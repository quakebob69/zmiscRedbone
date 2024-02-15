USE [RedBone]
GO

UPDATE [main].[LocationType] 
set Enabled = 0
WHERE Location <> 'Salt Lake City'
