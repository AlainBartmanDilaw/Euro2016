CREATE TABLE [dbo].[phase]
(
[Idt] [int] NOT NULL IDENTITY(8, 1),
[Lbl] [nvarchar] (100) COLLATE French_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[phase] ADD CONSTRAINT [PK_phase_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.phase', 'SCHEMA', N'dbo', 'TABLE', N'phase', NULL, NULL
GO
