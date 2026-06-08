-- вывод состояния пользователей до, блокировка аккаунтов с неудачными платежами и вывод состояния после
SELECT user_id,
	name,
	deleted,
	del_reason
FROM users
WHERE user_id IN ( SELECT DISTINCT user_id
		FROM payments
		WHERE status = 'failed');

UPDATE
	users
SET deleted = TRUE,
	del_reason = 'ban'
WHERE user_id IN ( SELECT DISTINCT user_id
		FROM payments
		WHERE status = 'failed');

SELECT user_id,
	name,
	deleted,
	del_reason
FROM users
WHERE user_id IN ( SELECT DISTINCT user_id
		FROM payments
		WHERE status = 'failed');
