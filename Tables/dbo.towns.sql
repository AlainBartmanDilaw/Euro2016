CREATE TABLE [dbo].[towns]
(
[Idt] [int] NOT NULL IDENTITY(11, 1),
[Nom] [nvarchar] (50) COLLATE French_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[towns] ADD CONSTRAINT [PK_towns_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.towns', 'SCHEMA', N'dbo', 'TABLE', N'towns', NULL, NULL
GO
