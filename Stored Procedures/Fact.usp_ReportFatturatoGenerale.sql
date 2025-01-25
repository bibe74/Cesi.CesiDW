SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [Fact].[usp_ReportFatturatoGenerale] (
    @CodiceEsercizio CHAR(4),
    @CapoArea NVARCHAR(60),
    @IsProfiloValidoPerStatisticaFatturatoFormazione BIT
)
AS
BEGIN

    SET NOCOUNT ON;

    IF (@CodiceEsercizio IS NULL)
    BEGIN

        SELECT @CodiceEsercizio = CAST(YEAR(CURRENT_TIMESTAMP) AS CHAR(4));

    END;

    SELECT
        GA.CapoArea,
        D.Libero2 AS Tipologia,
        DR.Mese,
        DR.Mese_IT AS MeseDescrizione,
        SUM(D.ImportoTotale) AS ImportoTotale

    FROM Fact.Documenti D
    INNER JOIN Dim.Data DR ON DR.PKData = D.PKDataRegistrazione
    INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = D.PKGruppoAgenti
        AND (
            @CapoArea IS NULL
            OR GA.CapoArea = @CapoArea
        )
    WHERE D.CodiceEsercizio = @CodiceEsercizio
        AND D.IsProfiloValidoPerStatisticaFatturato = CAST(1 AS BIT)
        AND (
            @IsProfiloValidoPerStatisticaFatturatoFormazione IS NULL
            OR D.IsProfiloValidoPerStatisticaFatturatoFormazione = @IsProfiloValidoPerStatisticaFatturatoFormazione
        )
        AND D.IsDeleted = CAST(0 AS BIT)
    GROUP BY GA.CapoArea,
        D.Libero2,
        DR.Mese,
        DR.Mese_IT
    ORDER BY GA.CapoArea,
        D.Libero2,
        DR.Mese;

END;
GO
GRANT EXECUTE ON  [Fact].[usp_ReportFatturatoGenerale] TO [cesidw_reader]
GO
