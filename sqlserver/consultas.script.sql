-- 1. Select the tracks with price greater than or equal to 1€
SELECT [Name], Milliseconds, Bytes, UnitPrice, Composer 
FROM dbo.Track
WHERE UnitPrice >= 1
--Result: 213 rows

-- 2. Select the tracks with more than 4 minutes long
SELECT [Name], Milliseconds, Bytes, UnitPrice 
FROM dbo.Track
WHERE  Milliseconds > 240000
--Result: 2041 rows

-- 3. Select the tracks between 2 and 3 minutes long
SELECT [Name], Milliseconds, Bytes, UnitPrice 
FROM dbo.Track
WHERE  Milliseconds BETWEEN 120000 AND 180000
--Result: 387 rows

-- 4. Select the tracks where one of its composers is Mercury
SELECT [Name], Milliseconds, Bytes, UnitPrice, Composer 
FROM dbo.Track
WHERE Composer LIKE '%Mercury%'
--Result: 16 rows

-- 5. Calculate the average track length of the plataform
SELECT AVG(Milliseconds) AS "Average Track Length"
FROM dbo.Track
--Result: 393599

-- 6. Select the customers from USA, Canada and Brazil
SELECT FirstName, LastName, City, Country
FROM dbo.Customer
WHERE Country IN ('USA', 'Canada', 'Brazil')
--Result: 26 rows

-- 7. Select all the tracks from Queen
SELECT T.[Name] AS "Track" , T.Milliseconds, T.Bytes, T.UnitPrice, T.Composer, A.[Name] AS "Artist" 
FROM dbo.Track AS T
	INNER JOIN dbo.Album AS B ON T.AlbumId = B.AlbumId
	INNER JOIN dbo.Artist AS A ON B.ArtistId = A.ArtistId 
WHERE A.[Name] = 'Queen'
--Result: 45 rows

-- 8. Select the Queen's tracks where David Bowie has participated as compositor
SELECT T.[Name], T.Milliseconds, T.Bytes, T.UnitPrice, T.Composer, A.[Name] AS "Artist Name" 
FROM dbo.Track AS T
	INNER JOIN dbo.Album AS B ON T.AlbumId = B.AlbumId
	INNER JOIN dbo.Artist AS A ON B.ArtistId = A.ArtistId 
WHERE A.[Name] = 'Queen' AND T.Composer LIKE '%David Bowie%'
--Result: 1 row

-- 9. Select the tracks of 'Heavy Metal Classic' playlist
SELECT  T.[Name] AS Track, T.Milliseconds, T.Bytes, T.UnitPrice, T.Composer, P.[Name] AS PlayList
FROM dbo.Track AS T
		INNER JOIN dbo.PlayListTrack AS PT ON T.TrackId = PT.TrackId
		INNER JOIN dbo.PlayList AS P ON PT.PlaylistId = P.PlayListId
WHERE P.[Name] = 'Heavy Metal Classic'
--Result: 26 rows

-- 10. Select the playlists with its number of tracks
SELECT  P.[Name] AS PlayList, COUNT (T.TrackId) AS "Number of tracks"
FROM dbo.Track AS T
		INNER JOIN dbo.PlayListTrack AS PT ON T.TrackId = PT.TrackId
		INNER JOIN dbo.PlayList AS P ON PT.PlaylistId = P.PlayListId
GROUP BY P.[Name]
--Result: 12 rows

-- 11. Select the playlists (distinct) that have any song from AC/DC
SELECT  DISTINCT P.[Name] AS PlayList, A.[Name] AS Artist
FROM dbo.Track AS T
		INNER JOIN dbo.PlayListTrack AS PT ON T.TrackId = PT.TrackId
		INNER JOIN dbo.PlayList AS P ON PT.PlaylistId = P.PlayListId
		INNER JOIN dbo.Album AS B ON T.AlbumId = B.AlbumId
		INNER JOIN dbo.Artist AS A ON B.ArtistId = A.ArtistId 
WHERE A.[Name] LIKE 'AC/DC'
--Result: 2 rows

-- 12. Select the playlists that have any song from 'Queen' along with the quantity
SELECT DISTINCT P.[Name] AS PlayList, COUNT(DISTINCT (T.[Name])) AS "Number of tracks"
FROM dbo.Track AS T
		INNER JOIN dbo.PlayListTrack AS PT ON T.TrackId = PT.TrackId
		INNER JOIN dbo.PlayList AS P ON PT.PlaylistId = P.PlayListId
		INNER JOIN dbo.Album AS B ON T.AlbumId = B.AlbumId
		INNER JOIN dbo.Artist AS A ON B.ArtistId = A.ArtistId 
WHERE A.[Name] LIKE 'Queen'
GROUP BY P.[Name]
--Result:  2 rows

-- 13. Select the tracks that are not on any playlist
SELECT DISTINCT T.[Name] AS Track, P.[Name] AS Playlist
FROM dbo.Track AS T
	LEFT JOIN dbo.PlayListTrack AS PT ON T.TrackId = PT.TrackId
	INNER JOIN dbo.PlayList AS P ON PT.PlaylistId = P.PlayListId
WHERE P.[Name] IS NULL
--Result: 0 rows


-- 14. Select the artists that don't have any album
SELECT A.[Name] AS Artist, B.Title AS Album
FROM dbo.Artist AS A
	LEFT JOIN dbo.Album AS B ON B.ArtistId = A.ArtistId 
WHERE B.Title IS NULL
ORDER BY A.[Name] ASC
--Result: 71 rows

-- 15. Select the artists with their number of albums
-- To ensure whether the query is correct or not, some of the artists from the previous query (artists without album) should be displayed with 0 albums
SELECT A.[Name] AS Artist, COUNT (B.Title) AS "Number of albums"
FROM dbo.Artist AS A
	LEFT JOIN dbo.Album AS B ON B.ArtistId = A.ArtistId 
GROUP BY A.[Name]
ORDER BY A.[Name] ASC
--Result: 275 rows
