CREATE TABLE [Landing].[WEBINARS_CreditoAutocertificazione]
(
[ID] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[AutocertificazioneID] [int] NOT NULL,
[CreditoTipologiaID] [int] NOT NULL,
[CreditoCorsoID] [int] NULL,
[Stato] [tinyint] NOT NULL,
[Crediti] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[WEBINARS_CreditoAutocertificazione] ADD CONSTRAINT [PK_Landing_WEBINARS_CreditoAutocertificazione] PRIMARY KEY CLUSTERED ([UpdateDatetime], [ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WEBINARS_CreditoAutocertificazione_BusinessKey] ON [Landing].[WEBINARS_CreditoAutocertificazione] ([ID]) ON [PRIMARY]
GO
