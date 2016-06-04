CREATE TABLE [dbo].[stadium]
(
[Idt] [int] NOT NULL IDENTITY(17, 1),
[Nom] [nvarchar] (100) COLLATE French_CI_AS NOT NULL,
[Towns_Idt] [int] NOT NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[stadium] ADD
CONSTRAINT [Stadium_Towns_Fk] FOREIGN KEY ([Towns_Idt]) REFERENCES [dbo].[towns] ([Idt])
GO
ALTER TABLE [dbo].[stadium] ADD CONSTRAINT [PK_stadium_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Stadium_Towns_Fk] ON [dbo].[stadium] ([Towns_Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.stadium', 'SCHEMA', N'dbo', 'TABLE', N'stadium', NULL, NULL
GO
