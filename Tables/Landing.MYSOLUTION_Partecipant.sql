CREATE TABLE [Landing].[MYSOLUTION_Partecipant]
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
[PhoneNumber] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Ssn] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CreatedOnUtc] [datetime2] NOT NULL,
[IdProfession] [int] NOT NULL,
[IdProfessionDetail] [int] NOT NULL,
[MobilePhone] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[OriginalPartecipantId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_Partecipant] ADD CONSTRAINT [PK_Landing_MYSOLUTION_Partecipant] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_Partecipant_BusinessKey] ON [Landing].[MYSOLUTION_Partecipant] ([Id]) ON [PRIMARY]
GO
