CREATE TABLE [Landing].[COMETA_CategoriaCommercialeSoggettoCommerciale]
(
[id_cat_com_sc] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[descrizione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_CategoriaCommercialeSoggettoCommerciale] ADD CONSTRAINT [PK_Landing_COMETA_CategoriaCommercialeSoggettoCommerciale] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_cat_com_sc]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_CategoriaCommercialeSoggettoCommerciale_BusinessKey] ON [Landing].[COMETA_CategoriaCommercialeSoggettoCommerciale] ([id_cat_com_sc]) ON [PRIMARY]
GO
