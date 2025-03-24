use library_management_system;

delimiter //
create procedure GetMemberLoans (IN member_id INT)
	BEGIN
		SELECT * FROM loans l
        where l.member_id=member_id;
    END//
delimiter ;
DROP PROCEDURE GetMemberLoans;

CALL GetMemberLoans(1);

CREATE VIEW ActiveLoans AS
	SELECT m.name, b.title FROM loans l
	JOIN members m ON (m.member_id=l.member_id)
	JOIN books b ON (b.book_id=l.book_id)
	LEFT JOIN authors a ON (a.author_id=b.author_id)
	WHERE return_date is null or return_date > curdate();
    
SELECT * FROM ActiveLoans;

ALTER TABLE loans
add status ENUM("returned", "loan");


delimiter //
CREATE TRIGGER update_return BEFORE UPDATE ON loans
FOR EACH ROW
BEGIN
	IF NEW.status = 'returned' THEN
        SET NEW.return_date = CURDATE();
    END IF;
END//
delimiter ;
DROP TRIGGER update_return;

UPDATE loans set status="loan" WHERE member_id=2;


ALTER TABLE books
add status bool;

delimiter //
CREATE TRIGGER available_book
BEFORE INSERT ON loans
FOR EACH ROW
BEGIN
    DECLARE last_returned_date DATETIME;

    -- Get the most recent returned_date for the book
    SELECT return_date
    INTO last_returned_date
    FROM loans
    WHERE book_id = NEW.book_id
    ORDER BY returned_date DESC
    LIMIT 1;

    -- Update the status of the book based on whether the last returned_date is not null
    UPDATE books
    SET status = (last_returned_date IS NOT NULL)
    WHERE book_id = NEW.book_id;
END//
delimiter ;
DROP TRIGGER available_book;

