CREATE VIEW [dbo].[vLecturesCoursesCategory]
AS
SELECT
    dbo.categories.name AS [CategoryName], 
    dbo.courses.name AS [CourseName], 
    dbo.courses.updatedOn AS [CourseUpdatedOn], 
    dbo.lectures.name AS [LectureName], 
    dbo.lectures.publishedOn AS [LecturePublishedOn], 
    dbo.authors.name AS [AuthorName]
FROM 
    dbo.categories 
    INNER JOIN dbo.courses 
            ON dbo.categories.id = dbo.courses.categories_id 
    INNER JOIN dbo.lectures 
            ON dbo.courses.id = dbo.lectures.courses_id 
    INNER JOIN dbo.authors 
            ON dbo.lectures.authors_id = dbo.authors.id