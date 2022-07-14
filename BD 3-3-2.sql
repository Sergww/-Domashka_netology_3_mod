SELECT title, year_release FROM Albums
WHERE year_release = 2018;

SELECT MAX(duration) FROM Track;

SELECT title, duration FROM Track
ORDER BY duration DESC
LIMIT 1;

SELECT title FROM Track
WHERE duration >= 210;

SELECT title FROM Compilation
WHERE year_release BETWEEN 2018 AND 2020;

SELECT title FROM Track
<<<<<<< HEAD
WHERE title ILIKE '%my%' OR title ILIKE '%мой%';
=======
WHERE title ILIKE '%my%' OR title ILIKE 'мой';
>>>>>>> 0837262282a696da4cd57c07f5e0c29aa31aa8c6

SELECT nickname FROM Musicians
WHERE (length(nickname)-length(replace(nickname,' ',''))+1) = 1

SELECT nickname FROM Musicians
WHERE array_length(regexp_split_to_array(nickname, '\s+'), 1) = 1;

SELECT nickname FROM Musicians
<<<<<<< HEAD
WHERE array_length(string_to_array(nickname, ' '), 1) = 1;
=======
WHERE array_length(string_to_array(nickname, ' '), 1) = 1;
>>>>>>> 0837262282a696da4cd57c07f5e0c29aa31aa8c6
