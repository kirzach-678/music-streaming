-- поиск explicit треков длительностью более 4 минут
SELECT title,
	duration_sec,
	audio
FROM songs
WHERE explicit = TRUE
	AND duration_sec > 240
ORDER BY duration_sec DESC;
