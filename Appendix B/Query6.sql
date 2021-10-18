/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 6
*/

USE [GuestHouse2020];

-- For guests 1185 and 1270 show the number of bookings made and the total number of nights.
-- Your output should include the guest id and the total number of bookings and the total number of nights.
SELECT 
	[guest_id] , 
	COUNT([booking_id]) AS 'Number of Bookings',
	[nights] 
FROM 
	[dbo].[booking] INNER JOIN [dbo].[guest]
	ON [dbo].[booking].[guest_id] = [dbo].[guest].[id]
WHERE
	[guest_id] IN (1185, 1270)
GROUP BY 
	[guest_id],
	[booking_id], 
	[nights];
GO