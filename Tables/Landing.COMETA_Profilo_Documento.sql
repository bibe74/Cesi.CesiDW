CREATE TABLE [Landing].[COMETA_Profilo_Documento]
(
[id_prof_documento] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[descrizione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[tipo_registro] [char] (2) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Profilo_Documento] ADD CONSTRAINT [PK_Landing_COMETA_Profilo_Documento] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_prof_documento]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Profilo_Documento_BusinessKey] ON [Landing].[COMETA_Profilo_Documento] ([id_prof_documento]) ON [PRIMARY]
GO
