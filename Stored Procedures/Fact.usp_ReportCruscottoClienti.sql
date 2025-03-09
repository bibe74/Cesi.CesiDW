SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
SELECT DISTINCT
    CR.AnnoCreazione AS Anno,
    CR.AnnoCreazione AS AnnoDescrizione

FROM Fact.Crediti CR
WHERE CR.IsDeleted = CAST(0 AS BIT)
ORDER BY CR.AnnoCreazione DESC;

DECLARE @Anno INT = 2024;

WITH CreditiAnnoCorrente
AS (
    SELECT
        UPPER(CR.CodiceFiscale) AS CodiceFiscale,
        UPPER(CR.Cognome + N' ' + CR.Nome + N' (' + CR.CodiceFiscale + N')') AS CodiceFiscaleDescrizione,
        SUM(CR.Crediti) AS Crediti

    FROM Fact.Crediti CR
    WHERE CR.IsDeleted = CAST(0 AS BIT)
        AND CR.AnnoCreazione = @Anno
    GROUP BY UPPER (CR.CodiceFiscale),
        UPPER (CR.Cognome + N' ' + CR.Nome + N' (' + CR.CodiceFiscale + N')')
),
CodiceFiscaleDettaglio
AS (
    SELECT
        CAC.CodiceFiscale,
        CAC.CodiceFiscaleDescrizione,
        CAC.Crediti,
        ROW_NUMBER() OVER (PARTITION BY CAC.CodiceFiscale ORDER BY CAC.Crediti DESC, CAC.CodiceFiscaleDescrizione) AS rn

    FROM CreditiAnnoCorrente CAC
)
SELECT
    CFD.CodiceFiscale,
    CFD.CodiceFiscaleDescrizione

FROM CodiceFiscaleDettaglio CFD
WHERE CFD.rn = 1
ORDER BY CodiceFiscaleDescrizione;
GO
*/

/**
 * @storedprocedure Fact.usp_ReportCruscottoClienti
*/

CREATE   PROCEDURE [Fact].[usp_ReportCruscottoClienti] (
    @AnnoMese INT,
    @GruppoAgenti NVARCHAR(60) = NULL,
    @CapoArea NVARCHAR(60) = NULL,
    --@TipoData CHAR(1) = 'C', -- 'C': competenza (data ordine), 'I': inizio contratto, 'F': fine contratto
    @RagioneSociale NVARCHAR(120) = NULL,
    @CodiceCliente NVARCHAR(10) = NULL,
    @Azione NVARCHAR(60) = NULL
)
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PKDataInizioPeriodo DATE,
    @PKDataFinePeriodo DATE,
    @PKDataInizioUltimoMese DATE,
    @PKDataInizioUltimoTrimestre DATE,
    @PKDataInizioUltimoSemestre DATE;

SELECT @PKDataFinePeriodo = MAX(PKData) FROM Dim.Data WHERE AnnoMese = @AnnoMese;
SELECT @PKDataInizioUltimoSemestre = DATEADD(MONTH, -6, DATEADD(DAY, 1, @PKDataFinePeriodo));
SELECT @PKDataInizioUltimoMese = DATEADD(MONTH, -1, DATEADD(DAY, 1, @PKDataFinePeriodo));
SELECT @PKDataInizioUltimoTrimestre = DATEADD(MONTH, -3, DATEADD(DAY, 1, @PKDataFinePeriodo));
SELECT @PKDataInizioPeriodo = @PKDataInizioUltimoSemestre;

DECLARE @AnnoCorrente INT,
    @CodiceEsercizioMasterCorrente NVARCHAR(10),
    @CodiceEsercizioMasterPrecedente NVARCHAR(10);

SELECT @AnnoCorrente = YEAR(@PKDataFinePeriodo) - 1;

SELECT @CodiceEsercizioMasterCorrente = CONVERT(NVARCHAR(4), @AnnoCorrente) + N'/' + CONVERT(NVARCHAR(4), @AnnoCorrente + 1),
    @CodiceEsercizioMasterPrecedente = CONVERT(NVARCHAR(4), @AnnoCorrente - 1) + N'/' + CONVERT(NVARCHAR(4), @AnnoCorrente);

--SELECT @PKDataInizioPeriodo, @PKDataFinePeriodo, @PKDataInizioUltimoMese, @PKDataInizioUltimoTrimestre, @PKDataInizioUltimoSemestre, @AnnoCorrente, @CodiceEsercizioMasterCorrente, @CodiceEsercizioMasterPrecedente;

DECLARE @AgenteProprietarioPrefix NVARCHAR(20) = N'Proprietario(';

