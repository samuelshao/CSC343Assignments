SET search_path to artistdb;

CREATE VIEW albumsong
AS
SELECT s.song_id, s.songwriter_id, b.album_id
FROM Song s, BelongsToAlbum b
WHERE b.song_id = s.song_id;

CREATE VIEW artistalbum
AS
SELECT a.artist_id, a.name, al.album_id, al.title
FROM Artist a, Album al
WHERE a.artist_id = al.artist_id;

CREATE VIEW table3
AS
SELECT song_id, songwriter_id, albumsong.album_id, artist_id, name, title
FROM albumsong join artistalbum on albumsong.album_id = artistalbum.album_id;

CREATE VIEW table4
AS
SELECT song_id, artistalbum.album_id, artist_id, name, title
FROM BelongsToAlbum b, artistalbum
WHERE b.album_id = artistalbum.album_id;

SELECT DISTINCT name as artist_name, title as album_name
FROM table3 t
WHERE album_id NOT IN (SELECT album_id
      	       	      FROM table3 tbl
		      WHERE tbl.album_id = t.album_id
		      AND tbl.songwriter_id <> t.artist_id
		      )
ORDER BY artist_name, album_name;

DROP VIEW table4 CASCADE;
DROP VIEW table3 CASCADE;
DROP VIEW artistalbum CASCADE;
DROP VIEW albumsong CASCADE; 
