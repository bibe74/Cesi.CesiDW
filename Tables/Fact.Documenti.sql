CREATE TABLE [Fact].[Documenti]
(
[PKDocumenti] [int] NOT NULL CONSTRAINT [DFT_Fact_Documenti_PKDocumenti] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_Documenti]),
[PKDataInizioEsercizio] [date] NOT NULL,
[PKDataFineEsercizio] [date] NOT NULL,
[PKDataRegistrazione] [date] NOT NULL,
[PKDataDocumento] [date] NOT NULL,
[PKDataCompetenza] [date] NOT NULL,
[PKCliente] [int] NOT NULL,
[PKClienteFattura] [int] NOT NULL,
[PKGruppoAgenti] [int] NOT NULL,
[PKCapoArea] [int] NOT NULL,
[PKDataFineContratto] [date] NOT NULL,
[PKDataInizioContratto] [date] NOT NULL,
[PKGruppoAgenti_Riga] [int] NOT NULL,
[PKCapoArea_Riga] [int] NOT NULL,
[PKArticolo] [int] NOT NULL,
[PKMacroTipologia] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[IDDocumento_Riga] [int] NOT NULL,
[IDDocumento] [int] NOT NULL,
[IDProfilo] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Profilo] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoRegistro] [char] (2) COLLATE Latin1_General_CI_AS NOT NULL,
[NumeroRegistro] [int] NOT NULL,
[Registro] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceEsercizio] [char] (4) COLLATE Latin1_General_CI_AS NOT NULL,
[NumeroDocumento] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoSoggettoCommerciale] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoSoggettoCommercialeFattura] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Libero4] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[IDLibero1] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Libero1] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[IDLibero2] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Libero2] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[IDLibero3] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Libero3] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[IDTipoFatturazione] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoFatturazione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[NumeroRiga] [int] NOT NULL,
[CodiceCondizioniPagamento] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[CondizioniPagamento] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[RinnovoAutomatico] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[NoteIntestazione] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[IsProfiloValidoPerStatisticaFatturato] [bit] NOT NULL,
[IsProfiloValidoPerStatisticaFatturatoFormazione] [bit] NOT NULL,
[ImportoTotale] [decimal] (10, 2) NOT NULL,
[ImportoProvvigioneCapoArea] [decimal] (10, 2) NOT NULL,
[ImportoProvvigioneAgente] [decimal] (10, 2) NOT NULL,
[ImportoProvvigioneSubagente] [decimal] (10, 2) NOT NULL,
[Progressivo] [int] NOT NULL,
[Quote] [int] NOT NULL,
[IDDocumento_Riga_Provenienza] [int] NULL,
[NoteDecisionali] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[PKDataDisdetta] [date] NOT NULL,
[IDDocumentoRinnovato] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [PK_Fact_Documenti] PRIMARY KEY CLUSTERED ([PKDocumenti]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Documenti_IDDocumento_Riga] ON [Fact].[Documenti] ([IDDocumento_Riga]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKArticolo] FOREIGN KEY ([PKArticolo]) REFERENCES [Dim].[Articolo] ([PKArticolo])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKCapoArea] FOREIGN KEY ([PKCapoArea]) REFERENCES [Dim].[CapoArea] ([PKCapoArea])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKCapoArea_Riga] FOREIGN KEY ([PKCapoArea_Riga]) REFERENCES [Dim].[CapoArea] ([PKCapoArea])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKClienteFattura] FOREIGN KEY ([PKClienteFattura]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKDataCompetenza] FOREIGN KEY ([PKDataCompetenza]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKDataDocumento] FOREIGN KEY ([PKDataDocumento]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKDataFineContratto] FOREIGN KEY ([PKDataFineContratto]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKDataFineEsercizio] FOREIGN KEY ([PKDataFineEsercizio]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKDataInizioContratto] FOREIGN KEY ([PKDataInizioContratto]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKDataInizioEsercizio] FOREIGN KEY ([PKDataInizioEsercizio]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKDataRegistrazione] FOREIGN KEY ([PKDataRegistrazione]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKGruppoAgenti] FOREIGN KEY ([PKGruppoAgenti]) REFERENCES [Dim].[GruppoAgenti] ([PKGruppoAgenti])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKGruppoAgenti_Riga] FOREIGN KEY ([PKGruppoAgenti_Riga]) REFERENCES [Dim].[GruppoAgenti] ([PKGruppoAgenti])
GO
ALTER TABLE [Fact].[Documenti] ADD CONSTRAINT [FK_Fact_Documenti_PKMacroTipologia] FOREIGN KEY ([PKMacroTipologia]) REFERENCES [Dim].[MacroTipologia] ([PKMacroTipologia])
GO
