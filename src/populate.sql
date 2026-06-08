-- необходим для хэширования паролей
CREATE EXTENSION IF NOT EXISTS pgcrypto;

INSERT INTO subscriptions (name, price, duration)
VALUES
	('Премиум месяц', 199.00, INTERVAL '1 month'),
	('Премиум полгода', 990.00, INTERVAL '6 months'),
	('Премиум год', 1990.00, INTERVAL '1 year'),
	('Hi-Fi месяц', 399.00, INTERVAL '1 month'),
	('Hi-Fi полгода', 1990.00, INTERVAL '6 month'),
	('Hi-Fi год', 3990.00, INTERVAL '1 year');

INSERT INTO users (subscription_auto_renewal, name, email, password_hash, registration_date,
 deleted, del_reason)
VALUES
	(DEFAULT, 'root', 'soundstream@soundstream.com', crypt('super_secret_pass_123',
	gen_salt('bf', 12)), '2025-01-01', FALSE, NULL),
	(TRUE, 'rock_star_99', 'ilyas@splin.ru', crypt('splinpass1', gen_salt('bf',
	12)), '2025-02-10', FALSE, NULL),
	(TRUE, 'johny_boy', 'snw@kino.ru', crypt('kinopass2', gen_salt('bf',
	12)), '2025-01-15', FALSE, NULL),
	(FALSE, 'gorshok_legend', 'mikhail@kish.ru', crypt('kishpass3', gen_salt('bf',
	12)), '2025-03-01', FALSE, NULL),
	(TRUE, 'till_berlin', 'till@rammstein.de', crypt('rammpass5', gen_salt('bf',
	12)), '2025-05-20', FALSE, NULL),
	(FALSE, 'billie_e', 'billie@eilish.com', crypt('billiepass6', gen_salt('bf',
	12)), '2025-06-01', FALSE, NULL),
	(TRUE, 'manager_sasha', 'sasha@yandexmusic.ru', crypt('manager123', gen_salt('bf',
	12)), '2025-01-20', FALSE, NULL),
	(TRUE, 'universal_boss', 'boss@universal.com', crypt('bosspassword', gen_salt('bf',
	12)), '2025-02-01', FALSE, NULL),
	(TRUE, 'elena_pop', 'elena@warner.com', crypt('elena_secure', gen_salt('bf',
	12)), '2025-03-15', FALSE, NULL),
	(TRUE, 'skater_boy', 'skater@mail.ru', crypt('skatepass', gen_salt('bf',
	12)), '2025-05-01', FALSE, NULL),
	(FALSE, 'mister_meloman', 'mister@gmail.com', crypt('misterpass', gen_salt('bf',
	12)), '2025-05-15', FALSE, NULL),
	(TRUE, 'vova_hiphop', 'vova@yandex.ru', crypt('vovapass1', gen_salt('bf',
	12)), '2025-05-25', FALSE, NULL),
	(TRUE, 'sad_user', 'deleted_user1@mail.ru', crypt('sadpass12', gen_salt('bf',
	12)), '2025-02-20', TRUE, 'voluntary'),
	(TRUE, 'spammer_99', 'bad_boy@gmail.com', crypt('hackmepls', gen_salt('bf',
	12)), '2025-03-10', TRUE, 'ban'),
	(FALSE, 'alice_wonder', 'alice@icloud.com', crypt('aliceinwonder', gen_salt('bf',
	12)), '2025-06-02', FALSE, NULL),
	(TRUE, 'pasha_techno', 'pavel@tech.ru', crypt('technotech', gen_salt('bf',
	12)), '2025-05-11', FALSE, NULL),
	(TRUE, 'marina_jazz', 'marina@jazz.ru', crypt('marina_jazz1', gen_salt('bf',
	12)), '2025-04-30', FALSE, NULL),
	(FALSE, 'user_without_pay', 'test_user@mail.ru', crypt('testpass',
	gen_salt('bf', 12)), '2025-06-05', FALSE, NULL),
	(TRUE, 'metall_head', 'rocker@rambler.ru', crypt('rockon123',
	gen_salt('bf', 12)), '2025-01-10', FALSE, NULL),
	(DEFAULT, 'evtish', 'evtish@soundstream.com', crypt('kaluga40',
	gen_salt('bf', 12)), '2008-06-06', FALSE, NULL),
	(DEFAULT, 'adolf', 'pomidorka@soundstream.com', crypt('tomatik228',
	gen_salt('bf', 12)), '2008-07-06', FALSE, NULL);

