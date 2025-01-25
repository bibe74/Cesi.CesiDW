CREATE TABLE [Landing].[MYSOLUTION_OrderItemPartecipant]
(
[OrderItemId] [int] NOT NULL,
[PartecipantId] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[OrderId] [int] NOT NULL,
[OrderTotal] [numeric] (18, 4) NOT NULL,
[OrderAuthorizationTransactionId] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[OrderPaidDate] [datetime2] NULL,
[OrderCreatedDate] [datetime2] NOT NULL,
[OrderCustomerId] [int] NOT NULL,
[OrderStatusId] [int] NOT NULL,
[OrderNumber] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[OrderItemUnitPriceExclTax] [numeric] (18, 4) NOT NULL,
[OrderItemAttributeDescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[AttributeMappingId] [varchar] (max) COLLATE Latin1_General_CI_AS NULL,
[AttributeValue] [varchar] (max) COLLATE Latin1_General_CI_AS NULL,
[AttributeMappingId2] [varchar] (max) COLLATE Latin1_General_CI_AS NULL,
[AttributeValue2] [varchar] (max) COLLATE Latin1_General_CI_AS NULL,
[ProductId] [int] NOT NULL,
[ProductName] [nvarchar] (400) COLLATE Latin1_General_CI_AS NOT NULL,
[ProductShortDescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[ProductSku] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[ProductGtin] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[ProductSubdescription] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[ProductAttributeCombinationSku] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[ProductAttributeCombinationGtin] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[PartecipantFirstName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PartecipantLastName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PartecipantEmail] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PartecipantFiscalCode] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[RootPartecipantEmail] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_OrderItemPartecipant] ADD CONSTRAINT [PK_Landing_MYSOLUTION_OrderItemPartecipant] PRIMARY KEY CLUSTERED ([UpdateDatetime], [OrderItemId], [PartecipantId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_OrderItemPartecipant_BusinessKey] ON [Landing].[MYSOLUTION_OrderItemPartecipant] ([OrderItemId], [PartecipantId]) ON [PRIMARY]
GO
