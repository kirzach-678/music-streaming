-- вывод песен, которые длиннее средней продолжительности всех треков в базе
SELECT title,
	duration_sec
FROM songs
WHERE duration_sec > (
		SELECT AVG(duration_sec)
		FROM songs)
ORDER BY duration_sec DESC;
