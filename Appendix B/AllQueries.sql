/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: All Queries
*/

USE [GuestHouse2020];

--Stats
SET STATISTICS IO ON;
SET STATISTICS TIME ON;


-- Query 1: List the people who has booked room number 101 on 17th November 2016.
SELECT 
	first_name + ' ' + last_name AS 'Guest Name',
	B.room_no,
	B.booking_date
FROM [dbo].[booking] B 
	JOIN [dbo].[guest] G ON B.guest_id = G.id
WHERE 
	B.room_no = 101 
	AND B.booking_date = '2016-11-17';
GO

-- Query 2: Give the booking date and the number of nights for guest 1540.
SELECT booking_date, nights 
FROM [dbo].[booking] 
WHERE guest_id = 1540;
GO
	
-- Query 3: List the arrival time and the first and last names for 
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

-- Query 4: Give the daily rate that should be paid for bookings 
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

-- Query 5: Find who is staying in room 101 on 2016-12-03, include first name, last name and address.
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

-- Query 6: For guests 1185 and 1270 show the number of bookings made and the total number of nights.
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

-- Query 7: Show the total amount payable by guest Ruth Cadbury for her room bookings.
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

-- Query 8: Calculate the total bill for booking 5346 including extras.
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

-- Query 9: For every guest who has the word “Edinburgh” in their address show
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

-- Query 10: For each day of the week beginning 2016-11-25 show the number 
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

-- Query 11: Show the number of guests in the hotel on the night of 2016-11-21.
-- Include all occupants who checked in that day but not those who checked out.
SELECT
	SUM([occupants]) As 'Number of Guests'
FROM [dbo].[booking]
WHERE [booking_date] = '2016-11-21'
AND NOT (DATEADD(day, [nights], [booking_date]) = '2016/11/21');
GO

--Query 12: List the rooms that are free on the day 25th Nov 2016.
SELECT [room_no]
FROM [dbo].[booking]
WHERE DATEADD(day, [nights], [booking_date]) = '2016/11/25';
GO