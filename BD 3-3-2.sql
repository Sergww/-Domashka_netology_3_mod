SELECT title, year_release FROM Albums
WHERE year_release = 2018;

SELECT title, duration FROM Track
ORDER BY duration DESC
LIMIT 1;

SELECT title FROM Track
WHERE duration >= 210;

SELECT title FROM Compilation
WHERE year_release BETWEEN 2018 AND 2020;

SELECT title FROM Track
WHERE title ILIKE '%my%' OR title LIKE '%мой%';

SELECT nickname FROM Musicians
WHERE (length(nickname)-length(replace(nickname,' ',''))+1) = 1