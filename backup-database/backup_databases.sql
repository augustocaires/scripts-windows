DECLARE @name NVARCHAR(256) 
DECLARE @path NVARCHAR(512) 
DECLARE @fileName NVARCHAR(512)  
DECLARE @fileDate NVARCHAR(40) 
 
SET @path = 'D:\Backups\'  
 
SELECT @fileDate = CONVERT(NVARCHAR(20),GETDATE(),112) 
 
DECLARE db_cursor CURSOR READ_ONLY FOR  
SELECT name 
FROM master.sys.databases 
WHERE name NOT IN ('master','model','msdb','tempdb')
AND state = 0
AND is_in_standby = 0
 
OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   
 
WHILE @@FETCH_STATUS = 0   
BEGIN   
   SET @fileName = @path + @name + '_' + @fileDate + '.bak'  
   BACKUP DATABASE @name TO DISK = @fileName  
 
   FETCH NEXT FROM db_cursor INTO @name   
END   
 
CLOSE db_cursor   
DEALLOCATE db_cursor