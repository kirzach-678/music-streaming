-- список всех релизов и выпустивших их лейблов
SELECT r.title AS release_title,
	r.release_type,
	l.name AS label_name
FROM releases r
	LEFT JOIN labels l ON r.label_id = l.label_id
ORDER BY r.publication_date DESC;
