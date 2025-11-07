/*
write a SQL query to list the titles and release years of all Harry Potter movies, in chronological order.
Your query should output a table with two columns, one for the title of each movie and one for the release year of each movie.
You may assume that the title of all Harry Potter movies will begin with the words “Harry Potter”, and that if a movie title begins with the words “Harry Potter”, it is a Harry Potter movie.

+-------------------------------------------------------------+------+
|                            title                            | year |
+-------------------------------------------------------------+------+
| Harry Potter and the Sorcerer's Stone                       | 2001 |
| Harry Potter and the Chamber of Secrets                     | 2002 |
| Harry Potter and the Prisoner of Azkaban                    | 2004 |
| Harry Potter and the Goblet of Fire                         | 2005 |
| Harry Potter und ein Stein                                  | 2006 |
| Harry Potter and the Order of the Phoenix                   | 2007 |
| Harry Potter und der geheime Pornokeller                    | 2008 |
| Harry Potter und der Plastikpokal                           | 2008 |
| Harry Potter and the Half-Blood Prince                      | 2009 |
| Harry Potter and the Deathly Hallows: Part 1                | 2010 |
| Creating the World of Harry Potter, Part 4: Sound and Music | 2010 |
| The Seekers Guide to Harry Potter                           | 2010 |
| Harry Potter and the Deathly Hallows: Part 2                | 2011 |
| Harry Potter and the Untold Stories of Hogwarts             | 2012 |
| Harry Potter: A History of Magic                            | 2017 |
| The Harry Potter Saga Analyzed                              | 2018 |
| Darla's Book Club: Discussing the Harry Potter Series       | 2020 |
| The Real! Harry Potter - Young Adult or Occult?             | 2024 |
| Harry Potter and the Stone                                  | 2024 |
+-------------------------------------------------------------+------+
*/
SELECT title, year FROM movies WHERE title  LIKE '%Harry Potter%' ORDER BY year ASC;
