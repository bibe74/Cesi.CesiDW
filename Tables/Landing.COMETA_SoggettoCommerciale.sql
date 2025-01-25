CREATE TABLE [Landing].[COMETA_SoggettoCommerciale]
(
[id_sog_commerciale] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[id_anagrafica] [int] NULL,
[tipo] [char] (1) COLLATE Latin1_General_CI_AS NULL,
[id_gruppo_agenti] [int] NULL,
[rnIDSoggettoCommercialeDESC] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_SoggettoCommerciale] ADD CONSTRAINT [PK_Landing_COMETA_SoggettoCommerciale] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_sog_commerciale]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_SoggettoCommerciale_BusinessKey] ON [Landing].[COMETA_SoggettoCommerciale] ([id_sog_commerciale]) ON [PRIMARY]
GO
