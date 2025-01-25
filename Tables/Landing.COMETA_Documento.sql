CREATE TABLE [Landing].[COMETA_Documento]
(
[id_documento] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[id_prof_documento] [int] NULL,
[id_registro] [int] NULL,
[data_registrazione] [date] NULL,
[num_documento] [nvarchar] (20) COLLATE Latin1_General_CI_AS NULL,
[data_documento] [date] NULL,
[data_competenza] [date] NULL,
[id_sog_commerciale] [int] NULL,
[id_sog_commerciale_fattura] [int] NULL,
[id_gruppo_agenti] [int] NULL,
[data_fine_contratto] [date] NULL,
[libero_4] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[data_inizio_contratto] [date] NULL,
[id_libero_1] [int] NULL,
[id_libero_2] [int] NULL,
[id_libero_3] [int] NULL,
[id_tipo_fatturazione] [int] NULL,
[data_disdetta] [date] NULL,
[motivo_disdetta] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[id_con_pagamento] [int] NULL,
[rinnovo_automatico] [char] (1) COLLATE Latin1_General_CI_AS NULL,
[note_intestazione] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[note_decisionali] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Documento] ADD CONSTRAINT [PK_Landing_COMETA_Documento] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_documento]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Documento_BusinessKey] ON [Landing].[COMETA_Documento] ([id_documento]) ON [PRIMARY]
GO
