CREATE TABLE [Import].[Budget]
(
[PKDataInizioMese] [date] NOT NULL,
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[ImportoBudgetNuoveVendite] [decimal] (18, 2) NOT NULL,
[ImportoBudgetRinnovi] [decimal] (18, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Budget] ADD CONSTRAINT [PK_Import_Budget] PRIMARY KEY CLUSTERED ([PKDataInizioMese], [CapoArea]) ON [PRIMARY]
GO
