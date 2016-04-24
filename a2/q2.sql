SET search_path TO artistdb;

CREATE VIEW Collab
(album_id,
artist_id,
sales
)
AS
SELECT a.album_id, a.artist_id, a.sales
FROM Album a, BelongsToAlbum b, Collaboration c
WHERE a.album_id = b.album_id
AND b.song_id = c.song_id;

CREATE VIEW NonCollab
(album_id,
artist_id,
sales
)
AS
SELECT album_id, artist_id, sales
FROM Album
EXCEPT
SELECT *
FROM Collab;

SELECT a.name artists, avg(c.sales) avg_collab_sales
FROM Artist a, Collab c, NonCollab n
WHERE a.artist_id = c.artist_id
AND c.artist_id = n.artist_id
GROUP BY a.name
HAVING avg(c.sales) > avg(n.sales);

DROP VIEW Collab CASCADE;