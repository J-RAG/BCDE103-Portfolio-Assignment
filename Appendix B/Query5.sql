/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 5
*/

USE [GuestHouse2020];

-- Find who is staying in room 101 on 2016-12-03, include first name, last name and address.
SELECT 
	[first_name],
	[last_name],
	[address]
FROM 
	[dbo].[booking] B INNER JOIN [dbo].[guest] G
	ON B.[guest_id] = G.[id]
WHERE 
	[room_no] = '101'
	AND [booking_date] ='2016-12-03';
GO
