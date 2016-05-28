CREATE TABLE [dbo].[bet]
(
[Idt] [int] NOT NULL IDENTITY(1, 1),
[Home Score] [smallint] NULL CONSTRAINT [DF__bet__Home Score__5629CD9C] DEFAULT (NULL),
[Away Score] [smallint] NULL CONSTRAINT [DF__bet__Away Score__571DF1D5] DEFAULT (NULL),
[Bet DateTime] [datetime2] (0) NULL CONSTRAINT [DF__bet__Bet DateTim__5812160E] DEFAULT (NULL),
[Match_Idt] [int] NOT NULL,
[Match_copy1_Idt] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bet] ADD CONSTRAINT [PK_bet_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_Bet_Match_copy11_idx] ON [dbo].[bet] ([Match_copy1_Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_Bet_Match1_idx] ON [dbo].[bet] ([Match_Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.bet', 'SCHEMA', N'dbo', 'TABLE', N'bet', NULL, NULL
GO
