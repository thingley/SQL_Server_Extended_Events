/*
	IMPORTANT

	-- Update the target file name with a full path (default value is 'D:\TEMP\ModuleDurationOver20Seconds.xel').
	-- Note that duration value is specified in microseconds.
*/

BEGIN TRY
	DROP EVENT SESSION [ModuleDurationOver20Seconds] ON SERVER;
END TRY
BEGIN CATCH
END CATCH

GO

CREATE EVENT SESSION [ModuleDurationOver20Seconds] ON SERVER 
ADD EVENT sqlserver.module_end(
    ACTION(package0.callstack,sqlserver.database_name,sqlserver.tsql_stack,sqlserver.username)
    WHERE ([duration]>(20000000)))
ADD TARGET package0.event_file(SET filename=N'D:\TEMP\ModuleDurationOver20Seconds.xel')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO


