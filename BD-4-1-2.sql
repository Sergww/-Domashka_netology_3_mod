SELECT g.name genre, COUNT(*) number_musicians FROM genremusician gm
JOIN genres g ON g.id = gm.genre_id
GROUP BY g.id;

SELECT a.year_release, a.title album, COUNT(*) number_tracks from track t 
JOIN albums a  ON a.id = t.album_id
WHERE a.year_release BETWEEN 2019 AND 2020
GROUP BY a.year_release, a.title;

SELECT a.title, AVG(duration) average_duration from track t 
JOIN albums a  ON a.id = t.album_id
GROUP BY a.title
ORDER BY average_duration DESC;

SELECT m.nickname FROM musicians m
WHERE m.nickname not in (
	SELECT DISTINCT m.nickname FROM musicians m
	LEFT JOIN musicianalbum ma  ON ma.musician_id = m.id
	LEFT JOIN albums a on a.id = ma.album_id
	WHERE a.year_release = 2020   
	)
ORDER BY m.nickname;  

SELECT c.title compilation from compilation c
JOIN trackcompilation tk  ON tk.compilation_id = c.id
JOIN track t ON t.id = tk.track_id
JOIN musicianalbum ma ON t.album_id = ma.album_id
JOIN musicians m ON m.id = ma.musician_id
WHERE m.nickname LIKE 'Михаил Круг'
GROUP BY c.title;

SELECT a.title albums_2_genre, COUNT(g.musician_id) number_genre from albums a
JOIN musicianalbum m ON a.id = m.album_id
JOIN genremusician g ON g.musician_id = m.musician_id
GROUP BY g.musician_id, a.title
HAVING COUNT(g.musician_id) > 1;

SELECT t.title track_not_compilation from track t
LEFT JOIN trackcompilation tk  ON tk.track_id = t.id
WHERE tk.track_id IS NULL
ORDER BY t.title;

SELECT nickname, t.duration FROM musicians m 
JOIN musicianalbum ma ON ma.musician_id = m.id
JOIN track t ON t.album_id = ma.album_id
WHERE duration = (SELECT MIN(duration) FROM track);

SELECT nickname musician, t.duration, COUNT(*) number_of_tracks FROM musicians m 
JOIN musicianalbum ma ON ma.musician_id = m.id
JOIN track t ON t.album_id = ma.album_id
GROUP BY nickname, duration
HAVING  t.duration = (SELECT MIN(duration) FROM track);

SELECT a.title, COUNT(*) numbers FROM albums a
LEFT JOIN track t ON t.album_id = a.id
GROUP BY t.album_id, a.title
HAVING  COUNT(*) = (
    SELECT count(album_id) from track
    GROUP BY album_id
    ORDER BY count
    LIMIT 1
   ); 
  