CREATE TABLE [Landing].[GPT_OpenAICliente]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Email] [nvarchar] (256) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[GPT_OpenAICliente] ADD CONSTRAINT [PK_Landing_GPT_OpenAICliente] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAICliente_AlternateKey] ON [Landing].[GPT_OpenAICliente] ([Email]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAICliente_BusinessKey] ON [Landing].[GPT_OpenAICliente] ([Id]) ON [PRIMARY]
GO
