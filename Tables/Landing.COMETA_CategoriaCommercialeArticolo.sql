CREATE TABLE [Landing].[COMETA_CategoriaCommercialeArticolo]
(
[id_cat_com_articolo] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[descrizione] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_CategoriaCommercialeArticolo] ADD CONSTRAINT [PK_Landing_COMETA_CategoriaCommercialeArticolo] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_cat_com_articolo]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_CategoriaCommercialeArticolo_BusinessKey] ON [Landing].[COMETA_CategoriaCommercialeArticolo] ([id_cat_com_articolo]) ON [PRIMARY]
GO
