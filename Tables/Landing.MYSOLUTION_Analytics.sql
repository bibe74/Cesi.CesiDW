CREATE TABLE [Landing].[MYSOLUTION_Analytics]
(
[created_at] [date] NOT NULL,
[email] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[path] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (32) NULL,
[ChangeHashKey] [varbinary] (32) NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[NumeroVisite] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_Analytics] ADD CONSTRAINT [PK_Landing_MYSOLUTION_Analytics] PRIMARY KEY CLUSTERED ([UpdateDatetime], [created_at], [email], [path]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Landing_MYSOLUTION_Analytics_BusinessKey] ON [Landing].[MYSOLUTION_Analytics] ([created_at], [email], [path]) ON [PRIMARY]
GO
