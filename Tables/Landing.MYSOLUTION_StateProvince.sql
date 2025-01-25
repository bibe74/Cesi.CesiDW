CREATE TABLE [Landing].[MYSOLUTION_StateProvince]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[CountryId] [int] NOT NULL,
[Name] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Abbreviation] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_StateProvince] ADD CONSTRAINT [PK_Landing_MYSOLUTION_StateProvince] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_StateProvince_BusinessKey] ON [Landing].[MYSOLUTION_StateProvince] ([Id]) ON [PRIMARY]
GO
