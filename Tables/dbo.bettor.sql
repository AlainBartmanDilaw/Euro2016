CREATE TABLE [dbo].[bettor]
(
[Idt] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) COLLATE French_CI_AS NULL CONSTRAINT [DF__bettor__Name__59063A47] DEFAULT (NULL),
[Surname] [nvarchar] (50) COLLATE French_CI_AS NULL CONSTRAINT [DF__bettor__Surname__59FA5E80] DEFAULT (NULL),
[Password] [nvarchar] (50) COLLATE French_CI_AS NULL CONSTRAINT [DF__bettor__Password__5AEE82B9] DEFAULT (NULL)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bettor] ADD CONSTRAINT [PK_bettor_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.bettor', 'SCHEMA', N'dbo', 'TABLE', N'bettor', NULL, NULL
GO
