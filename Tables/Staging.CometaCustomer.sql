CREATE TABLE [Staging].[CometaCustomer]
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
[tipo] [varchar] (1) COLLATE Latin1_General_CI_AS NULL,
[id_gruppo_agenti] [int] NULL,
[RagioneSociale] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[indirizzo] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[cap] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[localita] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[provincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[nazione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[cod_fiscale] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[par_iva] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[Email] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[nome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[cognome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Quote] [numeric] (18, 0) NULL,
[telefono_descrizione] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[id_telefono] [int] NULL,
[id_documento] [int] NULL,
[num_documento] [nvarchar] (20) COLLATE Latin1_General_CI_AS NULL,
[data_documento] [date] NULL,
[data_inizio_contratto] [date] NULL,
[data_fine_contratto] [date] NULL,
[HasSconto] [int] NULL,
[data_disdetta] [date] NULL,
[motivo_disdetta] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[Telefono] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[Cellulare] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[Fax] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CometaCustomer] ADD CONSTRAINT [PK_Staging_CometaCustomer] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_sog_commerciale]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_CometaCustomer_BusinessKey] ON [Staging].[CometaCustomer] ([id_sog_commerciale]) ON [PRIMARY]
GO
