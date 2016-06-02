CREATE TABLE [dbo].[Parameters]
(
[Name] [nchar] (10) COLLATE French_CI_AS NOT NULL,
[Value] [nvarchar] (50) COLLATE French_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Parameters] ADD CONSTRAINT [PK_Parameters] PRIMARY KEY CLUSTERED  ([Name]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Parameters] ON [dbo].[Parameters] ([Name]) ON [PRIMARY]
GO
