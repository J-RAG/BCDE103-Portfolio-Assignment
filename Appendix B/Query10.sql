/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 10
*/

USE [GuestHouse2020];

-- For each day of the week beginning 2016-11-25 show the number 
-- of bookings starting that day. Be sure to show all the days of 
-- the week in the correct order.
SELECT
	[booking_date], 
	COUNT([booking_id]) As 'Number of Bookings'
FROM [dbo].[booking]
GROUP BY [booking_date]
HAVING [booking_date] >= '2016-11-25'
ORDER BY [booking_date];
GO