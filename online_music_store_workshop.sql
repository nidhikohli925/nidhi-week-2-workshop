--1 Retrieve the titles and release dates of all songs released in 2022, ordered by release date (newest first).
SELECT title, release_date
FROM songs
WHERE substr (release_date, -4) = '2022' 
ORDER BY release_date ASC;


--2 Find all songs with a popularity score greater than 80 and a duration less than 4 minutes (240 seconds)
SELECT title, duration_seconds, popularity_score
FROM songs
WHERE popularity_score > 80
	AND duration_seconds <240
	ORDER BY popularity_score DESC;
	

--3 List all artists whose names start with "The".
SELECT artist_id, artist_name
FROM artists 
WHERE artist_name like 'The%';

--4 Find all premium customers who joined in 2022.
 SELECT first_name, last_name,premium_member, join_date
 FROM customers
 WHERE premium_member = 'TRUE'
	AND substr(join_date,-4) = '2022'
	ORDER BY first_name ASC;
	
--5 Calculate the total duration (in minutes) of all songs in the database and display the result with an appropriate column name.
SELECT sum (duration_seconds)/60.00 AS "Total Duration of Songs in minutes"
FROM songs;


--6 Find the top 5 most expensive song purchases in the database.

SELECT song_id, purchase_date, price
FROM purchases
ORDER BY price DESC
LIMIT 5;

--7 First, find all song_ids from songs with a popularity score above 90. Then, use those song_ids to find purchases of those songs.

SELECT *
FROM purchases
WHERE song_id IN (
	SELECT song_id
	FROM songs
	WHERE popularity_score> 90);

	

--8 Find all purchases made between January 1, 2023 and March 31, 2023.

SELECT *
FROM purchases
WHERE purchase_date BETWEEN '1/1/2023' AND '3/31/2023'
ORDER BY price DESC;




--9 Identify the songs with the highest popularity scores (above 90).

SELECT *
FROM songs
WHERE popularity_score >90
ORDER BY popularity_score DESC;



-- For tasks 1-3, how could you combine them into a single, more complex query that finds popular short songs by artists whose names start with "The"?

SELECT artist_id, duration_seconds, popularity_score
FROM songs
WHERE artist_id IN (
	SELECT artist_id
	FROM artists
	WHERE popularity_score > 80
	AND duration_seconds < 180
	AND artist_name like 'The%');











