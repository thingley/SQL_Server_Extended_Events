/*
	IMPORTANT

	-- Update the database name specified in the event predicates (default value is 'Controcc_Testing_').
	-- Update the target file name with a full path (default value is 'D:\TEMP\CallStack.xel').
*/

BEGIN TRY
	DROP EVENT SESSION [CallStack] ON SERVER;
END TRY
BEGIN CATCH
END CATCH

GO

CREATE EVENT SESSION [CallStack] ON SERVER 
ADD EVENT sqlserver.module_end(
    WHERE ([sqlserver].[database_name]=N'Controcc_Testing_')),
ADD EVENT sqlserver.module_start(
    WHERE ([sqlserver].[database_name]=N'Controcc_Testing_'))
ADD TARGET package0.event_file(SET filename=N'D:\TEMP\CallStack.xel')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF);

GO


