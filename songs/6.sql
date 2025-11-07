
-- Write a SQL query that lists the names of songs that are by Post Malone.

SELECT name FROM songs WHERE artist_id = (SELECT id FROM artists WHERE name = 'Post Malone');


-- 1) Your query should output a table with a single column for the name of each song.
/*
+----+
| id |
+----+
| 54 |
+----+
*/

-- 2) You should not make any assumptions about what Post Malone’s artist_id is.
/*
+-----------------------------------+
|               name                |
+-----------------------------------+
| Freaky Friday (feat. Chris Brown) |
+-----------------------------------+
*/
