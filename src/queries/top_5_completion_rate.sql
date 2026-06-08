-- 5 самых популярных песен по проценту дослушивания
SELECT s.title AS song_title,
	COUNT(ph.user_id) AS total_plays,
	ROUND(SUM(ph.duration_sec)::numeric / SUM(s.duration_sec) * 100, 2) AS completion_rate_percentage
FROM play_history ph
	INNER JOIN songs s ON ph.song_id = s.song_id
GROUP BY s.song_id,
	s.title
ORDER BY completion_rate_percentage DESC
LIMIT 5;
