SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [Staging].[usp_Reload_ArticoloCategoriaMaster]
AS
BEGIN

    SET NOCOUNT ON;

    TRUNCATE TABLE Staging.ArticoloCategoriaMaster;

    INSERT INTO Staging.ArticoloCategoriaMaster SELECT * FROM Staging.ArticoloCategoriaMasterView;

    DELETE FROM Staging.ArticoloCategoriaMaster WHERE Codice IN (N'MS2010', N'MS2011');

    INSERT INTO Staging.ArticoloCategoriaMaster (
        id_articolo,
        Codice,
        Descrizione,
        CategoriaMaster,
        CodiceEsercizioMaster,
        Percentuale
    )
    SELECT
        A.id_articolo,
        A.Codice,
        A.Descrizione,
        CEM.CategoriaMaster,
        CEM.CodiceEsercizionMaster,
        CASE A.Codice
          WHEN N'MS2010' THEN CASE WHEN CEM.CategoriaMaster = N'Master MySolution' THEN .75 ELSE .25 END
          WHEN N'MS2011' THEN CASE WHEN CEM.CategoriaMaster = N'Master MySolution' THEN .80 ELSE .20 END
          ELSE NULL
        END

    FROM Dim.Articolo A
    CROSS JOIN (
        SELECT
            N'Master MySolution' AS CategoriaMaster,
            N'2022/2023' AS CodiceEsercizionMaster

        UNION ALL SELECT N'Mini Master Revisione', N'2022/2023'
    ) CEM
    WHERE A.Codice IN (N'MS2010', N'MS2011');

    -- Richiesta del 14/6/2023
    UPDATE Staging.ArticoloCategoriaMaster SET CodiceEsercizioMaster = N'2022/2023' WHERE Codice = N'FO2286';

END;
GO
