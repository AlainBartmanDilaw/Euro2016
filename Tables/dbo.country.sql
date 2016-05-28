CREATE TABLE [dbo].[country]
(
[Idt] [int] NOT NULL IDENTITY(31, 1),
[Cod] [nchar] (3) COLLATE French_CI_AS NULL CONSTRAINT [DF__country__Cod__5BE2A6F2] DEFAULT (NULL),
[Lbl] [nvarchar] (100) COLLATE French_CI_AS NULL CONSTRAINT [DF__country__Lbl__5CD6CB2B] DEFAULT (NULL),
[Flag] [varbinary] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[country] ADD CONSTRAINT [PK_country_Idt] PRIMARY KEY CLUSTERED  ([Idt]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'euro2016bets.country', 'SCHEMA', N'dbo', 'TABLE', N'country', NULL, NULL
GO
