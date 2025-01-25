CREATE TABLE [Staging].[Accessi]
(
[PKData] [date] NOT NULL,
[PKCliente] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[PKCapoArea] [int] NULL,
[NumeroAccessi] [int] NOT NULL,
[NumeroPagineVisitate] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Accessi] ADD CONSTRAINT [PK_Staging_Accessi] PRIMARY KEY CLUSTERED ([PKData], [PKCliente]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_Accessi_PKCliente_PKData] ON [Staging].[Accessi] ([PKCliente], [PKData]) ON [PRIMARY]
GO
