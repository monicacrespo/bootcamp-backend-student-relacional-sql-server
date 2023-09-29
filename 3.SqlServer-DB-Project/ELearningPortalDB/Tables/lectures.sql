CREATE TABLE [dbo].[lectures]
(
	[id] [int] NOT NULL IDENTITY(1, 1),
	[name] [varchar](50) NULL UNIQUE,
	[publishedOn] [date] NULL,
	[syllabus] [text] NULL,
	[video] [uniqueidentifier] NULL,
	[isPrivate] [bit] NULL,
	[viewingCounter] [int] NULL,
	[courses_id] [int] NOT NULL,
	[authors_id] [int] NOT NULL,
	CONSTRAINT [PK_lectures] PRIMARY KEY ([id],[courses_id]),
	CONSTRAINT [FK_lectures_authors] FOREIGN KEY ([authors_id]) REFERENCES [dbo].[authors] ([id]),
	CONSTRAINT [FK_lectures_courses] FOREIGN KEY ([courses_id]) REFERENCES [dbo].[courses] ([id])
)
