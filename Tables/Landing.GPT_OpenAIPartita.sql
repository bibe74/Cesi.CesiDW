CREATE TABLE [Landing].[GPT_OpenAIPartita]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Codice] [nvarchar] (128) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[DataScadenza] [date] NOT NULL,
[ClienteId] [int] NOT NULL,
[Stato] [bit] NOT NULL,
[Quantita] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[GPT_OpenAIPartita] ADD CONSTRAINT [PK_Landing_GPT_OpenAIPartita] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAIPartita_BusinessKey] ON [Landing].[GPT_OpenAIPartita] ([Id]) ON [PRIMARY]
GO
