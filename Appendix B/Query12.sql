/*
Author: Julan Ray Avila Gutierrez
Email: jra0108@arastudent.ac.nz

NOTE: Query 12
*/

USE [GuestHouse2020];

-- List the rooms that are free on the day 25th Nov 2016.
SELECT [room_no]
FROM [dbo].[booking]
WHERE DATEADD(day, [nights], [booking_date]) = '2016/11/25';
GO