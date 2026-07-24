CREATE TABLE [Landing].[GPT_OpenAITokenUsage]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[email] [nvarchar] (320) COLLATE Latin1_General_CI_AS NOT NULL,
[threadId] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[conversationId] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[createdOn] [datetime2] NOT NULL,
[assistantArea] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[responseMode] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[model] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[vectorStorageId] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[input_tokens] [bigint] NULL,
[output_tokens] [bigint] NULL,
[reasoning_tokens] [bigint] NULL,
[total_tokens] [bigint] NULL,
[estimatedTotalCostUsd] [numeric] (18, 6) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[GPT_OpenAITokenUsage] ADD CONSTRAINT [PK_Landing_GPT_OpenAITokenUsage] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Landing_GPT_OpenAITokenUsage_BusinessKey] ON [Landing].[GPT_OpenAITokenUsage] ([Id]) ON [PRIMARY]
GO
