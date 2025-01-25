
EXEC sp_addrolemember N'db_datareader', N'cesidw_reader'

EXEC sp_addrolemember N'db_datareader', N'cesidw_writer'
ALTER ROLE [db_datareader] ADD MEMBER [Cristina]
GO
