-- проверка корректности хэша введённого пароля при авторизации
-- SELECT user_id,
-- 	name
-- FROM users
-- WHERE lower(email) = lower('pomidorka@soundteam.com')
-- 	AND password_hash = crypt('password', password_hash)
-- 	AND deleted = FALSE;
SELECT (password_hash = crypt('правильный пароль', password_hash)) AS password_match
FROM users
WHERE lower(email) = 'pomidorka@soundstream.com';

SELECT (password_hash = crypt('tomatik228', password_hash)) AS password_match
FROM users
WHERE lower(email) = 'pomidorka@soundstream.com';
