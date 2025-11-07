/*
write a SQL query to list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, order them alphabetically by title.
Your query should output a table with two columns, one for the title of each movie and one for the rating of each movie.
Movies that do not have ratings should not be included in the result.

En esta linea : JOIN movies ON ratings.movie_id = movies.id

estamos convirtiendo la columna movie_id de ratings en igual a la columna id en movies
*/

SELECT ratings.rating, movies.title FROM ratings JOIN movies ON ratings.movie_id = movies.id WHERE year = 2010 ORDER BY rating DESC, title ASC;
