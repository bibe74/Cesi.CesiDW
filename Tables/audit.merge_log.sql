CREATE TABLE [audit].[merge_log]
(
[merge_datetime] [datetime] NOT NULL CONSTRAINT [DFT_audit_merge_log_merge_datetime] DEFAULT (getdate()),
[full_olap_table_name] [nvarchar] (261) COLLATE Latin1_General_CI_AS NOT NULL,
[inserted_rows] [int] NOT NULL CONSTRAINT [DFT_audit_merge_log_inserted_rows] DEFAULT ((0)),
[updated_rows] [int] NOT NULL CONSTRAINT [DFT_audit_merge_log_updated_rows] DEFAULT ((0)),
[deleted_rows] [int] NOT NULL CONSTRAINT [DFT_audit_merge_log_deleted_rows] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [audit].[merge_log] ADD CONSTRAINT [PK_audit_merge_log] PRIMARY KEY CLUSTERED  ([merge_datetime], [full_olap_table_name]) ON [PRIMARY]
GO