INSERT INTO genres (name, description)
VALUES
	('Рок', 'Классический и современный рок'),
	('Панк-рок', 'Энергичный панк-рок с протестными текстами'),
	('Хип-хоп', 'Рифмы и биты'),
	('Инди-рок', 'Независимая гитарная музыка'),
	('Поп', 'Популярная музыка с запоминающимися мотивами'),
	('Индастриал-метал', 'Тяжелый метал с электронными элементами'),
	('Альтернативный рок', 'Разнообразные направления альтернативы'),
	('Синти-поп', 'Электронная музыка с доминированием синтезаторов'),
	('Джаз', 'Импровизационная музыка'),
	('Техно', 'Электронная танцевальная музыка');

INSERT INTO artists (name, description)
VALUES
	('Сплин', 'Российская рок-группа из Санкт-Петербурга'),
	('Кино', 'Легендарная советская рок-группа'),
	('Король и Шут', 'Российская хоррор-панк-группа'),
	('Rammstein', 'Немецкая индастриал-метал группа'),
	('Billie Eilish', 'Американская поп-исполнительница'),
	('Linkin Park', 'Американская альтернативная рок-группа'),
	('The Weeknd', 'Канадский поп и R&B исполнитель'),
	('Перемотка', 'Российская постпанк группа'),
	('ЛСП', 'Белорусский рэп-исполнитель и автор песен');

INSERT INTO labels (name, description)
VALUES
	('Navigator Records', 'Российский звукозаписывающий лейбл'),
	('Moroz Records', 'Издатель классического русского рока'),
	('Zhara Music', 'Современный лейбл популярной музыки'),
	('Universal Music Group', 'Один из крупнейших мировых лейблов'),
	('Warner Music Group', 'Международный медиагигант'),
	('Sony Music', 'Мировой лидер в сфере звукозаписи'),
	('Полигон Records', 'Независимый российский рок-лейбл'),
	('Rhino Records', 'Лейбл, специализирующийся на переизданиях'),
	('Booking Machine', 'Концертное агентство и лейбл'),
	('Self-Released', 'Самостоятельное издание артистов');

INSERT INTO releases (label_id, title, release_type, publication_date)
VALUES
	(1, 'Гранатовый альбом', 'album', '2025-02-15'),
	(2, 'Группа крови', 'album', '2025-01-20'),
	(8, 'Группа крови (Переиздание)', 'album', '2025-06-01'),
	(7, 'Камнем по голове', 'album', '2025-03-05'),
	(4, 'Mutter', 'album', '2025-05-25'),
	(5, 'Hit Me Hard and Soft', 'album', '2025-06-02'),
	(6, 'Hybrid Theory', 'album', '2025-01-11'),
	(4, 'After Hours', 'album', '2025-03-20'),
	(10, 'Старое кино', 'ep', '2025-04-01'),
	(6, 'The Highlights (Compilation)', 'album', '2025-05-01'),
	(1, 'Выхода нет (Remixes)', 'single', '2025-02-28'),
	(4, 'Zeit', 'album', '2025-05-12'),
	(5, 'Bad Guy (Remix Edition)', 'single', '2025-06-05'),
	(3, 'Новые песни', 'mixtape', '2025-05-18'),
	(6, 'Starboy', 'album', '2025-02-05'),
	(7, 'Акустический альбом', 'album', '2025-03-12'),
	(1, 'Новые люди', 'album', '2025-03-22'),
	(2, 'Звезда по имени Солнце', 'album', '2025-01-25');

INSERT INTO songs (audio, lyrics, title, duration_sec, explicit, publication_date)
VALUES
	('/music/vyhoda_net.flac', '/music/vyhoda_net.lrc', 'Выхода нет', 223, FALSE, '2025-02-15'),
	('/music/vyhoda_net_remix.flac', NULL, 'Выхода нет (DJ Electro Remix)', 310, FALSE, '2025-02-28'),
	('/music/gruppa_krovi.flac', '/music/gruppa_krovi.lrc', 'Группа крови', 285, FALSE, '2025-01-20'),
	('/music/peremen.flac', NULL, 'Перемен!', 295, FALSE, '2025-01-25'),
	('/music/kukla_kolduna.flac', '/music/kukla_kolduna.lrc', 'Кукла колдуна', 263, FALSE, '2025-03-12'),
	('/music/kamnem_po_golove.flac', NULL, 'Камнем по голове', 157, FALSE, '2025-03-05'),
	('/music/sonne.flac', '/music/sonne.lrc', 'Sonne', 272, FALSE, '2025-05-25'),
	('/music/deutschland.flac', NULL, 'Deutschland', 322, TRUE, '2025-05-12'),
	('/music/bad_guy.flac', '/music/bad_guy.lrc', 'Bad Guy', 194, FALSE, '2025-06-02'),
	('/music/bad_guy_remix.flac', NULL, 'Bad Guy (Remix)', 210, FALSE, '2025-06-05'),
	('/music/in_the_end.flac', '/music/in_the_end.lrc', 'In The End', 216, FALSE, '2025-01-11'),
	('/music/numb.flac', NULL, 'Numb', 185, FALSE, '2025-01-11'),
	('/music/blinding_lights.flac', '/music/blinding_lights.lrc', 'Blinding Lights', 200, FALSE, '2025-03-20'),
	('/music/starboy.flac', NULL, 'Starboy', 230, TRUE, '2025-02-05'),
	('/music/starye_filmy.flac', NULL, 'Старые фильмы', 180, FALSE, '2025-04-01'),
	('/music/monetka.flac', '/music/monetka.lrc', 'Монетка', 192, TRUE, '2025-05-18'),
	('/music/romans.flac', '/music/romans.lrc', 'Романс', 205, FALSE, '2025-02-15'),
	('/music/zvezda.flac', NULL, 'Звезда по имени Солнце', 225, FALSE, '2025-01-25');

