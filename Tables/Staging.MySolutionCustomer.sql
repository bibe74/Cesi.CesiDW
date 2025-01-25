CREATE TABLE [Staging].[MySolutionCustomer]
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
[Company] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CodiceFiscale] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[VATNumber] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[FirstName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[LastName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[StreetAddress] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[ZipPostalCode] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Phone] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Cellulare] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[City] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CountryId] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Country] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[StateProvinceId] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[StateProvince] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[rnCustomerDESC] [bigint] NULL,
[HasRoleMySolutionDemo] [bit] NOT NULL,
[HasRoleMySolutionInterno] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[MySolutionCustomer] ADD CONSTRAINT [PK_Staging_MySolutionCustomer] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_MySolutionCustomer_BusinessKey] ON [Staging].[MySolutionCustomer] ([Id]) ON [PRIMARY]
GO
