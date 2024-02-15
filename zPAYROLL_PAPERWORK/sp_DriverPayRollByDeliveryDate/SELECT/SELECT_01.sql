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


        -- Get loads without Legs
        select 
                l.LoadId
                -- First Pick
                ,LoadStop_Pick = lsPick.LoadStopId
                -- Last Drop
                ,LoadStop_Drop = lsDrop.LoadStopId
                ,Legind = 0
        from 
                dispatch.Load l
                inner join dispatch.LoadStop lsPick on lsPick.LoadStopId = (SELECT TOP 1 LoadStopId FROM dispatch.LoadStop WHERE LoadId = l.LoadId AND LoadStopTypeId = 1 ORDER BY StopNumber ASC)
                inner join dispatch.LoadStop lsDrop on lsDrop.LoadStopId = (SELECT TOP 1 LoadStopId FROM dispatch.LoadStop WHERE LoadId = l.LoadId AND LoadStopTypeId = 3 ORDER BY StopNumber DESC)
                inner join main.Person p1 on p1.PersonId = l.Driver1_PersonId
                left outer join main.Person p2 on p2.PersonId = l.Driver2_PersonId
        where 
                l.LoadStatusTypeId <> 100 -- don't include cancelled loads.
                and convert(DATE, lsDrop.StartDateTime) between @StartDt and @ThroughDt
                and 
                (
                        p1.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p1.PersonId and PersonTypeId = 4)
                        or isnull(p2.PersonId,0) in (select PersonId from main.PersonTypeMapping where PersonId = p2.PersonId and PersonTypeId = 4)
                )
                AND NOT EXISTS (SELECT 1 FROM dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2)

