CREATE DATABASE flight_booking_system;

DROP DATABASE flight_booking_system;

use flight_booking_system;
CREATE TABLE city(
	city_id INT PRIMARY KEY,
    name VARCHAR(30) ,
    abbreviation char(4)
);

CREATE TABLE client(
	client_id INT PRIMARY KEY,
	name varchar(40)
);

CREATE TABLE flight(
	flight_id INT PRIMARY KEY,
    from_city INT,
    to_city INT,
    departure_time TIME,
    arrival_time TIME,
    distance INT,
    FOREIGN KEY (from_city) REFERENCES city(city_id),
    FOREIGN KEY (to_city) REFERENCES city(city_id)
);

CREATE TABLE ticket(
	client_id INT,
    flight_id INT,
    confirmation_code varchar(10),
    price DOUBLE,
    class char(1),
    FOREIGN KEY (client_id) REFERENCES client(client_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);