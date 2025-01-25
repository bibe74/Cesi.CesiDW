CREATE TABLE [Landing].[WEBINARS_CreditoCorso]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[CreditoTipologiaID] [int] NOT NULL,
[WebinarSource] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Autocertificazione] [bit] NOT NULL,
[Crediti] [tinyint] NOT NULL,
[Ora] [int] NULL,
[CodiceMateria] [varchar] (50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[WEBINARS_CreditoCorso] ADD CONSTRAINT [PK_Landing_WEBINARS_CreditoCorso] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WEBINARS_CreditoCorso_BusinessKey] ON [Landing].[WEBINARS_CreditoCorso] ([Id]) ON [PRIMARY]
GO