WITH Insoluti
AS (
    SELECT
        D.PKCliente,
        SUM(S.ImportoResiduo) AS Insoluto
    FROM Fact.Scadenze S
    INNER JOIN Fact.Documenti D ON D.PKDocumenti = S.PKDocumenti
        AND D.IsDeleted = CAST(0 AS BIT)
    WHERE S.IsDeleted = CAST(0 AS BIT)
    GROUP BY D.PKCliente
    HAVING SUM(S.ImportoResiduo) > 0.0
),
Accessi
AS (
    SELECT
        --C.PKCliente,
        C.Email,
        SUM(CASE WHEN A.PKData BETWEEN @PKDataInizioUltimoMese AND @PKDataFinePeriodo THEN A.NumeroAccessi ELSE NULL END) AS AccessiUltimoMese,
        SUM(CASE WHEN A.PKData BETWEEN @PKDataInizioUltimoTrimestre AND @PKDataFinePeriodo THEN A.NumeroAccessi ELSE NULL END) AS AccessiUltimoTrimestre,
        SUM(CASE WHEN A.PKData BETWEEN @PKDataInizioUltimoSemestre AND @PKDataFinePeriodo THEN A.NumeroAccessi ELSE NULL END) AS AccessiUltimoSemestre

    FROM Fact.Accessi A
    INNER JOIN Dim.Data D ON D.PKData = A.PKData
        AND A.PKData BETWEEN @PKDataInizioUltimoSemestre AND @PKDataFinePeriodo
    INNER JOIN Dim.ClienteAccessi CA ON CA.PKClienteAccessi = A.PKCliente
    INNER JOIN Dim.Cliente C ON C.PKCliente = CA.PKCliente
    GROUP BY --C.PKCliente,
        C.Email
),
IscrizioniMaster
AS (
    SELECT
        --D.PKCliente,
        C.Email,
        ACM.CategoriaMaster,
        ACM.CodiceEsercizioMaster AS CodiceEsercizio,
        MAX(D.PKDataDocumento) AS DataUltimaFattura,
        COUNT(1) AS NumeroIscritti,
        SUM(D.ImportoTotale * ACM.Percentuale) AS ImportoTotale

    FROM Fact.Documenti D
    INNER JOIN Dim.Cliente C ON C.PKCliente = D.PKCliente
    INNER JOIN Dim.Articolo A ON A.PKArticolo = D.PKArticolo
        AND A.CodiceEsercizioMaster IN (@CodiceEsercizioMasterCorrente, @CodiceEsercizioMasterPrecedente)
    INNER JOIN Staging.ArticoloCategoriaMaster ACM ON ACM.id_articolo = A.id_articolo
    WHERE D.IDProfilo = N'ORDSEM'
        AND D.IsDeleted = CAST(0 AS BIT)
    GROUP BY --D.PKCliente,
        C.Email,
        ACM.CategoriaMaster,
        ACM.CodiceEsercizioMaster
),
Ordini
AS (
    SELECT
        D.IDDocumento,
        D.NumeroDocumento,
        C.CodiceCliente,
        C.RagioneSociale,
        C.Email,
        C.Localita AS Citta,
        C.Provincia,
        CASE WHEN D.NoteDecisionali LIKE @AgenteProprietarioPrefix + N'%)' THEN SUBSTRING(D.NoteDecisionali, LEN(@AgenteProprietarioPrefix)+1, LEN(D.NoteDecisionali) - LEN(@AgenteProprietarioPrefix) - 1) ELSE GA.CapoArea END AS AgenteProprietario,

        -- Abbonamento MySolution
        A.Tipo AS TipoAbbonamento,
		SUM(CASE WHEN D.NumeroRiga = 1 THEN D.Quote ELSE NULL END) AS QuoteFormazione,
        D.Libero1 AS Azione,
        D.RinnovoAutomatico AS ClausolaRinnovoAutomatico,
        C.PKDataDisdetta,
        DDIS.Data_IT AS DataDisdetta,
        D.PKDataInizioContratto,
        DIC.Data_IT AS DataInizioContratto,
        D.PKDataFineContratto,
        DFC.Data_IT AS DataFineContratto,
        D.PKDataCompetenza,
        SUM(D.ImportoTotale) AS TotaleDocumento,
        COALESCE(I.Insoluto, 0.0) AS Insoluto

    FROM Fact.Documenti D
    INNER JOIN Dim.Cliente C ON C.PKCliente = D.PKCliente
        AND (
            @RagioneSociale IS NULL
            OR C.RagioneSociale LIKE N'%' + @RagioneSociale + N'%'
        )
        AND (
            @CodiceCliente IS NULL
            OR C.CodiceCliente = @CodiceCliente
        )
    INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = D.PKGruppoAgenti
        AND (
            @CapoArea IS NULL
            OR GA.CapoArea = @CapoArea
        )
        AND (
            @GruppoAgenti IS NULL
            OR GA.GruppoAgenti = @GruppoAgenti
        )
    LEFT JOIN IMPORT.CapiArea ICA ON ICA.CapoArea = GA.CapoArea
    INNER JOIN Dim.GruppoAgenti GAR ON GAR.PKGruppoAgenti = D.PKGruppoAgenti_Riga
    INNER JOIN Dim.Data DIC ON DIC.PKData = D.PKDataInizioContratto
    INNER JOIN Dim.Data DFC ON DFC.PKData = D.PKDataFineContratto
    INNER JOIN Dim.Data DC ON DC.PKData = D.PKDataCompetenza
    INNER JOIN Dim.Articolo A ON A.PKArticolo = D.PKArticolo
    INNER JOIN Dim.Data DDIS ON DDIS.PKData = C.PKDataDisdetta
    INNER JOIN Dim.MacroTipologia MT ON MT.PKMacroTipologia = D.PKMacroTipologia
    LEFT JOIN Insoluti I ON I.PKCliente = D.PKCliente
    LEFT JOIN Import.LiquidazioneProvvigioneTeorica LPTA ON LPTA.CodiceCondizioniPagamento = D.CodiceCondizioniPagamento
        AND LPTA.DurataContratto = N'Annuale'
    LEFT JOIN Import.LiquidazioneProvvigioneTeorica LPTP ON LPTP.CodiceCondizioniPagamento = D.CodiceCondizioniPagamento
        AND LPTP.DurataContratto = N'Pluriennale'
    WHERE D.Profilo = N'ORDINE CLIENTE'
        AND CURRENT_TIMESTAMP BETWEEN D.PKDataInizioContratto AND CASE WHEN D.PKDataFineContratto = CAST('19000101' AS DATE) THEN CAST('20791231' AS DATE) ELSE D.PKDataFineContratto END
        AND D.IsDeleted = CAST(0 AS BIT)
        AND (
            @Azione IS NULL
            OR D.Libero1 = @Azione
        )
    GROUP BY D.IDDocumento,
        D.NumeroDocumento,
        C.CodiceCliente,
        C.RagioneSociale,
        C.Email,
        C.Localita,
        C.Provincia,
        CASE WHEN D.NoteDecisionali LIKE @AgenteProprietarioPrefix + N'%)' THEN SUBSTRING(D.NoteDecisionali, LEN(@AgenteProprietarioPrefix)+1, LEN(D.NoteDecisionali) - LEN(@AgenteProprietarioPrefix) - 1) ELSE GA.CapoArea END,
        A.Tipo,
        D.Libero1,
        D.RinnovoAutomatico,
        C.PKDataDisdetta,
        DDIS.Data_IT,
        D.PKDataInizioContratto,
        DIC.Data_IT,
        D.PKDataFineContratto,
        DFC.Data_IT,
        D.PKDataCompetenza,
        COALESCE(I.Insoluto, 0.0)
),
DettaglioOrdini
AS (
    SELECT
        O.IDDocumento,
        O.NumeroDocumento,
        O.CodiceCliente,
        O.RagioneSociale,
        O.Email,
        O.Citta,
        O.Provincia,
        O.AgenteProprietario,
        O.TipoAbbonamento,
        O.QuoteFormazione,
        O.Azione,
        O.ClausolaRinnovoAutomatico,
        O.PKDataDisdetta,
        O.DataDisdetta,
        O.PKDataInizioContratto,
        O.DataInizioContratto,
        O.PKDataFineContratto,
        O.DataFineContratto,
        O.PKDataCompetenza,
        O.TotaleDocumento,
        O.Insoluto,

        ROW_NUMBER() OVER (PARTITION BY O.CodiceCliente ORDER BY O.NumeroDocumento) AS rn

    FROM Ordini O
),
CreditiMIA
AS (
    SELECT
        --C.PKCliente,
        C.Email,
        SUM(COAI.CreditiAcquistati) AS CreditiAcquistati,
        SUM(COAI.CreditiConsumati) AS CreditiConsumati,
        SUM(COAI.CreditiFuoriOrdine) AS CreditiFuoriOrdine,
        SUM(COAI.CreditiResidui) AS CreditiResidui

    FROM Fact.CreditiOpenAI COAI
    INNER JOIN Dim.Cliente C ON C.PKCliente = COAI.PKCliente
        AND C.IsDeleted = CAST(0 AS BIT)
    WHERE COAI.IsDeleted = CAST(0 AS BIT)
    GROUP BY C.Email
)
SELECT
    DO.IDDocumento,
    --DO.NumeroDocumento,
    DO.CodiceCliente,
    DO.RagioneSociale,
    DO.Email,
    DO.Citta,
    DO.Provincia,
    DO.AgenteProprietario,
    DO.TipoAbbonamento,
    DO.QuoteFormazione,
    DO.Azione,
    DO.ClausolaRinnovoAutomatico,
    DO.PKDataDisdetta,
    DO.DataDisdetta,
    DO.PKDataInizioContratto,
    DO.DataInizioContratto,
    DO.PKDataFineContratto,
    DO.DataFineContratto,
    DO.TotaleDocumento,
    CASE WHEN DO.rn = 1 THEN DO.Insoluto ELSE 0.0 END AS Insoluto,
    A.AccessiUltimoMese,
    A.AccessiUltimoTrimestre,
    A.AccessiUltimoSemestre,
    CMIA.CreditiAcquistati,
    --CMIA.CreditiConsumati,
    --CMIA.CreditiFuoriOrdine,
    CMIA.CreditiResidui,
    @CodiceEsercizioMasterPrecedente AS CodiceEsercizioPrecedente,
    IMAP.NumeroIscritti AS NumeroIscrittiAnnoPrecedente,
    IMAP.ImportoTotale AS ImportoTotaleAnnoPrecedente,
    @CodiceEsercizioMasterCorrente AS CodiceEsercizioCorrente,
    IMMAP.NumeroIscritti AS NumeroIscrittiMiniMasterAnnoPrecedente,
    IMMAP.ImportoTotale AS ImportoTotaleMiniMasterAnnoPrecedente,
    IMAC.NumeroIscritti AS NumeroIscrittiAnnoCorrente,
    IMAC.ImportoTotale AS ImportoTotaleAnnoCorrente,
    IMMAC.NumeroIscritti AS NumeroIscrittiMiniMasterAnnoCorrente,
    IMMAC.ImportoTotale AS ImportoTotaleMiniMasterAnnoCorrente

