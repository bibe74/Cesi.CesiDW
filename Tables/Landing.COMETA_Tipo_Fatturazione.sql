CREATE TABLE [Landing].[COMETA_Tipo_Fatturazione]
(
[id_tipo_fatturazione] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[descrizione] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Tipo_Fatturazione] ADD CONSTRAINT [PK_Landing_COMETA_Tipo_Fatturazione] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_tipo_fatturazione]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Tipo_Fatturazione_BusinessKey] ON [Landing].[COMETA_Tipo_Fatturazione] ([id_tipo_fatturazione]) ON [PRIMARY]
GO
