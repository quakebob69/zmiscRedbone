declare @loadid int
set @loadid = 56572





select s.loadstoptypeid, s.startdatetime, s.dropstartdatetime, '--------------------------------',s.* from 
dispatch.Load l join dispatch.LoadStop s on l.LoadId = s.LoadId
where
s.loadstoptypeid <> 4 and
s.loadid = @loadid
order by
s.stopnumber











SELECT 
	' ' as '                                             LOAD---->', l.LoadId AS 'LOAD id', l.Driver1_PersonId AS 'LOAD driver', ' ' as '                                                      STOP---->', s.Driver1_PersonId as 'STOP driver id', s.StopNumber as 'STOP stop number', s.LoadStopTypeId as 'STOP stop type', s.ClientId as 'STOP client id', s.StartDateTime as 'STOP StartDateTime', s.DropStartDateTime as 'STOP DropStartDateTime'
FROM     
	dispatch.[Load] l INNER JOIN
    dispatch.LoadStop s ON l.LoadId = s.LoadId
where
	l.LoadId = @loadid 
ORDER BY
	l.LoadId, s.StopNumber


	



SELECT 
	' ' as '                                             LOAD---->', l.LoadId AS 'LOAD id', l.Driver1_PersonId AS 'LOAD driver', ' ' as '                                                      STOP---->', s.Driver1_PersonId as 'STOP driver id', s.StopNumber as 'STOP stop number', s.LoadStopTypeId as 'STOP stop type', s.ClientId as 'STOP client id', s.StartDateTime as 'STOP StartDateTime', s.DropStartDateTime as 'STOP DropStartDateTime'
FROM     
	dispatch.[Load] l INNER JOIN
    dispatch.LoadStop s ON l.LoadId = s.LoadId
where
	l.LoadId = @loadid 
ORDER BY
	l.LoadId, s.StopNumber









/*
	--top 100 most recent billed
		select TOP 100 l.LoadStatusTypeId , s.loadstoptypeid, s.startdatetime, s.dropstartdatetime, '--------------------------------',s.* from 
		dispatch.Load l join s s on l.LoadId = s.LoadId
		where
		s.loadstoptypeid <> 4
		and 
		l.LoadStatusTypeId <> 100
		and
		l.LoadStatusTypeId > 7
		and
		s.loadstoptypeid = 2
		ORDER BY s.startdatetime desc
*/






--select * from dispatch.LoadStatusType


