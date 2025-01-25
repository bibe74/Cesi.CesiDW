CREATE TABLE [Import].[CapoAreaDefault_GruppoAgenti]
(
[CapoAreaDefault] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[PKGruppoAgentiDefault] [int] NOT NULL,
[IDGruppoAgenti] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL,
[GruppoAgenti] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[CapoAreaDefault_GruppoAgenti] ADD CONSTRAINT [PK_Import_CapoAreaDefault_GruppoAgenti] PRIMARY KEY CLUSTERED ([CapoAreaDefault]) ON [PRIMARY]
GO
