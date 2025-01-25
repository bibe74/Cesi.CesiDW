CREATE TABLE [Fact].[Crediti]
(
[PKCrediti] [int] NOT NULL CONSTRAINT [DFT_Fact_Crediti_PKCrediti] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_Crediti]),
[ID] [int] NOT NULL,
[PKCorso] [int] NOT NULL,
[PKDataCreazione] [date] NOT NULL,
[AnnoCreazione] AS (datepart(year,[PKDataCreazione])),
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[IDCorso] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Nome] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Cognome] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceFiscale] [nvarchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[EMail] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Professione] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[Ordine] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[EnteAccreditante] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[TipoCrediti] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[StatoCrediti] [nvarchar] (40) COLLATE Latin1_General_CI_AS NOT NULL,
[CodiceMateria] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Crediti] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Crediti] ADD CONSTRAINT [PK_Fact_Crediti] PRIMARY KEY CLUSTERED ([PKCrediti]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Fact_Crediti_AnnoCreazione_CodiceFiscale] ON [Fact].[Crediti] ([AnnoCreazione], [CodiceFiscale]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[Crediti] ADD CONSTRAINT [FK_Fact_Crediti_PKCorso] FOREIGN KEY ([PKCorso]) REFERENCES [Dim].[Corso] ([PKCorso])
GO
ALTER TABLE [Fact].[Crediti] ADD CONSTRAINT [FK_Fact_Crediti_PKDataCreazione] FOREIGN KEY ([PKDataCreazione]) REFERENCES [Dim].[Data] ([PKData])
GO
