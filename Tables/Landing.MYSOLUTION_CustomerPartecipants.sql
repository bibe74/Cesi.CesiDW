CREATE TABLE [Landing].[MYSOLUTION_CustomerPartecipants]
(
[Customer_Id] [int] NOT NULL,
[Partecipant_Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_CustomerPartecipants] ADD CONSTRAINT [PK_Landing_MYSOLUTION_CustomerPartecipants] PRIMARY KEY CLUSTERED ([UpdateDatetime], [Customer_Id], [Partecipant_Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_CustomerPartecipants_BusinessKey] ON [Landing].[MYSOLUTION_CustomerPartecipants] ([Customer_Id], [Partecipant_Id]) ON [PRIMARY]
GO
