USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadsForStatus_Get]    Script Date: 4/24/2024 8:14:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_LoadsForStatus_Get]
(
	@ShowCancelledLoads bit,
	@ShowBilledLoads bit,
	@ShowReimbursablesOnly bit = 0,
	@ShowNoBolAttachedOnly bit = 0,
	@ShowClientType char(1) = 'A',
	@ShowNoDropDatesOnly bit = 0,
	@SearchAllString varchar(max) = ''
)
AS 
BEGIN

	-- sp_LoadsForStatus_Get 0, 0, 0, 0, 'A', 0, '5007542988'
	-- sp_LoadsForStatus_Get 0, 0, 0, 0, 'B', 0, '374562'

	-- sp_LoadsForStatus_Get 0, 0, 1, 0, 0, ''
	-- sp_LoadsForStatus_Get 0, 0, 1, 0, 0, ''
	-- sp_LoadsForStatus_Get 0, 0, 0, 1, 0, ''
	-- sp_LoadsForStatus_Get 0, 0, 0, 0, 1, ''
	-- sp_LoadsForStatus_Get 0, 1, 0, 0, 0, ''

	-- sp_LoadsForStatus_Get 1, 1, ''
	-- sp_LoadsForStatus_Get 0, 1, 0, 0, '348229028'

	IF 1=0 BEGIN
		SET FMTONLY OFF
	END

	DECLARE @LShowCancelledLoads bit = @ShowCancelledLoads,
			@LShowBilledLoads bit = @ShowBilledLoads,
			@LShowReimbursablesOnly bit = @ShowReimbursablesOnly,
			@LShowNoBolAttachedOnly bit = @ShowNoBolAttachedOnly,
			@LShowClientType char(1) = CASE WHEN @ShowClientType = '' THEN 'A' ELSE @ShowClientType END,
			@LShowNoDropDatesOnly bit = @ShowNoDropDatesOnly,
			@LSearchAllString varchar(max) = @SearchAllString

	DECLARE @ValidLoads Table (LoadId int NOT NULL PRIMARY KEY CLUSTERED);
	--CREATE TABLE #ValidLoads (LoadId int NOT NULL PRIMARY KEY CLUSTERED);

	IF COALESCE(@LSearchAllString, '') <> ''
	BEGIN
		--include all loads in the search
		SELECT	@LShowBilledLoads = 1,
				@LShowCancelledLoads = 0,
				@LShowReimbursablesOnly = 0,
				@LShowNoBolAttachedOnly = 0,
				@LShowClientType = 'A',
				@LShowNoDropDatesOnly = 0

		INSERT	INTO @ValidLoads
		SELECT	LoadId FROM ufn_Load_Search_MultiFields(@LSearchAllString)
	END
	ELSE IF @LShowReimbursablesOnly = 1
	BEGIN
		INSERT	INTO @ValidLoads
		SELECT	DISTINCT l.LoadId 
		FROM	dispatch.Load l
				JOIN dispatch.AccCharge acc ON acc.LoadId = l.LoadId
				--JOIN dispatch.AccChargeType acct ON acct.AccChargeTypeId = acc.AccChargeTypeId
				--JOIN dispatch.AccChargeType ct ON ct.AccChargeTypeId = acc.AccChargeTypeId
		WHERE	l.LoadStatusTypeId != (SELECT LoadStatusTypeId FROM dispatch.LoadStatusType WHERE UPPER(LoadStatusTypeNm) = 'BILLED')	--status is not 'billed'
		AND		(
					(acc.AccChargeTypeId IN (3, 13) AND acc.BillableInd = 1)
					OR
					(acc.AccChargeTypeId = 15 AND acc.ReimbursableInd = 1)
				)
		--AND		acct.ReiumbursementInd = 1
		AND		COALESCE(acc.MarkedAsCompleted, 0) = 0
	END
	ELSE IF @LShowNoBolAttachedOnly = 1
	BEGIN
		INSERT	INTO @ValidLoads
		SELECT	DISTINCT l.LoadId 
		FROM	dispatch.Load l
				JOIN dispatch.LoadStop ls ON ls.LoadId = l.LoadId AND ls.LoadStopTypeId = 3
		WHERE	(SELECT COUNT(*) FROM dispatch.LoadFile WHERE LoadFileTypeId = 2 AND LoadId = l.LoadId) = 0	--# of BOL attachemnts for load
		--AND		ArrivalDateTime is not null
		--AND		l.LoadStatusTypeId in (5, 7, 8)
		AND		DATEDIFF(	HOUR, 
							(SELECT MAX(StartDateTime) FROM dispatch.LoadStop WHERE LoadStopTypeId = 3 AND LoadStopId = ls.LoadStopId),
							GETDATE()
						) >= 48
	END
	ELSE IF @LShowNoDropDatesOnly = 1
	BEGIN
		--include billed
		SELECT @LShowBilledLoads = 1

		INSERT	INTO @ValidLoads
		SELECT	DISTINCT l.LoadId		--,CreatedTs, DATEDIFF(WEEK, l.CreatedTs, GETDATE())
		FROM	dispatch.Load l
				JOIN dispatch.LoadStop ls ON ls.LoadId = l.LoadId AND ls.LoadStopTypeId = 3
		WHERE	ls.LoadStopTypeId IN (2, 3)	--drops or legs
		AND		DATEDIFF(WEEK, l.CreatedTs, GETDATE()) <= 2		--last 2 weeks only
		AND		(
					(LoadStopTypeId = 2 AND DropStartDateTime IS NULL)	--leg
					OR
					(LoadStopTypeId = 3 AND StartDateTime IS NULL)		--drop
				)
	END
	ELSE
	BEGIN
		INSERT	INTO @ValidLoads
		SELECT	l.LoadId 
		FROM	dispatch.Load l
		--WHERE	(SELECT COUNT(*) FROM dispatch.LoadStop WHERE LoadId = l.LoadId AND StartDateTime IS NULL) = 0
		--WHERE	((@LShowCancelledLoads = 1 AND LoadStatusTypeId = 100)  OR (@LShowCancelledLoads = 0 AND LoadStatusTypeId <> 100))
		--AND		(@LShowBilledLoads = 1 OR (@LShowBilledLoads = 0 AND LoadStatusTypeId <> 8))
	END

	--SELECT * FROM @ValidLoads

    SELECT	ld.LoadId,
            ld.TripNumber,
			--Notes = (SELECT COALESCE(dbo.GetLoadNotes(ld.LoadId, 0), '')),
			SUBSTATUSES = (SELECT STRING_AGG(lsst.Name, ', ') AS Departments FROM dispatch.LoadToLoadStatusSubType ltl inner join dispatch.LoadStatusSubType lsst on lsst.LoadStatusSubTypeId = ltl.LoadStatusSubTypeId where ltl.LoadId = ld.LoadId),
            CUSTNAME = clnt.ClientName,
            StartLocation =	(	SELECT	TOP (1) City + ' ' + State
                                FROM	main.ClientAddress
                                WHERE   UseForBillingInd = 1
								AND		ClientId =	(	SELECT	TOP (1) ClientId
                                                        FROM	dispatch.LoadStop
                                                        WHERE	LoadId = ld.LoadId
														AND		LoadStopTypeId = 1
														AND		StopTypeNumber = 1
													)
							),
            CURRENT_STATUS = ldsta.LoadStatusTypeNm,
            ldsta.LoadStatusTypeId,
            EndLocation =	(	SELECT	TOP (1) City + ' ' + State
                                FROM	main.ClientAddress AS ClientAddress_1
                                WHERE	UseForBillingInd = 1
								AND		ClientId =	(	SELECT	TOP (1) ClientId
														FROM	dispatch.LoadStop AS LoadStop_3
														WHERE	LoadId = ld.LoadId
														AND		LoadStopTypeId = 3
														ORDER BY StopTypeNumber DESC
													)
							),
            DRIVER_1_ID = prsn.FirstName + ' ' + prsn.LastName,
            Truck_Number = trk.Unit_ID,
            CURRENT_MILEAGE = (ISNULL(ld.Miles, 0) + ISNULL(ld.DeadHead,0)),
            GrossRevenue = isnull(ld.GrossRevenue,0),
            RPM = ISNULL(LD.RatePerMile, 0),
            PICKUP_BY =	(	SELECT	TOP (1) StartDateTime
                            FROM	dispatch.LoadStop AS LoadStop_2
                            WHERE	LoadId = ld.LoadId
							AND		LoadStopTypeId = 1
							AND		StopTypeNumber = 1
						),
            PICKUP_BY_DATE =	(	SELECT	TOP (1) CAST(StartDateTime AS DATE)
									FROM	dispatch.LoadStop AS LoadStop_2
									WHERE	LoadId = ld.LoadId
									AND		LoadStopTypeId = 1
									AND		StopTypeNumber = 1
								),
			--PICKUP_BY_TIME =	(	SELECT	TOP (1) CAST(StartDateTime AS TIME)
								--	FROM	dispatch.LoadStop AS LoadStop_2
								--	WHERE	LoadId = ld.LoadId
								--	AND		LoadStopTypeId = 1
								--	AND		StopTypeNumber = 1
								--),
            PICKUP_BY_TIME =	(	SELECT	TOP (1) CAST(CONCAT(CAST(GETDATE() AS Date),' ', CAST(StartDateTime AS time(0))) AS datetime)
									FROM	dispatch.LoadStop AS LoadStop_2
									WHERE	LoadId = ld.LoadId
									AND		LoadStopTypeId = 1
									AND		StopTypeNumber = 1
								),
            DELIVER_BY =	(	SELECT	TOP (1) StartDateTime
                                FROM	dispatch.LoadStop AS LoadStop_1
                                WHERE	LoadId = ld.LoadId
								AND		LoadStopTypeId = 3
								ORDER BY StopTypeNumber DESC
							),
            DELIVER_BY_DATE =	(	SELECT	TOP (1) CAST(StartDateTime AS DATE)
									FROM	dispatch.LoadStop AS LoadStop_1
									WHERE	LoadId = ld.LoadId
									AND		LoadStopTypeId = 3
									ORDER BY StopTypeNumber DESC
								),
            DELIVER_BY_TIME =	(	SELECT	TOP (1) CAST(CONCAT(CAST(GETDATE() AS Date),' ', CAST(StartDateTime AS time(0))) AS datetime)
									FROM	dispatch.LoadStop AS LoadStop_1
									WHERE	LoadId = ld.LoadId
									AND		LoadStopTypeId = 3
									ORDER BY StopTypeNumber DESC
								),
			LockedPersonId,
			Pickup_StartDateTime_DisplayTimeInd =	(	SELECT	TOP (1) StartDateTime_DisplayTimeInd
														FROM	dispatch.LoadStop as LoadStop_3
														WHERE	LoadId = ld.LoadId
														AND		LoadStopTypeId = 1
														AND		StopNumber = 1
													),
			Delivered_StartDateTime_DisplayTimeInd =	(	SELECT	TOP (1) StartDateTime_DisplayTimeInd
															FROM	dispatch.LoadStop AS LoadStop_4
															WHERE	LoadId = ld.LoadId
															AND		LoadStopTypeId = 1
															AND		StopNumber = 3
														),
			Dispatcher = prsnDispatch.FirstName +	CASE	WHEN ISNULL(prsnDispatch.MiddleInitial,'') <> '' THEN ' ' + prsnDispatch.MiddleInitial + ' ' 
															ELSE ' ' 
													END 
												+ ' ' + prsnDispatch.LastName,
			ld.ProblemInd,
			--Trailer_ID = ISNULL(tr.Trailer_ID, '') 
			-- DMS 11/30/2022
			Trailer_ID =	COALESCE((	SELECT	TOP 1 Trailer_ID
										FROM	dispatch.LoadStop ls
												LEFT JOIN dispatch.Trailer t ON t.TrailerId = ls.Trailer1_TrailerId
										WHERE	ls.LoadId = ld.LoadId
										AND		ls.LoadStopTypeId = 1
										ORDER BY ls.LoadStopId DESC
									), COALESCE(tr.Trailer_ID, ''))
	INTO	#tmp
    FROM	dispatch.[Load] AS ld 
			JOIN @ValidLoads vl ON vl.LoadId = ld.loadId
            INNER JOIN dispatch.LoadStatusType AS ldsta ON ld.LoadStatusTypeId = ldsta.LoadStatusTypeId 
			--LEFT JOIN dispatch.LoadNotes ln ON ln.LoadId = ld.LoadId AND NoteTypeId = 1
            LEFT OUTER JOIN main.Client AS clnt ON ld.ClientId = clnt.ClientId 
			LEFT JOIN main.ClientType ct ON ct.ClientTypeId = clnt.ClientTypeId
            LEFT OUTER JOIN main.Person AS prsn ON ld.Driver1_PersonId = prsn.PersonId 
            --LEFT OUTER JOIN dispatch.Punit AS trk ON ld.TruckPunitId = trk.PunitId
            LEFT OUTER JOIN equipment.Punit AS trk ON ld.TruckPunitId = trk.PunitId
            LEFT OUTER JOIN main.Person As prsnDispatch ON ld.DispatcherPersonId = prsnDispatch.PersonId
            LEFT OUTER JOIN dispatch.Trailer tr on ld.Trailer1_TrailerId = tr.TrailerId
	WHERE	((@LShowCancelledLoads = 1 AND ldsta.LoadStatusTypeId = 100)  OR (@LShowCancelledLoads = 0 AND ldsta.LoadStatusTypeId <> 100))
	AND		(@LShowBilledLoads = 1 OR (@LShowBilledLoads = 0 AND COALESCE(ld.LoadStatusTypeId, 0) <> 8))
	AND		(@LShowClientType = 'A' OR (@LShowClientType = 'D' AND ct.ClientType = 'D') OR (@LShowClientType = 'B' AND ct.ClientType = 'B'))

	-- sp_LoadsForStatus_Get 0, 0

	--IF @ShowCancelledLoads = 1
	--	DELETE from #tmp where LoadStatusTypeId <> 100
	--ELSE
	--	DELETE from #tmp where LoadStatusTypeId = 100
        
	--IF @ShowBilledLoads = 0
	--	DELETE from #tmp where LoadStatusTypeId = 8
        
	--IF isnull(@SearchAllString,'') <> ''
	--	DELETE from #tmp where LoadId not in (select LoadId from ufn_Load_Search_MultiFields(@SearchAllString))


	-- loop through each Load in the #tmp, and loop through each leg of each load and grab the driver and update back to Driver in #tmp
	-- added all drivers into stuff and added back to Driver1 field

	IF OBJECT_ID('tempdb..#TEMPSTUFF') IS NOT NULL DROP TABLE #TEMPSTUFF

	SELECT	*
	INTO	#TEMPSTUFF
	FROM	(	SELECT	LoadId, DRIVER_1_ID
				FROM	#tmp
				UNION ALL
				SELECT	ls.LoadId, DRIVER_1_ID = 'Leg: ' + prsn.FirstName + ' ' + prsn.LastName 
				FROM	dispatch.loadstop ls
						JOIN #tmp t ON t.LoadId = ls.LoadId
						LEFT OUTER JOIN main.Person prsn ON ls.Driver1_PersonId = prsn.PersonId 
				WHERE	ls.LoadStopTypeId = 2
				AND		ls.Driver1_PersonId IS NOT NULL
				UNION ALL
				SELECT	ls.LoadId, DRIVER_1_ID = 'Leg: ' + prsn.FirstName + ' ' + prsn.LastName
				FROM	dispatch.loadstop ls
						JOIN #tmp t ON t.LoadId = ls.LoadId
						LEFT OUTER JOIN main.Person prsn ON ls.Driver2_PersonId = prsn.PersonId 
				WHERE	LoadStopTypeId = 2
				AND		Driver2_PersonId IS NOT NULL
			) C

	IF OBJECT_ID('tempdb..#CONCAT') IS NOT NULL DROP TABLE #CONCAT

	SELECT	*
	INTO	#CONCAT
	FROM	(	SELECT	A.LoadId,
						STUFF((	SELECT	', ' + CAST(B.DRIVER_1_ID AS VARCHAR(30))
								FROM	#TEMPSTUFF B
								WHERE	B.LoadId = A.LoadId
								FOR XML PATH('')), 1, 1, '') [DRIVER_1_ID]
				FROM	#TEMPSTUFF A
				GROUP BY A.LoadId
				--ORDER BY 1
			) C

	SELECT	t.LoadId,
			TripNumber,
			--Notes,
			SUBSTATUSES,
			CUSTNAME,
			StartLocation,
			CURRENT_STATUS,
			LoadStatusTypeId,
			EndLocation,
			DRIVER_1_ID = substring(c.DRIVER_1_ID,1,100),
			Truck_Number,
			CURRENT_MILEAGE,
			GrossRevenue,
			RPM,
			PICKUP_BY,
			PICKUP_BY_DATE,
			PICKUP_BY_TIME,
			DELIVER_BY,
			DELIVER_BY_DATE,
			DELIVER_BY_TIME,
			LockedPersonId,
			Pickup_StartDateTime_DisplayTimeInd,
			Delivered_StartDateTime_DisplayTimeInd,
			Dispatcher,
			ProblemInd,
			Trailer_ID			
	FROM	#tmp t
			LEFT JOIN #CONCAT c ON c.LoadId = t.LoadId
	ORDER BY LoadId DESC

	DROP TABLE #tmp

