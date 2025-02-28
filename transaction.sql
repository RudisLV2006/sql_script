use sql_store;

START TRANSACTION;
	INSERT INTO orders (customer_id, order_date, status) VALUES (2,curdate(), 2);
	INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (LAST_INSERT_ID(), 3, 2, 6.7);
COMMIT;

SHOW VARIABLES LIKE 'autocommit';

ROLLBACK;

START TRANSACTION;
	UPDATE customers 
		SET points = (points+10)
	WHERE customer_id = 1;

rollback;

SELECT @@transaction_ISOLATION;