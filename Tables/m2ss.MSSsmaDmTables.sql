CREATE TABLE [m2ss].[MSSsmaDmTables]
(
[object_id] [int] NOT NULL,
[schema_id] [int] NOT NULL,
[status] [tinyint] NULL,
[dm_start_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [m2ss].[MSSsmaDmTables] ADD CONSTRAINT [PK__MSSsmaDm__3DC088B500200768] PRIMARY KEY CLUSTERED  ([object_id]) ON [PRIMARY]
GO
