CREATE TABLE [Dim].[MacroTipologia]
(
[PKMacroTipologia] [int] NOT NULL CONSTRAINT [DFT_Dim_MacroTipologia_PKMacroTipologia] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_MacroTipologia]),
[MacroTipologia] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_MacroTipologia_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_MacroTipologia_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_MacroTipologia_IsDeleted] DEFAULT ((0)),
[IsValidaPerBudgetNuoveVendite] [bit] NOT NULL,
[IsValidaPerBudgetRinnovi] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[MacroTipologia] ADD CONSTRAINT [PK_Dim_MacroTipologia] PRIMARY KEY CLUSTERED ([PKMacroTipologia]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_MacroTipologia_id_MacroTipologia] ON [Dim].[MacroTipologia] ([MacroTipologia]) ON [PRIMARY]
GO
