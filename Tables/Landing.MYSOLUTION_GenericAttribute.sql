CREATE TABLE [Landing].[MYSOLUTION_GenericAttribute]
(
[Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[EntityId] [int] NOT NULL,
[Key] [nvarchar] (400) COLLATE Latin1_General_CI_AS NOT NULL,
[Value] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_GenericAttribute] ADD CONSTRAINT [PK_Landing_MYSOLUTION_GenericAttribute] PRIMARY KEY CLUSTERED  ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_GenericAttribute_BusinessKey] ON [Landing].[MYSOLUTION_GenericAttribute] ([Id]) ON [PRIMARY]
GO
