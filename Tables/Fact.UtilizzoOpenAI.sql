CREATE TABLE [Fact].[UtilizzoOpenAI]
(
[PKUtilizzoOpenAI] [int] NOT NULL CONSTRAINT [DFT_PKUtilizzoOpenAI] DEFAULT (NEXT VALUE FOR [seq_Fact_UtilizzoOpenAI]),
[IDUtilizzoOpenAI] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (32) NULL,
[ChangeHashKey] [varbinary] (32) NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[PKCliente] [int] NOT NULL,
[IDThread] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[IDConversazione] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[PKDataConversazione] [date] NOT NULL,
[Area] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[ModalitaRisposta] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Modello] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[IDVectorStorage] [nvarchar] (200) COLLATE Latin1_General_CI_AS NULL,
[InputTokens] [bigint] NULL,
[OutputTokens] [bigint] NULL,
[ReasoningTokens] [bigint] NULL,
[TotalTokens] [bigint] NULL,
[EstimatedTotalCostUSD] [numeric] (18, 6) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Fact].[UtilizzoOpenAI] ADD CONSTRAINT [PK_Fact_UtilizzoOpenAI] PRIMARY KEY CLUSTERED ([PKUtilizzoOpenAI]) ON [PRIMARY]
GO
ALTER TABLE [Fact].[UtilizzoOpenAI] ADD CONSTRAINT [FK_Fact_UtilizzoOpenAI_PKCliente] FOREIGN KEY ([PKCliente]) REFERENCES [Dim].[Cliente] ([PKCliente])
GO
ALTER TABLE [Fact].[UtilizzoOpenAI] ADD CONSTRAINT [FK_Fact_UtilizzoOpenAI_PKDataConversazione] FOREIGN KEY ([PKDataConversazione]) REFERENCES [Dim].[Data] ([PKData])
GO
