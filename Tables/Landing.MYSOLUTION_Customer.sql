CREATE TABLE [Landing].[MYSOLUTION_Customer]
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
[IdCometa] [int] NOT NULL,
[AdminComment] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[IsTaxExempt] [bit] NOT NULL,
[HasShoppingCartItems] [bit] NOT NULL,
[Active] [bit] NOT NULL,
[Deleted] [bit] NOT NULL,
[IsSystemAccount] [bit] NOT NULL,
[SystemName] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[LastIpAddress] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CreatedOnUtc] [datetime2] NOT NULL,
[LastLoginDateUtc] [datetime2] NULL,
[LastActivityDateUtc] [datetime2] NOT NULL,
[CustomerGuid] [uniqueidentifier] NOT NULL,
[EmailToRevalidate] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[AffiliateId] [int] NOT NULL,
[VendorId] [int] NOT NULL,
[RequireReLogin] [bit] NOT NULL,
[FailedLoginAttempts] [int] NOT NULL,
[CannotLoginUntilDateUtc] [datetime2] NULL,
[RegisteredInStoreId] [int] NOT NULL,
[BillingAddress_Id] [int] NULL,
[ShippingAddress_Id] [int] NULL,
[MysolutionSubscriptionQuote] [int] NULL,
[SendRiqualification] [bit] NOT NULL,
[IsSpecial] [bit] NOT NULL,
[DateExpiration] [datetime2] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_Customer] ADD CONSTRAINT [PK_Landing_MYSOLUTION_Customer] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_Customer_BusinessKey] ON [Landing].[MYSOLUTION_Customer] ([Id]) ON [PRIMARY]
GO
