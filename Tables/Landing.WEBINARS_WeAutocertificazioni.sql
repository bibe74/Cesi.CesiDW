CREATE TABLE [Landing].[WEBINARS_WeAutocertificazioni]
(
[ID] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Corso] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Cognome] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceFiscale] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Professione] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[Ordine] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[DataCreazione] [date] NULL,
[Email] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[WEBINARS_WeAutocertificazioni] ADD CONSTRAINT [PK_Landing_WEBINARS_WeAutocertificazioni] PRIMARY KEY CLUSTERED ([UpdateDatetime], [ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WEBINARS_WeAutocertificazioni_BusinessKey] ON [Landing].[WEBINARS_WeAutocertificazioni] ([ID]) ON [PRIMARY]
GO
