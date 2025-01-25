CREATE TABLE [Landing].[MYSOLUTION_NopCustomer]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[Username] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[Email] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[Active] [bit] NOT NULL,
[Deleted] [bit] NOT NULL,
[BillingAddress_Id] [int] NULL,
[ShippingAddress_Id] [int] NULL,
[IdCometa] [int] NOT NULL,
[DateExpiration] [datetime2] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_NopCustomer] ADD CONSTRAINT [PK_Landing_MYSOLUTION_NopCustomer] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_NopCustomer_BusinessKey] ON [Landing].[MYSOLUTION_NopCustomer] ([Id]) ON [PRIMARY]
GO
