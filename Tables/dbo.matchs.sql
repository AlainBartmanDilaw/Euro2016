CREATE TABLE [dbo].[matchs]
(
[Idt] [int] NOT NULL IDENTITY(148, 1),
[Number] [smallint] NULL CONSTRAINT [DF__matchs__Number__619B8048] DEFAULT (NULL),
[Groups_Cod] [nchar] (3) COLLATE French_CI_AS NULL CONSTRAINT [DF__matchs__Groups_C__6383C8BA] DEFAULT (NULL),
[Phase_Idt] [int] NULL CONSTRAINT [DF__matchs__Phase_Id__6477ECF3] DEFAULT (NULL),
[ScheduleDate] [datetime2] (0) NULL CONSTRAINT [DF__matchs__Schedule__656C112C] DEFAULT (NULL),
[Stadium_Idt] [int] NULL CONSTRAINT [DF__matchs__Stadium___66603565] DEFAULT (NULL)
) ON [PRIMARY]
ALTER TABLE [dbo].[matchs] ADD 
CONSTRAINT [Matchs_PK] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [Match_Stadium_Fk] ON [dbo].[matchs] ([Stadium_Idt]) ON [PRIMARY]

ALTER TABLE [dbo].[matchs] ADD
CONSTRAINT [Matchs_Groups_Fk] FOREIGN KEY ([Groups_Cod]) REFERENCES [dbo].[groups] ([Cod])
ALTER TABLE [dbo].[matchs] ADD
CONSTRAINT [Matchs_Phase_Fk] FOREIGN KEY ([Phase_Idt]) REFERENCES [dbo].[phase] ([Idt])
ALTER TABLE [dbo].[matchs] ADD
CONSTRAINT [Matchs_Stadium_Fk] FOREIGN KEY ([Stadium_Idt]) REFERENCES [dbo].[stadium] ([Idt])
GO

EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.matchs', 'SCHEMA', N'dbo', 'TABLE', N'matchs', NULL, NULL
GO
