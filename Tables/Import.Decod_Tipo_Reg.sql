CREATE TABLE [Import].[Decod_Tipo_Reg]
(
[tipo_registro] [char] (2) COLLATE Latin1_General_CI_AS NOT NULL,
[descr_tipo_reg] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Decod_Tipo_Reg] ADD CONSTRAINT [PK_Import_Decod_Tipo_Reg] PRIMARY KEY CLUSTERED  ([tipo_registro]) ON [PRIMARY]
GO
