/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 7
*/

USE [GuestHouse2020];

-- Show the total amount payable by guest Ruth Cadbury for her room bookings.
-- You should JOIN to the rate table using room_type_requested and occupants.
SELECT
	SUM(R.[amount]) AS 'Total Amount'
FROM
	-- JOIN Rate table
	[dbo].[booking] B JOIN [dbo].[rate] R
	ON B.[room_type_requested] = R.[room_type]
	JOIN [dbo].[rate]
	ON B.[occupants] = R.[occupancy]

	-- JOIN Guest
	JOIN [dbo].[guest] G
	ON B.[guest_id] = G.[id]
WHERE 
	G.[first_name] = 'Ruth' 
	AND G.[last_name] = 'Cadbury';
GO
