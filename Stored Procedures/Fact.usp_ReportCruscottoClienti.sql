SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/**
 * @storedprocedure Fact.usp_ReportCruscottoClienti
*/

CREATE   PROCEDURE [Fact].[usp_ReportCruscottoClienti] (
    @PKDataFinePeriodo DATE = NULL,
    --@GruppoAgenti NVARCHAR(60) = NULL,
    @CapoArea NVARCHAR(60) = NULL
)
AS
BEGIN

SET NOCOUNT ON;

--DECLARE @PKDataFinePeriodo DATE;

SET @PKDataFinePeriodo = COALESCE(@PKDataFinePeriodo, DATEADD(DAY, -1, CONVERT(DATE, CURRENT_TIMESTAMP)));

DECLARE @PKDataInizioPeriodo DATE,
    @PKDataInizioUltimoMese DATE,
    @PKDataInizioUltimoTrimestre DATE,
    @PKDataInizioUltimoSemestre DATE,
    @AnnoCorrente INT,
    @CodiceEsercizioMasterCorrente NVARCHAR(10),
    @CodiceEsercizioMasterPrecedente NVARCHAR(10);

SELECT @PKDataInizioUltimoSemestre = DATEADD(MONTH, -6, DATEADD(DAY, 1, @PKDataFinePeriodo)),
    @PKDataInizioUltimoTrimestre = DATEADD(MONTH, -3, DATEADD(DAY, 1, @PKDataFinePeriodo)),
    @PKDataInizioUltimoMese = DATEADD(MONTH, -1, DATEADD(DAY, 1, @PKDataFinePeriodo));

SET @PKDataInizioPeriodo = @PKDataInizioUltimoSemestre;

SELECT @AnnoCorrente = YEAR(@PKDataFinePeriodo) - 1;

SELECT @CodiceEsercizioMasterCorrente = CONVERT(NVARCHAR(4), @AnnoCorrente) + N'/' + CONVERT(NVARCHAR(4), @AnnoCorrente + 1),
    @CodiceEsercizioMasterPrecedente = CONVERT(NVARCHAR(4), @AnnoCorrente - 1) + N'/' + CONVERT(NVARCHAR(4), @AnnoCorrente);

--SELECT @PKDataInizioPeriodo, @PKDataFinePeriodo, @PKDataInizioUltimoMese, @PKDataInizioUltimoTrimestre, @PKDataInizioUltimoSemestre, @AnnoCorrente, @CodiceEsercizioMasterCorrente, @CodiceEsercizioMasterPrecedente;

DECLARE @AgenteProprietarioPrefix NVARCHAR(20) = N'Proprietario(';

