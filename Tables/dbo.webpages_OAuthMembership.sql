CREATE TABLE [dbo].[webpages_OAuthMembership]
(
[Provider] [nvarchar] (30) COLLATE French_CI_AS NOT NULL,
[ProviderUserId] [nvarchar] (100) COLLATE French_CI_AS NOT NULL,
[UserId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[webpages_OAuthMembership] ADD CONSTRAINT [PK__webpages__F53FC0ED10566F31] PRIMARY KEY CLUSTERED  ([Provider], [ProviderUserId]) ON [PRIMARY]
GO
