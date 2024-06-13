declare @loadid int
set @loadid = 56572





--load only
select s.loadstoptypeid, s.startdatetime, s.dropstartdatetime, '--------------------------------',s.* from 
dispatch.Load l join dispatch.LoadStop s on l.LoadId = s.LoadId
where
s.loadstoptypeid <> 4 and
s.loadid = @loadid
order by
s.stopnumber




--stop only







--load and stop
SELECT top 10
l.LoadId, s.StopNumber, s.LoadStopTypeId, l.Driver1_PersonId AS DriverFromLoadRec, main.ClientAddress.State AS PickOrDropState, main.ClientAddress.City AS PickOrDropCity, 
                  s.Driver1_PersonId AS DriverFromStopRec, s.StartDateTime AS PickOrDropDt, s.DropStartDateTime AS PickOrDropDtLeg
FROM     dispatch.[Load] l INNER JOIN
                  dispatch.LoadStop s ON l.LoadId = s.LoadId INNER JOIN
                  main.ClientAddress ON s.ClientId = main.ClientAddress.ClientId	
where l.LoadId = @loadid 
ORDER BY l.LoadId, s.StopNumber









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


