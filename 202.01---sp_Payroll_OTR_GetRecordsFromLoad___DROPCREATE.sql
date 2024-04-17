/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetRecordsFromLoad]    Script Date: 2/14/2024 10:06:27 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetRecordsFromLoad]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetRecordsFromLoad]    Script Date: 2/14/2024 10:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_GetRecordsFromLoad]
(
	@PayPeriodStart date
	,@PayPeriodEnd date
)
as
/*
	exec payroll.sp_Payroll_OTR_GetRecordsFromLoad '12/10/2023', '12/16/2023'
*/

BEGIN
SET NOCOUNT ON;
 IF 1=0 BEGIN
   SET FMTONLY OFF
 END
	--vars
		--Load And LoadStop records for this pay period
			--#CurrentPayPeriodLoad
			--#CurrentPayPeriodLoadStop
			DROP TABLE IF EXISTS #CurrentPayPeriodLoad
			DROP TABLE IF EXISTS #CurrentPayPeriodLoadStop

			SELECT * INTO
			#CurrentPayPeriodLoad
			FROM payroll.vLoadCurrentPayPeriod
			
			SELECT * INTO
			#CurrentPayPeriodLoadStop
			FROM payroll.vLoadStopCurrentPayPeriod


	--
        DECLARE @crsV TABLE (
                LoadId int
                ,LoadStopId_Pick int 
                ,LoadStopId_Drop int
                ,LegInd bit
        )
        declare @LoadId int
        declare @LoadStopId_Pick int
        declare @LoadStopId_Drop int
        declare @LegInd bit

        insert into @crsV (LoadId, LoadStopId_Pick, LoadStopId_Drop, LegInd)
