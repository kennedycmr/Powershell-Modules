-- Attach databases to correct mount points after refresh
CREATE DATABASE [SV_tpcc] ON 
( FILENAME = N'C:\MSSQL\SV_tpcc_data1\tpcc_data1.mdf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_log\tpcc_log.ldf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_data2\tpcc_data2.ndf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_data3\tpcc_data3.ndf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_data4\tpcc_data4.ndf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_data5\tpcc_data5.ndf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_data6\tpcc_data6.ndf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_data7\tpcc_data7.ndf' ),
( FILENAME = N'C:\MSSQL\SV_tpcc_data8\tpcc_data8.ndf' )
 FOR ATTACH
GO

CREATE DATABASE [VC_tpcc] ON 
( FILENAME = N'C:\MSSQL\VC_tpcc_data1\tpcc_data1.mdf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_log\tpcc_log.ldf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_data2\tpcc_data2.ndf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_data3\tpcc_data3.ndf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_data4\tpcc_data4.ndf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_data5\tpcc_data5.ndf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_data6\tpcc_data6.ndf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_data7\tpcc_data7.ndf' ),
( FILENAME = N'C:\MSSQL\VC_tpcc_data8\tpcc_data8.ndf' )
 FOR ATTACH
GO