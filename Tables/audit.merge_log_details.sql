CREATE TABLE [audit].[merge_log_details]
(
[merge_datetime] [datetime] NOT NULL CONSTRAINT [DFT_audit_merge_log_details_merge_datetime] DEFAULT (getdate()),
[merge_action] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL,
[full_olap_table_name] [nvarchar] (261) COLLATE Latin1_General_CI_AS NOT NULL,
[primary_key_description] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_audit_merge_log_details] ON [audit].[merge_log_details] ([merge_datetime], [merge_action], [full_olap_table_name]) ON [PRIMARY]
GO
