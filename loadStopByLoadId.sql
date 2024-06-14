declare @loadid int
set @loadid = 56572




/*
	select s.loadstoptypeid, s.startdatetime, s.dropstartdatetime, '--------------------------------',s.* from 
	dispatch.Load l join dispatch.LoadStop s on l.LoadId = s.LoadId
	where
	s.loadstoptypeid <> 4 and
	s.loadid = @loadid
	order by
	s.stopnumber
*/










SELECT 
	' ' as '                                                      LOAD---->', l.LoadId AS 'id', l.Driver1_PersonId AS 'driver', ' ' as '                                                      STOP---->', s.Driver1_PersonId as 'driver', s.StopNumber as 'stop', s.LoadStopTypeId as 'type', s.ClientId as 'client', s.StartDateTime as 'StartDateTime (PICK OR DROP)', s.DropStartDateTime as 'DropStartDateTime (LEG)'
FROM     
	dispatch.[Load] l INNER JOIN
    dispatch.LoadStop s ON l.LoadId = s.LoadId
where
	l.LoadId = @loadid 
ORDER BY
	l.LoadId, s.StopNumber


	





SELECT 
	' ' as '                                                      LOAD---->', l.LoadId AS 'id', l.Driver1_PersonId AS 'driver'
	
FROM     
	dispatch.[Load] l
where
	l.LoadId = @loadid 
ORDER BY
	l.LoadId





	


SELECT 
	' ' as '                                                      STOP---->', s.Driver1_PersonId as 'driver', s.StopNumber as 'stop', s.LoadStopTypeId as 'type', s.ClientId as 'client', s.StartDateTime as 'StartDateTime (PICK OR DROP)', s.DropStartDateTime as 'DropStartDateTime (LEG)'FROM     
	dispatch.LoadStop s
where
	s.LoadId = @loadid 
ORDER BY
	s.LoadId, s.StopNumber


	





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
--select * from dispatch.LoadType


