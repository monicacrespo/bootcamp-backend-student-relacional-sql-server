CREATE TABLE [dbo].[categories]
(
	[id] [tinyint] IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	[name] [varchar](50) NOT NULL UNIQUE,
	[subCategories_id] [tinyint] NULL,
	CONSTRAINT [FK_categories_categories] FOREIGN KEY ([subCategories_id]) REFERENCES [dbo].[categories] ([id])
)
