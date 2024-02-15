DROP TABLE IF EXISTS #asdf;

CREATE TABLE #asdf (
  LoadId int
 ,LoadStopId_Pick int 
 ,LoadStopId_Drop int
 ,LegInd bit
);

INSERT INTO #asdf (
  LoadId
 ,LoadStopId_Pick 
 ,LoadStopId_Drop
 ,LegInd
)

VALUES 
(57254,	87101,	86270,	1),
(57312,	87347,	86417,	1),
(57435,	87485,	86786,	1),
(57463,	87391,	87392,	1),
(57497,	87327,	87002,	1),
(57506,	87338,	87018,	1),
(57507,	87340,	87020,	1),
(57523,	87337,	87070,	1),
(57548,	87325,	87159,	1),
(57550,	87572,	87164,	1),
(57565,	87411,	87216,	1),
(57571,	87339,	87230,	1),
(57587,	87566,	87300,	1),
(57591,	87529,	87270,	1),
(57619,	87571,	87355,	1),
(57661,	87569,	87568,	1),
(57662,	87482,	87484,	1);




DROP TABLE IF EXISTS #crsV;

declare @StartDt datetime = '12/31/2023'
declare @ThroughDt datetime= '1/6/2024'
declare @Driver varchar(max) = NULL

CREATE TABLE #crsV (
  LoadId int
 ,LoadStopId_Pick int 
 ,LoadStopId_Drop int
 ,LegInd bit
);


        declare @LoadId int
        declare @LoadStopId_Pick int
        declare @LoadStopId_Drop int
        declare @LegInd bit

        insert into #crsV (LoadId, LoadStopId_Pick, LoadStopId_Drop, LegInd)

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
        union all

		select * from #asdf

        -- get Loads that have legs
        union all
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
        
        --select * from dispatch.Load where LoadId = 606
        --select * from dispatch.LoadStop where Loadid = 606 order by StopNumber
        --select * from @crsV 
        --order by LoadId

        declare @tempA table (
                DriverTag char(1)
                ,LoadId int
                ,TruckNumber varchar(255)
                ,Client_Id nchar(10)
                ,DriverId varchar(10)
                ,Driver varchar(100)
                ,CODriver varchar(100)
                ,LoadedMiles int
                ,Paid_Miles int
                ,DoublesMiles decimal(18,2)
                ,DH_QTY decimal(18,2)
                ,DeadHead int
                ,TripNumber varchar(15)
                ,PickupBy datetime
                ,DeliverBy datetime
                ,StopNumber int
                ,DriverType char(1)
                ,InvoiceDate datetime
                ,StopCount int
                ,DriverPersonId int
                ,LegInd bit
        )

        declare curs cursor for
        select 
                LoadId, LoadStopId_Pick, LoadStopId_Drop, LegInd
        from
                #crsV

        open curs
        fetch next from curs 
        into @LoadId, @LoadStopId_Pick, @LoadStopId_Drop, @LegInd
        
        while @@FETCH_STATUS = 0 
        begin
                insert into @tempA
                SELECT
                        DriverTag = '1'
                        ,l.LoadId
                        ,TruckNumber = pt.Unit_ID        
                        ,cl.Client_Id
                        ,dr1.DriverId
                        ,Driver = p.FirstName + ' ' + p.LastName
                        ,CODriver = p2.FirstName + ' ' + p2.LastName
                        --,LoadedMiles = iif(l.PaidMiles is null, isnull(l.Miles,0), l.PaidMiles)
                        ,LoadedMiles = iif(@LegInd = 0, (isnull(l.PaidMiles, isnull(l.Miles,0))), lsPick.PaidMiles)

                        --,Paid_Miles1 = iif(l.Driver2_PersonId is null, iif(l.PaidMiles IS NULL, isnull(l.miles,0), l.PaidMiles) + isnull(l.DeadHead,0), 
                        --                                                                (iif(l.PaidMiles is null, isnull(l.Miles,0), l.PaidMiles) + isnull(l.DeadHead,0)) / 2)
                        
                        ,Paid_Miles = iif(@LegInd = 0, (iif(l.Driver2_PersonId is null, isnull(l.PaidMiles, isnull(l.miles,0)) + isnull(l.DeadHead,0), 
                                                                                                                                                   (isnull(l.PaidMiles, isnull(l.Miles,0)) + isnull(l.DeadHead,0)) / 2)),
                                                        -- for LEGs
                                                                                   (iif(lsPick.Driver2_PersonId is null, isnull(lsPick.PaidMiles, 0) + isnull(lsPick.PaidEmpty,0), 
                                                                                                                                                        (isnull(lsPick.PaidMiles, 0) + isnull(lsPick.PaidEmpty,0)) / 2))
                                                        )
                        ,DoublesMiles = (select sum(Quantity) from dispatch.AccCharge where AccChargeTypeId = 4 and LoadId = l.LoadId) -- Doubles
                        ,DH_QTY = (select sum(Quantity) from dispatch.AccCharge where AccChargeTypeId = 5 and LoadId = l.LoadId) -- Drop & Hook
                        ,DeadHead = iif(@LegInd = 0, l.DeadHead, lsPick.PaidEmpty)
                        ,l.TripNumber
                        -- Regardless of whether the pick is a LEG or not, use StartDateTime
                        ,PickupBy = lsPick.StartDateTime
                        -- if the Drop is a leg, use the DropStartDateTime vs. StartDateTime
                        ,DeliverBy = iif(lsDrop.LoadStopId = 2, lsDrop.DropStartDateTime, lsDrop.StartDateTime)
                        ,StopNumber = 0
                        ,DriverType = 'C'
                        ,l.InvoiceDate
                        -- Ask Matt if the below would still be correct in the new platform the way stops are done (we have legs, fuel stops, Each location including the initial pick is a stop).
                --        ,StopCount = (iif(cl.Client_Id = 'ALB1000', (SELECT COUNT(*) -1 from dispatch.LoadStop where LoadId = l.LoadId), 
                --                                        (SELECT COUNT(*) -2 from dispatch.LoadStop where LoadId = l.LoadId)))
                        ,StopCount = IIF(@LegInd = 0, 
                                                                                (SELECT COUNT(*) -2 from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,3)) -- Added, filtered for pick and drop
                                                                                ,(SELECT COUNT(*) - 2 FROM dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,2,3) and StopNumber between lsPick.StopNumber and lsDrop.StopNumber)
                                                        )
                        ,DriverPersonId = p.PersonId
                        ,LegInd = @LegInd
                FROM
                        dispatch.Load l
                        INNER JOIN dispatch.LoadStop lsPick on lsPick.LoadStopId = @LoadStopId_Pick
                        INNER JOIN dispatch.LoadStop lsDrop on lsDrop.LoadStopId = @LoadStopId_Drop
                        inner join main.Person p on p.PersonId = IIF(@LegInd = 0,  l.Driver1_PersonId, lsPick.Driver1_PersonId)
                        -- Get truck's Unit_Id
                        LEFT OUTER JOIN equipment.punit pt on pt.PunitId = IIF(@LegInd = 0, l.TruckPunitId, lsPick.TruckPunitId)
                        -- Get the Client_Id
                        LEFT OUTER JOIN main.Client cl on cl.ClientId = l.ClientId
                        -- Get DriverId (e.g. ABD1000)
                        LEFT OUTER JOIN main.Driver dr1 on dr1.PersonId = IIF(@LegInd = 0, l.Driver1_PersonId, lsPick.Driver1_PersonId)
                        -- Get Driver 2 name
                        --LEFT OUTER JOIN main.Driver dr2 on dr2.PersonId = l.Driver2_PersonId
                        LEFT OUTER JOIN main.Person p2 on p2.PersonId = IIF(@LegInd = 0, l.Driver2_PersonId, lsPick.Driver2_PersonId)
                WHERE 
                        L.LoadId = @LoadId 
                        and p.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p.PersonId and PersonTypeId = 4) -- PersonType OTR
                        -- If drop is a LEG, use DropStartDateTime vs. StartDateTime
                        and  iif(lsDrop.LoadStopTypeId = 2, lsDrop.DropStartDateTime, lsDrop.StartDateTime) is not null
                        -- If drop is a LEG, use DropStartDateTime vs. StartDateTime
                        and iif(lsDrop.LoadStopTypeId = 2, CONVERT(DATE, lsDrop.DropStartDateTime), CONVERT(DATE, lsDrop.StartDateTime)) between @StartDt and @ThroughDt

                insert into @tempA
                SELECT
                        DriverTag = '2'
                        ,l.LoadId
                        ,TruckNumber = pt.Unit_ID
                        ,cl.Client_Id
                        ,dr2.DriverId
                        ,Driver = p.FirstName + ' ' + p.LastName
                        ,CODriver = p2.FirstName + ' ' + p2.LastName
                        --,LoadedMiles = iif(l.PaidMiles is null, isnull(l.Miles,0), l.PaidMiles)
                        ,LoadedMiles = iif(@LegInd = 0, (isnull(l.PaidMiles, isnull(l.Miles,0))), lsPick.PaidMiles)
                        --,Paid_Miles =                                        iif(l.Driver2_PersonId is null, iif(l.PaidMiles IS NULL, isnull(l.miles,0), l.PaidMiles) + isnull(l.DeadHead,0), 
                        --                                                                (iif(l.PaidMiles is null, isnull(l.Miles,0), l.PaidMiles) +  isnull(l.DeadHead,0)) / 2)
                        ,Paid_Miles = iif(@LegInd = 0, (iif(l.Driver2_PersonId is null, isnull(l.PaidMiles, isnull(l.miles,0)) + isnull(l.DeadHead,0), 
                                                                                                                                                   (isnull(l.PaidMiles, isnull(l.Miles,0)) + isnull(l.DeadHead,0)) / 2)),
                                                        -- for LEGs
                                                                                                                                                        (iif(lsPick.Driver2_PersonId is null, isnull(lsPick.PaidMiles, 0) + isnull(lsPick.PaidEmpty,0), 
                                                                                                                                                    (isnull(lsPick.PaidMiles, 0) + isnull(lsPick.PaidEmpty,0)) / 2))
                                                        )
                        ,DoublesMiles = (select sum(Quantity) from dispatch.AccCharge where AccChargeTypeId = 4 and LoadId = l.LoadId) -- Doubles
                        ,DH_QTY = (select sum(Quantity) from dispatch.AccCharge where AccChargeTypeId = 5 and LoadId = l.LoadId) -- Drop & Hook
                        ,l.DeadHead
                        ,l.TripNumber
                        -- Regardless of whether the pick is a LEG or not, use StartDateTime
                        ,PickupBy = lsPick.StartDateTime
                        -- if the Drop is a leg, use the DropStartDateTime vs. StartDateTime
                        ,DeliverBy = iif(lsDrop.LoadStopId = 2, lsDrop.DropStartDateTime, lsDrop.StartDateTime)
                        ,StopNumber = 0
                        ,DriverType = 'C'
                        ,l.InvoiceDate
                        -- Ask Matt if the below would still be correct in the new platform the way stops are done (we have legs, fuel stops, Each location including the initial pick is a stop).
                --        ,StopCount = (iif(cl.Client_Id = 'ALB1000', (SELECT COUNT(*) -1 from dispatch.LoadStop where LoadId = l.LoadId), 
                --                                        (SELECT COUNT(*) -2 from dispatch.LoadStop where LoadId = l.LoadId)))
                        --,StopCount = (SELECT COUNT(*) -2 from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,3)) -- Added, filtered for pick and drop
                        ,StopCount = IIF(@LegInd = 0, 
                                                        (SELECT COUNT(*) -2 from dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,3)) -- Added, filtered for pick and drop
                                                        ,(SELECT COUNT(*) - 2 FROM dispatch.LoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,2,3) and StopNumber between lsPick.StopNumber and lsDrop.StopNumber)
                                )
                        ,DriverPersonId = p.PersonId
                        ,LegInd = @LegInd
                FROM
                        dispatch.Load l 
                        INNER JOIN dispatch.LoadStop lsPick on lsPick.LoadStopId = @LoadStopId_Pick
                        INNER JOIN dispatch.LoadStop lsDrop on lsDrop.LoadStopId = @LoadStopId_Drop
                        inner join main.Person p on p.PersonId = IIF(@LegInd = 0,  l.Driver2_PersonId, lsPick.Driver2_PersonId)
                        -- Get truck's Unit_Id
                        LEFT OUTER JOIN equipment.punit pt on pt.PunitId = IIF(@LegInd = 0, l.TruckPunitId, lsPick.TruckPunitId)
                        -- Get the Client_Id
                        LEFT OUTER JOIN main.Client cl on cl.ClientId = l.ClientId
                        -- Get Driver (e.g. ABD1000)
                        LEFT OUTER JOIN main.Driver dr2 on dr2.PersonId = IIF(@LegInd = 0, l.Driver2_PersonId, lsPick.Driver2_PersonId)
                        LEFT OUTER JOIN main.Person p2 on p2.PersonId = IIF(@LegInd = 0, l.Driver1_PersonId, lsPick.Driver1_PersonId)
                WHERE 
                        l.LoadId = @LoadId
                        and p.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p.PersonId and PersonTypeId = 4) -- PersonType OTR
                        -- If drop is a LEG, use DropStartDateTime vs. StartDateTime
                        and  iif(lsDrop.LoadStopTypeId = 2, lsDrop.DropStartDateTime, lsDrop.StartDateTime) is not null
                        -- If drop is a LEG, use DropStartDateTime vs. StartDateTime
                        and iif(lsDrop.LoadStopTypeId = 2, CONVERT(DATE, lsDrop.DropStartDateTime), CONVERT(DATE, lsDrop.StartDateTime)) between @StartDt and @ThroughDt

        fetch next from curs 
                into @LoadId, @LoadStopId_Pick, @LoadStopId_Drop, @LegInd
        end

        close curs
        deallocate curs

        /*
        Query below selects all active drivers that did not have a drop within the date range selected.  
        This is done so that the subquery has a Driver Name "placeholder" in the event of existence of Other Pay activity.
        */

        INSERT INTO @tempA
        SELECT DISTINCT
                DriverTag = '2'
        --        ,l.LoadId
                ,0--Added
                ,TruckNumber = ''
                ,Client_Id = ''
                ,dr1.DriverId
                ,Driver = p.FirstName + ' ' + p.LastName
                ,CODriver = ''
                ,LoadedMiles = null
                ,Paid_Miles = null
                ,DoublesMiles = null
                ,DH_QTY = null
                ,DeadHead = null
                ,TripNumber = '0'
                ,PickupBy = null
                ,DeliverBy = null
                ,StopNumber = 0
                ,DriverType = 'C'
                ,InvoiceDate = null
                ,StopCount = null
                ,DriverPersonId = p.PersonId
                ,LegInd = 0 
        FROM
                dispatch.Load l
                inner join main.Person p on p.PersonId = l.Driver1_PersonId
                -- Get Driver (e.g. ABD1000)
                LEFT OUTER JOIN main.Driver dr1 on dr1.PersonId = l.Driver1_PersonId
                -- Get first Drop for Delivered By
                LEFT OUTER JOIN dispatch.LoadStop lsDrop on lsDrop.LoadStopId = (select top 1 LoadStopId 
                                                                                                                                        from dispatch.LoadStop
                                                                                                                                        where LoadId = l.LoadId and LoadStopTypeId = 3 -- Drop
                                                                                                                                        order by StopTypeNumber desc) -- asc) -- Last Drop
                LEFT OUTER JOIN @tempA A ON p.FirstName + ' ' + p.LastName = A.Driver  -- Added

        WHERE 
                p.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p.PersonId and PersonTypeId = 4) -- PersonType OTR
                and lsDrop.StartDateTime is not null
                AND A.DriverId IS NULL  -- Added
                AND p.FirstName + ' ' + p.LastName Not In (Select Driver from @tempA) --Added
                AND p.IsActive = 1

        select * from @tempA
        where Driver = IsNull(@Driver, Driver)
        order by Driver, Paid_Miles
GO



