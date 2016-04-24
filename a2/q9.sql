SET search_path TO artistdb;

UPDATE WasInBand
SET end_year = 2014
WHERE artist_id = (SELECT artist_id
      		  FROM Artist
		  WHERE name = 'Adam LEvine');

UPDATE WasInBand
SET end_year = 2014
WHERE artist_id = (SELECT artist_id
      		  FROM Artist
		  WHERE name = 'Mick Jagger');

CREATE VIEW MICK
AS
SELECT artist_id
FROM Artist
WHERE name = 'Mick Jagger';

CREATE VIEW Maroon
AS
SELECT artist_id as band_id
FROM Artist
WHERE name = 'Maroon 5';

CREATE VIEW NewLead
AS
SELECT artist_id, band_id, 2014 AS start_year, 2015 AS end_year
FROM Mick, Maroon;

INSERT INTO WasInBand(artist_id, band_id, start_year, end_year)
SELECT artist_id, band_id, start_year, end_year
FROM NewLead;

SELECT *
FROM WasInBand
ORDER BY artist_id;

DROP VIEW NewLead CASCADE;
DROP VIEW Maroon CASCADE;
DROP VIEW Mick CASCADE;