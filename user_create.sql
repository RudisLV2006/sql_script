SELECT * FROM mysql.USER;

CREATE USER 'user05032025'@'localhost' IDENTIFIED BY 'password';
GRANT all privileges ON laravel_api_05032025.* TO 'user05032025'@'localhost';
SHOW GRANTS FOR 'user05032025'@'localhost';
CREATE DATABASE laravel_api_05032025;

DROP database laravel;

DROP USER 'user05032025'@'localhost';
