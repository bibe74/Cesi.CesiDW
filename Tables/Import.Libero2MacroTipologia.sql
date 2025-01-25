CREATE TABLE [Import].[Libero2MacroTipologia]
(
[IDLibero2] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Libero2] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[MacroTipologia] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[IsValidaPerBudgetNuoveVendite] [bit] NOT NULL,
[IsValidaPerBudgetRinnovi] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Libero2MacroTipologia] ADD CONSTRAINT [PK_Import_Libero2MacroTipologia] PRIMARY KEY CLUSTERED ([IDLibero2]) ON [PRIMARY]
GO
