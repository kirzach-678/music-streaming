-- список сотрудников для каждого лейбла, включая те, в которых нет сотрудников
SELECT u.name AS employee_username,
	l.name AS label_name,
	ul.appointment_date
FROM user_labels ul
	INNER JOIN users u ON ul.user_id = u.user_id
	RIGHT JOIN labels l ON ul.label_id = l.label_id;
