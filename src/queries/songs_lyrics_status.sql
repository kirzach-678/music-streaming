-- проверка наличия файлов с текстом для каждой песни
SELECT s.title,
	s.audio,
	s.lyrics
FROM songs s
	LEFT JOIN song_releases sr ON s.song_id = sr.song_id
ORDER BY s.title;
