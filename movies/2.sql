/*
write a SQL query to determine the birth year of Emma Stone.

Your query should output a table with a single column and a single row (not counting the header) containing Emma Stone’s birth year.
You may assume that there is only one person in the database with the name Emma Stone.

We have:
CREATE TABLE people (
    id INTEGER,
    name TEXT NOT NULL,
    birth NUMERIC,
    PRIMARY KEY(id)

SO:
+-------+
| birth |
+-------+
| 1988  |
+-------+
*/

SELECT birth FROM people WHERE name = 'Emma Stone';
