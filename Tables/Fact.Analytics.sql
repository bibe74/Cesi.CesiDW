CREATE TABLE [Fact].[Analytics]
(
[PKAnalytics] [int] NOT NULL CONSTRAINT [DFT_PKAnalytics] DEFAULT (NEXT VALUE FOR [seq_Fact_Analytics]),
[PKDataVisita] [date] NOT NULL,
[PKCliente] [int] NOT NULL,
[Percorso] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (32) NULL,
[ChangeHashKey] [varbinary] (32) NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[NumeroVisite] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Analytics] ADD CONSTRAINT [PK_Fact_Analytics] PRIMARY KEY CLUSTERED ([PKAnalytics]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Analytics_BusinessKey] ON [Fact].[Analytics] ([PKDataVisita], [PKCliente], [Percorso]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Analytics] ADD CONSTRAINT [FK_Fact_Analytics_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[Analytics] ADD CONSTRAINT [FK_Fact_Analytics_PKDataVisita] FOREIGN KEY ([PKDataVisita]) REFERENCES [Dim].[Data] ([PKData])
GO
