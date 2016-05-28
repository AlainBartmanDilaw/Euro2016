CREATE TABLE [dbo].[groups]
(
[Idt] [int] NOT NULL IDENTITY(7, 1),
[Cod] [nchar] (3) COLLATE French_CI_AS NULL CONSTRAINT [DF__groups__Cod__5EBF139D] DEFAULT (NULL),
[Lbl] [nvarchar] (100) COLLATE French_CI_AS NULL CONSTRAINT [DF__groups__Lbl__5FB337D6] DEFAULT (NULL)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[groups] ADD CONSTRAINT [PK_groups_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[groups] ADD CONSTRAINT [groups$Groups_Ak] UNIQUE NONCLUSTERED  ([Cod]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.groups', 'SCHEMA', N'dbo', 'TABLE', N'groups', NULL, NULL
GO
