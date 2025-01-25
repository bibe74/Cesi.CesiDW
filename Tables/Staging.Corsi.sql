CREATE TABLE [Staging].[Corsi]
(
[OrderItemId] [int] NOT NULL,
[Partecipant_Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[NomePartecipante] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CognomePartecipante] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[EmailPartecipante] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CodiceFiscalePartecipante] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[EmailPartecipanteRoot] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Utente] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[PKUtente] [int] NULL,
[Corso] [nvarchar] (400) COLLATE Latin1_General_CI_AS NOT NULL,
[IDCorso] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[IDWebinar] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[TipoCorso] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PKDataInizio] [date] NULL,
[HasDateMultiple] [bit] NULL,
[DescrizioneOrdine] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PrezzoUnitarioOrdine] [numeric] (18, 4) NOT NULL,
[ImportoTotaleOrdine] [numeric] (18, 4) NOT NULL,
[NumeroOrdine] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[StatoOrdine] [int] NOT NULL,
[PKDataIscrizione] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[Corsi] ADD CONSTRAINT [PK_Landing_MYSOLUTION_CoursesData] PRIMARY KEY CLUSTERED ([UpdateDatetime], [OrderItemId], [Partecipant_Id]) ON [PRIMARY]
GO
