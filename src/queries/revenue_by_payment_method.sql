-- подсчет успешных доходов с группировкой по методам оплаты
SELECT method,
	COUNT(payment_id) AS total_payments,
	SUM(amount_paid) AS total_revenue
FROM payments
WHERE status = 'completed'
GROUP BY method;
