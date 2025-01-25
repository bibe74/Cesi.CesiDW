CREATE TABLE [Landing].[WEBINARS_WeBinars]
(
[Source] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[VideoStartDate] [datetime] NULL,
[VideoTitle] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[CourseTitle] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[CourseType] [varchar] (500) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[WEBINARS_WeBinars] ADD CONSTRAINT [PK_Landing_WEBINARS_WeBinars] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Source]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WEBINARS_WeBinars_BusinessKey] ON [Landing].[WEBINARS_WeBinars] ([Source]) ON [PRIMARY]
GO
