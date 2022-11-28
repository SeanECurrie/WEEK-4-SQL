-- DDL
-- Create Artist Table
CREATE TABLE artist(
	artist_id SERIAL PRIMARY KEY,
	artist_name VARCHAR(100),
	record_label VARCHAR(100)
);

-- Create favorite_song table
CREATE TABLE favorite_song(
	song_id SERIAL PRIMARY KEY,
	song_name VARCHAR(100),
	artist_id INTEGER,
	album VARCHAR(50),
	date_published DATE,
	plays INTEGER,
	FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

-- DML
-- Insert data into artist table
INSERT INTO artist(artist_name, record_label)
VALUES('Pop Smoke', 'Republic Records'),('Mac Miller', 'Rostrum Records'),('Juice WRLD', 'Interscope Records'),('Nipsey Hussle', 'All Money In No Money Out');

INSERT INTO artist(artist_name)
VALUES('Chance the Rapper');

SELECT *
FROM artist;

-- Insert data into favorite_song table
INSERT INTO favorite_song(song_name,artist_id,album,date_published,plays)
VALUES
	('Blue World', 2, 'Circles', '2020-01-17', 142556902),
	('Welcome To The Party', 1, 'Meet The Woo', '2019-07-26', 382147889),
	('So It Goes', 2, 'Swimming', '2018-08-03', 4912567),
	('Yea Yea', 1, 'Shoot Fot The Stars Aim For The Moon', '2020-07-03', 6824587),
	('Lucid Dreams', 3, 'Goodbye & Good Riddance', '2018-05-18', 1699199935),
	('Hard Work Pays Off', 3, 'WRLD ON DRUGS', '2018-10-19', 517858962),
	('Hussle and Motivate', 4, 'Victory Lap', '2018-02-16', 51656462),
	('Grinding All My Life', 4, 'Victory Lap', '2018-02-16', 119751625);
	
INSERT INTO favorite_song(song_name)
VALUES('DREAMCATCHER');
	
SELECT *
FROM favorite_song;

-- NOTE: FROM clause = Left table, JOIN clause = Right table

-- INNER JOIN: Returns all records that have matching values in both tables
SELECT *
FROM artist
INNER JOIN favorite_song
ON artist.artist_id=favorite_song.artist_id;

-- LEFT JOIN: Returns all records from the left table, and the matched records from the right table
SELECT artist_name, song_name, artist.artist_id
FROM artist
LEFT JOIN favorite_song
ON artist.artist_id=favorite_song.artist_id;

-- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
SELECT *
FROM artist
RIGHT JOIN favorite_song
ON artist.artist_id=favorite_song.artist_id;

-- FULL JOIN: Returns all records when there is a match in either left or right table
SELECT *
FROM artist
FULL JOIN favorite_song
ON artist.artist_id=favorite_song.artist_id;

-- MULTI JOIN
-- Starting from the actor table, connect to the film_actor table, then connect to to the film table
-- NOTE: Its best practice to join at most 3 tables, no more.
SELECT first_name, last_name, title
FROM actor
INNER JOIN film_actor
ON actor.actor_id=film_actor.actor_id
INNER JOIN film
ON film_actor.film_id=film.film_id;
