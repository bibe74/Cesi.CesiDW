CREATE TABLE [Landing].[COMETA_Scadenza]
(
[id_scadenza] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[tipo_scadenza] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[id_sog_commerciale] [int] NULL,
[data_scadenza] [datetime2] NULL,
[importo] [numeric] (18, 0) NULL,
[stato_scadenza] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[esito_pagamento] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[id_documento] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_Scadenza] ADD CONSTRAINT [PK_Landing_COMETA_Scadenza] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_scadenza]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_Scadenza_BusinessKey] ON [Landing].[COMETA_Scadenza] ([id_scadenza]) ON [PRIMARY]
GO
