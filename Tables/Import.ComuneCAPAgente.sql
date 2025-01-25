CREATE TABLE [Import].[ComuneCAPAgente]
(
[IDProvincia] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Comune] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[CAP] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Agente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[ComuneCAPAgente] ADD CONSTRAINT [PK_Import_ComuneCAPAgente] PRIMARY KEY CLUSTERED ([IDProvincia], [Comune], [CAP]) ON [PRIMARY]
GO
