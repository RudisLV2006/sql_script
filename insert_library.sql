USE library_management_system;

INSERT INTO authors (name,birthday) VALUES 
("Kristaps", "2006-04-11"),
("Rolands", "2006-06-12"),
("Mareks", "2006-12-15"),
("Markuss", "2006-02-5"),
("Aivis", "2002-10-03");


INSERT INTO books (title, author_id, published_date, isbn) VALUES 
("Dienas saulite",2,"2019-03-12","856729562851"),
("Saprotama naksts",1,"2022-05-11","2351266361"),
("Neredzama sieva",2,"2018-07-30","5434152"),
("Lielais suns",3,"2030-02-11","432121"),
("Sarkanais knabs",4,"2011-02-09","5632661"),
("Pilpiens",4,"2025-03-19","2415612"),
("Datorins",1,"2016-07-11","231241256"),
("Klavierites",2,"2011-10-10","455413315"),
("Nebijusais ruksis",1,"2022-05-22","74513212"),
("Izcilais dators",3,"2019-02-11","42416612");

INSERT INTO members(name, membership_date) VALUES
("Juris", "2020-09-20"),
("Daniils", "2021-11-01"),
("Arvis", "2017-03-19"),
("Arturs", "2025-02-28"),
("Akvils", "2022-01-20");

INSERT INTO loans(book_id,member_id,loan_date) VALUES
(1,1,"2022-01-01"),
(2,2,"2010-05-04");



UPDATE authors set birthday="1999-01-01" WHERE author_id=5;
DELETE FROM books WHERE book_id = 10;
DELETE FROM members WHERE member_id = 3;


SELECT b.*, a.name FROM books b
JOIN authors a ON (a.author_id=b.author_id);

SELECT * FROM members m
RIGHT JOIN loans l on (l.member_id=m.member_id);

SELECT a.author_id,a.name, count(b.author_id) as "total books" FROM books b
JOIN authors a ON (a.author_id=b.author_id)
GROUP BY b.author_id;

SELECT * FROM loans
WHERE return_date is null or return_date > curdate();

SELECT * FROM loans;
SELECT * FROM BOOks;

DELETE FROM loans WHERE loan_id=11;
INSERT INTO loans(book_id,member_id,loan_date) VALUES
(9,1,"2022-01-01");
UPDATE loans set status="returned" WHERE loan_id=12;