INSERT INTO playlists (user_id, title, description, access_type)
VALUES
	(1, 'Рекомендации редакции: Русский Рок', 'Лучшие хиты отечественной сцены', 'public'),
	(1, 'Рекомендации редакции: Зарубежный Топ', 'Мировые шедевры', 'public'),
	(11, 'Мой Рок-н-Ролл', 'Плейлист для покатушек', 'private'),
	(12, 'Грустное настроение', NULL, 'sharable'),
	(13, 'Рэпчина 2025', 'Только качающие биты', 'public'),
	(16, 'Музыка для учебы', 'Фоновый синти-поп', 'private'),
	(17, 'Для тренировок', 'Тяжелый метал', 'public'),
	(18, 'Вечерний джаз', 'Расслабляющая подборка', 'sharable'),
	(2, 'Черновики Сплин', 'Секретные наработки', 'private'),
	(12, 'Любимое из Кино', NULL, 'public'),
	(13, 'Хиты на репите', 'Круглосуточно', 'public'),
	(11, 'Зарубежная альтернатива', NULL, 'sharable'),
	(16, 'Поп-хиты', 'Самое свежее', 'public'),
	(17, 'Industrial Base', 'Громко!', 'private'),
	(20, 'Heavy Metal Playlist', 'Metallica & Co', 'public'),
	(3, 'Акустика Цоя', 'Редкие записи', 'private'),
	(4, 'Панк живой', 'Хой!', 'public'),
	(6, 'Rammstein Favorites', 'Best tracks', 'public'),
	(7, 'Billie Vibes', 'Chill pop', 'private');

INSERT INTO payments (user_id, subscription_id, amount_paid, method, status, dt)
VALUES
	(11, 1, 19.00, 'card', 'completed', '2025-05-01 10:00:00+03'),
	(12, 2, 99.00, 'fps', 'completed', '2025-05-15 14:20:00+03'),
	(13, 3, 199.00, 'card', 'completed', '2025-05-25 18:45:00+03'),
	(14, 2, 99.00, 'card', 'completed', '2025-02-20 09:15:00+03'),
	(15, 5, 199.00, 'fps', 'failed', '2025-03-10 11:00:00+03'),
	(16, 4, 99.00, 'card', 'completed', '2025-06-02 12:30:00+03'),
	(17, 6, 399.00, 'fps', 'completed', '2025-05-11 16:00:00+03'),
	(18, 1, 19.00, 'card', 'completed', '2025-04-30 20:10:00+03'),
	(20, 5, 199.00, 'card', 'completed', '2025-01-10 15:00:00+03'),
	(2, 2, 99.00, 'card', 'completed', '2025-02-10 10:00:00+03'),
	(3, 2, 990.00, 'fps', 'completed', '2026-01-15 11:00:00+03'),
	(4, 2, 990.00, 'card', 'completed', '2026-03-01 12:00:00+03'),
	(5, 2, 990.00, 'fps', 'completed', '2026-04-12 13:00:00+03'),
	(6, 2, 990.00, 'card', 'completed', '2026-05-20 14:00:00+03'),
	(7, 2, 990.00, 'fps', 'completed', '2026-06-01 15:00:00+03'),
	(8, 3, 990.00, 'card', 'completed', '2026-01-20 16:00:00+03'),
	(9, 3, 990.00, 'fps', 'completed', '2026-02-01 17:00:00+03'),
	(10, 1, 199.00, 'card', 'completed', DEFAULT),
	(11, 1, 199.00, 'card', 'pending', DEFAULT),
	(12, 2, 990.00, 'fps', 'failed', DEFAULT);

