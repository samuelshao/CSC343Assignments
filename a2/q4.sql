SET search_path TO artistdb;

CREATE VIEW MusicianOrBand
(artist,
capacity,
genres
)
AS
SELECT a.name, r.role, genre
FROM Artist a, Role r, Genre g, Album al
WHERE a.artist_id = r.artist_id
AND (r.role = 'Musician' OR r.role = 'Band')
AND a.artist_id = al.artist_id
AND al.genre_id = g.genre_id
GROUP BY a.name, r.role, genre;


CREATE VIEW SongWriters
(artist,
capacity,
genres
)
AS
SELECT a.name, r.role, genre
FROM Artist a, Role r, Genre g, Album al, Song s, BelongsToAlbum b
WHERE a.artist_id = r.artist_id
AND r.role = 'Songwriter'
AND a.artist_id = s.songwriter_id
AND s.song_id = b.song_id
AND b.album_id = al.album_id
AND al.genre_id = g.genre_id
GROUP BY a.name, r.role, genre;

CREATE VIEW MusicianBandCount
(artist,
capacity,
genres
)
AS
SELECT artist, capacity, count(genres)
FROM MusicianOrBand
GROUP BY artist, capacity
HAVING count(genres) >= 3
ORDER BY count(genres) DESC, artist ASC;

CREATE VIEW SongwriterCount
(artist,
capacity,
genres
)
AS
SELECT artist, capacity, count(genres)
FROM SongWriters
GROUP BY artist, capacity
HAVING count(genres) >= 3
ORDER BY count(genres) DESC, artist ASC;

SELECT artist, capacity, genres
FROM MusicianBandCount
UNION ALL
SELECT artist, capacity, genres
FROM SongwriterCount;

DROP VIEW MusicianOrBand CASCADE;
DROP VIEW SongWriters CASCADE;