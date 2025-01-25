CREATE TABLE [Landing].[COMETA_Articolo]
(
[id_articolo] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[descrizione] [nvarchar] (80) COLLATE Latin1_General_CI_AS NULL,
[id_cat_com_articolo] [int] NULL,
[id_cat_merceologica] [int] NULL,
[des_breve] [nvarchar] (80) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Articolo] ADD CONSTRAINT [PK_Landing_COMETA_Articolo] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_articolo]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Articolo_BusinessKey] ON [Landing].[COMETA_Articolo] ([id_articolo]) ON [PRIMARY]
GO
