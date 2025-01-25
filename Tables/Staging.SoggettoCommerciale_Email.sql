CREATE TABLE [Staging].[SoggettoCommerciale_Email]
(
[IDSoggettoCommerciale] [int] NOT NULL,
[Email] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[rnEmail] [int] NOT NULL,
[rnSoggettoCommercialeDESC] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[SoggettoCommerciale_Email] ADD CONSTRAINT [PK_Landing_COMETA_Telefono] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [IDSoggettoCommerciale], [Email]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Staging_SoggettoCommerciale_Email_Email_rnSoggettoCommercialeDESC] ON [Staging].[SoggettoCommerciale_Email] ([Email], [rnSoggettoCommercialeDESC]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Staging_SoggettoCommerciale_Email_BusinessKey] ON [Staging].[SoggettoCommerciale_Email] ([IDSoggettoCommerciale], [Email]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Staging_SoggettoCommerciale_IDSoggettoCommerciale_rnEmail] ON [Staging].[SoggettoCommerciale_Email] ([IDSoggettoCommerciale], [rnEmail]) ON [PRIMARY]
GO
