
-- Write a SQL query to list the names of the top 5 longest songs, in descending order of length.

 SELECT name FROM songs ORDER BY duration_ms DESC LIMIT 5;

-- Your query should output a table with a single column for the name of each song.
/*
+-----------------------+-------------+
|         name          | duration_ms |
+-----------------------+-------------+
| Te Bote - Remix       | 417920      |
| SICKO MODE            | 312820      |
| Walk It Talk It       | 276147      |
| Him & I (with Halsey) | 268867      |
| Perfect               | 263400      |
+-----------------------+-------------+
*/
