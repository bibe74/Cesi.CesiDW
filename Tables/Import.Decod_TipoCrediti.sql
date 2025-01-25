CREATE TABLE [Import].[Decod_TipoCrediti]
(
[IDTipoCrediti] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoCrediti] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Decod_TipoCrediti] ADD CONSTRAINT [PK_Import_Decod_TipoCrediti] PRIMARY KEY CLUSTERED ([IDTipoCrediti]) ON [PRIMARY]
GO
