CREATE TABLE [Landing].[COMETA_Esercizio]
(
[id_esercizio] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[codice] [char] (4) COLLATE Latin1_General_CI_AS NULL,
[data_inizio] [date] NULL,
[data_fine] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Esercizio] ADD CONSTRAINT [PK_Landing_COMETA_Esercizio] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [id_esercizio]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Esercizio_BusinessKey] ON [Landing].[COMETA_Esercizio] ([id_esercizio]) ON [PRIMARY]
GO
