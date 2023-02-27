CREATE VIEW [dbo].[vLecturesCoursesCategory]
AS
SELECT
    dbo.categories.name AS [Category Name], 
    dbo.courses.name AS [Course Name], 
    dbo.courses.updatedOn AS [Course Last Updated On], 
    dbo.lectures.name AS [Lecture Name], 
    dbo.lectures.publishedOn AS [Lecture Published On], 
    dbo.authors.name AS [Author Name]
FROM 
    dbo.categories 
    INNER JOIN dbo.courses 
            ON dbo.categories.id = dbo.courses.categories_id 
    INNER JOIN dbo.lectures 
            ON dbo.courses.id = dbo.lectures.courses_id 
    INNER JOIN dbo.authors 
            ON dbo.lectures.authors_id = dbo.authors.id