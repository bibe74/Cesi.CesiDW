CREATE TABLE [Staging].[ClientiNOPInCometa]
(
[PKClienteNOP] [int] NOT NULL,
[Email] [nvarchar] (120) COLLATE Latin1_General_CI_AS NOT NULL,
[PKClienteCometa] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[ClientiNOPInCometa] ADD CONSTRAINT [PK_Staging_ClientiNOPInCometa] PRIMARY KEY CLUSTERED ([PKClienteNOP]) ON [PRIMARY]
GO
