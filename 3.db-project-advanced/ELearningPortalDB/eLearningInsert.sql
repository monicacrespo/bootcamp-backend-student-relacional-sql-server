---------categories-----------
DECLARE @subCategoryId TINYINT;
DECLARE @categoryName VARCHAR(50);

SET @categoryName = 'Express';
IF (@categoryName IS NOT NULL)
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
		SELECT @subCategoryId = id FROM [dbo].[categories] WHERE [name] = @categoryName;
		IF @@ROWCOUNT = 0
		BEGIN
			INSERT INTO [dbo].[categories] ([name], [subCategories_id]) VALUES  (@categoryName, null);
			SET @subCategoryId = SCOPE_IDENTITY();

			INSERT INTO [dbo].[categories] ([name], [subCategories_id]) VALUES  ('nodejs', @subCategoryId);
			SET @subCategoryId = SCOPE_IDENTITY();

			INSERT INTO [dbo].[categories] ([name], [subCategories_id]) VALUES  ('Backend', @subCategoryId);			
		END;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		COMMIT TRANSACTION;
	END CATCH
END;


-------courses---------
DECLARE @courseId INT;
DECLARE @courseName VARCHAR(50);

SET @courseName = 'The Complete Developers Guide to nodejs';

IF (@courseName IS NOT NULL)
BEGIN
	BEGIN TRY
	
		SELECT @courseId = id FROM [dbo].[authors] WHERE [name] = @courseName;
		IF @@ROWCOUNT = 0
		BEGIN
			INSERT INTO [dbo].[courses]
			   ([name]
			   ,[description]
			   ,[updatedOn]
			   ,[isPrivate]
			   ,[totalViewingCounter]
			   ,[categories_id])
		 VALUES
			   (@courseName
			   ,'Learn from real NodeJS experts! Includes REALLY Advanced NodeJS. Express, GraphQL, REST, MongoDB, SQL, MERN + much more'
			   ,'2022-04-21 00:00:00.000'
			   ,0
			   ,100
			   ,@subCategoryId)
			
			SET @courseId = SCOPE_IDENTITY();					
		END;
		
	END TRY
	BEGIN CATCH
		SELECT @courseId = id FROM [dbo].[courses] WHERE [name] = @courseName;
	END CATCH
END;

----------author-----------
DECLARE @authorId INT;
DECLARE @authorName VARCHAR(50);
SET @authorName = 'Braulio Díez';

IF (@authorName IS NOT NULL)
BEGIN
	BEGIN TRY
	
		SELECT @authorId = id FROM [dbo].[authors] WHERE [name] = @authorName;
		IF @@ROWCOUNT = 0
		BEGIN
			INSERT INTO [dbo].[authors] ([name], [bio]) VALUES  (@authorName, 'Desarrollador, ponente, formador y escritor, más de 15 años de experiencia en proyectos internacionales, apasionado del open source');
			SET @authorId = SCOPE_IDENTITY();									
		END;		

	END TRY
	BEGIN CATCH
		SELECT @authorId = id FROM [dbo].[authors] WHERE [name] = @authorName;
	END CATCH
END;

------lecture-----------

DECLARE @lectureId INT;
DECLARE @lectureName VARCHAR(50);

SET @lectureName = 'Nodejs Fundamentals: Enviroment Setup';
BEGIN
	BEGIN TRY
	
		SELECT @lectureId = id FROM [dbo].[lectures] WHERE [name] = @lectureName;
		IF @@ROWCOUNT = 0
		BEGIN
			INSERT INTO [dbo].[lectures]
					   ([name]
					   ,[publishedOn]
					   ,[syllabus]
					   ,[video]
					   ,[isPrivate]
					   ,[viewingCounter]
					   ,[courses_id]
					   ,[authors_id])
				 VALUES
					   (@lectureName
					   ,'2022-03-20 00:00:00.000'
					   ,'syllabus'
					   , NEWID()
					   ,0
					   ,50
					   ,@courseId
					   ,@authorId)

			SET @lectureId = SCOPE_IDENTITY();					
		END;
		
	END TRY
	BEGIN CATCH
		SELECT @lectureId = id FROM [dbo].[lectures] WHERE [name] = @lectureName;
	END CATCH
END;

-----author-------
SET @authorName = 'Diego Martín';
IF (@authorName IS NOT NULL)
BEGIN
	BEGIN TRY
	
		SELECT @authorId = id FROM [dbo].[authors] WHERE [name] = @authorName;
		IF @@ROWCOUNT = 0
		BEGIN
			INSERT INTO [dbo].[authors] ([name], [bio]) VALUES  (@authorName, 'Ingeniero/Arquitecto especializado en .NET C# con más de una década de experiencia desarrollando aplicaciones web en empresas de Nueva Zelanda y España. Entusiasta de Domain Driven Design, Event Sourcing y arquitecturas distribuidas.');
			SET @authorId = SCOPE_IDENTITY();									
		END;		

	END TRY
	BEGIN CATCH
		SELECT @authorId = id FROM [dbo].[authors] WHERE [name] = @authorName;
	END CATCH
END;

-----------lecture-----------
SET @lectureName = 'Nodejs Fundamentals: Package Management';
BEGIN
	BEGIN TRY
	
		SELECT @lectureId = id FROM [dbo].[lectures] WHERE [name] = @lectureName;
		IF @@ROWCOUNT = 0
		BEGIN
			INSERT INTO [dbo].[lectures]
					   ([name]
					   ,[publishedOn]
					   ,[syllabus]
					   ,[video]
					   ,[isPrivate]
					   ,[viewingCounter]
					   ,[courses_id]
					   ,[authors_id])
				 VALUES
					   (@lectureName
					   ,'2022-03-25 00:00:00.000'
					   ,'syllabus'
					   , NEWID()
					   ,0
					   ,50
					   ,@courseId
					   ,@authorId)

			SET @lectureId = SCOPE_IDENTITY();					
		END;
		
	END TRY
	BEGIN CATCH
		SELECT @lectureId = id FROM [dbo].[lectures] WHERE [name] = @lectureName;
	END CATCH
END;


----------- Query to get the category and subcategories
SELECT
    c.name as category,
    CONCAT(c.name, ' ' , sc.name ) as category_subcategory
FROM [dbo].[categories] AS c
LEFT JOIN [dbo].[categories] AS sc  on c.subCategories_id = sc.id
GROUP BY c.name, sc.name
