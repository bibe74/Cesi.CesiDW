CREATE TABLE [Import].[ProfiliDocumento]
(
[id_prof_documento] [int] NOT NULL,
[Profilo] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL,
[IsProfiloValidoPerStatisticaFatturato] [bit] NOT NULL,
[IsProfiloValidoPerStatisticaFatturatoFormazione] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[ProfiliDocumento] ADD CONSTRAINT [PK_Import_ProfiliDocumento] PRIMARY KEY CLUSTERED ([id_prof_documento]) ON [PRIMARY]
GO
