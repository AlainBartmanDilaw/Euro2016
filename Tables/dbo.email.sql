CREATE TABLE [dbo].[email]
(
[Idt] [int] NOT NULL IDENTITY(1, 1),
[Bettor_Idt] [int] NOT NULL,
[Address] [nvarchar] (50) COLLATE French_CI_AS NULL CONSTRAINT [DF__email__Address__5DCAEF64] DEFAULT (NULL)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[email] ADD CONSTRAINT [PK_email_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_eMail_Bettor1_idx] ON [dbo].[email] ([Bettor_Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.email', 'SCHEMA', N'dbo', 'TABLE', N'email', NULL, NULL
GO
