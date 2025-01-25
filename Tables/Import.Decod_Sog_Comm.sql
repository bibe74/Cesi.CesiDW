CREATE TABLE [Import].[Decod_Sog_Comm]
(
[tipo] [char] (1) COLLATE Latin1_General_CI_AS NOT NULL,
[descr_sog_com] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Decod_Sog_Comm] ADD CONSTRAINT [PK_Import_Decod_Sog_Comm] PRIMARY KEY CLUSTERED  ([tipo]) ON [PRIMARY]
GO
