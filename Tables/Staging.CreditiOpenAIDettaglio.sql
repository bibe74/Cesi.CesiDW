CREATE TABLE [Staging].[CreditiOpenAIDettaglio]
(
[PKCliente] [int] NOT NULL,
[CodiceOrdine] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[PKDataUltimoUtilizzo] [date] NOT NULL,
[PKDataCreazionePartita] [date] NOT NULL,
[PKDataScadenzaPartita] [date] NOT NULL,
[QtaCreditiCaricatiInPartita] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[PKDataInizioDemo] [date] NOT NULL,
[QtaCreditiResidui] [int] NULL,
[QtaCreditiUtilizzati] [int] NULL,
[ConteggioDomandeERisposte] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CreditiOpenAIDettaglio] ADD CONSTRAINT [PK_Staging_CreditiOpenAIDettaglio] PRIMARY KEY CLUSTERED ([UpdateDatetime], [PKCliente], [CodiceOrdine], [PKDataUltimoUtilizzo], [PKDataCreazionePartita], [PKDataScadenzaPartita], [QtaCreditiCaricatiInPartita]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_CreditiOpenAI_BusinessKey] ON [Staging].[CreditiOpenAIDettaglio] ([PKCliente], [CodiceOrdine], [PKDataUltimoUtilizzo], [PKDataCreazionePartita], [PKDataScadenzaPartita], [QtaCreditiCaricatiInPartita]) ON [PRIMARY]
GO
