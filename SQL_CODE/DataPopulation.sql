-- Insert statements for Person
OPEN SYMMETRIC KEY EmailSymmetricKey DECRYPTION BY CERTIFICATE PersonEmailCertificate;

INSERT INTO PERSON (PERSON_ID, first_name, last_name, email_encrypted, date_of_birth, street_name, state, city, zipcode, Person_type) 
VALUES 
(1, 'John', 'Doe', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'john.doe@example.com'), '1985-01-01', '700 Boylston St', 'MA', 'Boston', '02116', 'P'),
(2, 'Jane', 'Smith', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'jane.smith@example.com'), '1990-02-02', '1 City Hall Square', 'MA', 'Boston', '02201', 'E'),
(3, 'Bob', 'Brown', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'bob.brown@example.com'), '1975-03-03', '4 South Market Building', 'MA', 'Boston', '02109', 'P'),
(4, 'Alice', 'Johnson', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'alice.johnson@example.com'), '1980-04-04', '110 Huntington Ave', 'MA', 'Boston', '02116', 'E'),
(5, 'Chris', 'Davis',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'chris.davis@example.com'), '1995-05-05', '800 Boylston St', 'MA', 'Boston', '02199', 'P'),
(6, 'Pat', 'Martinez',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'pat.martinez@example.com'), '1988-06-06', '1 Franklin Park Rd', 'MA', 'Boston', '02121', 'P'),
(7, 'Kim', 'Lee',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'kim.lee@example.com'), '1970-07-07', '300 Congress St', 'MA', 'Boston', '02210', 'E'),
(8, 'Sam', 'Wilson',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'sam.wilson@example.com'), '1992-08-08', '6B Beacon St', 'MA', 'Boston', '02108', 'E'),
(9, 'Alex', 'Taylor',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'alex.taylor@example.com'), '1999-09-09', '139 Tremont St', 'MA', 'Boston', '02111', 'P'),
(10, 'Morgan', 'White',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'morgan.white@example.com'), '2000-10-10', '465 Huntington Ave', 'MA', 'Boston', '02115', 'P'),
(11, 'Emily', 'Anderson',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'emily.anderson@example.com'), '1987-11-11', '200 Cambridge St', 'MA', 'Boston', '02114', 'E'),
(12, 'Michael', 'Brown',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'michael.brown@example.com'), '1982-12-12', '15 Beacon St', 'MA', 'Boston', '02108', 'E'),
(13, 'Sarah', 'Clark',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'sarah.clark@example.com'), '1994-01-13', '100 Federal St', 'MA', 'Boston', '02110', 'P'),
(14, 'David', 'Evans',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'david.evans@example.com'), '1986-02-14', '75 State St', 'MA', 'Boston', '02109', 'E'),
(15, 'Laura', 'Garcia',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'laura.garcia@example.com'), '1991-03-15', '10 Post Office Square', 'MA', 'Boston', '02109', 'P'),
(16, 'James', 'Harris', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'james.harris@example.com'), '1983-04-16', '500 Boylston St', 'MA', 'Boston', '02116', 'E'),
(17, 'Natalie', 'Jackson', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'natalie.jackson@example.com'), '1993-05-17', '30 Memorial Dr', 'MA', 'Boston', '02142', 'P'),
(18, 'Robert', 'King', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'robert.king@example.com'), '1984-06-18', '20 Milk St', 'MA', 'Boston', '02109', 'E'),
(19, 'Olivia', 'Lopez', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'olivia.lopez@example.com'), '1996-07-19', '5 Longfellow Pl', 'MA', 'Boston', '02114', 'P'),
(20, 'Daniel', 'Martin',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'daniel.martin@example.com'), '1981-08-20', '40 Trinity Pl', 'MA', 'Boston', '02116', 'E'),
(21, 'Sophia', 'Martinez', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'sophia.martinez@example.com'), '1997-09-21', '25 Beacon St', 'MA', 'Boston', '02108', 'E'),
(22, 'William', 'Nelson',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'william.nelson@example.com'), '1989-10-22', '50 Congress St', 'MA', 'Boston', '02201', 'P'),
(23, 'Isabella', 'Perez',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'isabella.perez@example.com'), '1998-11-23', '75 State St', 'MA', 'Boston', '02109', 'P'),
(24, 'Ethan', 'Robinson',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'ethan.robinson@example.com'), '1992-12-24', '100 Federal St', 'MA', 'Boston', '02110', 'E'),
(25, 'Emma', 'Rodriguez',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'emma.rodriguez@example.com'), '1980-01-25', '125 High St', 'MA', 'Boston', '02110', 'E'),
(26, 'Liam', 'Sanchez',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'liam.sanchez@example.com'), '1996-02-26', '150 Huntington Ave', 'MA', 'Boston', '02115', 'P'),
(27, 'Oliver', 'Smith',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'oliver.smith@example.com'), '1986-03-27', '175 Tremont St', 'MA', 'Boston', '02111', 'E'),
(28, 'Ava', 'Thompson',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'ava.thompson@example.com'), '1999-04-28', '200 Boylston St', 'MA', 'Boston', '02116', 'P'),
(29, 'Benjamin', 'White',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'benjamin.white@example.com'), '1991-05-29', '225 Franklin St', 'MA', 'Boston', '02110', 'E'),
(30, 'Charlotte', 'Williams',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'charlotte.williams@example.com'), '1995-06-30', '250 Summer St', 'MA', 'Boston', '02210', 'P'),
(31, 'Daniel', 'Wilson',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'daniel.wilson@example.com'), '1984-07-31', '275 Congress St', 'MA', 'Boston', '02210', 'E'),
(32, 'Elizabeth', 'Wood', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'elizabeth.wood@example.com'), '1990-08-01', '300 Longwood Ave', 'MA', 'Boston', '02115', 'P'),
(33, 'James', 'Young',  EncryptByKey(Key_GUID('EmailSymmetricKey'), 'james.young@example.com'), '1983-09-02', '325 Newbury St', 'MA', 'Boston', '02116', 'E'),
(34, 'Sophia', 'Clark', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'sophia.clark@example.com'), '1997-10-03', '350 Cambridge St', 'MA', 'Boston', '02114', 'P'),
(35, 'William', 'Martin', EncryptByKey(Key_GUID('EmailSymmetricKey'), 'william.martin@example.com'), '1994-11-04', '375 Harvard St', 'MA', 'Boston', '02138', 'E');