DROP TABLE IF EXISTS #DettaglioOrdini;

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
Ordini
AS (
    SELECT
        D.IDDocumento,
        D.NumeroDocumento,
        C.PKCliente,
        CASE WHEN D.NoteDecisionali LIKE @AgenteProprietarioPrefix + N'%)' THEN SUBSTRING(D.NoteDecisionali, LEN(@AgenteProprietarioPrefix)+1, LEN(D.NoteDecisionali) - LEN(@AgenteProprietarioPrefix) - 1) ELSE GA.CapoArea END AS AgenteProprietario,

        -- Abbonamento MySolution
        A.Tipo AS TipoAbbonamento,
        CASE A.Tipo
          WHEN N'FISCO' THEN 'MYS'
          WHEN N'FULL' THEN 'MYS'
          WHEN N'LAVORO' THEN 'MYS'
          WHEN N'MIAFISCO' THEN 'MIA'
          WHEN N'MIAFULL' THEN 'MIA'
          WHEN N'MIALAVORO' THEN 'MIA'
          ELSE N''
        END AS MacroTipoAbbonamento,
		SUM(CASE WHEN D.NumeroRiga = 1 THEN D.Quote ELSE NULL END) AS QuoteFormazione,
        D.Libero1 AS Azione,
        D.RinnovoAutomatico AS ClausolaRinnovoAutomatico,
        D.PKDataInizioContratto,
        DIC.Data_IT AS DataInizioContratto,
        D.PKDataFineContratto,
        DFC.Data_IT AS DataFineContratto,
        D.PKDataCompetenza,
        SUM(D.ImportoTotale) AS TotaleDocumento,
        COALESCE(I.Insoluto, 0.0) AS Insoluto

    FROM Fact.Documenti D
    INNER JOIN Dim.Cliente C ON C.PKCliente = D.PKCliente
    INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = D.PKGruppoAgenti
    LEFT JOIN IMPORT.CapiArea ICA ON ICA.CapoArea = GA.CapoArea
    INNER JOIN Dim.GruppoAgenti GAR ON GAR.PKGruppoAgenti = D.PKGruppoAgenti_Riga
    INNER JOIN Dim.Data DIC ON DIC.PKData = D.PKDataInizioContratto
    INNER JOIN Dim.Data DFC ON DFC.PKData = D.PKDataFineContratto
    INNER JOIN Dim.Data DC ON DC.PKData = D.PKDataCompetenza
    INNER JOIN Dim.Articolo A ON A.PKArticolo = D.PKArticolo
    INNER JOIN Dim.MacroTipologia MT ON MT.PKMacroTipologia = D.PKMacroTipologia
    LEFT JOIN Insoluti I ON I.PKCliente = D.PKCliente
    WHERE D.Profilo = N'ORDINE CLIENTE'
        AND D.IsDeleted = CAST(0 AS BIT)
    GROUP BY D.IDDocumento,
        D.NumeroDocumento,
        C.PKCliente,
        CASE WHEN D.NoteDecisionali LIKE @AgenteProprietarioPrefix + N'%)' THEN SUBSTRING(D.NoteDecisionali, LEN(@AgenteProprietarioPrefix)+1, LEN(D.NoteDecisionali) - LEN(@AgenteProprietarioPrefix) - 1) ELSE GA.CapoArea END,
        A.Tipo,
        CASE A.Tipo
          WHEN N'FISCO' THEN 'MYS'
          WHEN N'FULL' THEN 'MYS'
          WHEN N'LAVORO' THEN 'MYS'
          WHEN N'MIAFISCO' THEN 'MIA'
          WHEN N'MIAFULL' THEN 'MIA'
          WHEN N'MIALAVORO' THEN 'MIA'
          ELSE N''
        END,
        D.Libero1,
        D.RinnovoAutomatico,
        D.PKDataInizioContratto,
        DIC.Data_IT,
        D.PKDataFineContratto,
        DFC.Data_IT,
        D.PKDataCompetenza,
        COALESCE(I.Insoluto, 0.0)
)
SELECT
    O.IDDocumento,
    O.NumeroDocumento,
    O.PKCliente,
    O.AgenteProprietario,
    O.TipoAbbonamento,
    O.MacroTipoAbbonamento,
    O.QuoteFormazione,
    O.Azione,
    O.ClausolaRinnovoAutomatico,
    O.PKDataInizioContratto,
    O.DataInizioContratto,
    O.PKDataFineContratto,
    O.DataFineContratto,
    O.PKDataCompetenza,
    O.TotaleDocumento,
    O.Insoluto,
    ROW_NUMBER() OVER (PARTITION BY O.PKCliente ORDER BY O.NumeroDocumento) AS rn

INTO #DettaglioOrdini

FROM Ordini O
WHERE O.PKDataInizioContratto <= @PKDataFinePeriodo
    AND O.PKDataFineContratto >= @PKDataInizioPeriodo;

CREATE NONCLUSTERED INDEX IX_DettaglioOrdini_PKCliente_MacroTipoAbbonamento ON #DettaglioOrdini (PKCliente, MacroTipoAbbonamento);

