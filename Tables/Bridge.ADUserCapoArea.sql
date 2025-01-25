CREATE TABLE [Bridge].[ADUserCapoArea]
(
[ADUser] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Bridge].[ADUserCapoArea] ADD CONSTRAINT [PK_Bridge_ADUserCapoArea] PRIMARY KEY CLUSTERED  ([ADUser], [CapoArea]) ON [PRIMARY]
GO
