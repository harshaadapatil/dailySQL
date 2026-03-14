USE sys;

-- Create the movies table
CREATE TABLE movies (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(150) NOT NULL,
    genre        ENUM('action', 'comedy', 'drama', 'horror', 'sci-fi'),
    director     VARCHAR(100) NOT NULL,
    release_year YEAR,
    rating       DECIMAL(3,1),
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE movies ADD COLUMN is_available BOOLEAN DEFAULT TRUE;

-- Drop the column
ALTER TABLE movies DROP COLUMN is_available;

-- Modify column type
ALTER TABLE movies MODIFY COLUMN director VARCHAR(150);

-- Move title to first position
ALTER TABLE movies MODIFY COLUMN title VARCHAR(150) FIRST;

-- Move genre after title
ALTER TABLE movies MODIFY COLUMN genre ENUM('action','comedy','drama','horror','sci-fi') AFTER title;

-- Rename and rename back
RENAME TABLE movies TO movies_collection;
RENAME TABLE movies_collection TO movies;

-- Insert 10 movies
INSERT INTO movies (title, genre, director, release_year, rating) VALUES
('Inception',           'sci-fi', 'Christopher Nolan', 2010, 8.8),
('The Dark Knight',     'action', 'Christopher Nolan', 2008, 9.0),
('Interstellar',        'sci-fi', 'Christopher Nolan', 2014, 8.6),
('3 Idiots',            'comedy', 'Rajkumar Hirani',   2009, 8.4),
('Dangal',              'drama',  'Nitesh Tiwari',     2016, 8.3),
('Andhadhun',           'drama',  'Sriram Raghavan',   2018, 8.2),
('Get Out',             'horror', 'Jordan Peele',      2017, 7.7),
('Avengers Endgame',    'action', 'Anthony Russo',     2019, 8.4),
('The Shawshank',       'drama',  'Frank Darabont',    1994, 9.3),
('Hereditary',          'horror', 'Ari Aster',         2018, 7.3);

-- Update by ID
UPDATE movies SET title  = 'The Dark Knight Rises' WHERE id = 2;
UPDATE movies SET genre  = 'action'                WHERE id = 5;

-- Update by title
UPDATE movies SET rating = 9.1 WHERE title = 'The Shawshank';

-- Delete a specific row
DELETE FROM movies WHERE id = 10;

-- Delete by condition
DELETE FROM movies WHERE genre = 'horror';

--  DQL  |  Data Query Language

-- Basic SELECT
SELECT * FROM movies;
SELECT title, director FROM movies;

-- WHERE filters
SELECT * FROM movies WHERE genre = 'sci-fi';
SELECT title, rating FROM movies WHERE genre = 'action';
SELECT * FROM movies WHERE title = 'Inception';
SELECT * FROM movies WHERE release_year > 2010;
SELECT * FROM movies WHERE rating >= 8.5;

-- LIKE pattern matching
SELECT * FROM movies WHERE title    LIKE 'A%';       -- starts with A
SELECT * FROM movies WHERE title    LIKE 'I%';       -- starts with I
SELECT * FROM movies WHERE director LIKE '%Nolan%';  -- any Nolan film
SELECT * FROM movies WHERE title    LIKE '%the%';    -- contains 'the'

-- ORDER BY
SELECT * FROM movies ORDER BY title;
SELECT * FROM movies ORDER BY title DESC;
SELECT title, release_year FROM movies ORDER BY release_year;
SELECT * FROM movies ORDER BY rating DESC;           -- highest rated first
SELECT * FROM movies ORDER BY created_at DESC;

-- Aggregate functions
SELECT COUNT(*)           FROM movies;               -- total movies
SELECT COUNT(id)          FROM movies;               -- non-null count
SELECT MIN(release_year)  FROM movies;               -- oldest
SELECT MAX(release_year)  FROM movies;               -- newest
SELECT MIN(rating)        FROM movies;               -- lowest rated
SELECT MAX(rating)        FROM movies;               -- highest rated
SELECT AVG(rating)        FROM movies;               -- average rating
SELECT SUM(rating)        FROM movies;               -- sum of all ratings

-- GROUP BY + HAVING
SELECT genre, COUNT(*)
FROM movies
GROUP BY genre;

SELECT genre, COUNT(id)
FROM movies
GROUP BY genre;

SELECT genre, COUNT(*)
FROM movies
GROUP BY genre
HAVING COUNT(*) > 2;

SELECT genre, COUNT(*)
FROM movies
GROUP BY genre
HAVING COUNT(*) < 3;

-- Average rating per genre
SELECT genre, AVG(rating) AS avg_rating
FROM movies
GROUP BY genre;

-- Only genres where avg rating > 8.0
SELECT genre, AVG(rating) AS avg_rating
FROM movies
GROUP BY genre
HAVING AVG(rating) > 8.0;

-- LIMIT: first N rows
SELECT * FROM movies LIMIT 5;
SELECT * FROM movies ORDER BY rating DESC LIMIT 3;   -- top 3 highest rated

-- LIMIT with OFFSET: skip rows (useful for pagination)
SELECT * FROM movies LIMIT 5 OFFSET 3;              -- rows 4 to 8

-- Alias (AS): rename columns in result
SELECT title AS movie_name, rating AS imdb_score FROM movies;
SELECT director, COUNT(*) AS total_films FROM movies GROUP BY director;

-- BETWEEN: range filter
SELECT * FROM movies WHERE release_year BETWEEN 2010 AND 2020;
SELECT * FROM movies WHERE rating BETWEEN 8.0 AND 9.0;

-- IN: match multiple values
SELECT * FROM movies WHERE genre IN ('action', 'sci-fi');
SELECT * FROM movies WHERE release_year IN (2008, 2010, 2014, 2018);

-- NOT IN: exclude values
SELECT * FROM movies WHERE genre NOT IN ('horror', 'comedy');

-- IS NULL / IS NOT NULL
SELECT * FROM movies WHERE rating IS NULL;
SELECT * FROM movies WHERE rating IS NOT NULL;

-- AND / OR / NOT: combine conditions
SELECT * FROM movies WHERE genre = 'drama'  AND rating > 8.0;
SELECT * FROM movies WHERE genre = 'action' OR  genre = 'sci-fi';
SELECT * FROM movies WHERE NOT genre = 'horror';

-- DISTINCT: remove duplicate values
SELECT DISTINCT genre    FROM movies;
SELECT DISTINCT director FROM movies;

-- Combine ORDER BY + LIMIT + WHERE
SELECT title, rating
FROM movies
WHERE genre = 'drama'
ORDER BY rating DESC
LIMIT 3;

