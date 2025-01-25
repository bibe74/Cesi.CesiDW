CREATE TABLE [audit].[tables]
(
[provider_name] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[full_table_name] [sys].[sysname] NOT NULL,
[staging_table_name] [sys].[sysname] NOT NULL,
[datawarehouse_table_name] [sys].[sysname] NOT NULL,
[lastupdated_staging] [datetime] NULL,
[lastupdated_local] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [audit].[tables] ADD CONSTRAINT [PK_audit_tables] PRIMARY KEY CLUSTERED  ([provider_name], [full_table_name]) ON [PRIMARY]
GO
