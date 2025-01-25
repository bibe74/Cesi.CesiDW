SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/**
 * @storedprocedure Fact.usp_ReportAccessi
*/

CREATE   PROCEDURE [Fact].[usp_ReportAccessi] (
    @PKDataInizioPeriodo DATE = NULL,
    @Agente NVARCHAR(60) = NULL,
    @TipoCliente NVARCHAR(10) = NULL
)
AS
BEGIN

    SET NOCOUNT ON;

    SET DATEFIRST 1;

    DECLARE @PKDataFinePeriodo DATE;

    IF (@PKDataInizioPeriodo IS NULL)
    BEGIN

        DECLARE @Yesterday DATE = DATEADD(DAY, -1, CAST(CURRENT_TIMESTAMP AS DATE));

        SET @PKDataFinePeriodo = DATEADD(DAY, 7-DATEPART(WEEKDAY, @Yesterday), @Yesterday);

        SELECT @PKDataInizioPeriodo = DATEADD(DAY, -27, @PKDataFinePeriodo);
    END;

    SELECT @PKDataFinePeriodo = DATEADD(DAY, 27, @PKDataInizioPeriodo);

    WITH SettimaneNumerate
    AS (
        SELECT
            D.PKData AS PKDataLunedi,
            DATEADD(DAY, 6, D.PKData) AS PKDataDomenica,
            LEFT(CONVERT(NVARCHAR(2), ROW_NUMBER() OVER (ORDER BY D.PKData DESC)) + '^ sett. ' + CONVERT(NVARCHAR(10), D.PKData, 103), 14) AS DescrizioneSettimana,
            ROW_NUMBER() OVER (ORDER BY D.PKData DESC) AS rn

        FROM Dim.Data D
        WHERE D.PKData BETWEEN @PKDataInizioPeriodo AND @PKDataFinePeriodo
            AND DATEPART(WEEKDAY, D.PKData) = 1
    ),
    AccessiSettimaneNumerate
    AS (
        SELECT
            C.PKCliente,
            SN.rn,
            SN.DescrizioneSettimana,
            SUM(A.NumeroAccessi) AS NumeroAccessi,
            SUM(A.NumeroPagineVisitate) AS NumeroPagineVisitate,
            COUNT(DISTINCT A.PKData) AS NumeroGiorniAccesso

        FROM Fact.Accessi A
        INNER JOIN Dim.ClienteAccessi CA ON CA.PKClienteAccessi = A.PKCliente
        INNER JOIN Dim.Cliente C ON C.PKCliente = CA.PKCliente
        INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = C.PKGruppoAgenti
            AND (
                @Agente IS NULL
                OR GA.CapoArea = @Agente
            )
        INNER JOIN SettimaneNumerate SN ON A.PKData BETWEEN SN.PKDataLunedi AND SN.PKDataDomenica
        WHERE A.IsDeleted = CAST(0 AS BIT)
        GROUP BY C.PKCliente,
            SN.rn,
            SN.DescrizioneSettimana
    ),
    AccessiUltimiTreMesi
    AS (
        SELECT
            C.PKCliente,
            SUM(A.NumeroAccessi) AS NumeroAccessi,
            SUM(A.NumeroPagineVisitate) AS NumeroPagineVisitate,
            COUNT(DISTINCT A.PKData) AS NumeroGiorniAccesso

        FROM Fact.Accessi A
        INNER JOIN Dim.ClienteAccessi CA ON CA.PKClienteAccessi = A.PKCliente
            AND (
                @Agente IS NULL
                OR CA.Agente = @Agente
            )
        INNER JOIN Dim.Cliente C ON C.PKCliente = CA.PKCliente
        --INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = C.PKGruppoAgenti
        WHERE A.IsDeleted = CAST(0 AS BIT)
            AND A.PKData BETWEEN DATEADD(MONTH, -3, @PKDataFinePeriodo) AND @PKDataFinePeriodo
        GROUP BY C.PKCliente
    ),
    Clienti
    AS (
        SELECT
            C.PKCliente,
            C.CodiceCliente,
            C.Agente,
            C.RagioneSociale,
            C.Email,
            C.Telefono,
            C.TipoCliente,
            C.Localita AS Comune,
            C.IDProvincia AS Provincia,
            C.Regione,
            DIC.Data_IT AS DataInizio,
            DFC.Data_IT AS DataScadenza

        FROM Dim.ClienteAccessi C
        INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = C.PKGruppoAgenti
        INNER JOIN Dim.Data DIC ON DIC.PKData = C.PKDataInizioContratto
        INNER JOIN Dim.Data DFC ON DFC.PKData = C.PKDataFineContratto
        WHERE C.IsDeleted = CAST(0 AS BIT)
            AND C.IsAbbonato = CAST(1 AS BIT)
            AND C.PKDataFineContratto >= @PKDataInizioPeriodo
            AND (
                @TipoCliente IS NULL
                OR C.TipoCliente = @TipoCliente
            )
            AND (
                @Agente IS NULL
                OR C.Agente = @Agente
            )
    )
    SELECT
        C.Agente,
        C.CodiceCliente,
        C.RagioneSociale,
        C.Email,
        C.Telefono,
        C.Comune,
        C.Provincia,
        C.Regione,
        C.DataInizio,
        C.DataScadenza,
        SN.DescrizioneSettimana,
        COALESCE(ASN.NumeroAccessi, 0) AS NumeroAccessi,
        COALESCE(ASN.NumeroPagineVisitate, 0) AS NumeroPagineVisitate,
        COALESCE(ASN.NumeroGiorniAccesso, 0) AS NumeroGiorniAccesso,
        CASE WHEN ROW_NUMBER() OVER (PARTITION BY C.PKCliente ORDER BY SN.rn) = 1 THEN COALESCE(AU3M.NumeroGiorniAccesso, 0) ELSE 0 END AS NumeroGiorniAccessoUltimiTreMesi

    FROM Clienti C
    CROSS JOIN SettimaneNumerate SN
    LEFT JOIN AccessiSettimaneNumerate ASN ON ASN.PKCliente = C.PKCliente AND ASN.rn = SN.rn
    LEFT JOIN AccessiUltimiTreMesi AU3M ON AU3M.PKCliente = C.PKCliente

    WHERE C.PKCliente > 0

    ORDER BY C.Agente,
        C.RagioneSociale,
        SN.rn;

END;
GO
GRANT EXECUTE ON  [Fact].[usp_ReportAccessi] TO [cesidw_reader]
GO
