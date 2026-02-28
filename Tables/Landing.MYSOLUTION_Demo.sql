CREATE TABLE [Landing].[MYSOLUTION_Demo]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (32) NULL,
[ChangeHashKey] [varbinary] (32) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Email] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[RagioneSociale] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[Cognome] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[Citta] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[Provincia] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[SiglaProvincia] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[DataInizioDemo] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_Demo] ADD CONSTRAINT [PK_Landing_MYSOLUTION_Demo] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_Demo_BusinessKey] ON [Landing].[MYSOLUTION_Demo] ([Id]) ON [PRIMARY]
GO
