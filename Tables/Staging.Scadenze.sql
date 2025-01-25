CREATE TABLE [Staging].[Scadenze]
(
[IDScadenza] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[TipoScadenza] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[IDSoggettoCommerciale] [int] NOT NULL,
[PKCliente] [int] NOT NULL,
[PKDataScadenza] [date] NOT NULL,
[StatoScadenza] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[EsitoPagamento] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[IDDocumento] [int] NOT NULL,
[PKDocumenti] [int] NOT NULL,
[ImportoScadenza] [decimal] (10, 2) NOT NULL,
[ImportoSaldato] [decimal] (10, 2) NOT NULL,
[ImportoResiduo] [decimal] (10, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Scadenze] ADD CONSTRAINT [PK_Landing_COMETA_Scadenza] PRIMARY KEY CLUSTERED ([UpdateDatetime], [IDScadenza]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Scadenza_BusinessKey] ON [Staging].[Scadenze] ([IDScadenza]) ON [PRIMARY]
GO
