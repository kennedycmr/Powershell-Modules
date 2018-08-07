-- Detach Snapshot Volume and Volume Copy databases before refresh
ALTER DATABASE [SV_tpcc] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
EXEC master.dbo.sp_detach_db @dbname = N'SV_tpcc'
GO

ALTER DATABASE [VC_tpcc] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
EXEC master.dbo.sp_detach_db @dbname = N'VC_tpcc'
GO