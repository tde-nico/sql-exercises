-- 1
CREATE TABLE songs (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	length FLOAT NOT NULL,
	album_id INTEGER NOT NULL,
	FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- 2
SELECT name FROM bands;

-- 3
SELECT name FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;

-- 4
SELECT DISTINCT b.name FROM bands AS b, albums AS a
WHERE b.id = a.band_id;

-- 5
SELECT b.name FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING COUNT(a.id) = 0;

-- 6
SELECT a.name, SUM(s.length) AS duration FROM albums as a
JOIN songs as s ON a.id = s.album_id
GROUP BY a.id
ORDER BY Duration DESC
LIMIT 1;

-- 7
UPDATE albums SET release_year = 1986
WHERE release_year IS NULL;

-- 8
INSERT INTO albums VALUES (19, "SUS", 2000, 4);

-- 9
DELETE FROM albums
WHERE id = 19;

-- 10
SELECT AVG(length) FROM songs;

-- 11
SELECT a.name AS album_name, s.name AS song_name, s.length AS song_length
FROM albums AS a
JOIN songs AS s ON a.id = s.album_id
WHERE s.length = (
	SELECT MAX(length)
	FROM songs
	WHERE album_id = a.id
)
GROUP BY a.name;

-- 12
SELECT b.name, COUNT(s.name) FROM songs AS s
JOIN albums AS a ON s.album_id = a.id
JOIN bands AS b ON a.band_id = b.id
GROUP BY b.name;
