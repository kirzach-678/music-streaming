-- добавление тестовых треков, вывод плейлиста до очистки, удаление треков с номером больше 10 и вывод после
INSERT INTO song_playlists (song_id, playlist_id, track_no)
VALUES
	(7, 1, 11),
	(8, 1, 12);

SELECT playlist_id,
	song_id,
	track_no
FROM song_playlists
WHERE playlist_id = 1
ORDER BY track_no;

DELETE FROM song_playlists
WHERE playlist_id = 1
	AND track_no > 10;

SELECT playlist_id,
	song_id,
	track_no
FROM song_playlists
WHERE playlist_id = 1
ORDER BY track_no;
