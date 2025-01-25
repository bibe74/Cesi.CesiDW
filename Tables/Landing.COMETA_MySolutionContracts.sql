CREATE TABLE [Landing].[COMETA_MySolutionContracts]
(
[id_riga_documento] [int] NOT NULL,
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
[EMail] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[num_progressivo] [numeric] (18, 0) NULL,
[num_documento] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[data_documento] [datetime2] NULL,
[data_inizio_contratto] [datetime2] NULL,
[data_fine_contratto] [datetime2] NULL,
[Nome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Cognome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Quote] [numeric] (18, 0) NOT NULL,
[id_sog_commerciale] [int] NOT NULL,
[tipo] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[id_documento] [int] NULL,
[descrizione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[id_articolo] [int] NULL,
[prezzo] [numeric] (18, 0) NULL,
[sconto] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[prezzo_netto] [numeric] (18, 0) NULL,
[prezzo_netto_ivato] [numeric] (18, 0) NULL,
[note_intestazione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[data_disdetta] [datetime2] NULL,
[motivo_disdetta] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[pec] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CodiceArticolo] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_MySolutionContracts] ADD CONSTRAINT [PK_Landing_COMETA_MySolutionContracts] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_riga_documento]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_MySolutionContracts_BusinessKey] ON [Landing].[COMETA_MySolutionContracts] ([id_riga_documento]) ON [PRIMARY]
GO
