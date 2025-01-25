CREATE TABLE [Landing].[COMETA_Libero_2]
(
[id_libero_2] [int] NOT NULL,
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
ALTER TABLE [Landing].[COMETA_Libero_2] ADD CONSTRAINT [PK_Landing_COMETA_Libero_2] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_libero_2]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Libero_2_BusinessKey] ON [Landing].[COMETA_Libero_2] ([id_libero_2]) ON [PRIMARY]
GO
