CREATE TABLE [Fact].[Corsi]
(
[PKCorsi] [int] NOT NULL CONSTRAINT [DFT_Fact_Corsi_PKCorsi] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_Corsi]),
[OrderItemId] [int] NOT NULL,
[Partecipant_Id] [int] NOT NULL,
[PKUtente] [int] NOT NULL,
[PKDataInizio] [date] NOT NULL,
[PKDataIscrizione] [date] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[NomePartecipante] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[CognomePartecipante] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[EmailPartecipante] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[CodiceFiscalePartecipante] [nvarchar] (20) COLLATE Latin1_General_CI_AS NULL,
[EmailPartecipanteRoot] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[Utente] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[Corso] [nvarchar] (240) COLLATE Latin1_General_CI_AS NOT NULL,
[IDCorso] [nvarchar] (20) COLLATE Latin1_General_CI_AS NULL,
[IDWebinar] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[TipoCorso] [nvarchar] (120) COLLATE Latin1_General_CI_AS NULL,
[HasDateMultiple] [bit] NULL,
[DescrizioneOrdine] [nvarchar] (240) COLLATE Latin1_General_CI_AS NULL,
[PrezzoUnitarioOrdine] [decimal] (10, 2) NOT NULL,
[NumeroOrdine] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[StatoOrdine] [int] NOT NULL,
[ImportoTotaleOrdine] [decimal] (10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Corsi] ADD CONSTRAINT [PK_Fact_Corsi] PRIMARY KEY CLUSTERED ([PKCorsi]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Fact_Corsi_OrderItemId_Partecipant_Id] ON [Fact].[Corsi] ([OrderItemId], [Partecipant_Id]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Corsi] ADD CONSTRAINT [FK_Fact_Corsi_PKDataInizio] FOREIGN KEY ([PKDataInizio]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Corsi] ADD CONSTRAINT [FK_Fact_Corsi_PKDataIscrizione] FOREIGN KEY ([PKDataIscrizione]) REFERENCES [Dim].[Data] ([PKData])
GO
ALTER TABLE [Fact].[Corsi] ADD CONSTRAINT [FK_Fact_Corsi_PKUtente] FOREIGN KEY ([PKUtente]) REFERENCES [Dim].[Utente] ([PKUtente])
GO
