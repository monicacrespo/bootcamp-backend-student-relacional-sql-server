-- 1. Select the tracks order by the number of times that appear in playlists in descending mode
SELECT T.[Name], COUNT (PT.PlaylistId) 
FROM dbo.Track AS T
	INNER JOIN dbo.PlayListTrack AS PT ON T.TrackId = PT.TrackId
	INNER JOIN dbo.PlayList AS P ON PT.PlaylistId = P.PlayListId
GROUP BY T.[Name] --PT.TrackId
ORDER BY COUNT(PT.PlaylistId) DESC;
--Result: 3249 rows

-- 2. Select the bestseller tracks (the InvoiceLine table has got the purchase record)
SELECT T.[Name] AS "Track's Name", COUNT(*) AS "Track's purchased quantity"
FROM dbo.Track T
	INNER JOIN dbo.InvoiceLine IL ON IL.TrackId = T.TrackId
GROUP BY T.[Name]
ORDER BY 2 DESC
--Result: 1884 rows

-- 3. Select the bestseller artists
SELECT A.[Name] AS "Artist's Name", COUNT(T.Name) AS "Track's purchased quantity"
FROM dbo.Track AS T 
	INNER JOIN dbo.InvoiceLine IL ON IL.TrackId = T.TrackId
	INNER JOIN dbo.Album AS B ON T.AlbumId = B.AlbumId
	INNER JOIN dbo.Artist AS A ON B.ArtistId = A.ArtistId
GROUP BY A.[Name]
ORDER BY 2 DESC
--Result: 165 rows

-- 4. Select the tracks not bought yet
SELECT T.TrackId, I.InvoiceId
FROM dbo.Track AS T 
	LEFT JOIN dbo.InvoiceLine I ON I.TrackId = T.TrackId
WHERE I.InvoiceId IS NULL
--Result: 1519 rows

-- 5. Select the artists that have not sold any track
SELECT AT.[Name]
FROM dbo.Artist AS AT
WHERE AT.ArtistId NOT IN
	(
		SELECT DISTINCT A.ArtistId
		FROM dbo.Artist AS A
			INNER JOIN dbo.Album AS B ON A.ArtistId = B.ArtistId
			INNER JOIN dbo.Track AS T ON B.AlbumId = T.AlbumId
			INNER JOIN dbo.InvoiceLine I ON I.TrackId = T.TrackId
	)
ORDER BY AT.[Name] ASC
--Result: 110 rows (275 - 165 = 110)