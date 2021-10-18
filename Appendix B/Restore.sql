USE [master]
BACKUP LOG [GuestHouse2020] 
	TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\GuestHouse2020_LogBackup_2021-09-20_15-36-11.bak' 
	WITH NOFORMAT, 
	NOINIT,  
	NAME = N'GuestHouse2020_LogBackup_2021-09-20_15-36-11', 
	NOSKIP, 
	NOREWIND, 
	NOUNLOAD,  
	NORECOVERY ,  
	STATS = 5
RESTORE DATABASE [GuestHouse2020] 
	FROM  DISK = N'C:\Temp\GuestHouse2021.bak' 
	WITH  FILE = 1, 
	MOVE N'GuestHouse2020' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GuestHouse2020.mdf',  
	MOVE N'GuestHouse2020_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GuestHouse2020_log.ldf',  
	NOUNLOAD,  STATS = 5

GO


