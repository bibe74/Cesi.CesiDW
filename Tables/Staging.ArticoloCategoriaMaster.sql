CREATE TABLE [Staging].[ArticoloCategoriaMaster]
(
[id_articolo] [int] NOT NULL,
[Codice] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (80) COLLATE Latin1_General_CI_AS NULL,
[CategoriaMaster] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceEsercizioMaster] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Percentuale] [decimal] (5, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[ArticoloCategoriaMaster] ADD CONSTRAINT [PK_Staging_ArticoloCategoriaMaster] PRIMARY KEY CLUSTERED ([id_articolo], [CategoriaMaster]) ON [PRIMARY]
GO
