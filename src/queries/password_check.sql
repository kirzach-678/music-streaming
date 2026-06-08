-- проверка корректности хэша введённого пароля при авторизации
SELECT (password_hash = crypt('fixiki2008', password_hash)) AS password_match
FROM users
WHERE lower(email) = 'pomidorka@soundstream.com';

SELECT (password_hash = crypt('tomatik228', password_hash)) AS password_match
FROM users
WHERE lower(email) = 'pomidorka@soundstream.com';
