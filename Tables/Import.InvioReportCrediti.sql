CREATE TABLE [Import].[InvioReportCrediti]
(
[Email] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[Descrizione] [nvarchar] (40) COLLATE Latin1_General_CI_AS NULL,
[Note] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[InvioReportCrediti] ADD CONSTRAINT [PK_Import_InvioReportCrediti] PRIMARY KEY CLUSTERED ([Email]) ON [PRIMARY]
GO
