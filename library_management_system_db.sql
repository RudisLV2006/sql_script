CREATE DATABASE IF NOT EXISTS library_management_system;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
USE library_management_system;

CREATE TABLE IF NOT EXISTS Authors(
	author_id int AUTO_INCREMENT,
    name varchar(100) not null,
    birthday DATE,
    PRIMARY KEY (author_id)
);
CREATE TABLE IF NOT EXISTS books(
	book_id int AUTO_INCREMENT,
    title varchar(200) not null,
    author_id int,
    published_date DATE,
    isbn varchar(20) unique,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS members(
	member_id int AUTO_INCREMENT,
    name varchar(100) not null,
    membership_date date,
    PRIMARY KEY (member_id)
);

CREATE TABLE IF NOT EXISTS loans(
	loan_id int AUTO_INCREMENT,
    book_id int,
    member_id int,
    loan_date date,
    return_date date,
    PRIMARY KEY (loan_id),
    FOREIGN KEY (book_id) references books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) references members(member_id) ON DELETE CASCADE
)
