CREATE TABLE [Landing].[COMETA_Telefono]
(
[id_telefono] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[id_anagrafica] [int] NULL,
[tipo] [char] (1) COLLATE Latin1_General_CI_AS NULL,
[num_riferimento] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[descrizione] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[interlocutore] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[nome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[cognome] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[ruolo] [numeric] (18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Telefono] ADD CONSTRAINT [PK_Landing_COMETA_Telefono] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_telefono]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Telefono_BusinessKey] ON [Landing].[COMETA_Telefono] ([id_telefono]) ON [PRIMARY]
GO
