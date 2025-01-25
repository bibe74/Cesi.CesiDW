CREATE TABLE [Staging].[Corso]
(
[IDCorso] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Corso] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[TipoCorso] [varchar] (500) COLLATE Latin1_General_CI_AS NULL,
[Giornata] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[PKDataInizioCorso] [date] NOT NULL,
[OraInizioCorso] [nvarchar] (4000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Corso] ADD CONSTRAINT [PK_Landing_WEBINARS_WeBinars] PRIMARY KEY CLUSTERED ([UpdateDatetime], [IDCorso]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WEBINARS_WeBinars_BusinessKey] ON [Staging].[Corso] ([IDCorso]) ON [PRIMARY]
GO