FROM DettaglioOrdini DO
INNER JOIN Dim.Data DIC ON DIC.PKData = DO.PKDataInizioContratto
    AND DO.PKDataInizioContratto > CAST('19000101' AS DATE)
    --AND (
    --    @TipoData <> 'I'
    --    OR DIC.PKData BETWEEN @PKDataInizioPeriodo AND @PKDataFinePeriodo
    --)
INNER JOIN Dim.Data DFC ON DFC.PKData = DO.PKDataFineContratto
    --AND (
    --    @TipoData <> 'F'
    --    OR DFC.PKData BETWEEN @PKDataInizioPeriodo AND @PKDataFinePeriodo
    --)
INNER JOIN Dim.Data DC ON DC.PKData = DO.PKDataCompetenza
    --AND (
    --    @TipoData <> 'C'
    --    OR DC.PKData BETWEEN @PKDataInizioPeriodo AND @PKDataFinePeriodo
    --)
LEFT JOIN Accessi A ON A.Email = DO.Email
LEFT JOIN CreditiMIA CMIA ON CMIA.Email = DO.Email
LEFT JOIN IscrizioniMaster IMAC ON IMAC.Email = DO.Email
    AND IMAC.CategoriaMaster = N'Master MySolution'
    AND IMAC.CodiceEsercizio = @CodiceEsercizioMasterCorrente
LEFT JOIN IscrizioniMaster IMAP ON IMAP.Email = DO.Email
    AND IMAP.CategoriaMaster = N'Master MySolution'
    AND IMAP.CodiceEsercizio = @CodiceEsercizioMasterPrecedente
LEFT JOIN IscrizioniMaster IMMAC ON IMMAC.Email = DO.Email
    AND IMMAC.CategoriaMaster = N'Mini Master Revisione'
    AND IMMAC.CodiceEsercizio = @CodiceEsercizioMasterCorrente
LEFT JOIN IscrizioniMaster IMMAP ON IMMAP.Email = DO.Email
    AND IMMAP.CategoriaMaster = N'Mini Master Revisione'
    AND IMMAP.CodiceEsercizio = @CodiceEsercizioMasterPrecedente
ORDER BY DO.AgenteProprietario,
    DO.CodiceCliente,
    DO.NumeroDocumento;

END;
GO
GRANT EXECUTE ON  [Fact].[usp_ReportCruscottoClienti] TO [cesidw_reader]
GO
