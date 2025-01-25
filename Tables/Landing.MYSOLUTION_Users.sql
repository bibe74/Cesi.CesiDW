CREATE TABLE [Landing].[MYSOLUTION_Users]
(
[ID] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Email] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[RagioneSociale] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[Cognome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[Citta] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_Users] ADD CONSTRAINT [PK_Landing_MYSOLUTION_Users] PRIMARY KEY CLUSTERED ([UpdateDatetime], [ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_Users_BusinessKey] ON [Landing].[MYSOLUTION_Users] ([ID]) ON [PRIMARY]
GO
