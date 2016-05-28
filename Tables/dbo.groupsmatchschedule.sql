CREATE TABLE [dbo].[groupsmatchschedule]
(
[Idt] [smallint] NOT NULL IDENTITY(7, 1),
[MatchDay] [smallint] NOT NULL,
[NumOrderHome] [smallint] NOT NULL,
[NumOrderAway] [smallint] NULL CONSTRAINT [DF__groupsmat__NumOr__60A75C0F] DEFAULT (NULL)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[groupsmatchschedule] ADD CONSTRAINT [PK_groupsmatchschedule_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.groupsmatchschedule', 'SCHEMA', N'dbo', 'TABLE', N'groupsmatchschedule', NULL, NULL
GO
