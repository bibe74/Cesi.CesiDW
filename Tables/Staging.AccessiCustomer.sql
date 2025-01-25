CREATE TABLE [Staging].[AccessiCustomer]
(
[Username] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[IDSoggettoCommerciale] [int] NULL,
[IDMySolution] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[AccessiCustomer] ADD CONSTRAINT [PK_Staging_AccessiCustomer] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Username]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_AccessiCustomer_BusinessKey] ON [Staging].[AccessiCustomer] ([Username]) ON [PRIMARY]
GO
