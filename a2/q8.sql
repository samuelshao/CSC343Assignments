SET search_path TO artistdb;

CREATE VIEW acdc
AS
SELECT artist_id
FROM Artist
WHERE name = 'AC/DC';

CREATE VIEW ArtistList
AS
SELECT w.artist_id, w.band_id, 2014 AS start_year, 2015 AS end_year
FROM acdc, WasInBand w
WHERE w.band_id = acdc.artist_id;

INSERT INTO WasInBand(artist_id, band_, start_year, end_year)
SELECT artist_id, band_id, start_year, end_year
FROM ArtistList;

SELECT *
FROM WasInBand
ORDER BY artist_id;

DROP VIEW ArtistList;
DROP VIEW acdc;