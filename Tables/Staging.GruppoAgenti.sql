CREATE TABLE [Staging].[GruppoAgenti]
(
[id_gruppo_agenti] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[IDGruppoAgenti] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[GruppoAgenti] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Agente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Subagente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[GruppoAgenti] ADD CONSTRAINT [PK_Staging_Gruppo_Agenti] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_gruppo_agenti]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_GruppoAgenti_BusinessKey] ON [Staging].[GruppoAgenti] ([id_gruppo_agenti]) ON [PRIMARY]
GO
