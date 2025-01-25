CREATE TABLE [Landing].[COMETA_CondizioniPagamento]
(
[id_con_pagamento] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Codice] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Descrizione] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_CondizioniPagamento] ADD CONSTRAINT [PK_Landing_COMETA_CondizioniPagamento] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_con_pagamento]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_CondizioniPagamento_BusinessKey] ON [Landing].[COMETA_CondizioniPagamento] ([id_con_pagamento]) ON [PRIMARY]
GO
