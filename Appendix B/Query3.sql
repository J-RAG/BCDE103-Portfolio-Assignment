/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 3
*/

USE [GuestHouse2020];

-- List the arrival time and the first and last names for 
-- all guests due to arrive on 2016-11-05, order the output by time of arrival.
SELECT 
	[first_name], 
	[last_name], 
	[arrival_time]
FROM 
	[dbo].[booking] B JOIN [dbo].[guest] G
ON	B.[guest_id] = G.[id]
WHERE [booking_date] = '2016-11-05'
ORDER BY [arrival_time];
GO