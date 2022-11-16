-- 1. Select the tracks order by the number of times that appear in playlists in descending mode
SELECT T.[Name], COUNT (PT.PlaylistId) 
FROM dbo.Track AS T
	INNER JOIN dbo.PlayListTrack AS PT ON T.TrackId = PT.TrackId
	INNER JOIN dbo.PlayList AS P ON PT.PlaylistId = P.PlayListId
GROUP BY T.[Name] --PT.TrackId
ORDER BY COUNT(PT.PlaylistId) DESC;
--Result: 3249 rows

-- 2. Select the bestseller tracks (the InvoiceLine table has got the purchase record)
SELECT TrackId, COUNT(*) AS "Purchase quantity"
FROM dbo.InvoiceLine
GROUP BY TrackId
HAVING  COUNT(*) > 1
--Result: 256 rows

-- 3. Select the bestseller artists
SELECT DISTINCT (A.[Name])
FROM dbo.Track AS T 
	INNER JOIN dbo.Album AS B ON T.AlbumId = B.AlbumId
	INNER JOIN dbo.Artist AS A ON B.ArtistId = A.ArtistId 
	INNER JOIN (
		SELECT TrackId, COUNT(*) AS "Purchase quantity"
		FROM dbo.InvoiceLine
		GROUP BY TrackId
		HAVING  COUNT(*) > 1
	) AS I
	ON I.TrackId = T.TrackId
--Result: 90 rows

-- 4. Select the tracks not bought yet
SELECT T.TrackId, I.InvoiceId
FROM dbo.Track AS T 
LEFT JOIN dbo.InvoiceLine I ON I.TrackId = T.TrackId
WHERE I.InvoiceId IS NULL
--Result: 1519 rows

-- 5. Select the artists that have not sold any track
SELECT DISTINCT (A.[Name])
FROM dbo.Track AS T 
	INNER JOIN dbo.Album AS B ON T.AlbumId = B.AlbumId
	INNER JOIN dbo.Artist AS A ON B.ArtistId = A.ArtistId 
	INNER JOIN (
		SELECT T.TrackId, I.InvoiceId
		FROM dbo.Track AS T 
		LEFT JOIN dbo.InvoiceLine I ON I.TrackId = T.TrackId
		WHERE I.InvoiceId IS NULL
		) AS I
	ON I.TrackId = T.TrackId
--Result: 170 rows