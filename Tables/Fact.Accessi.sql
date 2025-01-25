CREATE TABLE [Fact].[Accessi]
(
[PKAccessi] [int] NOT NULL CONSTRAINT [DFT_Fact_Accessi_PKAccessi] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_Accessi]),
[PKData] [date] NOT NULL,
[PKCliente] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[NumeroAccessi] [int] NOT NULL,
[NumeroPagineVisitate] [int] NOT NULL,
[PKCapoArea] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Accessi] ADD CONSTRAINT [PK_Fact_Accessi] PRIMARY KEY CLUSTERED ([PKAccessi]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Fact_Accessi_PKData_INCLUDE] ON [Fact].[Accessi] ([PKData]) INCLUDE ([PKCliente], [NumeroAccessi], [NumeroPagineVisitate]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Accessi_PKData_PKCliente] ON [Fact].[Accessi] ([PKData], [PKCliente]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Accessi] ADD CONSTRAINT [FK_Fact_Accessi_PKCapoArea] FOREIGN KEY ([PKCapoArea]) REFERENCES [Dim].[CapoArea] ([PKCapoArea])
GO
ALTER TABLE [Fact].[Accessi] ADD CONSTRAINT [FK_Fact_Accessi_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[Accessi] ADD CONSTRAINT [FK_Fact_Accessi_PKData] FOREIGN KEY ([PKData]) REFERENCES [Dim].[Data] ([PKData])
GO
