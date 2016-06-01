CREATE TABLE [dbo].[webpages_Membership]
(
[UserId] [int] NOT NULL,
[CreateDate] [datetime] NULL,
[ConfirmationToken] [nvarchar] (128) COLLATE French_CI_AS NULL,
[IsConfirmed] [bit] NULL CONSTRAINT [DF__webpages___IsCon__160F4887] DEFAULT ((0)),
[LastPasswordFailureDate] [datetime] NULL,
[PasswordFailuresSinceLastSuccess] [int] NOT NULL CONSTRAINT [DF__webpages___Passw__17036CC0] DEFAULT ((0)),
[Password] [nvarchar] (128) COLLATE French_CI_AS NOT NULL,
[PasswordChangedDate] [datetime] NULL,
[PasswordSalt] [nvarchar] (128) COLLATE French_CI_AS NOT NULL,
[PasswordVerificationToken] [nvarchar] (128) COLLATE French_CI_AS NULL,
[PasswordVerificationTokenExpirationDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD CONSTRAINT [PK__webpages__1788CC4C14270015] PRIMARY KEY CLUSTERED  ([UserId]) ON [PRIMARY]
GO
