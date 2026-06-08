-- вывод всех песен с указанием их исполнителей
SELECT a.name AS artist_name,
	s.title AS song_title,
	s.duration_sec
FROM songs s
	INNER JOIN artist_songs asg ON s.song_id = asg.song_id
	INNER JOIN artists a ON asg.artist_id = a.artist_id
ORDER BY artist_name,
	song_title;
