CREATE TABLE [dbo].[Usr]
(
[Idt] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (55) COLLATE French_CI_AS NOT NULL,
[Surname] [nvarchar] (56) COLLATE French_CI_AS NULL,
[eMail] [nvarchar] (max) COLLATE French_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usr] ADD CONSTRAINT [Usr_Pk] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Usr_Ak] ON [dbo].[Usr] ([Name]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'', 'SCHEMA', N'dbo', 'TABLE', N'Usr', NULL, NULL
GO
