CREATE TABLE [Dim].[ClienteAccessi]
(
[PKClienteAccessi] [int] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_PKClienteAccessi] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_ClienteAccessi]),
[Username] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_IsDeleted] DEFAULT ((0)),
[IDSoggettoCommerciale] [int] NULL,
[PKCliente] [int] NOT NULL,
[Email] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[IDAnagraficaCometa] [int] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_IDAnagraficaCometa] DEFAULT ((-1)),
[HasAnagraficaCometa] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_HasAnagraficaCometa] DEFAULT ((0)),
[HasAnagraficaNopCommerce] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_HasAnagraficaNopCommerce] DEFAULT ((0)),
[HasAnagraficaMySolution] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_HasAnagraficaMySolution] DEFAULT ((0)),
[ProvenienzaAnagrafica] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_ProvenienzaAnagrafica] DEFAULT (N''),
[CodiceCliente] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoSoggettoCommerciale] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_TipoSoggettoCommerciale] DEFAULT (N''),
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
[PKDataInizioContratto] [date] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_PKInizioContratto] DEFAULT (CONVERT([date],'19000101')),
[PKDataFineContratto] [date] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_PKFineContratto] DEFAULT (CONVERT([date],'19000101')),
[PKDataDisdetta] [date] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_PKDataDisdetta] DEFAULT (CONVERT([date],'19000101')),
[MotivoDisdetta] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[PKGruppoAgenti] [int] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_PKGruppoAgenti] DEFAULT ((-1)),
[Cognome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[IsAttivo] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_IsAttivo] DEFAULT ((0)),
[IsAbbonato] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_IsAbbonato] DEFAULT ((0)),
[IDSoggettoCommerciale_migrazione] [int] NULL,
[IDSoggettoCommerciale_migrazione_old] [int] NULL,
[IDProvincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[IsClienteFormazione] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_IsClienteFormazione] DEFAULT ((0)),
[CapoAreaDefault] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_CapoAreaDefault] DEFAULT (N''),
[AgenteDefault] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_AgenteDefault] DEFAULT (N''),
[HasRoleMySolutionDemo] [bit] NOT NULL CONSTRAINT [DFT_Dim_ClienteAccessi_HasRoleMySolutionDemo] DEFAULT ((0)),
[IDMySolution] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[ClienteAccessi] ADD CONSTRAINT [PK_Dim_ClienteAccessi] PRIMARY KEY CLUSTERED ([PKClienteAccessi]) ON [PRIMARY]
GO
ALTER TABLE [Dim].[ClienteAccessi] ADD CONSTRAINT [FK_Dim_ClienteAccessi_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Dim].[ClienteAccessi] ADD CONSTRAINT [FK_Dim_ClienteAccessi_PKDataDisdetta] FOREIGN KEY ([PKDataDisdetta]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Dim].[ClienteAccessi] ADD CONSTRAINT [FK_Dim_ClienteAccessi_PKDataFineContratto] FOREIGN KEY ([PKDataFineContratto]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Dim].[ClienteAccessi] ADD CONSTRAINT [FK_Dim_ClienteAccessi_PKDataInizioContratto] FOREIGN KEY ([PKDataInizioContratto]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Dim].[ClienteAccessi] ADD CONSTRAINT [FK_Dim_ClienteAccessi_PKGruppoAgenti] FOREIGN KEY ([PKGruppoAgenti]) REFERENCES [Dim].[GruppoAgenti] ([PKGruppoAgenti])
GO
