CREATE TABLE [Landing].[MYSOLUTION_CoursesData]
(
[OrderItemId] [int] NOT NULL,
[Partecipant_Id] [int] NOT NULL,
[HistoricalHashKey] [varbinary] (20) NULL,
[ChangeHashKey] [varbinary] (20) NULL,
[HistoricalHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[ChangeHashKeyASCII] [varchar] (34) COLLATE Latin1_General_CI_AS NULL,
[InsertDatetime] [datetime] NOT NULL,
[UpdateDatetime] [datetime] NOT NULL,
[IsDeleted] [bit] NULL,
[PartecipantFirstName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PartecipantLastName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PartecipantEmail] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[PartecipantFiscalCode] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[RootPartecipantEmail] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[CustomerUserName] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NULL,
[CourseName] [nvarchar] (400) COLLATE Latin1_General_CI_AS NOT NULL,
[CourseCode] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[AttCourseCode] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[WebinarCode] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[AttWebinarCode] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[CourseType] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[StartDate_text] [nvarchar] (400) COLLATE Latin1_General_CI_AS NULL,
[StartDate] [date] NULL,
[HasMoreDates] [bit] NULL,
[OrderDescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[ItemNetUnitPrice] [numeric] (18, 4) NOT NULL,
[OrderTotalPrice] [numeric] (18, 4) NOT NULL,
[OrderNumber] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[OrderStatus] [int] NOT NULL,
[OrderCreatedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Landing].[MYSOLUTION_CoursesData] ADD CONSTRAINT [PK_Landing_MYSOLUTION_CoursesData] PRIMARY KEY CLUSTERED ([UpdateDatetime], [OrderItemId], [Partecipant_Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MYSOLUTION_CoursesData_BusinessKey] ON [Landing].[MYSOLUTION_CoursesData] ([OrderItemId], [Partecipant_Id]) ON [PRIMARY]
GO
