CREATE TABLE [Staging].[MacroTipologia]
(
[MacroTipologia] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[IsValidaPerBudgetNuoveVendite] [bit] NOT NULL,
[IsValidaPerBudgetRinnovi] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[MacroTipologia] ADD CONSTRAINT [PK_Import_MacroTipologia] PRIMARY KEY CLUSTERED ([UpdateDatetime], [MacroTipologia]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MacroTipologia_BusinessKey] ON [Staging].[MacroTipologia] ([MacroTipologia]) ON [PRIMARY]
GO
