CREATE TABLE [Staging].[Budget]
(
[PKData] [date] NOT NULL,
[PKCapoArea] [int] NOT NULL,
[PKMacroTipologia] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[ImportoBudgetNuoveVendite] [decimal] (18, 2) NULL,
[ImportoBudgetRinnovi] [decimal] (18, 2) NULL,
[ImportoBudget] [decimal] (18, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Budget] ADD CONSTRAINT [PK_Staging_Budget] PRIMARY KEY CLUSTERED ([UpdateDatetime], [PKData], [PKCapoArea], [PKMacroTipologia]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_Budget_BusinessKey] ON [Staging].[Budget] ([PKData], [PKCapoArea], [PKMacroTipologia]) ON [PRIMARY]
GO
