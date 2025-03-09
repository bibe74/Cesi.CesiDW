CREATE TABLE [Fact].[CreditiOpenAI]
(
[PKCreditiOpenAI] [int] NOT NULL CONSTRAINT [DFT_Fact_CreditiOpenAI_PKCreditiOpenAI] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_CreditiOpenAI]),
[PKCliente] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[PKDataScadenzaOrdine] [date] NOT NULL,
[CreditiAcquistati] [int] NULL,
[CreditiConsumati] [int] NULL,
[CreditiFuoriOrdine] [int] NULL,
[CreditiResidui] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[CreditiOpenAI] ADD CONSTRAINT [PK_Fact_CreditiOpenAI] PRIMARY KEY CLUSTERED ([PKCreditiOpenAI]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[CreditiOpenAI] ADD CONSTRAINT [FK_Fact_CreditiOpenAI_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[CreditiOpenAI] ADD CONSTRAINT [FK_Fact_CreditiOpenAI_PKDataScadenzaOrdine] FOREIGN KEY ([PKDataScadenzaOrdine]) REFERENCES [Dim].[Data] ([PKData])
GO
