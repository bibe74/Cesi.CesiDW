CREATE TABLE [Dim].[CapoArea]
(
[PKCapoArea] [int] NOT NULL CONSTRAINT [DFT_Dim_CapoArea_PKCapoArea] DEFAULT (NEXT VALUE FOR [dbo].[seq_Dim_CapoArea]),
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_CapoArea_InsertDatetime] DEFAULT (getdate()),
[UpdateDatetime] [datetime] NOT NULL CONSTRAINT [DFT_Dim_CapoArea_UpdateDatetime] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DFT_Dim_CapoArea_IsDeleted] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [Dim].[CapoArea] ADD CONSTRAINT [PK_Dim_CapoArea] PRIMARY KEY CLUSTERED ([PKCapoArea]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dim_CapoArea_GUIDCapoArea] ON [Dim].[CapoArea] ([CapoArea]) ON [PRIMARY]
GO
