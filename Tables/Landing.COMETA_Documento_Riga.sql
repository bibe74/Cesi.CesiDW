CREATE TABLE [Landing].[COMETA_Documento_Riga]
(
[id_riga_documento] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[id_documento] [int] NULL,
[id_gruppo_agenti] [int] NULL,
[num_riga] [int] NULL,
[id_articolo] [int] NULL,
[descrizione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[totale_riga] [decimal] (10, 2) NULL,
[provv_calcolata_carea] [decimal] (10, 2) NULL,
[provv_calcolata_agente] [decimal] (10, 2) NULL,
[provv_calcolata_subagente] [decimal] (10, 2) NULL,
[id_riga_doc_provenienza] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Documento_Riga] ADD CONSTRAINT [PK_Landing_COMETA_Documento_Riga] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_riga_documento]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Documento_Riga_BusinessKey] ON [Landing].[COMETA_Documento_Riga] ([id_riga_documento]) ON [PRIMARY]
GO
