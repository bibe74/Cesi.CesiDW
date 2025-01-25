CREATE TABLE [Dim].[Corso]
(
[PKCorso] [int] NOT NULL CONSTRAINT [DFT_Dim_Corso_PKCorso] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_Corso]),
[IDCorso] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Corso_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_Corso_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_Corso_IsDeleted] DEFAULT ((0)),
[Corso] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[TipoCorso] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[Giornata] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[PKDataInizioCorso] [date] NOT NULL,
[OraInizioCorso] [nvarchar] (10) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Corso] ADD CONSTRAINT [PK_Dim_Corso] PRIMARY KEY CLUSTERED ([PKCorso]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_Corso_id_Corso] ON [Dim].[Corso] ([IDCorso]) ON [PRIMARY]
GO
ALTER TABLE [Dim].[Corso] ADD CONSTRAINT [FK_Dim_Corso_PKDataInizioCorso] FOREIGN KEY ([PKDataInizioCorso]) REFERENCES [Dim].[Data] ([PKData])
GO
