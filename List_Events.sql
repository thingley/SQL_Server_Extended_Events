SELECT
	package_name		= p.[name]
	, event_name		= o.[name]
	, [description]		= o.[description]
FROM sys.dm_xe_packages p
JOIN sys.dm_xe_objects o ON p.[guid] = o.[package_guid]
WHERE ((p.capabilities IS NULL) OR (p.capabilities & 1 = 0))
AND ((o.capabilities IS NULL) OR (o.capabilities & 1 = 0))
AND (o.object_type = N'event')
ORDER BY
	p.[name]
	, o.[name]
	, o.[description];