WITH CreditiMIA
AS (
    SELECT
        C.PKCliente,
        --C.Email,
        SUM(COAI.CreditiAcquistati) AS CreditiAcquistati,
        SUM(COAI.CreditiConsumati) AS CreditiConsumati,
        SUM(COAI.CreditiFuoriOrdine) AS CreditiFuoriOrdine,
        SUM(COAI.CreditiResidui) AS CreditiResidui

    FROM Fact.CreditiOpenAI COAI
    INNER JOIN Dim.Cliente C ON C.PKCliente = COAI.PKCliente
        AND C.IsDeleted = CAST(0 AS BIT)
    WHERE COAI.IsDeleted = CAST(0 AS BIT)
    GROUP BY C.PKCliente
        --, C.Email
),
Accessi
AS (
    SELECT
        C.PKCliente, --C.Email,
        SUM(CASE WHEN A.PKData BETWEEN @PKDataInizioUltimoMese AND @PKDataFinePeriodo THEN A.NumeroAccessi ELSE NULL END) AS AccessiUltimoMese,
        SUM(CASE WHEN A.PKData BETWEEN @PKDataInizioUltimoTrimestre AND @PKDataFinePeriodo THEN A.NumeroAccessi ELSE NULL END) AS AccessiUltimoTrimestre,
        SUM(CASE WHEN A.PKData BETWEEN @PKDataInizioUltimoSemestre AND @PKDataFinePeriodo THEN A.NumeroAccessi ELSE NULL END) AS AccessiUltimoSemestre

    FROM Fact.Accessi A
    INNER JOIN Dim.Data D ON D.PKData = A.PKData
        AND A.PKData BETWEEN @PKDataInizioUltimoSemestre AND @PKDataFinePeriodo
    INNER JOIN Dim.ClienteAccessi CA ON CA.PKClienteAccessi = A.PKCliente
    INNER JOIN Dim.Cliente C ON C.PKCliente = CA.PKCliente
    GROUP BY C.PKCliente --, C.Email
),
IscrizioniMaster
AS (
    SELECT
        D.PKCliente, --C.Email,
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
    GROUP BY D.PKCliente, --C.Email,
        ACM.CategoriaMaster,
        ACM.CodiceEsercizioMaster
),
Clienti
AS (
    SELECT
        C.PKCliente,
        C.CodiceCliente,
        C.RagioneSociale,
        C.Email,
        C.Localita AS Citta,
        C.Provincia,
        C.PKDataDisdetta,
        DDIS.Data_IT AS DataDisdetta

    FROM Dim.Cliente C
    INNER JOIN Dim.Data DDIS ON DDIS.PKData = C.PKDataDisdetta
    INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = C.PKGruppoAgenti
        --AND (
        --    @GruppoAgenti IS NULL
        --    OR GA.GruppoAgenti = @GruppoAgenti
        --)
        AND (
            @CapoArea IS NULL
            OR GA.CapoArea = @CapoArea
        )
        AND GA.IsDeleted = CAST(0 AS BIT)
    WHERE C.IsDeleted = CAST(0 AS BIT)
        AND EXISTS(SELECT DO.IDDocumento FROM #DettaglioOrdini DO WHERE DO.PKCliente = C.PKCliente)
)
SELECT
    C.PKCliente,
    C.CodiceCliente,
    C.RagioneSociale,
    C.Email,
    C.Citta,
    C.Provincia,
    C.PKDataDisdetta,
    C.DataDisdetta,

    DOMYS.IDDocumento,
    --DO.NumeroDocumento,
    DOMYS.AgenteProprietario,
    DOMYS.QuoteFormazione,
    DOMYS.Azione,
    DOMYS.ClausolaRinnovoAutomatico,
    DOMYS.PKDataInizioContratto,
    DOMYS.DataInizioContratto,
    DOMYS.PKDataFineContratto,
    DOMYS.DataFineContratto,
    DOMYS.TotaleDocumento,
    CASE WHEN DOMYS.rn = 1 THEN DOMYS.Insoluto ELSE 0.0 END AS Insoluto,
    A.AccessiUltimoMese,
    A.AccessiUltimoTrimestre,
    A.AccessiUltimoSemestre,
    DOMIA.PKDataInizioContratto AS PKDataInizioContrattoMIA,
    DOMIA.DataInizioContratto AS DataInizioContrattoMIA,
    DOMIA.PKDataFineContratto AS PKDataFineContrattoMIA,
    DOMIA.DataFineContratto AS DataFineContrattoMIA,
    DOMIA.TotaleDocumento AS TotaleDocumentoMIA,
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

FROM Clienti C
LEFT JOIN #DettaglioOrdini DOMYS ON DOMYS.PKCliente = C.PKCliente
    AND DOMYS.MacroTipoAbbonamento = N'MYS'
LEFT JOIN #DettaglioOrdini DOMIA ON DOMIA.PKCliente = C.PKCliente
    AND DOMIA.MacroTipoAbbonamento = N'MIA'
INNER JOIN Dim.Data DC ON DC.PKData = DOMYS.PKDataCompetenza
LEFT JOIN Accessi A ON A.PKCliente = C.PKCliente
LEFT JOIN CreditiMIA CMIA ON CMIA.PKCliente = C.PKCliente
LEFT JOIN IscrizioniMaster IMAC ON IMAC.PKCliente = C.PKCliente
    AND IMAC.CategoriaMaster = N'Master MySolution'
    AND IMAC.CodiceEsercizio = @CodiceEsercizioMasterCorrente
LEFT JOIN IscrizioniMaster IMAP ON IMAP.PKCliente = C.PKCliente
    AND IMAP.CategoriaMaster = N'Master MySolution'
    AND IMAP.CodiceEsercizio = @CodiceEsercizioMasterPrecedente
LEFT JOIN IscrizioniMaster IMMAC ON IMMAC.PKCliente = C.PKCliente
    AND IMMAC.CategoriaMaster = N'Mini Master Revisione'
    AND IMMAC.CodiceEsercizio = @CodiceEsercizioMasterCorrente
LEFT JOIN IscrizioniMaster IMMAP ON IMMAP.PKCliente = C.PKCliente
    AND IMMAP.CategoriaMaster = N'Mini Master Revisione'
    AND IMMAP.CodiceEsercizio = @CodiceEsercizioMasterPrecedente
ORDER BY DOMYS.AgenteProprietario,
    C.CodiceCliente,
    DOMYS.rn;

END;
GO
GRANT EXECUTE ON  [Fact].[usp_ReportCruscottoClienti] TO [cesidw_reader]
GO
