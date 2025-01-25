CREATE TABLE [Import].[LiquidazioneProvvigioneTeorica]
(
[DurataContratto] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceCondizioniPagamento] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[LiquidazioneProvvigioneTeorica] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[LiquidazioneProvvigioneTeorica] ADD CONSTRAINT [PK_Import_LiquidazioneProvvigioneTeorica] PRIMARY KEY CLUSTERED ([DurataContratto], [CodiceCondizioniPagamento]) ON [PRIMARY]
GO
