CREATE TABLE [Import].[OpenAICausale]
(
[Codice] [nvarchar] (32) COLLATE Latin1_General_CI_AS NOT NULL,
[IsAcquisto] [bit] NOT NULL,
[IsConsumo] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[OpenAICausale] ADD CONSTRAINT [PK_Import_OpenAICausale] PRIMARY KEY CLUSTERED ([Codice]) ON [PRIMARY]
GO
