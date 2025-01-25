CREATE TABLE [Import].[CapiArea]
(
[CapoArea] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Agente] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[ADUser] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Email] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[InvioEmail] [bit] NOT NULL,
[AgenteBudget] [nvarchar] (60) COLLATE Latin1_General_CI_AS NOT NULL,
[Prefisso] [nvarchar] (3) COLLATE Latin1_General_CI_AS NOT NULL,
[ProvvigioneNuovo] [decimal] (18, 2) NULL,
[ProvvigioneRinnovo] [decimal] (18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Import].[CapiArea] ADD CONSTRAINT [PK_Import_CapiArea] PRIMARY KEY CLUSTERED ([CapoArea]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Import_CapiArea_Prefisso] ON [Import].[CapiArea] ([Prefisso]) ON [PRIMARY]
GO
