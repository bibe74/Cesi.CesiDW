CREATE TABLE [Landing].[MYSOLUTION_LogsForReport]
(
[Data] [date] NOT NULL,
[Username] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[NumeroAccessi] [int] NULL,
[NumeroPagineVisitate] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_LogsForReport] ADD CONSTRAINT [PK_Landing_MYSOLUTION_LogsForReport] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [Data], [Username]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_LogsForReport_BusinessKey] ON [Landing].[MYSOLUTION_LogsForReport] ([Data], [Username]) ON [PRIMARY]
GO
