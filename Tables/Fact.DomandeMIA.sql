CREATE TABLE [Fact].[DomandeMIA]
(
[PKDomandeMIA] [int] NOT NULL CONSTRAINT [DFT_Fact_DomandeMIA_PKDomandeMIA] DEFAULT (NEXT VALUE FOR [dbo].[seq_Fact_DomandeMIA]),
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[PKDataCreazione] [date] NOT NULL,
[Testo] [nvarchar] (2000) COLLATE Latin1_General_CI_AS NULL,
[IsDomanda] [bit] NOT NULL,
[Area] [nvarchar] (80) COLLATE Latin1_General_CI_AS NULL,
[Email] [nvarchar] (60) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[DomandeMIA] ADD CONSTRAINT [PK_Fact_DomandeMIA] PRIMARY KEY CLUSTERED ([PKDomandeMIA]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[DomandeMIA] ADD CONSTRAINT [FK_Fact_DomandeMIA_PKDataCreazione] FOREIGN KEY ([PKDataCreazione]) REFERENCES [Dim].[Data] ([PKData])
GO
