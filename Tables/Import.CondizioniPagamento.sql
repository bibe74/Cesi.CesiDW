CREATE TABLE [Import].[CondizioniPagamento]
(
[CodiceCondizioniPagamento] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[CondizioniPagamento] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoContratto] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[ProvvigioniAgenti] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[CondizioniPagamento] ADD CONSTRAINT [PK_Import_CondizioniPagamento] PRIMARY KEY CLUSTERED ([CodiceCondizioniPagamento]) ON [PRIMARY]
GO
