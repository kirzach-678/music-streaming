-- ранжирование песен по длительности внутри каждого жанра
SELECT g.name AS genre_name,
	s.title AS song_title,
	s.duration_sec,
	DENSE_RANK() OVER (PARTITION BY g.genre_id ORDER BY s.duration_sec DESC) AS rank_in_genre
FROM songs s
	INNER JOIN song_genres sg ON s.song_id = sg.song_id
	INNER JOIN genres g ON sg.genre_id = g.genre_id;
