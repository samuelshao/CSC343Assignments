SET search_path TO artistdb;

CREATE VIEW findAlbum
AS
SELECT album_id
FROM Album al, Artist a
WHERE al.artist_id = a.artist_id
AND name = 'Michael Jackson';

CREATE VIEW findSong
AS
SELECT song_id
FROM BelongsToAlbum
WHERE album_id IN (SELECT album_id 
      	       	  FROM findAlbum);

CREATE VIEW findLabel
AS
SELECT label_id
FROM ProducedBy
WHERE album_id IN (SELECT album_id 
      	       	  FROM findAlbum);

DELETE FROM ProducedBy
WHERE album_id IN (SELECT album_id 
      	       	  FROM findAlbum)
AND label_id IN (SELECT label_id 
    	     	FROM findLabel);

DELETE FROM RecordLabel
WHERE label_id IN (SELECT label_id 
      	       	  FROM findLabel);

DELETE FROM Collaboration
WHERE song_id IN (SELECT song_id
      	      	 FROM findSong);

DELETE FROM BelongsToAlbum
WHERE song_id IN (SELECT song_id
      	      	 FROM findSong)
AND album_id in (SELECT album_id
    	     	FROM findAlbum);

DELETE FROM Song
WHERE song_id IN (SELECT song_id
      	      	 FROM findSong);

DELETE FROM Album
WHERE album_id IN (SELECT album_id
      	       	  FROM findAlbum);