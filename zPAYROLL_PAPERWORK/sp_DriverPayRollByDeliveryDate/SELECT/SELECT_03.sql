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


		-- get Loads that have legs
        select 
                l.LoadId
                -- First Pick
                ,LoadStopId_Pick = lsPick.LoadStopId
                -- next LEG or Last Drop (if no other legs)
                ,LoadStopId_Drop =  lsDrop.LoadStopId
                ,LegInd = 0
        from 
                dispatch.Load l
                -- Get the first Pick
                INNER JOIN dispatch.LoadStop lsPick on lsPick.LoadStopId = (select Top 1 LoadStopId from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 1 order by StopNumber asc)  
                -- Get the first LEG
                INNER JOIN dispatch.LoadStop lsDrop on lsDrop.LoadStopId = (select top 1 LoadStopId from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 order by StopNumber asc)
                inner join main.Person p1 on p1.PersonId = l.Driver1_PersonId
                left outer join main.Person p2 on p2.PersonId = l.Driver2_PersonId
        where 
                l.LoadStatusTypeId <> 100 -- don't include cancelled loads.
                -- Look at Leg DropStartDateTime since this is a LEG drop.
                and convert(DATE, lsDrop.DropStartDateTime) between @StartDt and @ThroughDt
                and
                (
                        p1.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p1.PersonId and PersonTypeId = 4)
                        or isnull(p2.PersonId,0) in (select PersonId from main.PersonTypeMapping where PersonId = p2.PersonId and PersonTypeId = 4)
                )
                AND EXISTS (SELECT LoadStopId FROM dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId = 2)
        
