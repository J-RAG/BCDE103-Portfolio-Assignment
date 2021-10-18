/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 4
*/

USE [GuestHouse2020];

-- Q4. Give the daily rate that should be paid for bookings 
-- with ids 5152, 5165, 5154 and 5295. Include booking id, 
-- room type, number of occupants and the amount.

SELECT 
	[booking_id], 
	[room_type_requested], 
	[occupants], 
	[amount]
FROM
	[dbo].[booking] B JOIN [dbo].[rate] R
	ON B.[occupants] = R.occupancy
WHERE 
	[booking_id] IN (5152, 5165, 5165, 5295);
GO