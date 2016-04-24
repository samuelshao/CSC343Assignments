SET search_path TO artistdb;

CREATE VIEW indieAlbum
AS
SELECT album_id, year, artist_id
FROM Album
WHERE album_id NOT IN (SELECT album_id
      	       	      FROM ProducedBy
		      );

CREATE VIEW FirstIndieAlbum
AS
SELECT artist_id, album_id, year
FROM Album
WHERE artist_id IN (SELECT artist_id
      		   FROM indieAlbum
		   )
AND year <= ALL(SELECT year
    	    	FROM Album qq
		WHERE qq.artist_id = Album.artist_id
		);

CREATE VIEW table3
AS
SELECT DISTINCT name as artist_name, Artist.artist_id, album_id
FROM FirstIndieAlbum, Artist
WHERE Artist.artist_id = FirstIndieAlbum.artist_id
AND nationality = 'Canada'
ORDER BY name;

CREATE VIEW laterSigned
AS
SELECT artist_id
FROM RecordLabel r, ProducedBy p, Album a
WHERE r.label_id = p.label_id
AND country = 'America'
AND p.album_id = a.album_id;

SELECT DISTINCT artist_name
FROM table3
WHERE artist_id IN (SELECT artist_id
      		   FROM laterSigned
		   )
ORDER BY artist_name;

drop view laterSigned CASCADE;
drop view indieAlbum CASCADE;


