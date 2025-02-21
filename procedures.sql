-- use sql_invoicing;

DELIMITER &&   -- sintakses atdalītais
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END&&
DELIMITER ;  -- atgrieža atpakaļ ; kā sintaksis

call get_clients();



DELIMITER //
CREATE PROCEDURE get_invoice_with_balance()
BEGIN
	SELECT * FROM invoices WHERE invoice_total - payment_total > 0;
END//
DELIMITER ;

call get_invoice_with_balance;



DROP PROCEDURE IF EXISTS `get_clients_by_state`;
DELIMITER //
CREATE PROCEDURE get_clients_by_state(IN state CHAR(2))
BEGIN
	SELECT * FROM clients c WHERE c.state = state;
END//

DELIMITER ;

call get_clients_by_state('CA');



DELIMITER //
CREATE PROCEDURE get_invoices_by_client (IN client CHAR(50))
BEGIN
	SELECT * FROM invoices i WHERE i.client_id IN (
		SELECT client_id FROM clients c WHERE c.name = client
	);
END//
DELIMITER ;

CALL get_invoices_by_client('Yadel');


DROP PROCEDURE IF EXISTS `get_invoices_by_client_id`;
DELIMITER //
CREATE PROCEDURE get_invoices_by_client_id (IN client_id INT)
BEGIN
	select * from invoices i
	where i.client_id = IFNULL(client_id, i.client_id);
END//
DELIMITER ;

CALL get_invoices_by_client_id('1');


DROP PROCEDURE IF EXISTS `get_invoices_by_client_validateid`;
DELIMITER //
CREATE PROCEDURE get_invoices_by_client_validateid (IN client_id INT)
BEGIN
	select * from invoices i
	where i.client_id = IFNULL(client_id, i.client_id);
END//
DELIMITER ;

CALL get_invoices_by_client_id(null);

DROP PROCEDURE IF EXISTS `get_invoices_by_client_validate`;
DELIMITER //
CREATE PROCEDURE get_invoices_by_client_validate (IN client CHAR(50))
BEGIN
	SELECT * FROM invoices i WHERE i.client_id IN (
		SELECT client_id FROM clients c WHERE c.name = IFNULL(client,c.name)
	);
END//
DELIMITER ;

CALL get_invoices_by_client_validate(NULL);

DROP PROCEDURE IF EXISTS `set_invoice_payment`;
DELIMITER //
CREATE PROCEDURE set_invoice_payment(IN payment_id INT, IN payment_amount DECIMAL(9,2))
BEGIN
	if payment_amount <= 0 THEN
    SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid payment amount';
	END IF;
    
	UPDATE invoices i
    SET i.payment_total = (i.payment_total+payment_amount), i.payment_date = CURDATE()
    WHERE i.invoice_id = payment_id;
END//
DELIMITER ;

CALL set_invoice_payment(1,-200);