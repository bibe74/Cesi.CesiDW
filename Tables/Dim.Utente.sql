CREATE TABLE [Dim].[Utente]
(
[PKUtente] [int] NOT NULL CONSTRAINT [DFT_Dim_Utente_PKUtente] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_Utente]),
[IDUtente] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Utente_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Utente_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_Utente_IsDeleted] DEFAULT ((0)),
[Email] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[RagioneSociale] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Cognome] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Citta] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[PKCliente] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Utente] ADD CONSTRAINT [PK_Dim_Utente] PRIMARY KEY CLUSTERED ([PKUtente]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Utente_id_Utente] ON [Dim].[Utente] ([IDUtente]) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Utente] ADD CONSTRAINT [FK_Dim_Utente_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
