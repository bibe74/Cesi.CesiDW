CREATE TABLE [Landing].[COMETA_MovimentiScadenza]
(
[id_mov_scadenza] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[id_scadenza] [int] NULL,
[data] [datetime2] NULL,
[importo] [numeric] (18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_MovimentiScadenza] ADD CONSTRAINT [PK_Landing_COMETA_MovimentiScadenza] PRIMARY KEY CLUSTERED ([UpdateDatetime], [id_mov_scadenza]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_MovimentiScadenza_BusinessKey] ON [Landing].[COMETA_MovimentiScadenza] ([id_mov_scadenza]) ON [PRIMARY]
GO
