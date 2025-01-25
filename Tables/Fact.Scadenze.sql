CREATE TABLE [Fact].[Scadenze]
(
[PKScadenze] [int] NOT NULL CONSTRAINT [DFT_Fact_Scadenze_PKScadenze] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_Scadenze]),
[PKCliente] [int] NOT NULL,
[PKDataScadenza] [date] NOT NULL,
[PKDocumenti] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[IDScadenza] [int] NOT NULL,
[TipoScadenza] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[IDSoggettoCommerciale] [int] NOT NULL,
[StatoScadenza] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[EsitoPagamento] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[IDDocumento] [int] NOT NULL,
[ImportoScadenza] [decimal] (10, 2) NOT NULL,
[ImportoSaldato] [decimal] (10, 2) NOT NULL,
[ImportoResiduo] [decimal] (10, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Scadenze] ADD CONSTRAINT [PK_Fact_Scadenze] PRIMARY KEY CLUSTERED ([PKScadenze]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Scadenze_IDScadenza] ON [Fact].[Scadenze] ([IDScadenza]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Scadenze] ADD CONSTRAINT [FK_Fact_Scadenze_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[Scadenze] ADD CONSTRAINT [FK_Fact_Scadenze_PKDataScadenza] FOREIGN KEY ([PKDataScadenza]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Scadenze] ADD CONSTRAINT [FK_Fact_Scadenze_PKDocumenti] FOREIGN KEY ([PKDocumenti]) REFERENCES [Fact].[Documenti] ([PKDocumenti])
GO
