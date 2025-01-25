CREATE TABLE [Staging].[CometaVendor]
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
[RagioneSociale] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[indirizzo] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[cap] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[localita] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[provincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[nazione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[cod_fiscale] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[par_iva] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CometaVendor] ADD CONSTRAINT [PK_Staging_CometaVendor] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_sog_commerciale]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_CometaVendor_BusinessKey] ON [Staging].[CometaVendor] ([id_sog_commerciale]) ON [PRIMARY]
GO