CLOSE SYMMETRIC KEY EmailSymmetricKey;

-- Insert statements for Passenger
INSERT INTO PASSENGER (passenger_id, passenger_accessibility) 
VALUES 
(1, 'None'),
(3, 'Wheelchair'),
(5, 'None'),
(6, 'Visual Assistance'),
(9, 'None'),
(10, 'Hearing Assistance'),
(13, 'None'),
(15, 'Wheelchair'),
(17, 'None'),
(18, 'Visual Assistance'),
(21, 'None'),
(23, 'Hearing Assistance'),
(27, 'None'),
(29, 'Wheelchair'),
(31, 'None'),
(32, 'Visual Assistance'),
(35, 'None');


-- Insert statements for Employee
INSERT INTO EMPLOYEE (employee_id, date_of_joining) 
VALUES 
(2, '2020-01-15'),
(4, '2020-02-10'),
(7, '2020-03-20'),
(8, '2021-04-25'),
(12, '2021-05-08'),
(14, '2022-06-12'),
(16, '2022-07-30'),
(18, '2022-08-17'),
(21, '2023-09-22'),
(24, '2023-10-05'),
(27, '2023-11-18'),
(29, '2023-12-03'),
(31, '2021-01-09'),
(34, '2021-02-14');


-- Insert statements for MBTA_CHARLIE
OPEN SYMMETRIC KEY CharlieCardSymmetricKey DECRYPTION BY CERTIFICATE MBTACharlieCardCertificate;

INSERT INTO MBTA_CHARLIE (charlie_id, passenger_id, balance,card_number_encrypted) VALUES
(1, 1, 50.00, EncryptByKey(Key_GUID('CharlieCardSymmetricKey'), '987654321')),
(2, 3, 25.50, EncryptByKey(Key_GUID('CharlieCardSymmetricKey'), '123456789')),
(3, 5, 30.75, EncryptByKey(Key_GUID('CharlieCardSymmetricKey'), '192837465')),
(4, 6, 45.00, EncryptByKey(Key_GUID('CharlieCardSymmetricKey'), '564738291')),
(5, 9, 60.25, EncryptByKey(Key_GUID('CharlieCardSymmetricKey'), '647382914')),
(6, 10, 15.00, EncryptByKey(Key_GUID('CharlieCardSymmetricKey'), '738291456'));

