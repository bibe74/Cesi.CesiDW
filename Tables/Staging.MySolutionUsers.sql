CREATE TABLE [Staging].[MySolutionUsers]
(
[Email] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[rnDataInizioContrattoDESC] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[rnCodiceDataInizioContrattoDESC] [int] NOT NULL,
[CodiceCliente] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[RagioneSociale] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceFiscale] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[PartitaIVA] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Localita] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Provincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Telefono] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoCliente] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[PKDataInizioContratto] [date] NOT NULL,
[PKDataFineContratto] [date] NOT NULL,
[Cognome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[IDDocumento] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[MySolutionUsers] ADD CONSTRAINT [PK_Landing_COMETA_MySolutionUsers] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Email], [rnDataInizioContrattoDESC]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_MySolutionUsers_BusinessKey] ON [Staging].[MySolutionUsers] ([Email], [rnDataInizioContrattoDESC]) ON [PRIMARY]
GO
