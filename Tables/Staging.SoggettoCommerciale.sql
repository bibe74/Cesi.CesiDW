CREATE TABLE [Staging].[SoggettoCommerciale]
(
[IDSoggettoCommerciale] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[CodiceSoggettoCommerciale] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[IDAnagrafica] [int] NOT NULL,
[TipoSoggettoCommerciale] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[RagioneSociale] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[Indirizzo] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[CAP] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Localita] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Provincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Nazione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceFiscale] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[PartitaIVA] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[PKGruppoAgenti] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[SoggettoCommerciale] ADD CONSTRAINT [PK_Landing_COMETA_SoggettoCommerciale] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [IDSoggettoCommerciale]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_SoggettoCommerciale_BusinessKey] ON [Staging].[SoggettoCommerciale] ([IDSoggettoCommerciale]) ON [PRIMARY]
GO
