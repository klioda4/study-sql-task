-- Найти все чеки, в которых больше одной покупки (позиции)
SELECT
	*
FROM
	receipts
INNER JOIN
	receipt_positions ON receipts.id = receipt_positions.receipt_id
WHERE
	receipts.id
IN
	(SELECT
		receipt_id
	FROM
		receipt_positions
	GROUP BY
		receipt_id
	HAVING
		COUNT(id) > 1);