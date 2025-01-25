CREATE TABLE [Landing].[MYSOLUTION_Address]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[FirstName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[LastName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Email] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Company] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Country] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[StateProvince] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[City] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Address1] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Address2] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[ZipPostalCode] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PhoneNumber] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[County] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CodiceFiscale] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Piva] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_Address] ADD CONSTRAINT [PK_Landing_MYSOLUTION_Address] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_Address_BusinessKey] ON [Landing].[MYSOLUTION_Address] ([Id]) ON [PRIMARY]
GO
