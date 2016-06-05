CREATE TABLE [dbo].[bet]
(
[Idt] [int] NOT NULL IDENTITY(1, 1),
[HomeAway] [char] (1) COLLATE French_CI_AS NOT NULL CONSTRAINT [DF__bet__HomeAway__3493CFA7] DEFAULT (NULL),
[Score] [smallint] NULL CONSTRAINT [DF__bet__Away Score__571DF1D5] DEFAULT (NULL),
[Matchs_Idt] [int] NOT NULL,
[Usr_Idt] [int] NOT NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[bet] ADD 
CONSTRAINT [PK_bet_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [fk_Bet_Match1_idx] ON [dbo].[bet] ([Matchs_Idt]) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [fk_Bet_Match_copy11_idx] ON [dbo].[bet] ([Usr_Idt]) ON [PRIMARY]

GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.bet', 'SCHEMA', N'dbo', 'TABLE', N'bet', NULL, NULL
GO

ALTER TABLE [dbo].[bet] ADD
CONSTRAINT [Bet_Matchs_Fk] FOREIGN KEY ([Matchs_Idt]) REFERENCES [dbo].[matchs] ([Idt])
GO
