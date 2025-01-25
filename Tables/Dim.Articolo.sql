CREATE TABLE [Dim].[Articolo]
(
[PKArticolo] [int] NOT NULL CONSTRAINT [DFT_Dim_Articolo_PKArticolo] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_Articolo]),
[id_articolo] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Articolo_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Articolo_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_Articolo_IsDeleted] DEFAULT ((0)),
[Codice] [nvarchar] (80) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (80) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceCategoriaCommerciale] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[CategoriaCommerciale] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceCategoriaMerceologica] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[CategoriaMerceologica] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[DescrizioneBreve] [nvarchar] (80) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceEsercizioMaster] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[CategoriaMaster] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Fatturazione] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Tipo] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Data1] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Data2] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Data3] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Data4] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Data5] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Data6] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Articolo] ADD CONSTRAINT [PK_Dim_Articolo] PRIMARY KEY CLUSTERED ([PKArticolo]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Articolo_id_articolo] ON [Dim].[Articolo] ([id_articolo]) ON [PRIMARY]
GO