CLOSE SYMMETRIC KEY CharlieCardSymmetricKey;

-- Insert statements for MBTA_TYPES
INSERT INTO MBTA_TYPES (type_id, type_name) VALUES
(1, 'Blue'),
(2, 'Green'),
(3, 'Red'),
(4, 'Orange'),
(5, 'Purple');

-- Insert statements for MBTA_ROUTEINFO
INSERT INTO MBTA_ROUTEINFO (route_id, route_from, route_to, duration) VALUES
(1, 'Alewife', 'Ashmont/Braintree', 45),
(2, 'Bowdoin', 'Wonderland', 35),
(3, 'North Station', 'Lechmere', 20),
(4, 'Oak Grove', 'Forest Hills', 30),
(5, 'South Station', 'Worcester', 90),
(6, 'Park Street', 'Forest Hills', 25),
(7, 'Government Center', 'Braintree', 40),
(8, 'Quincy Center', 'Alewife', 55),
(9, 'Davis', 'Alewife', 15),
(10, 'Park Street', 'Lechmere', 22),
(11, 'Hynes Convention Center', 'Wonderland', 40),
(12, 'Central Square', 'Oak Grove', 28),
(13, 'JFK/UMass', 'Ashmont', 20),
(14, 'Quincy Adams', 'Alewife', 60),
(15, 'Riverside', 'Lechmere', 45),
(16, 'Haymarket', 'Oak Grove', 32),
(17, 'Alewife', 'Quincy Center', 50),
(18, 'Copley', 'Wonderland', 38),
(19, 'Ashmont', 'Forest Hills', 29),
(20, 'Kenmore', 'Alewife', 20),
(21, 'Wellington', 'Lechmere', 35),
(22, 'Sullivan Square', 'Forest Hills', 30),
(23, 'State', 'Wonderland', 40),
(24, 'Back Bay', 'Alewife', 45),
(25, 'Mass Ave', 'Lechmere', 18),
(26, 'Harvard', 'Forest Hills', 27),
(27, 'Porter Square', 'Alewife', 50),
(28, 'Prudential', 'Wonderland', 40),
(29, 'Union Square', 'Lechmere', 30),
(30, 'Malden Center', 'Forest Hills', 35),
(31, 'Copley', 'Ashmont', 36),
(32, 'Arlington', 'Alewife', 25),
(33, 'Symphony', 'Wonderland', 38),
(34, 'Kendall/MIT', 'Lechmere', 22),
(35, 'Northeastern', 'Forest Hills', 29);


-- Insert statements for MBTA_STATION
INSERT INTO MBTA_STATION (station_id, station_name, station_zipcode, station_status) VALUES
(1, 'Alewife', '02140', 'Active'),
(2, 'Davis', '02144', 'Active'),
(3, 'Porter', '02138', 'Active'),
(4, 'Harvard', '02138', 'Active'),
(5, 'Central', '02139', 'Active'),
(6, 'Kendall/MIT', '02142', 'Active'),
(7, 'Charles/MGH', '02114', 'Active'),
(8, 'Park Street', '02108', 'Active'),
(9, 'Downtown Crossing', '02111', 'Active'),
(10, 'South Station', '02210', 'Active');

-- Insert statements for MBTA_PASSENGERFREQUENCY
INSERT INTO MBTA_PASSENGERFREQUENCY (frequency_id, station_id, passenger_id, avg_sec, sd_sec, day_type) VALUES
(1, 1, 1, 60, 10, 'Weekday'),
(2, 1, 3, 120, 20, 'Weekday'),
(3, 2, 5, 180, 30, 'Weekday'),
(4, 2, 6, 240, 40, 'Weekday'),
(5, 2, 9, 300, 50, 'Weekday'),
(6, 3, 10, 360, 60, 'Weekday'),
(7, 4, 1, 420, 70, 'Weekday'),
(8, 4, 3, 480, 80, 'Weekday'),
(9, 5, 5, 540, 90, 'Weekday'),
(10, 5, 6, 600, 100, 'Weekday');

