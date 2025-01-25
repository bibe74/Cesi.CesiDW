CREATE TABLE [Fact].[Budget]
(
[PKBudget] [int] NOT NULL CONSTRAINT [DFT_Fact_Budget_PKBudget] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_Budget]),
[PKData] [date] NOT NULL,
[PKCapoArea] [int] NOT NULL,
[PKMacroTipologia] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[ImportoBudgetNuoveVendite] [decimal] (10, 2) NULL,
[ImportoBudgetRinnovi] [decimal] (10, 2) NULL,
[ImportoBudget] [decimal] (10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Budget] ADD CONSTRAINT [PK_Fact_Budget] PRIMARY KEY CLUSTERED ([PKBudget]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Budget_PKData_PKCapoArea_PKMacroTipologia] ON [Fact].[Budget] ([PKData], [PKCapoArea], [PKMacroTipologia]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Budget] ADD CONSTRAINT [FK_Fact_Budget_PKCapoArea] FOREIGN KEY ([PKCapoArea]) REFERENCES [Dim].[CapoArea] ([PKCapoArea])
GO
ALTER TABLE [Fact].[Budget] ADD CONSTRAINT [FK_Fact_Budget_PKData] FOREIGN KEY ([PKData]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Budget] ADD CONSTRAINT [FK_Fact_Budget_PKMacroTipologia] FOREIGN KEY ([PKMacroTipologia]) REFERENCES [Dim].[MacroTipologia] ([PKMacroTipologia])
GO
