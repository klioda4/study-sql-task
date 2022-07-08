-- Запрос всех продаж самых дорогих на данный момент товаров
SELECT *
FROM
	receipt_positions
WHERE
	product_id
IN
	(SELECT id
	FROM
		products
	WHERE
		price =(SELECT MAX(price)
				 FROM products))