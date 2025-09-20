CREATE TABLE [Landing].[GPT_OpenAIMessage]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[OpenAIThreadId] [int] NOT NULL,
[Message] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[IsQuestion] [bit] NOT NULL,
[CreatedOn] [smalldatetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[GPT_OpenAIMessage] ADD CONSTRAINT [PK_Landing_GPT_OpenAIMessage] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAIMessage_BusinessKey] ON [Landing].[GPT_OpenAIMessage] ([Id]) ON [PRIMARY]
GO
