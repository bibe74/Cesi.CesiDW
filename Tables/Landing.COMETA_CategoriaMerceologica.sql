CREATE TABLE [Landing].[COMETA_CategoriaMerceologica]
(
[id_cat_merceologica] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[descrizione] [nvarchar] (40) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_CategoriaMerceologica] ADD CONSTRAINT [PK_Landing_COMETA_CategoriaMerceologica] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_cat_merceologica]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_CategoriaMerceologica_BusinessKey] ON [Landing].[COMETA_CategoriaMerceologica] ([id_cat_merceologica]) ON [PRIMARY]
GO
