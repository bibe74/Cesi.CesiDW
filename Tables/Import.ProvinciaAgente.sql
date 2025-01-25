CREATE TABLE [Import].[ProvinciaAgente]
(
[IDProvincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Agente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[ProvinciaAgente] ADD CONSTRAINT [PK_Import_ProvinciaAgente] PRIMARY KEY CLUSTERED ([IDProvincia]) ON [PRIMARY]
GO
