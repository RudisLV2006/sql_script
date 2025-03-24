START TRANSACTION;
INSERT INTO loans (member_id,book_id, loan_date) VALUES (2,1,"2010-10-01");



COMMIT;
ROLLBACK;

SET autocommit=0;