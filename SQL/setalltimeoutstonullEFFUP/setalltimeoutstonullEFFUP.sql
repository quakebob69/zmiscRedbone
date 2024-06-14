-- num clockouts updated since eff up
select count(*) - 208 FROM [104.42.111.50].[RedBone].[main].[TimeClockEntry] where clockout is not null
select * FROM [104.42.111.50].[RedBone].[main].[TimeClockEntry] where clockout is not null



--difference
--(SELECT count(*) as prodcnt FROM [104.42.111.50].[RedBone].[main].[TimeClockEntry])
--(SELECT count(*) as backcnt FROM [main].[TimeClockEntry]);

select 
(SELECT count(*) FROM [104.42.111.50].[RedBone].[main].[TimeClockEntry])
-
(SELECT count(*) FROM [main].[TimeClockEntry]);

--diffs
select top 100 * from [104.42.111.50].[RedBone].[main].[TimeClockEntry] order by entryid desc 



--just do me - personid = 2775
--before
	select * from 
	[104.42.111.50].[RedBone].[main].[TimeClockEntry] prod
	join 
	[main].[TimeClockEntry] back on prod.EntryId = back.EntryId
	where prod.personid = 2775


--update 
	update prodTBL
	set prodTBL.clockout = backTBL.clockout
	from [main].[TimeClockEntry] backTBL
	join [104.42.111.50].[RedBone].[main].[TimeClockEntry] prodTBL
		 on backTBL.EntryId = prodTBL.EntryId
	where 
	--(prodTBL.personid = 6 or prodTBL.personid = 2775) and
	prodTBL.clockout is null





--UPDATE t2
--SET t2.ColumnToUpdate = t1.ColumnValue
--FROM YourTableName t1
--    INNER JOIN SecondInstance.YourDatabaseName.dbo.YourTableName t2
--        ON t1.JoinColumnName = t2.JoinColumnName;	




--after
	select * from 
	[104.42.111.50].[RedBone].[main].[TimeClockEntry] prod
	join 
	[main].[TimeClockEntry] back on prod.EntryId = back.EntryId
	where prod.personid = 2775


--
select count(*) - 208 FROM [104.42.111.50].[RedBone].[main].[TimeClockEntry] where clockout is not null
select * FROM [104.42.111.50].[RedBone].[main].[TimeClockEntry] where clockout is not null