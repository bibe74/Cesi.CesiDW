CREATE TABLE [Fact].[CreditiOpenAIDettaglio]
(
[PKCreditiOpenAIDettaglio] [int] NOT NULL CONSTRAINT [DFT_Fact_CreditiOpenAIDettaglio_PKCreditiOpenAIDettaglio] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_CreditiOpenAIDettaglio]),
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
[IsDeleted] [bit] NOT NULL,
[PKDataInizioDemo] [date] NOT NULL,
[QtaCreditiResidui] [int] NULL,
[QtaCreditiUtilizzati] [int] NULL,
[ConteggioDomandeERisposte] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[CreditiOpenAIDettaglio] ADD CONSTRAINT [PK_Fact_CreditiOpenAIDettaglio] PRIMARY KEY CLUSTERED ([PKCreditiOpenAIDettaglio]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_CreditiOpenAIDettaglio_BusinessKey] ON [Fact].[CreditiOpenAIDettaglio] ([PKCliente], [CodiceOrdine], [PKDataUltimoUtilizzo], [PKDataCreazionePartita], [PKDataScadenzaPartita], [QtaCreditiCaricatiInPartita]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[CreditiOpenAIDettaglio] ADD CONSTRAINT [FK_Fact_CreditiOpenAIDettaglio_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[CreditiOpenAIDettaglio] ADD CONSTRAINT [FK_Fact_CreditiOpenAIDettaglio_PKDataCreazionePartita] FOREIGN KEY ([PKDataCreazionePartita]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[CreditiOpenAIDettaglio] ADD CONSTRAINT [FK_Fact_CreditiOpenAIDettaglio_PKDataScadenzaPartita] FOREIGN KEY ([PKDataScadenzaPartita]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[CreditiOpenAIDettaglio] ADD CONSTRAINT [FK_Fact_CreditiOpenAIDettaglio_PKDataUltimoUtilizzo] FOREIGN KEY ([PKDataUltimoUtilizzo]) REFERENCES [Dim].[Data] ([PKData])
GO
