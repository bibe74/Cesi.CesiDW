CREATE TABLE [Staging].[CreditiOpenAI]
(
[PKCliente] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[PKDataScadenzaOrdine] [date] NOT NULL,
[CreditiAcquistati] [int] NULL,
[CreditiConsumati] [int] NULL,
[CreditiFuoriOrdine] [int] NULL,
[CreditiResidui] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CreditiOpenAI] ADD CONSTRAINT [PK_Landing_GPT_OpenAICredito] PRIMARY KEY CLUSTERED ([UpdateDatetime], [PKCliente]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAICredito_BusinessKey] ON [Staging].[CreditiOpenAI] ([PKCliente]) ON [PRIMARY]
GO
