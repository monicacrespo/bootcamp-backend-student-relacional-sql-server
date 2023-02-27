CREATE TABLE [dbo].[categories]
(
	[id] [int] NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[name] [varchar](50) NOT NULL UNIQUE,
	[categories_id] [int] NOT NULL,
	CONSTRAINT [FK_categories_categories] FOREIGN KEY ([categories_id]) REFERENCES [dbo].[categories] ([id])
)