-- Insert statements for MBTA_TRANSACTION
OPEN SYMMETRIC KEY TransactionAmountSymmetricKey
DECRYPTION BY CERTIFICATE MBTATransactionAmountCertificate;

INSERT INTO MBTA_TRANSACTION (transaction_id, charlie_id, amount_encrypted) VALUES
(1, 1, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(20.00 AS NVARCHAR))),
(2, 2, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(25.00 AS NVARCHAR))),
(3, 3, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(30.00 AS NVARCHAR))),
(4, 4, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(35.00 AS NVARCHAR))),
(5, 5, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(40.00 AS NVARCHAR))),
(6, 6, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(45.00 AS NVARCHAR))),
(7, 1, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(50.00 AS NVARCHAR))),
(8, 2, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(55.00 AS NVARCHAR))),
(9, 3, EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(60.00 AS NVARCHAR))),
(10, 4,EncryptByKey(Key_GUID('TransactionAmountSymmetricKey'), CAST(65.00 AS NVARCHAR)));

CLOSE SYMMETRIC KEY TransactionAmountSymmetricKey;

-- Insert statements for MBTA_TRAININFO
INSERT INTO MBTA_TRAININFO (train_id, train_serial_no, year_of_manufacturing, last_service_date, capacity) VALUES
(1, 'T100', '2010-01-01', '2023-01-15', 1200),
(2, 'T101', '2011-02-01', '2023-02-20', 1200),
(3, 'T102', '2012-03-01', '2023-03-25', 1300),
(4, 'T103', '2013-04-01', '2023-04-30', 1300),
(5, 'T104', '2014-05-01', '2023-05-05', 1400),
(6, 'T105', '2015-06-01', '2023-06-10', 1400),
(7, 'T106', '2016-07-01', '2023-07-15', 1500),
(8, 'T107', '2017-08-01', '2023-08-20', 1500),
(9, 'T108', '2018-09-01', '2023-09-25', 1600),
(10, 'T109', '2019-10-01', '2023-10-30', 1600);

-- Insert statements for EMPLOYEE_TRAIN_ASSIGNMENT
INSERT INTO EMPLOYEE_TRAIN_ASSIGNMENT (emp_train_id, employee_id, train_id, start_date, end_date) VALUES
(1, 2, 1, '2023-01-01', '2023-06-01'),
(2, 4, 2, '2023-02-01', NULL),
(3, 7, 3, '2023-03-01', '2023-08-01'),
(4, 8, 4, '2023-04-01', NULL);

-- Insert statements for TRAIN_STATUS_HISTORY
INSERT INTO TRAIN_STATUS_HISTORY (train_id, station_id, status, longitude, latitude, event_time, delay_reason) VALUES
(1, 1, 'On Time', -71.142483, 42.395428, '20120618 10:34:09 AM', NULL),
(2, 2, 'Delayed', -71.121815, 42.39674, '20120618 10:34:09 AM', 'Technical issue'),
(3, 3, 'On Time', -71.104549, 42.365486, '20120618 10:34:09 AM', NULL),
(4, 4, 'Cancelled', -71.123708, 42.362490, '20120618 10:34:09 AM', 'Severe weather'),
(5, 5, 'On Time', -71.086176, 42.361166, '20120618 10:34:09 AM', NULL),
(1, 6, 'Delayed', -71.077107, 42.352271,'20120618 10:34:09 AM', 'Signal problem'),
(2, 7, 'On Time', -71.062424, 42.355518, '20120618 10:34:09 AM', NULL),
(3, 8, 'On Time', -71.051613, 42.356394, '20120618 10:34:09 AM', NULL),
(4, 9, 'Delayed', -71.060880, 42.355029, '20120618 10:34:09 AM', 'Maintenance'),
(5, 10, 'On Time', -71.057655, 42.352250, '20120618 10:34:09 AM', NULL);



