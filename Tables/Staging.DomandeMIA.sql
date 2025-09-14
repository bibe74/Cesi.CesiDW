CREATE TABLE [Staging].[DomandeMIA]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Testo] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[IsDomanda] [bit] NOT NULL,
[PKDataCreazione] [date] NOT NULL,
[Area] [nvarchar] (64) COLLATE Latin1_General_CI_AS NULL,
[Email] [nvarchar] (256) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[DomandeMIA] ADD CONSTRAINT [PK_Landing_GPT_OpenAIMessage] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GPT_OpenAIMessage_BusinessKey] ON [Staging].[DomandeMIA] ([Id]) ON [PRIMARY]
GO
