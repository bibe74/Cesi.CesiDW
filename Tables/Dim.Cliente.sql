CREATE TABLE [Dim].[Cliente]
(
[PKCliente] [int] NOT NULL CONSTRAINT [DFT_Dim_Cliente_PKCliente] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_Cliente]),
[IDSoggettoCommerciale] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Cliente_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Cliente_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_IsDeleted] DEFAULT ((0)),
[Email] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[IDAnagraficaCometa] [int] NULL CONSTRAINT [DFT_Dim_Cliente_IDAnagraficaCometa] DEFAULT ((-1)),
[HasAnagraficaCometa] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_HasAnagraficaCometa] DEFAULT ((0)),
[HasAnagraficaNopCommerce] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_HasAnagraficaNopCommerce] DEFAULT ((0)),
[HasAnagraficaMySolution] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_HasAnagraficaMySolution] DEFAULT ((0)),
[ProvenienzaAnagrafica] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_Cliente_ProvenienzaAnagrafica] DEFAULT (N''),
[CodiceCliente] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoSoggettoCommerciale] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_Cliente_TipoSoggettoCommerciale] DEFAULT (N''),
[RagioneSociale] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceFiscale] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[PartitaIVA] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Indirizzo] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[CAP] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Localita] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Provincia] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Regione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Macroregione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Nazione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Telefono] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Cellulare] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Fax] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoCliente] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Agente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[PKDataInizioContratto] [date] NOT NULL CONSTRAINT [DFT_Dim_Cliente_PKDataInizioContratto] DEFAULT (CONVERT([date],'19000101')),
[PKDataFineContratto] [date] NOT NULL CONSTRAINT [DFT_Dim_Cliente_PKDataFineContratto] DEFAULT (CONVERT([date],'19000101')),
[PKDataDisdetta] [date] NOT NULL CONSTRAINT [DFT_Dim_Cliente_PKDataDisdetta] DEFAULT (CONVERT([date],'19000101')),
[MotivoDisdetta] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[PKGruppoAgenti] [int] NOT NULL CONSTRAINT [DFT_Dim_Cliente_PKGruppoAgenti] DEFAULT ((-1)),
[Cognome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[IsAttivo] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_IsAttivo] DEFAULT ((0)),
[IsAbbonato] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_IsAbbonato] DEFAULT ((0)),
[IDSoggettoCommerciale_migrazione] [int] NULL,
[IDSoggettoCommerciale_migrazione_old] [int] NULL,
[IDProvincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_Cliente_IDProvincia] DEFAULT (N''),
[IsClienteFormazione] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_IsClienteFormazione] DEFAULT ((0)),
[CapoAreaDefault] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_Cliente_CapoAreaDefault] DEFAULT (N''),
[AgenteDefault] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_Cliente_AgenteDefault] DEFAULT (N''),
[HasRoleMySolutionDemo] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_HasRoleMySolutionDemo] DEFAULT ((0)),
[HasRoleMySolutionInterno] [bit] NOT NULL CONSTRAINT [DFT_Dim_Cliente_HasRoleMySolutionInterno] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Cliente] ADD CONSTRAINT [PK_Dim_Cliente] PRIMARY KEY CLUSTERED ([PKCliente]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Cliente_IDSoggettoCommerciale] ON [Dim].[Cliente] ([IDSoggettoCommerciale]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Dim_Cliente_PKGruppoAgenti_IsAbbonato_PKDataFineContratto_INCLUDE] ON [Dim].[Cliente] ([PKGruppoAgenti], [IsAbbonato], [PKDataFineContratto]) INCLUDE ([Email], [CodiceCliente], [RagioneSociale], [Localita], [Regione], [Telefono], [TipoCliente], [PKDataInizioContratto], [IDProvincia]) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Cliente] ADD CONSTRAINT [FK_Dim_Cliente_PKDataDisdetta] FOREIGN KEY ([PKDataDisdetta]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Dim].[Cliente] ADD CONSTRAINT [FK_Dim_Cliente_PKDataFineContratto] FOREIGN KEY ([PKDataFineContratto]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Dim].[Cliente] ADD CONSTRAINT [FK_Dim_Cliente_PKDataInizioContratto] FOREIGN KEY ([PKDataInizioContratto]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Dim].[Cliente] ADD CONSTRAINT [FK_Dim_Cliente_PKGruppoAgenti] FOREIGN KEY ([PKGruppoAgenti]) REFERENCES [Dim].[GruppoAgenti] ([PKGruppoAgenti])
GO
