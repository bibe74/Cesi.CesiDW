CREATE TABLE [Import].[Amministratori]
(
[Amministratore] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[ADUser] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Email] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Amministratori] ADD CONSTRAINT [PK_Import_Amministratori] PRIMARY KEY CLUSTERED ([Amministratore]) ON [PRIMARY]
GO
