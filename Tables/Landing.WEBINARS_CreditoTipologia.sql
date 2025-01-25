CREATE TABLE [Landing].[WEBINARS_CreditoTipologia]
(
[ID] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Ordine] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Tipo] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[WEBINARS_CreditoTipologia] ADD CONSTRAINT [PK_Landing_WEBINARS_CreditoTipologia] PRIMARY KEY CLUSTERED ([UpdateDatetime], [ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WEBINARS_CreditoTipologia_BusinessKey] ON [Landing].[WEBINARS_CreditoTipologia] ([ID]) ON [PRIMARY]
GO
