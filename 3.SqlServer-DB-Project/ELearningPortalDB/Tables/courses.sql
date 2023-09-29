CREATE TABLE [dbo].[courses]
(
	[id] [int] NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[name] [varchar](50) NOT NULL UNIQUE,
	[description] [varchar](500) NULL,
	[updatedOn] [date] NULL,
	[isPrivate] [bit] NULL,
	[totalViewingCounter] [int] NULL,
	[categories_id] [tinyint] NOT NULL,
	CONSTRAINT [FK_courses_categories] FOREIGN KEY ([categories_id]) REFERENCES [dbo].[categories] ([id])
)
