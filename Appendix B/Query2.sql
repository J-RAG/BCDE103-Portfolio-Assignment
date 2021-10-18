/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 2
*/

USE [GuestHouse2020];

-- Query 2: Give the booking date and the number of nights for guest 1540.
SELECT booking_date, nights 
FROM [dbo].[booking] 
WHERE guest_id = 1540;
GO