END


/*


        -- Hide Cancelled and Billed Loads by default
        IF @ShowCancelledLoads = 1 -- show only cancelled loads when this is checked. Otherwise, never include Cancelled loads
                SELECT * FROM #tmp WHERE CURRENT_STATUS = 'Cancelled' and (isnull(@SearchAllString,'') <> '' and LoadId in (select LoadId from ufn_Load_Search_MultiFields(@SearchAllString)) or (isnull(@SearchAllString,'') = '' ))
                order by TripNumber desc
        else if @ShowBilledLoads = 0
                begin
                        IF OBJECT_ID('tempdb..#tmp2') IS NOT NULL DROP TABLE #tmp2
                        SELECT * into #tmp2 FROM #tmp WHERE CURRENT_STATUS <> 'Cancelled' and CURRENT_STATUS <> 'Billed' and (isnull(@SearchAllString,'') <> '' and LoadId in (select LoadId from ufn_Load_Search_MultiFields(@SearchAllString)) or (isnull(@SearchAllString,'') = '' ))
                        order by TripNumber desc
                end
        else if @ShowBilledLoads = 1
                begin
                        IF OBJECT_ID('tempdb..#tmp2') IS NOT NULL DROP TABLE #tmp2
                        SELECT * into #tmp2 FROM #tmp WHERE CURRENT_STATUS <> 'Cancelled' order by TripNumber desc
                end

        if @SearchAllString is not null
                SELECT * FROM #tmp2 where LoadId not in (select LoadId from ufn_Load_Search_MultiFields(@SearchAllString))
        else
                SELECT * FROM #tmp2 

        IF OBJECT_ID('tempdb..#tmp') IS NOT NULL DROP TABLE #tmp
        IF OBJECT_ID('tempdb..#tmp2') IS NOT NULL DROP TABLE #tmp2
*/
GO


