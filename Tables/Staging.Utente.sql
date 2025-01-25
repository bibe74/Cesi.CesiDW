CREATE TABLE [Staging].[Utente]
(
[IDUtente] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Email] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[RagioneSociale] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Cognome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Citta] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[PKCliente] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Utente] ADD CONSTRAINT [PK_Landing_MYSOLUTION_Users] PRIMARY KEY CLUSTERED ([UpdateDatetime], [IDUtente]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_Users_BusinessKey] ON [Staging].[Utente] ([IDUtente]) ON [PRIMARY]
GO
