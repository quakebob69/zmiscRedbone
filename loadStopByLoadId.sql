select s.loadstoptypeid, s.startdatetime, s.dropstartdatetime, '--------------------------------',s.* from 
dispatch.Load l join dispatch.LoadStop s on l.LoadId = s.LoadId
where
s.loadstoptypeid <> 4 and
s.loadid = 62593


order by
s.stopnumber





select TOP 100 l.LoadStatusTypeId , s.loadstoptypeid, s.startdatetime, s.dropstartdatetime, '--------------------------------',s.* from 
dispatch.Load l join dispatch.LoadStop s on l.LoadId = s.LoadId
where
s.loadstoptypeid <> 4
and 
l.LoadStatusTypeId <> 100
and
l.LoadStatusTypeId > 8
and
s.loadstoptypeid = 2
ORDER BY s.startdatetime desc


select * from dispatch.LoadStatusType
