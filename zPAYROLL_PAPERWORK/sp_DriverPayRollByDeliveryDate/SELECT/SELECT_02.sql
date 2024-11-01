declare @StartDt datetime = '12/31/2023'
declare @ThroughDt datetime = '1/6/2024'

DECLARE @crsV TABLE (
        LoadId int
        ,LoadStopId_Pick int 
        ,LoadStopId_Drop int
        ,LegInd bit
)
insert into @crsV (LoadId, LoadStopId_Pick, LoadStopId_Drop, LegInd)
select * from @crsV


        -- get legs 
        select 
                l.LoadId
                -- First Pick
                ,LoadStopId_Pick = lsPick.LoadStopId
                -- next LEG or Last Drop (if no other legs)
                ,LoadStopId_Drop =  lsDrop.LoadStopId
                ,LegInd = 1
        from 
                dispatch.Load l
                INNER JOIN dispatch.LoadStop lsPick on lsPick.LoadId = l.LoadId and lsPick.LoadStopTypeId = 2
                -- get the next leg or last drop
                INNER JOIN dispatch.LoadStop lsDrop on lsDrop.LoadStopId = iif(exists(select top 1 LoadStopId from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 and StopNumber > lsPick.StopNumber order by StopNumber asc)
                                                                ,(select top 1 LoadStopId from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 and StopNumber > lsPick.StopNumber order by StopNumber)
                                                                ,(SELECT TOP 1 LoadStopId FROM dispatch.LoadStop WHERE LoadId = l.LoadId AND LoadStopTypeId = 3 ORDER BY StopNumber desc))
                inner join main.Person p1 on p1.PersonId = lsPick.Driver1_PersonId
                left outer join main.Person p2 on p2.PersonId = isnull(lsPick.Driver2_PersonId,0)
        where 
                l.LoadStatusTypeId <> 100 -- don't include cancelled loads.
                -- Pick either StartDateTime or DropStartDateTime based on if the stop is a LEG or not
                and iif(lsDrop.LoadStopTypeId = 2, Convert(Date, lsDrop.DropStartDateTime), convert(DATE, lsDrop.StartDateTime)) between @StartDt and @ThroughDt
                and
                (
                        p1.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p1.PersonId and PersonTypeId = 4)
                        or isnull(p2.PersonId,0) in (select PersonId from main.PersonTypeMapping where PersonId = p2.PersonId and PersonTypeId = 4)
                )

