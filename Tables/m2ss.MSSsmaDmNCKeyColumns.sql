CREATE TABLE [m2ss].[MSSsmaDmNCKeyColumns]
(
[object_id] [int] NOT NULL,
[key_name] [sys].[sysname] NOT NULL,
[key_type] [char] (2) COLLATE French_CI_AS NOT NULL,
[key_column_id] [int] NOT NULL,
[index_column_id] [int] NULL,
[is_disabled] [bit] NULL,
[referenced_object_id] [int] NULL,
[delete_referential_action] [tinyint] NULL,
[update_referential_action] [tinyint] NULL,
[is_not_for_replication] [bit] NULL,
[is_not_trusted] [bit] NULL,
[referenced_column_id] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [m2ss].[MSSsmaDmNCKeyColumns] ADD CONSTRAINT [PK__MSSsmaDm__BC5021FB03F0984C] PRIMARY KEY CLUSTERED  ([object_id], [key_name], [key_column_id], [key_type]) ON [PRIMARY]
GO
