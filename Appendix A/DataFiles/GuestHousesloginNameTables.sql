/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Create Database Tables
*/



USE [GuestHousesloginName];
GO

-- Drop tables/ Database
/*
DROP TABLE extra;
DROP TABLE booking;
DROP TABLE room;
DROP TABLE rate;
DROP TABLE room_type;
DROP TABLE guest;
DROP TABLE calendar;
DROP DATABASE IF EXISTS [GuestHousesloginName];
GO
*/



-- Independent Tables
CREATE TABLE guest (
	id				INT PRIMARY KEY,
	first_name		VARCHAR(20) NOT NULL,
	last_name		VARCHAR(20) NOT NULL,
	guestAddress	VARCHAR(50) NOT NULL
);
GO

CREATE TABLE room_type(
	id			VARCHAR(10) PRIMARY KEY,
	description VARCHAR(80) NOT NULL
);
GO

CREATE TABLE calendar (
	id DATE PRIMARY KEY
);


-- Dependent Tables
CREATE TABLE rate (
	room_type VARCHAR(10),
	occupancy INT,
	PRIMARY KEY (room_type, occupancy),
	FOREIGN KEY (room_type) REFERENCES room_type (id),
);
GO

CREATE TABLE room (
	id INT PRIMARY KEY,
	room_type VARCHAR(10) NOT NULL,
	max_occupancy INT NOT NULL,
	FOREIGN KEY (room_type) REFERENCES room_type (id)
);
GO

CREATE TABLE booking (
	booking_id INT PRIMARY KEY,
	booking_date DATE NOT NULL,
	room_no INT,
	guest_id INT,
	occupants INT,
	room_type_requested VARCHAR(10),
	nights INT,
	arrival_time TIME,
	FOREIGN KEY (room_no) REFERENCES room (id),
	FOREIGN KEY (guest_id) REFERENCES guest (id),
	FOREIGN KEY (room_type_requested, occupants) REFERENCES rate (room_type, occupancy),
	FOREIGN KEY (room_type_requested) REFERENCES room_type (id)
);
GO


CREATE TABLE extra (
	extra_id		int,
	booking_id		int,
	description		VARCHAR(20),
	amount			int,
	FOREIGN KEY (booking_id) REFERENCES booking (booking_id)
);
GO
