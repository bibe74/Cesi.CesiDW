SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/**
 * @storedprocedure Fact.usp_ReportCreditiMIA
*/

CREATE   PROCEDURE [Fact].[usp_ReportCreditiMIA] (
    @CapoArea NVARCHAR(60) = NULL
)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        C.Email,
        COAID.CodiceOrdine AS [Codice ordine],
        COAID.QtaCreditiCaricatiInPartita AS [Crediti caricati in partita],
        COAID.QtaCreditiResidui AS [Crediti residui],
        COAID.QtaCreditiUtilizzati AS [Crediti utilizzati],
        COAID.ConteggioDomandeERisposte AS [Numero domande e risposte],
        DUU.Data_IT AS [Ultimo utilizzo],
        DCP.Data_IT AS [Data creazione partita],
        DSP.Data_IT AS [Data scadenza partita],
        DID.Data_IT AS [Data inizio demo]

    FROM Fact.CreditiOpenAIDettaglio COAID
    INNER JOIN Dim.Cliente C ON C.PKCliente = COAID.PKCliente
    INNER JOIN Dim.GruppoAgenti GA ON GA.PKGruppoAgenti = C.PKGruppoAgenti
        AND (
            @CapoArea IS NULL
            OR GA.CapoArea = @CapoArea
        )
    INNER JOIN Dim.Data DUU ON DUU.PKData = COAID.PKDataUltimoUtilizzo
    INNER JOIN Dim.Data DCP ON DCP.PKData = COAID.PKDataCreazionePartita
    INNER JOIN Dim.Data DSP ON DSP.PKData = COAID.PKDataScadenzaPartita
    INNER JOIN Dim.Data DID ON DID.PKData = COAID.PKDataInizioDemo
    ORDER BY C.Email,
        COAID.CodiceOrdine,
        DUU.PKData,
        DCP.PKData,
        DID.PKData;

END;
GO
GRANT EXECUTE ON  [Fact].[usp_ReportCreditiMIA] TO [cesidw_reader]
GO
