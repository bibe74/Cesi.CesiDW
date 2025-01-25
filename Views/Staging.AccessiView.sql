SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   VIEW [Staging].[AccessiView]
AS
WITH ClientiAccessi
AS (
    SELECT
        AC.Username,
        C.PKCliente,
        1 AS rn

    FROM Staging.AccessiCustomer AC
    INNER JOIN Dim.Cliente C ON C.IDSoggettoCommerciale = AC.IDSoggettoCommerciale

    UNION ALL

    SELECT
        AC.Username,
        COALESCE(CEmail.PKCliente, -101) AS PKCliente,
        ROW_NUMBER() OVER (PARTITION BY AC.Username ORDER BY CEmail.PKCliente DESC) AS rn

    FROM Staging.AccessiCustomer AC
    LEFT JOIN Dim.Cliente C ON C.IDSoggettoCommerciale = AC.IDSoggettoCommerciale
    LEFT JOIN Dim.Cliente CEmail ON CEmail.Email = AC.Username
),
AccessiRiepilogo
AS (
    SELECT
        --LFR.Data,
        COALESCE(D.PKData, CAST('19000101' AS DATE)) AS PKData,
        --LFR.IDUser,
        CA.PKClienteAccessi,
        CA.PKGruppoAgenti,
        SUM(LFR.NumeroAccessi) AS NumeroAccessi,
        SUM(LFR.NumeroPagineVisitate) AS NumeroPagineVisitate

    FROM Landing.MYSOLUTION_LogsForReport LFR
    LEFT JOIN Dim.Data D ON D.PKData = LFR.Data
    INNER JOIN Staging.AccessiUsername AU ON AU.UsernameAccessi = LFR.Username
    INNER JOIN Dim.ClienteAccessi CA ON CA.Username = AU.Username
    WHERE LFR.IsDeleted = CAST(0 AS BIT)
    GROUP BY COALESCE (D.PKData, CAST ('19000101' AS DATE)),
        CA.PKClienteAccessi,
        CA.PKGruppoAgenti
),
TableData
AS (
    SELECT
        AR.PKData,
        AR.PKClienteAccessi AS PKCliente,

        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            AR.PKData,
            AR.PKClienteAccessi,
            ' '
        ))) AS HistoricalHashKey,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            GA.PKCapoArea,
            SUM(AR.NumeroAccessi),
            SUM(AR.NumeroPagineVisitate),
            ' '
        ))) AS ChangeHashKey,
        CURRENT_TIMESTAMP AS InsertDatetime,
        CURRENT_TIMESTAMP AS UpdateDatetime,

        COALESCE(GA.PKCapoArea, -1) AS PKCapoArea,
        SUM(AR.NumeroAccessi) AS NumeroAccessi,
        SUM(AR.NumeroPagineVisitate) AS NumeroPagineVisitate

    FROM AccessiRiepilogo AR
    LEFT JOIN Dim.ClienteAccessi CA ON CA.PKCliente = AR.PKClienteAccessi
    LEFT JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = CA.PKGruppoAgenti
    GROUP BY AR.PKData,
        AR.PKClienteAccessi,
        GA.PKCapoArea
)
SELECT
    -- Chiavi
    TD.PKData,
    TD.PKCliente,

    -- Campi per sincronizzazione
    TD.HistoricalHashKey,
    TD.ChangeHashKey,
    CONVERT(VARCHAR(34), TD.HistoricalHashKey, 1) AS HistoricalHashKeyASCII,
    CONVERT(VARCHAR(34), TD.ChangeHashKey, 1) AS ChangeHashKeyASCII,
    TD.InsertDatetime,
    TD.UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Dimensioni
    TD.PKCapoArea,

    -- Misure
    TD.NumeroAccessi,
    TD.NumeroPagineVisitate

FROM TableData TD;
GO
