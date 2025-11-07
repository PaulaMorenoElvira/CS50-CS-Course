/*
write a SQL query to list the titles of all movies released in 2008.
Your query should output a table with a single column for the title of each movie.

We have:
CREATE TABLE movies (
    id INTEGER,
    title TEXT NOT NULL,
    year NUMERIC,
    PRIMARY KEY(id)
*/

SELECT title FROM movies WHERE year = 2008;
