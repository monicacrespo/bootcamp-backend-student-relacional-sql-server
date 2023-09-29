IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[subscriptions]') 
AND type in ('U')) DROP TABLE [dbo].[subscriptions]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[lectures]') 
AND type in ('U')) DROP TABLE [dbo].[lectures]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[courses_tags]') 
AND type in ('U')) DROP TABLE [dbo].[courses_tags]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[tags]') 
AND type in ('U')) DROP TABLE [dbo].[tags]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[courses]') 
AND type in ('U')) DROP TABLE [dbo].[courses]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[users]') 
AND type in ('U')) DROP TABLE [dbo].[users]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[authors]') 
AND type in ('U')) DROP TABLE [dbo].[authors]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[categories]') 
AND type in ('U')) DROP TABLE [dbo].[categories]
