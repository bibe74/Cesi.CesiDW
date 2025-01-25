CREATE TABLE [Landing].[COMETA_MySolutionTrascodifica]
(
[codice] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[tipo] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[COMETA_MySolutionTrascodifica] ADD CONSTRAINT [PK_Landing_COMETA_MySolutionTrascodifica] PRIMARY KEY CLUSTERED ([UpdateDatetime], [codice]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMETA_MySolutionTrascodifica_BusinessKey] ON [Landing].[COMETA_MySolutionTrascodifica] ([codice]) ON [PRIMARY]
GO
