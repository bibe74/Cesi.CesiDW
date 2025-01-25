CREATE TABLE [Staging].[CapoArea]
(
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[CapoArea] ADD CONSTRAINT [PK_Staging_CapoArea] PRIMARY KEY CLUSTERED ([UpdateDatetime], [CapoArea]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_CapoArea_BusinessKey] ON [Staging].[CapoArea] ([CapoArea]) ON [PRIMARY]
GO
