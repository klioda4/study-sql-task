DROP TABLE receipt_positions;
DROP TABLE receipts;
DROP TABLE products;
DROP TABLE discount_cards;


CREATE TABLE IF NOT EXISTS products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	price DECIMAL(5, 2) NOT NULL,
	promotional BOOLEAN NOT NULL DEFAULT FALSE,
	quantity INT NOT NULL,
	
	CHECK (price >= 0)
);

CREATE TABLE IF NOT EXISTS discount_cards (
	number INT PRIMARY KEY,
	discount REAL NOT NULL,
	
	CHECK (discount >= 0)
);

CREATE TABLE IF NOT EXISTS receipts (
	id SERIAL PRIMARY KEY,
	discount_card_number INT DEFAULT NULL,
	discount_card_percent REAL NOT NULL DEFAULT 0,
	sum_without_card_discount DECIMAL(5, 2) NOT NULL,
	total_value DECIMAL(5, 2) NOT NULL,
	
	FOREIGN KEY (discount_card_number) REFERENCES discount_cards (number),
	
	CHECK (sum_without_card_discount >= 0),
	CHECK (total_value >= 0)
);

CREATE TABLE IF NOT EXISTS receipt_positions (
	id SERIAL PRIMARY KEY,
	quantity INT NOT NULL,
	product_discount_percent REAL NOT NULL DEFAULT 0,
	product_price DECIMAL(5, 2) NOT NULL,
	value_without_discount DECIMAL(5, 2) NOT NULL,
	value_with_discount DECIMAL(5, 2) NOT NULL,
	product_id INT NOT NULL,
	receipt_id INT NOT NULL,
	
	FOREIGN KEY (product_id) REFERENCES products (id),
	FOREIGN KEY (receipt_id) REFERENCES receipts (id),
	
	CHECK (quantity >= 0),
	CHECK (product_price >= 0),
	CHECK (value_without_discount >= 0),
	CHECK (value_with_discount >= 0)
);