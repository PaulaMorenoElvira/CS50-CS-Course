
-- Write a SQL query that returns the average energy of songs that are by Drake.

 SELECT avg(energy) FROM songs WHERE artist_id = (SELECT id FROM artists WHERE name = 'Drake');

-- 1) Your query should output a table with a single column and a single row containing the average energy.
/*
+----+
| id |
+----+
| 23 |
+----+
*/
-- 2) You should not make any assumptions about what Drake’s artist_id is.
/*
+-------------+
| avg(energy) |
+-------------+
| 0.789       |
+-------------+
*/
