CREATE TABLE [Import].[Decod_StatoCrediti]
(
[IDStatoCrediti] [tinyint] NOT NULL,
[StatoCrediti] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Decod_StatoCrediti] ADD CONSTRAINT [PK_Import_Decod_StatoCrediti] PRIMARY KEY CLUSTERED ([IDStatoCrediti]) ON [PRIMARY]
GO