-- Insert statements for MBTA_SCHEDULE
INSERT INTO MBTA_SCHEDULE (schedule_id, train_id, arrival_time, departure_time) VALUES
(1, 1, '07:00:00', '07:05:00'),
(2, 2, '08:00:00', '08:05:00'),
(3, 3, '09:00:00', '09:05:00'),
(4, 4, '10:00:00', '10:05:00'),
(5, 5, '11:00:00', '11:05:00'),
(6, 6, '12:00:00', '12:05:00'),
(7, 7, '13:00:00', '13:05:00'),
(8, 8, '14:00:00', '14:05:00'),
(9, 9, '15:00:00', '15:05:00'),
(10, 10, '16:00:00', '16:05:00'),
(11, 1, '17:00:00', '17:05:00'),
(12, 2, '18:00:00', '18:05:00'),
(13, 3, '19:00:00', '19:05:00'),
(14, 4, '20:00:00', '20:05:00'),
(15, 5, '21:00:00', '21:05:00'),
(16, 6, '22:00:00', '22:05:00'),
(17, 7, '23:00:00', '23:05:00'),
(18, 8, '00:00:00', '00:05:00'),
(19, 9, '01:00:00', '01:05:00'),
(20, 10, '02:00:00', '02:05:00'),
(21, 1, '03:00:00', '03:05:00'),
(22, 2, '04:00:00', '04:05:00'),
(23, 3, '05:00:00', '05:05:00'),
(24, 4, '06:00:00', '06:05:00'),
(25, 5, '07:00:00', '07:05:00'),
(26, 6, '08:00:00', '08:05:00'),
(27, 7, '09:00:00', '09:05:00'),
(28, 8, '10:00:00', '10:05:00'),
(29, 9, '11:00:00', '11:05:00'),
(30, 10, '12:00:00', '12:05:00'),
(31, 1, '13:00:00', '13:05:00'),
(32, 2, '14:00:00', '14:05:00'),
(33, 3, '15:00:00', '15:05:00'),
(34, 4, '16:00:00', '16:05:00'),
(35, 5, '17:00:00', '17:05:00');


-- Insert statements for TRAIN_CURRENTSTATUS
INSERT INTO TRAIN_CURRENTSTATUS (TrainCurrentStatus_ID, train_id, latitude, longitude, status, last_update) VALUES
(1, 1, 42.395428, -71.142483, 'Running', '2023-04-01 08:00:00'),
(2, 2, 42.39674, -71.121815, 'Stopped', '2023-04-01 09:00:00'),
(3, 3, 42.365486, -71.104549, 'Running', '2023-04-01 10:00:00'),
(4, 4, 42.362490, -71.123708, 'Maintenance', '2023-04-01 11:00:00'),
(5, 5, 42.361166, -71.086176, 'Running', '2023-04-01 12:00:00'),
(6, 6, 42.352271, -71.077107, 'Stopped', '2023-04-01 13:00:00'),
(7, 7, 42.355518, -71.062424, 'Running', '2023-04-01 14:00:00'),
(8, 8, 42.356394, -71.051613, 'Running', '2023-04-01 15:00:00'),
(9, 9, 42.355029, -71.060880, 'Maintenance', '2023-04-01 16:00:00'),
(10, 10, 42.352250, -71.057655, 'Running', '2023-04-01 17:00:00');


INSERT INTO MBTA_ROUTE_SCHEDULE (route_schedule_id, route_id, schedule_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35);


-- Insert statements for TRAIN_ROUTEASSIGNMENT
INSERT INTO TRAIN_ROUTEASSIGNMENT ( train_id, route_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

-- Insert statements for ROUTE_TYPE
INSERT INTO ROUTE_TYPE (route_type_id, route_id, type_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 2),
(16, 16, 2),
(17, 17, 3),
(18, 18, 3),
(19, 19, 3),
(20, 20, 3),
(21, 21, 3),
(22, 22, 3),
(23, 23, 4),
(24, 24, 4),
(25, 25, 4),
(26, 26, 4),
(27, 27, 4),
(28, 28, 4),
(29, 29, 4),
(30, 30, 4),
(31, 31, 5),
(32, 32, 5),
(33, 33, 5),
(34, 34, 5),
(35, 35, 5);


-- Insert statements for STATION_ROUTE
INSERT INTO STATION_ROUTE (station_route_id, station_id, route_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3)
