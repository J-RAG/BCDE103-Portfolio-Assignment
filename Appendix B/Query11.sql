/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 11
*/

USE [GuestHouse2020];

-- Show the number of guests in the hotel on the night of 2016-11-21.
-- Include all occupants who checked in that day but not those who checked out.
SELECT
	SUM([occupants]) As 'Number of Guests'
FROM [dbo].[booking]
WHERE [booking_date] = '2016-11-21'
AND NOT (DATEADD(day, [nights], [booking_date]) = '2016/11/21');
GO
