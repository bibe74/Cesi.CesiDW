CREATE TABLE [Landing].[COMETA_Gruppo_Agenti]
(
[id_gruppo_agenti] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[descrizione] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[id_sog_com_capo_area] [int] NULL,
[id_sog_com_agente] [int] NULL,
[id_sog_com_sub_agente] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Gruppo_Agenti] ADD CONSTRAINT [PK_Landing_COMETA_Gruppo_Agenti] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_gruppo_agenti]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Gruppo_Agenti_BusinessKey] ON [Landing].[COMETA_Gruppo_Agenti] ([id_gruppo_agenti]) ON [PRIMARY]
GO