/*
*/
        -- Get loads without Legs
        select 
                l.LoadId
                -- First Pick
                ,LoadStop_Pick = lsPick.LoadStopId
                -- Last Drop
                ,LoadStop_Drop = lsDrop.LoadStopId
                ,Legind = 0
        from 
                #CurrentPayPeriodLoad l
                inner join #CurrentPayPeriodLoadStop lsPick on lsPick.LoadStopId = (SELECT TOP 1 LoadStopId FROM #CurrentPayPeriodLoadStop WHERE LoadId = l.LoadId AND LoadStopTypeId = 1 ORDER BY StopNumber ASC)
                inner join #CurrentPayPeriodLoadStop lsDrop on lsDrop.LoadStopId = (SELECT TOP 1 LoadStopId FROM #CurrentPayPeriodLoadStop WHERE LoadId = l.LoadId AND LoadStopTypeId = 3 ORDER BY StopNumber DESC)
                inner join main.Person p1 on p1.PersonId = l.Driver1_PersonId
                left outer join main.Person p2 on p2.PersonId = l.Driver2_PersonId
        where 
                l.LoadStatusTypeId <> 100 -- don't include cancelled loads.
                and convert(DATE, lsDrop.StartDateTime) between @PayPeriodStart and @PayPeriodEnd
                and 
                (
                        p1.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p1.PersonId and PersonTypeId = 4)
                        or isnull(p2.PersonId,0) in (select PersonId from main.PersonTypeMapping where PersonId = p2.PersonId and PersonTypeId = 4)
                )
                AND NOT EXISTS (SELECT 1 FROM #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId = 2)
        union all

        -- get legs 
        select 
                l.LoadId
                -- First Pick
                ,LoadStopId_Pick = lsPick.LoadStopId
                -- next LEG or Last Drop (if no other legs)
                ,LoadStopId_Drop =  lsDrop.LoadStopId
                ,LegInd = 1
        from 
                #CurrentPayPeriodLoad l
                INNER JOIN #CurrentPayPeriodLoadStop lsPick on lsPick.LoadId = l.LoadId and lsPick.LoadStopTypeId = 2
                -- get the next leg or last drop
                INNER JOIN #CurrentPayPeriodLoadStop lsDrop on lsDrop.LoadStopId = iif(exists(select top 1 LoadStopId from #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 and StopNumber > lsPick.StopNumber order by StopNumber asc)
                                                                ,(select top 1 LoadStopId from #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 and StopNumber > lsPick.StopNumber order by StopNumber)
                                                                ,(SELECT TOP 1 LoadStopId FROM #CurrentPayPeriodLoadStop WHERE LoadId = l.LoadId AND LoadStopTypeId = 3 ORDER BY StopNumber desc))
                inner join main.Person p1 on p1.PersonId = lsPick.Driver1_PersonId
                left outer join main.Person p2 on p2.PersonId = isnull(lsPick.Driver2_PersonId,0)
        where 
                l.LoadStatusTypeId <> 100 -- don't include cancelled loads.
                -- Pick either StartDateTime or DropStartDateTime based on if the stop is a LEG or not
                and iif(lsDrop.LoadStopTypeId = 2, Convert(Date, lsDrop.DropStartDateTime), convert(DATE, lsDrop.StartDateTime)) between @PayPeriodStart and @PayPeriodEnd
                and
                (
                        p1.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p1.PersonId and PersonTypeId = 4)
                        or isnull(p2.PersonId,0) in (select PersonId from main.PersonTypeMapping where PersonId = p2.PersonId and PersonTypeId = 4)
                )
		


		


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
                #CurrentPayPeriodLoad l
                -- Get the first Pick
                INNER JOIN #CurrentPayPeriodLoadStop lsPick on lsPick.LoadStopId = (select Top 1 LoadStopId from #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId = 1 order by StopNumber asc)  
                -- Get the first LEG
                INNER JOIN #CurrentPayPeriodLoadStop lsDrop on lsDrop.LoadStopId = (select top 1 LoadStopId from #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId = 2 order by StopNumber asc)
                inner join main.Person p1 on p1.PersonId = l.Driver1_PersonId
                left outer join main.Person p2 on p2.PersonId = l.Driver2_PersonId
        where 
                l.LoadStatusTypeId <> 100 -- don't include cancelled loads.
                -- Look at Leg DropStartDateTime since this is a LEG drop.
                and convert(DATE, lsDrop.DropStartDateTime) between @PayPeriodStart and @PayPeriodEnd
                and
                (
                        p1.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p1.PersonId and PersonTypeId = 4)
                        or isnull(p2.PersonId,0) in (select PersonId from main.PersonTypeMapping where PersonId = p2.PersonId and PersonTypeId = 4)
                )
                AND EXISTS (SELECT LoadStopId FROM #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId = 2)
        
        --select * from #CurrentPayPeriodLoad where LoadId = 606
        --select * from #CurrentPayPeriodLoadStop where Loadid = 606 order by StopNumber
        --select * from @crsV 
        --order by LoadId

        declare @tempA table (
                DriverTag char(1)
                ,LoadId int
                ,TruckNumber varchar(30)
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
                ,Driver2PersonId int--Added
                ,LegInd bit
                ,PickOrigin varchar(100)--Added
                ,DropDest varchar(100)--Added
				,PUnitId int --Added
        )

        declare curs cursor for
        select 
                LoadId, LoadStopId_Pick, LoadStopId_Drop, LegInd
        from
                @crsV

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
														--        ,StopCount = (iif(cl.Client_Id = 'ALB1000', (SELECT COUNT(*) -1 from #CurrentPayPeriodLoadStop where LoadId = l.LoadId), 
														--                                        (SELECT COUNT(*) -2 from #CurrentPayPeriodLoadStop where LoadId = l.LoadId)))
																,StopCount = IIF(@LegInd = 0, 
																														(SELECT COUNT(*) -2 from #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,3)) -- Added, filtered for pick and drop
																														,(SELECT COUNT(*) - 2 FROM #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,2,3) and StopNumber between lsPick.StopNumber and lsDrop.StopNumber)
																								)
																,DriverPersonId = p.PersonId
																,Driver2PersonId = p2.PersonId--Added
																,LegInd = @LegInd
																,PickOrigin = claddrorigin.City + ', ' + claddrorigin.State        --Added
																,DropDest = cladddest.City + ', ' + cladddest.State        --Added
																,pt.PUnitId
														FROM
																#CurrentPayPeriodLoad l
																INNER JOIN #CurrentPayPeriodLoadStop lsPick on lsPick.LoadStopId = @LoadStopId_Pick
																INNER JOIN #CurrentPayPeriodLoadStop lsDrop on lsDrop.LoadStopId = @LoadStopId_Drop
																inner join main.Person p on p.PersonId = IIF(@LegInd = 0,  l.Driver1_PersonId, lsPick.Driver1_PersonId)
																-- Get truck's Unit_Id
																LEFT OUTER JOIN equipment.punit pt on pt.PunitId = IIF(@LegInd = 0, l.TruckPunitId, lsPick.TruckPunitId) 
																LEFT OUTER JOIN equipment.punitmapping pm on pm.PUnitId = pt.PUnitId and @PayPeriodEnd between pm.EffectiveDate and pm.ExpirationDate --Added 5/10
																-- Get the Client_Id
																LEFT OUTER JOIN main.Client cl on cl.ClientId = l.ClientId
																-- Get DriverId (e.g. ABD1000)
																LEFT OUTER JOIN main.Driver dr1 on dr1.PersonId = IIF(@LegInd = 0, l.Driver1_PersonId, lsPick.Driver1_PersonId)
																-- Get Driver 2 name
																--LEFT OUTER JOIN main.Driver dr2 on dr2.PersonId = l.Driver2_PersonId
																LEFT OUTER JOIN main.Person p2 on p2.PersonId = IIF(@LegInd = 0, l.Driver2_PersonId, lsPick.Driver2_PersonId)
																LEFT OUTER JOIN main.ClientAddress claddrorigin on claddrorigin.ClientId  =  IIF(@LegInd = 0,  
																																																												(SELECT        TOP (1) ClientId
																																																												FROM            main.ClientAddress
																																																												WHERE        (UseForBillingInd = 1 AND ClientId =
																																																												(SELECT        TOP (1) ClientId
																																																												FROM            #CurrentPayPeriodLoadStop
																																																												WHERE        (LoadId = l.LoadId) AND (LoadStopTypeId = 1) AND (StopTypeNumber = 1))))  
																																																								, lsPick.ClientId) And claddrorigin.AddressTypeId = 2 --Added
																LEFT OUTER JOIN main.ClientAddress cladddest    on cladddest.ClientId     =  IIF(@LegInd = 0,  
																																																										(SELECT        TOP (1) ClientId
																																																										FROM            main.ClientAddress AS ClientAddress_1
																																																										WHERE        (UseForBillingInd = 1 AND ClientId =
																																																										(SELECT        TOP (1) ClientId
																																																										FROM            #CurrentPayPeriodLoadStop AS LoadStop_3
																																																										WHERE        (LoadId = l.LoadId) AND (LoadStopTypeId = 3) order by StopTypeNumber desc )))
																																																								, lsDrop.ClientId) And cladddest.AddressTypeId = 2         --Added
														WHERE 
																L.LoadId = @LoadId 
																and p.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p.PersonId and PersonTypeId = 4) -- PersonType OTR
																-- If drop is a LEG, use DropStartDateTime vs. StartDateTime
																and  iif(lsDrop.LoadStopTypeId = 2, lsDrop.DropStartDateTime, lsDrop.StartDateTime) is not null
																-- If drop is a LEG, use DropStartDateTime vs. StartDateTime
																and iif(lsDrop.LoadStopTypeId = 2, CONVERT(DATE, lsDrop.DropStartDateTime), CONVERT(DATE, lsDrop.StartDateTime)) between @PayPeriodStart and @PayPeriodEnd

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
														--        ,StopCount = (iif(cl.Client_Id = 'ALB1000', (SELECT COUNT(*) -1 from #CurrentPayPeriodLoadStop where LoadId = l.LoadId), 
														--                                        (SELECT COUNT(*) -2 from #CurrentPayPeriodLoadStop where LoadId = l.LoadId)))
																--,StopCount = (SELECT COUNT(*) -2 from #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,3)) -- Added, filtered for pick and drop
																,StopCount = IIF(@LegInd = 0, 
																								(SELECT COUNT(*) -2 from #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,3)) -- Added, filtered for pick and drop
																								,(SELECT COUNT(*) - 2 FROM #CurrentPayPeriodLoadStop where LoadId = l.LoadId and LoadStopTypeId in (1,2,3) and StopNumber between lsPick.StopNumber and lsDrop.StopNumber)
																		)
																,DriverPersonId = p.PersonId
																,Driver2PersonId = p2.PersonId--Added
																,LegInd = @LegInd
																,PickOrigin = claddrorigin.City + ', ' + claddrorigin.State        --Added
																,DropDest = cladddest.City + ', ' + cladddest.State        --Added
																,pt.PUnitId
														FROM
																#CurrentPayPeriodLoad l 
																INNER JOIN #CurrentPayPeriodLoadStop lsPick on lsPick.LoadStopId = @LoadStopId_Pick
																INNER JOIN #CurrentPayPeriodLoadStop lsDrop on lsDrop.LoadStopId = @LoadStopId_Drop
																inner join main.Person p on p.PersonId = IIF(@LegInd = 0,  l.Driver2_PersonId, lsPick.Driver2_PersonId)
																-- Get truck's Unit_Id
																LEFT OUTER JOIN equipment.punit pt on pt.PunitId = IIF(@LegInd = 0, l.TruckPunitId, lsPick.TruckPunitId)
																LEFT OUTER JOIN equipment.punitmapping pm on pm.PUnitId = pt.PUnitId and @PayPeriodEnd between pm.EffectiveDate and pm.ExpirationDate --Added 5/10
																-- Get the Client_Id
																LEFT OUTER JOIN main.Client cl on cl.ClientId = l.ClientId
																-- Get Driver (e.g. ABD1000)
																LEFT OUTER JOIN main.Driver dr2 on dr2.PersonId = IIF(@LegInd = 0, l.Driver2_PersonId, lsPick.Driver2_PersonId)
																LEFT OUTER JOIN main.Person p2 on p2.PersonId = IIF(@LegInd = 0, l.Driver1_PersonId, lsPick.Driver1_PersonId)
																LEFT OUTER JOIN main.ClientAddress claddrorigin on claddrorigin.ClientId  =  IIF(@LegInd = 0,  
																																																												(SELECT        TOP (1) ClientId
																																																												FROM            main.ClientAddress
																																																												WHERE        (UseForBillingInd = 1 AND ClientId =
																																																												(SELECT        TOP (1) ClientId
																																																												FROM            #CurrentPayPeriodLoadStop
																																																												WHERE        (LoadId = l.LoadId) AND (LoadStopTypeId = 1) AND (StopTypeNumber = 1))))  
																																																								, lsPick.ClientId) And claddrorigin.AddressTypeId = 2 --Added
																LEFT OUTER JOIN main.ClientAddress cladddest    on cladddest.ClientId     =  IIF(@LegInd = 0,  
																																																										(SELECT        TOP (1) ClientId
																																																										FROM            main.ClientAddress AS ClientAddress_1
																																																										WHERE        (UseForBillingInd = 1 AND ClientId =
																																																										(SELECT        TOP (1) ClientId
																																																										FROM            #CurrentPayPeriodLoadStop AS LoadStop_3
																																																										WHERE        (LoadId = l.LoadId) AND (LoadStopTypeId = 3) order by StopTypeNumber desc )))
																																																								, lsDrop.ClientId) And cladddest.AddressTypeId = 2         --Added
														WHERE 
																l.LoadId = @LoadId
																and p.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p.PersonId and PersonTypeId = 4) -- PersonType OTR
																-- If drop is a LEG, use DropStartDateTime vs. StartDateTime
																and  iif(lsDrop.LoadStopTypeId = 2, lsDrop.DropStartDateTime, lsDrop.StartDateTime) is not null
																-- If drop is a LEG, use DropStartDateTime vs. StartDateTime
																and iif(lsDrop.LoadStopTypeId = 2, CONVERT(DATE, lsDrop.DropStartDateTime), CONVERT(DATE, lsDrop.StartDateTime)) between @PayPeriodStart and @PayPeriodEnd

												fetch next from curs 
														into @LoadId, @LoadStopId_Pick, @LoadStopId_Drop, @LegInd
												end

												close curs
												deallocate curs
		



















        select distinct
        pp.personid
        into #TEMPOTR
        from main.personpay pp
        where pp.payrateid = 85
        and @PayPeriodEnd < pp.PayRateEndDate AND @PayPeriodEnd > pp.PayRateBeginDate

        IF OBJECT_ID('tempdb..#TEMPB') IS NOT NULL DROP TABLE #TEMPB
        

        SELECT B.* 
        INTO #TEMPB
        FROM
        (
        --SOLO LOADED MILES
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - OTR', PayId = case when DriverPersonId in (select personid from #TEMPOTR) then 85 else 62 end, Quantity = CAST(LoadedMiles AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
		FROM @tempA
        WHERE Driver2PersonId is null

        UNION ALL
        
        --SOLO EMPTY MILES
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - Deadhead', PayId = case when DriverPersonId in (select personid from #TEMPOTR) then 85 else 62 end, Quantity = CAST(IsNull(DeadHead,0) AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is null

        UNION ALL

        --SOLO PERDIEM MILES
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Diem', PayId = 84, Quantity = CAST(Paid_Miles AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is null

        UNION ALL

        --SOLO DOUBLES MILES
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - Doubles', PayId = 76, Quantity = CAST(IsNull(DoublesMiles,0) AS decimal (18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is null

--TEAM--------------

        UNION ALL

        --TEAM LOADED MILES
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - OTR', PayId = case when DriverPersonId in (select personid from #TEMPOTR) then 85 else 62 end, Quantity = CAST(IsNull(LoadedMiles,0)/2 AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null --AND DriverPersonId NOT IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 17)

        UNION ALL

        --TEAM LOADED MILES - TRAINEE
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - OTR (Trainee)', PayId = 64, Quantity = CAST(IsNull(LoadedMiles,0)/2 AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null AND DriverPersonId IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 16)

        UNION ALL

        --TEAM LOADED MILES - TRAINER
        --SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        --DriverPersonId, PayCode = 'Per Mile - OTR (Trainer)', PayId = 63, Quantity = CAST(IsNull(LoadedMiles,0)/2 AS decimal(18,2)) 
        --FROM @tempA
        --WHERE Driver2PersonId is not null AND DriverPersonId IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 17)

        --UNION ALL

        --TEAM EMPTY MILES
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - Deadhead', PayId = case when DriverPersonId in (select personid from #TEMPOTR) then 85 else 62 end, Quantity = CAST(IsNull(DeadHead,0)/2 AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null AND DriverPersonId NOT IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 17)

        UNION ALL

        --TEAM EMPTY MILES - TRAINEE
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - Deadhead (Trainee)', PayId = 64, Quantity = CAST(IsNull(DeadHead,0)/2 AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null AND DriverPersonId IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 16)

        UNION ALL

        --TEAM EMPTY MILES - TRAINER
        --SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        --DriverPersonId, PayCode = 'Per Mile - Deadhead (Trainer)', PayId = 63, Quantity = CAST(IsNull(DeadHead,0)/2 AS decimal(18,2)) 
        --FROM @tempA
        --WHERE Driver2PersonId is not null AND DriverPersonId IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 17)

        --UNION ALL


        --TEAM DOUBLES MILES
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Mile - Doubles', PayId = 76, Quantity = CAST(IsNull(DoublesMiles,0)/2 AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null AND DriverPersonId NOT IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 16)

-----------------------

        UNION ALL

        --TEAM PERDIEM
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Per Diem', PayId = 84, Quantity = CAST(IsNull(Paid_Miles,0) AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null

        UNION ALL

        --SOLO EXTRA STOPS
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Extra Stops', PayId = 73, Quantity = CAST(IsNull(StopCount,0) AS decimal(18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is null

        UNION ALL

        --TEAM EXTRA STOPS
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Extra Stops', PayId = 74, Quantity = CAST(IsNull(StopCount,0.00)/2.00 AS decimal(18,2))
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null AND DriverPersonId NOT IN (select PersonId from main.PersonTypeMapping where PersonTypeId IN (16,17))--No Extra Stop for Trainee

        UNION ALL

        --TEAM EXTRA STOPS (Trainer)
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Extra Stops (Trainer)', PayId = 73, Quantity = CAST(IsNull(StopCount,0) AS decimal(18,2))
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null AND DriverPersonId IN (select PersonId from main.PersonTypeMapping where PersonTypeId IN (17))--Trainer full extra stop pay

        UNION ALL

        --SOLO DROP HOOK
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Drop & Hook', PayId = 73, Quantity = CAST(IsNull(DH_QTY,0) AS decimal (18,2)) 
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is null

        UNION ALL

        --TEAM DROP HOOK
        SELECT LoadId, TripNumber, TruckNumber, Client_Id, PickupBy, DeliverBy, DriverType, LegInd, PickOrigin, DropDest,
        DriverPersonId, PayCode = 'Drop & Hook', PayId = 73, Quantity = CAST(IsNull(DH_QTY,0)/2 AS decimal(18,2))
        ,PUnitId --added 05/10/22
        FROM @tempA
        WHERE Driver2PersonId is not null AND DriverPersonId NOT IN (select PersonId from main.PersonTypeMapping where PersonTypeId = 16)--No drop Hook for Trainee

        ) B


--        SELECT [Name] = p.FirstName + ' ' + p.LastName , B.*, pp.PayRateAmount 
        SELECT [Name] = p.FirstName + ' ' + p.LastName 
        , LoadId=Cast(B.LoadId as Int)
        , B.TripNumber	--=Cast(B.TripNumber as Int)
        , TruckNumber = Cast(TruckNumber as Int)
        , B.Client_Id
        , B.PickupBy
        , B.DeliverBy
        , B.DriverType
        , LegInd = Cast(LegInd as bit)
        , B.PickOrigin
        , B.DropDest
        , B.DriverPersonId
        , PayCode = b.PayCode  --ppr.Description
        , PayId = Cast(B.PayId as Int)
        , Quantity = Cast(B.Quantity as Decimal(10,2))
        , PayRateAmount = Cast(pp.PayRateAmount as Decimal(10,2)) 
		, PUnitId --Added 05/10/2022
        FROM #TEMPB B 
        LEFT JOIN Main.Person p on p.PersonId = B.DriverPersonId
        LEFT JOIN Main.PersonPay pp on (pp.personid = cast(b.DriverPersonId as Int)) and (cast(pp.PayRateId as Int) = Cast(b.PayId as Int)) 
                and (@PayPeriodEnd < pp.PayRateEndDate) and (@PayPeriodEnd > pp.PayRateBeginDate) --modified 11/18 db
        --LEFT JOIN Main.PersonPayRate ppr on ppr.PersonPayRateId = b.PayId
        WHERE Quantity <> 0
        AND B.DriverPersonId NOT IN (Select PersonId from main.PersonPay where PayRateId = 69) -- Exclude salaried drivers
        ORDER BY p.LastName, FirstName, TripNumber,
                CASE PayCode
                WHEN 'Per Mile - OTR' THEN 1
                WHEN 'Per Mile - Deadhead' THEN 2
                WHEN 'Per Diem' THEN 3
                WHEN 'Per Mile - Doubles' THEN 4
                ELSE 5 END

END
GO


