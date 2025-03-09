CREATE TABLE [Landing].[GPT_OpenAICredito]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[ClienteId] [int] NOT NULL,
[CausaleId] [int] NOT NULL,
[PartitaId] [int] NULL,
[MessageId] [int] NULL,
[Documento] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[DataMovimento] [date] NOT NULL,
[Quantita] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[GPT_OpenAICredito] ADD CONSTRAINT [PK_Landing_GPT_OpenAICredito] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAICredito_BusinessKey] ON [Landing].[GPT_OpenAICredito] ([Id]) ON [PRIMARY]
GO
