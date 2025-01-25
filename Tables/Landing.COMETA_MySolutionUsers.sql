CREATE TABLE [Landing].[COMETA_MySolutionUsers]
(
[EMail] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[id_anagrafica] [int] NULL,
[codice] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[RagioneSociale] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[indirizzo] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[cap] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[localita] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[provincia] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[nazione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[cod_fiscale] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[par_iva] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[num_progressivo] [numeric] (18, 0) NULL,
[num_documento] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[data_documento] [datetime2] NULL,
[data_inizio_contratto] [datetime2] NULL,
[data_fine_contratto] [datetime2] NULL,
[HaSconto] [bit] NULL,
[Nome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Cognome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Quote] [numeric] (18, 0) NOT NULL,
[telefono_descrizione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[id_telefono] [int] NOT NULL,
[id_sog_commerciale] [int] NOT NULL,
[tipo] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[id_documento] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_MySolutionUsers] ADD CONSTRAINT [PK_Landing_COMETA_MySolutionUsers] PRIMARY KEY CLUSTERED ([UpdateDatetime], [EMail]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_MySolutionUsers_BusinessKey] ON [Landing].[COMETA_MySolutionUsers] ([EMail]) ON [PRIMARY]
GO
