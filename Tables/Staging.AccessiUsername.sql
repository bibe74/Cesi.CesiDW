CREATE TABLE [Staging].[AccessiUsername]
(
[UsernameAccessi] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Username] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[AccessiUsername] ADD CONSTRAINT [PK_Staging_AccessiUsername] PRIMARY KEY CLUSTERED ([UsernameAccessi]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Staging_AccessiUsername_BusinessKey] ON [Staging].[AccessiUsername] ([UsernameAccessi]) ON [PRIMARY]
GO
