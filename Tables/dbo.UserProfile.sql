CREATE TABLE [dbo].[UserProfile]
(
[UserId] [int] NOT NULL IDENTITY(1, 1),
[UserName] [nvarchar] (56) COLLATE French_CI_AS NOT NULL,
[EmailId] [nvarchar] (max) COLLATE French_CI_AS NULL,
[Details] [nvarchar] (max) COLLATE French_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[UserProfile_AfterInsert] ON [dbo].[UserProfile]
AFTER INSERT
AS
-- set IDENTITY_INSERT Bettor on ;
insert into Bettor
( Idt, Name )
Select UserId, UserName
  from inserted ;
-- set IDENTITY_INSERT Bettor off ;
GO

ALTER TABLE [dbo].[UserProfile] ADD CONSTRAINT [PK__UserProf__1788CC4C09A971A2] PRIMARY KEY CLUSTERED  ([UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfile] ADD CONSTRAINT [UQ__UserProf__C9F284560C85DE4D] UNIQUE NONCLUSTERED  ([UserName]) ON [PRIMARY]
GO
