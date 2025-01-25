CREATE TABLE [Import].[Provincia]
(
[Provincia] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[CodSiglaProvincia] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DescrProvincia] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[CodCittaMetropolitana] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[CodRegione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DescrRegione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[CodMacroregione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DescrMacroregione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[CodNazione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DescrNazione] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DataInizioValidita] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[DataFineValidita] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[Provincia] ADD CONSTRAINT [PK_Import_Provincia] PRIMARY KEY CLUSTERED  ([CodSiglaProvincia]) ON [PRIMARY]
GO
