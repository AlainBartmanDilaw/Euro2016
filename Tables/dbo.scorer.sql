CREATE TABLE [dbo].[scorer]
(
[Idt] [int] NOT NULL IDENTITY(1, 1),
[Minute] [nvarchar] (45) COLLATE French_CI_AS NULL CONSTRAINT [DF__scorer__Minute__6EF57B66] DEFAULT (NULL),
[Players_Idt] [int] NOT NULL,
[Match_Idt] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scorer] ADD CONSTRAINT [PK_scorer_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_Scorer_Match1_idx] ON [dbo].[scorer] ([Match_Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_Scorer_Players1_idx] ON [dbo].[scorer] ([Players_Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.scorer', 'SCHEMA', N'dbo', 'TABLE', N'scorer', NULL, NULL
GO
