-- список пользователей, которые самостоятельно удалили свой аккаунт
SELECT name,
	email,
	registration_date
FROM users
WHERE deleted = TRUE
	AND del_reason = 'voluntary'
ORDER BY registration_date ASC;
