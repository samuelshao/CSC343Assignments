SET search_path TO artistdb;

SELECT DISTINCT a.name, a.nationality
FROM artist a, role r
WHERE Extract(year from a.birthdate) = (SELECT min(year)
      		   		       FROM album, artist
				       WHERE album.artist_id = artist.artist_id
				       AND artist.name = 'Steppenwolf')
AND a.artist_id = r.artist_id
AND r.role != 'Band'
ORDER BY a.name ASC;