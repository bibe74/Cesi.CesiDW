CREATE TABLE [Dim].[GruppoAgenti]
(
[PKGruppoAgenti] [int] NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_PKGruppoAgenti] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_GruppoAgenti]),
[id_gruppo_agenti] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_IsDeleted] DEFAULT ((0)),
[IDGruppoAgenti] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_IDGruppoAgenti] DEFAULT (N''),
[GruppoAgenti] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_GruppoAgenti] DEFAULT (N''),
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_CapoArea] DEFAULT (N''),
[Agente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_Agente] DEFAULT (N''),
[Subagente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_Subagente] DEFAULT (N''),
[PKCapoArea] [int] NOT NULL CONSTRAINT [DFT_Dim_GruppoAgenti_PKCapoArea] DEFAULT ((-1))
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[GruppoAgenti] ADD CONSTRAINT [PK_Dim_GruppoAgenti] PRIMARY KEY CLUSTERED ([PKGruppoAgenti]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_GruppoAgenti_GUIDGruppoAgenti] ON [Dim].[GruppoAgenti] ([id_gruppo_agenti]) ON [PRIMARY]
GO
ALTER TABLE [Dim].[GruppoAgenti] ADD CONSTRAINT [FK_Dim_GruppoAgenti_PKCapoArea] FOREIGN KEY ([PKCapoArea]) REFERENCES [Dim].[CapoArea] ([PKCapoArea])
GO
