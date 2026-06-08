-- поиск жанров, где средняя длительность песни превышает 4 минуты
SELECT g.name AS genre_name,
	ROUND(AVG(s.duration_sec), 2) AS avg_duration
FROM songs s
	INNER JOIN song_genres sg ON s.song_id = sg.song_id
	INNER JOIN genres g ON sg.genre_id = g.genre_id
GROUP BY g.name
HAVING AVG(s.duration_sec) > 240
ORDER BY avg_duration DESC;
