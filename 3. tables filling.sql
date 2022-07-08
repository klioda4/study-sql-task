DELETE FROM receipt_positions;
DELETE FROM receipts;
DELETE FROM products;
DELETE FROM discount_cards;

INSERT INTO products (id, name, price, quantity) VALUES (1, 'Apple', 1.12, 2);
INSERT INTO products (id, name, price, quantity) VALUES (2, 'Watermelon', 2.45, 4);
INSERT INTO products (id, name, price, quantity) VALUES (3, 'Orange', 0.99, 5);
INSERT INTO products (id, name, price, quantity) VALUES (4, 'Pear', 0.85, 1);
INSERT INTO products (id, name, price, quantity) VALUES (5, 'Cherry', 3.18, 6);
INSERT INTO products (id, name, price, quantity, promotional) VALUES (6, 'Apricot', 5.20, 8, TRUE);
INSERT INTO products (id, name, price, quantity, promotional) VALUES (7, 'Nectarine', 3.17, 0, TRUE);
INSERT INTO products (id, name, price, quantity, promotional) VALUES (8, 'Pineapple', 3.00, 9, TRUE);

INSERT INTO discount_cards (number, discount) VALUES (4815, 5);
INSERT INTO discount_cards (number, discount) VALUES (1234, 10);
INSERT INTO discount_cards (number, discount) VALUES (4321, 0.5);

INSERT INTO receipts (id, discount_card_number, discount_card_percent, sum_without_card_discount, total_value)
VALUES (1, 1234, 10, 2.22, 2.00);
INSERT INTO receipts (id, discount_card_number, discount_card_percent, sum_without_card_discount, total_value)
VALUES (2, 4815, 5, 30, 28.5);
INSERT INTO receipts (id, discount_card_number, discount_card_percent, sum_without_card_discount, total_value)
VALUES (3, 1234, 10, 31.05, 27.94);

INSERT INTO receipt_positions (quantity, product_price, value_without_discount, value_with_discount, product_id, receipt_id)
VALUES (2, 1.11, 2.22, 2.22, 1, 1);

INSERT INTO receipt_positions (quantity, product_price, value_without_discount, value_with_discount, product_id, receipt_id)
VALUES (6, 5.00, 30.00, 27.00, 6, 2);
INSERT INTO receipt_positions (quantity, product_price, value_without_discount, value_with_discount, product_id, receipt_id)
VALUES (3, 1.00, 3.00, 3.00, 5, 2);

INSERT INTO receipt_positions (quantity, product_price, value_without_discount, value_with_discount, product_id, receipt_id)
VALUES (6, 5.20, 31.20, 28.08, 6, 3);
INSERT INTO receipt_positions (quantity, product_price, value_without_discount, value_with_discount, product_id, receipt_id)
VALUES (3, 0.99, 2.97, 2.97, 5, 3);