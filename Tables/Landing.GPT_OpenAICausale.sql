CREATE TABLE [Landing].[GPT_OpenAICausale]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Codice] [nvarchar] (32) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (128) COLLATE Latin1_General_CI_AS NOT NULL,
[Segno] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[GPT_OpenAICausale] ADD CONSTRAINT [PK_Landing_GPT_OpenAICausale] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAICausale_AlternateKey] ON [Landing].[GPT_OpenAICausale] ([Codice]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAICausale_BusinessKey] ON [Landing].[GPT_OpenAICausale] ([Id]) ON [PRIMARY]
GO
