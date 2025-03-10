use flight_booking_system;
-- Insert into city table
INSERT INTO city (city_id, name, abbreviation)
VALUES
(1, 'New York', 'NY'),
(2, 'Los Angeles', 'LA'),
(3, 'Chicago', 'CHI');

-- Insert into client table
INSERT INTO client (client_id, name)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Bob Johnson');

-- Insert into flight table
INSERT INTO flight (flight_id, from_city, to_city, departure_time, arrival_time, distance)
VALUES
(1, 1, 2, '08:30:00', '11:30:00', 2451),  -- Flight from New York to Los Angeles
(2, 2, 3, '15:00:00', '18:00:00', 1744),  -- Flight from Los Angeles to Chicago
(3, 1, 3, '12:00:00', '14:30:00', 790);   -- Flight from New York to Chicago

-- Insert into ticket table
INSERT INTO ticket (client_id, flight_id, confirmation_code, price, class)
VALUES
(1, 1, 'A1B2C3D4', 300.00, 'E'),   -- Ticket for John Doe on flight 1 (New York to Los Angeles)
(2, 2, 'D4E5F6G7', 250.00, 'B'),   -- Ticket for Jane Smith on flight 2 (Los Angeles to Chicago)
(3, 3, 'H8I9J0K1', 200.00, 'F');   -- Ticket for Bob Johnson on flight 3 (New York to Chicago)




SELECT FROM ticket t

LEFT JOIN flight fl ON (fl.flight_id = t.flight_id),
LEFT JOIN client cl ON (cl.client_id = t.client_id),
INNER JOIN city ct ON (fl.)








