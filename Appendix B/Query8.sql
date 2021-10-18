/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 8
*/

USE [GuestHouse2020];

-- Calculate the total bill for booking 5346 including extras.
SELECT DISTINCT
	SUM(R.[amount] + E.amount) AS 'Total Bill',
	SUM(R.amount) AS 'Rate amount',
	SUM(E.amount) AS 'Extras'
FROM  
	[dbo].[booking] B 
	
	--JOIN Rate Table
	JOIN [dbo].[rate] R
	ON B.[room_type_requested] = [room_type]

	--JOIN extra Table
	JOIN [dbo].[extra] E
	ON B.[booking_id] = E.[booking_id]
WHERE
	B.[booking_id] = 5346;
GO


	