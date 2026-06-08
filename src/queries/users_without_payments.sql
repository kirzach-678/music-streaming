-- поиск активных пользователей без единой успешной оплаты
SELECT user_id,
	name,
	email
FROM users
WHERE user_id NOT IN ( SELECT DISTINCT user_id
		FROM payments
		WHERE status = 'completed')
	AND deleted = FALSE;
