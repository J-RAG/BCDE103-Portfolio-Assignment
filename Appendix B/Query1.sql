/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 1
*/

USE [GuestHouse2020];

-- List the people who has booked room number 101 on 17th November 2016.
SELECT 
	first_name + ' ' + last_name AS 'Guest Name',
	B.room_no,
	B.booking_date
FROM [dbo].[booking] B 
	JOIN [dbo].[guest] G ON B.guest_id = G.id
WHERE 
	B.room_no = 101 
	AND B.booking_date = '2016-11-17';
GO