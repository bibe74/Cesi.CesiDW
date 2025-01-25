CREATE TABLE [Landing].[COMETA_Anagrafica]
(
[id_anagrafica] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[rag_soc_1] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[rag_soc_2] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[indirizzo] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[cap] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[localita] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[provincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[nazione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[cod_fiscale] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[par_iva] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[indirizzo2] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Anagrafica] ADD CONSTRAINT [PK_Landing_COMETA_Anagrafica] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_anagrafica]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Anagrafica_BusinessKey] ON [Landing].[COMETA_Anagrafica] ([id_anagrafica]) ON [PRIMARY]
GO