INSERT INTO play_history (user_id, song_id, played_at, duration_sec)
VALUES
	(11, 1, '2025-05-02 12:00:00+03', 22),
	(11, 2, '2025-05-02 12:05:00+03', 15),
	(12, 3, '2025-05-16 15:00:00+03', 25),
	(12, 4, '2025-05-16 15:05:00+03', 29),
	(13, 7, '2025-05-26 19:00:00+03', 31),
	(13, 8, '2025-05-26 19:06:00+03', 24),
	(16, 11, '2025-06-03 13:00:00+03', 19),
	(17, 9, '2025-05-12 17:00:00+03', 22),
	(17, 10, '2025-05-12 17:05:00+03', 22),
	(18, 15, '2025-05-01 21:00:00+03', 200),
	(11, 5, '2025-05-03 10:00:00+03', 23),
	(13, 18, '2025-05-27 12:00:00+03', 19),
	(16, 12, '2026-05-27 12:00:00+03', 100),
	(17, 9, '2025-05-27 15:00:00+03', 22),
	(17, 10, '2025-01-27 12:00:00+03', 22),
	(18, 15, '2025-05-17 12:00:00+03', 20),
	(11, 5, '2025-05-27 12:05:00+03', 23),
	(13, 18, DEFAULT, 19),
	(16, 17, '2025-05-27 22:00:00+03', 92),
	(17, 5, '2025-06-27 12:00:00+03', 23),
	(18, 16, DEFAULT, 192);

INSERT INTO artist_songs (artist_id, song_id)
VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 6),
	(4, 7),
	(4, 8),
	(5, 9),
	(5, 10),
	(6, 11),
	(6, 12),
	(8, 12),
	(7, 13),
	(7, 14),
	(8, 15),
	(8, 16),
	(9, 17),
	(4, 18);

INSERT INTO song_genres (song_id, genre_id)
VALUES
	(1, 1),
	(1, 4),
	(2, 10),
	(3, 1),
	(3, 7),
	(4, 1),
	(5, 2),
	(5, 1),
	(6, 2),
	(7, 3),
	(7, 5),
	(8, 3),
	(9, 6),
	(9, 1),
	(10, 6),
	(11, 5),
	(11, 8),
	(12, 5),
	(13, 7),
	(13, 1),
	(14, 7),
	(15, 5),
	(15, 8),
	(16, 3),
	(16, 5),
	(17, 4),
	(18, 3);

INSERT INTO song_releases (song_id, release_id, track_no)
VALUES
	(1, 1, 5),
	(1, 12, 1),
	(3, 2, 1),
	(3, 3, 1),
	(5, 18, 2),
	(6, 4, 1),
	(7, 5, 4),
	(8, 13, 2),
	(9, 6, 3),
	(10, 14, 2),
	(11, 7, 2),
	(12, 15, 1),
	(13, 8, 4),
	(13, 11, 2),
	(14, 8, 7),
	(15, 9, 1),
	(15, 11, 1),
	(16, 17, 2),
	(17, 10, 3),
	(18, 16, 5),
	(2, 12, 2);

INSERT INTO song_playlists (song_id, playlist_id, track_no)
VALUES
	(1, 1, 1),
	(1, 3, 1),
	(3, 1, 2),
	(3, 3, 2),
	(3, 11, 2),
	(5, 1, 3),
	(9, 2, 1),
	(9, 7, 1),
	(11, 2, 2),
	(13, 2, 3),
	(7, 5, 1),
	(18, 5, 2),
	(17, 6, 1),
	(10, 7, 2),
	(15, 8, 1),
	(5, 11, 1),
	(12, 12, 1),
	(14, 13, 1);

INSERT INTO user_labels (user_id, label_id, appointment_date)
VALUES
	(8, 1, '2025-01-20'),
	(8, 3, '2025-05-10'),
	(9, 4, '2025-02-01'),
	(10, 5, '2025-03-15'),
	(10, 6, '2025-06-01');

INSERT INTO user_artists (user_id, artist_id, nickname, joining_date)
VALUES
	(2, 1, 'Александр Васильев', '2025-02-10'),
	(3, 2, 'Виктор Цой', '2025-01-15'),
	(3, 9, 'Сессионный гитарист', '2025-05-01'),
	(4, 3, 'Горшок', '2025-03-01'),
	(6, 5, 'Till Lindemann', '2025-05-20'),
	(7, 6, 'Billie Eilish', '2025-06-01');
