CREATE TABLE [dbo].[players]
(
[Idt] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) COLLATE French_CI_AS NULL CONSTRAINT [DF__players__Name__6C190EBB] DEFAULT (NULL),
[Surname] [nvarchar] (50) COLLATE French_CI_AS NULL CONSTRAINT [DF__players__Surname__6D0D32F4] DEFAULT (NULL),
[Number] [smallint] NULL CONSTRAINT [DF__players__Number__6E01572D] DEFAULT (NULL),
[Team_Idt] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[players] ADD CONSTRAINT [PK_players_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_Players_Team1_idx] ON [dbo].[players] ([Team_Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.players', 'SCHEMA', N'dbo', 'TABLE', N'players', NULL, NULL
GO
