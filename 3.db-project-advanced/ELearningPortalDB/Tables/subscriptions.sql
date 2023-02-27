CREATE TABLE [dbo].[subscriptions]
(
	[users_id] [int] NOT NULL,
	[courses_id] [int] NOT NULL,
	CONSTRAINT [PK_subscriptions] PRIMARY KEY ([users_id] ASC, [courses_id] ASC),
	CONSTRAINT [FK_subscriptions_users] FOREIGN KEY ([users_id]) REFERENCES [dbo].[users] ([id]),
	CONSTRAINT [FK_subscriptions_courses] FOREIGN KEY ([courses_id]) REFERENCES [dbo].[courses] ([id])
)
