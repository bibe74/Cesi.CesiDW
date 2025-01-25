CREATE TABLE [Landing].[COMETA_Registro]
(
[id_registro] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[id_esercizio] [int] NULL,
[tipo_registro] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[id_mod_registro] [int] NULL,
[numero] [numeric] (18, 0) NULL,
[descrizione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Registro] ADD CONSTRAINT [PK_Landing_COMETA_Registro] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_registro]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Registro_BusinessKey] ON [Landing].[COMETA_Registro] ([id_registro]) ON [PRIMARY]
GO
