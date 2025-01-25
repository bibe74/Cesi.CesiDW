CREATE TABLE [Landing].[MYSOLUTION_CustomerAddresses]
(
[Customer_Id] [int] NOT NULL,
[Address_Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_CustomerAddresses] ADD CONSTRAINT [PK_Landing_MYSOLUTION_CustomerAddresses] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [Customer_Id], [Address_Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_CustomerAddresses_BusinessKey] ON [Landing].[MYSOLUTION_CustomerAddresses] ([Customer_Id], [Address_Id]) ON [PRIMARY]
GO
