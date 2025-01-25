CREATE TABLE [Staging].[Crediti]
(
[ID] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[IDCorso] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[PKCorso] [int] NOT NULL,
[Nome] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[Cognome] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[CodiceFiscale] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[Professione] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[Ordine] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[PKDataCreazione] [date] NOT NULL,
[Email] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[EnteAccreditante] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoCrediti] [nvarchar] (40) COLLATE Latin1_General_CI_AS NULL,
[StatoCrediti] [nvarchar] (40) COLLATE Latin1_General_CI_AS NULL,
[CodiceMateria] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Crediti] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Crediti] ADD CONSTRAINT [PK_Landing_WEBINARS_CreditoAutocertificazione] PRIMARY KEY CLUSTERED ([UpdateDatetime], [ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WEBINARS_CreditoAutocertificazione_BusinessKey] ON [Staging].[Crediti] ([ID]) ON [PRIMARY]
GO
