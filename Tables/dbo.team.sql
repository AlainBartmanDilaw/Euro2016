CREATE TABLE [dbo].[team]
(
[Idt] [int] NOT NULL IDENTITY(31, 1),
[Cod] [nchar] (3) COLLATE French_CI_AS NULL CONSTRAINT [DF__team__Cod__6FE99F9F] DEFAULT (NULL),
[Lbl] [nvarchar] (100) COLLATE French_CI_AS NULL CONSTRAINT [DF__team__Lbl__70DDC3D8] DEFAULT (NULL),
[Country_Idt] [int] NOT NULL,
[Groups_Cod] [nchar] (3) COLLATE French_CI_AS NULL CONSTRAINT [DF__team__Groups_Cod__71D1E811] DEFAULT (NULL),
[NumOrder] [smallint] NULL CONSTRAINT [DF__team__NumOrder__72C60C4A] DEFAULT (NULL)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[team] ADD CONSTRAINT [PK_team_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_Team_Country_idx] ON [dbo].[team] ([Country_Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Team_Groups_Fk] ON [dbo].[team] ([Groups_Cod]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.team', 'SCHEMA', N'dbo', 'TABLE', N'team', NULL, NULL
GO
