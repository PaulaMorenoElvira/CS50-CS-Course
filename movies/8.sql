/*
write a SQL query to list the names of all people who starred in Toy Story.

Your query should output a table with a single column for the name of each person.
You may assume that there is only one movie in the database with the title Toy Story.
+-------------------+
|       name        |
+-------------------+
| Tom Hanks         |
| Tim Allen         |
| Don Rickles       |
| Jim Varney        |
| Wallace Shawn     |
| John Ratzenberger |
| Annie Potts       |
| John Morris       |
| Erik von Detten   |
| Laurie Metcalf    |
+-------------------+

NO HACE FALTA AÑADIR UN AND ENTRE JOINS

DESPUES DEL JOIN VIENE EL NOMBRE DE LÑA SEGUNDA CARPETA, NO EL DE LA CARPETA EN LA QUE YA ESTAS

*/

SELECT name FROM people JOIN stars ON people.id = stars.person_id JOIN movies ON stars.movie_id = movies.id WHERE title = 'Toy Story';

