SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Landing].[COMETA_SoggettoCommercialeView]
AS
WITH TableData
AS (
    SELECT
        id_sog_commerciale,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            id_sog_commerciale,
            ' '
        ))) AS HistoricalHashKey,
        CONVERT(VARBINARY(20), HASHBYTES('MD5', CONCAT(
            codice,
            id_anagrafica,
            tipo,
            id_gruppo_agenti,
            ' '
        ))) AS ChangeHashKey,
        CURRENT_TIMESTAMP AS InsertDatetime,
        CURRENT_TIMESTAMP AS UpdateDatetime,
        codice,
        id_anagrafica,
        tipo,
        id_gruppo_agenti,
        ROW_NUMBER() OVER (PARTITION BY id_anagrafica ORDER BY id_sog_commerciale DESC) AS rnIDSoggettoCommercialeDESC

    FROM COMETA.SoggettoCommerciale
)
SELECT
    -- Chiavi
    TD.id_sog_commerciale,

    -- Campi per sincronizzazione
    TD.HistoricalHashKey,
    TD.ChangeHashKey,
    CONVERT(VARCHAR(34), TD.HistoricalHashKey, 1) AS HistoricalHashKeyASCII,
    CONVERT(VARCHAR(34), TD.ChangeHashKey, 1) AS ChangeHashKeyASCII,
    TD.InsertDatetime,
    TD.UpdateDatetime,
    CAST(0 AS BIT) AS IsDeleted,

    -- Attributi
    TD.codice COLLATE DATABASE_DEFAULT AS codice,
    TD.id_anagrafica,
    TD.tipo COLLATE DATABASE_DEFAULT AS tipo,
    TD.id_gruppo_agenti,
    TD.rnIDSoggettoCommercialeDESC

FROM TableData TD;
GO
