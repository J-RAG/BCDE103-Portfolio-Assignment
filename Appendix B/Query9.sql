/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 9
*/

USE [GuestHouse2020];

-- For every guest who has the word “Edinburgh” in their address show
-- the total number of nights booked. Be sure to include 0 for those guests 
-- who have never had a booking. Show last name, first name, address and
-- number of nights. Order by last name then first name.
SELECT
	[last_name],
	[first_name],
	[Address],
	SUM(ISNULL([nights], 0)) AS 'Total Nights booked'
FROM 
	[dbo].[booking] B JOIN [dbo].[guest] G
	ON B.[guest_id]= G.[id]
WHERE 
	G.[Address] LIKE '%Edinburgh%'
GROUP BY
	[last_name],
	[first_name],
	[Address];
GO