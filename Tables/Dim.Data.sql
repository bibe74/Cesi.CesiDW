CREATE TABLE [Dim].[Data]
(
[PKData] [date] NOT NULL,
[Data_IT] [varchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[Anno] [int] NOT NULL,
[Mese] [int] NOT NULL,
[Mese_IT] [varchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[AnnoMese] [int] NOT NULL,
[AnnoMese_IT] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[Settimana] [int] NOT NULL,
[AnnoSettimana] [int] NOT NULL,
[AnnoSettimana_IT] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[SettimanaDescrizione] [nvarchar] (24) COLLATE Latin1_General_CI_AS NOT NULL,
[IsOrdinazioneChiusa] [bit] NOT NULL CONSTRAINT [DFT_Dim_Data_IsOrdinazioneChiusa] DEFAULT ((0)),
[IsOrdinazioneMensileChiusa] [bit] NOT NULL CONSTRAINT [DFT_Dim_Data_IsOrdinazioneMensileChiusa] DEFAULT ((0)),
[GiornoSettimana] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Data] ADD CONSTRAINT [PK_Dim_Data] PRIMARY KEY CLUSTERED ([PKData]) ON [PRIMARY]
GO
