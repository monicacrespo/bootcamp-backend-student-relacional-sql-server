CREATE TABLE [dbo].[courses_tags](
	[courses_id] [int] NOT NULL,
	[tags_id] [int] NOT NULL,
 CONSTRAINT [PK_courses_tags] PRIMARY KEY ([courses_id] ASC, [tags_id] ASC),
 CONSTRAINT [FK_courses_tags_courses] FOREIGN KEY([courses_id]) REFERENCES [dbo].[courses] ([id]),
 CONSTRAINT [FK_courses_tags_tags] FOREIGN KEY([tags_id]) REFERENCES [dbo].[tags] ([id])
)
