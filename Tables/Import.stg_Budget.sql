CREATE TABLE [Import].[stg_Budget]
(
[Agente] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[DataInizioMese] [datetime] NULL,
[BudgetNuoveVendite] [money] NULL,
[BudgetRinnovi] [money] NULL
) ON [PRIMARY]
GO
