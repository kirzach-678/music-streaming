-- вывод треков, над которыми работали два и более артиста (совместные релизы)
SELECT s.title AS song_title,
	a.name AS artist_name
FROM songs s
	INNER JOIN artist_songs asg ON s.song_id = asg.song_id
	INNER JOIN artists a ON asg.artist_id = a.artist_id
WHERE s.song_id IN (
		SELECT song_id
		FROM artist_songs
		GROUP BY song_id
		HAVING COUNT(artist_id) > 1)
ORDER BY s.title,
	a.name;
