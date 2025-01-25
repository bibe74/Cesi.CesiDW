CREATE TABLE [Landing].[COMETAINTEGRATION_ArticleBIData]
(
[ArticleID] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Data1] [varchar] (2000) COLLATE Latin1_General_CI_AS NULL,
[Data2] [varchar] (2000) COLLATE Latin1_General_CI_AS NULL,
[Data3] [varchar] (2000) COLLATE Latin1_General_CI_AS NULL,
[Data4] [varchar] (2000) COLLATE Latin1_General_CI_AS NULL,
[Data5] [varchar] (2000) COLLATE Latin1_General_CI_AS NULL,
[Data6] [varchar] (2000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETAINTEGRATION_ArticleBIData] ADD CONSTRAINT [PK_Landing_COMETAINTEGRATION_ArticleBIData] PRIMARY KEY CLUSTERED ([UpdateDatetime], [ArticleID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETAINTEGRATION_ArticleBIData_BusinessKey] ON [Landing].[COMETAINTEGRATION_ArticleBIData] ([ArticleID]) ON [PRIMARY]
GO
