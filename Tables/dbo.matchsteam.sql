CREATE TABLE [dbo].[matchsteam]
(
[Idt] [int] NOT NULL IDENTITY(103, 1),
[Matchs_Idt] [int] NOT NULL CONSTRAINT [DF__matchstea__Match__6754599E] DEFAULT ((0)),
[AwayHome] [char] (1) COLLATE French_CI_AS NULL CONSTRAINT [DF__matchstea__AwayH__395884C4] DEFAULT ('X'),
[team_idt] [int] NULL CONSTRAINT [DF__matchstea__team___693CA210] DEFAULT (NULL),
[Score] [smallint] NULL CONSTRAINT [DF__matchstea__Score__6A30C649] DEFAULT (NULL),
[Calc] [nvarchar] (100) COLLATE French_CI_AS NULL CONSTRAINT [DF__matchsteam__Calc__6B24EA82] DEFAULT (NULL)
) ON [PRIMARY]
ALTER TABLE [dbo].[matchsteam] ADD
CONSTRAINT [MatchsTeam_Match_Fk] FOREIGN KEY ([Matchs_Idt]) REFERENCES [dbo].[matchs] ([Idt])
ALTER TABLE [dbo].[matchsteam] ADD
CONSTRAINT [MatchsTeam_Team_Fk] FOREIGN KEY ([team_idt]) REFERENCES [dbo].[team] ([Idt])
GO
ALTER TABLE [dbo].[matchsteam] ADD CONSTRAINT [PK_matchsteam_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.matchsteam', 'SCHEMA', N'dbo', 'TABLE', N'matchsteam', NULL, NULL
GO
