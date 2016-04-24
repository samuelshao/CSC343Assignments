SET search_path TO artistdb;

CREATE VIEW SongdiffAlbum
AS
SELECT song_id, album_id
FROM BelongsToAlbum b
WHERE song_id IN (SELECT song_id
      	      	 FROM BelongsToAlbum b1
		 WHERE b1.song_id = b.song_id
		 AND b1.album_id <> b.album_id
		 );

CREATE VIEW findArtistYearSong
AS
SELECT a.artist_id, song_id, a.album_id, year
FROM Album a, SongDiffAlbum s
WHERE a.album_id = s.album_id
AND a.album_id IN (SELECT album_id
    	       	  FROM SongDiffAlbum
		  )
;

SELECT song.title as song_name, year, name as artist_name
FROM findArtistYearSong f, Song, Artist
WHERE Artist.artist_id = f.artist_id
AND Song.song_id = f.song_id
ORDER BY song_name, year, artist_name;

DROP VIEW findArtistYearSong CASCADE;
DROP VIEW SongdiffAlbum CASCADE;