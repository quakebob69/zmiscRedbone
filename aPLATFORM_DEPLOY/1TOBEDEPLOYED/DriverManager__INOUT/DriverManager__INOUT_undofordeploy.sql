
/****** Object:  StoredProcedure [dbo].[sp_LoadStop_GetCertainStop]    Script Date: 8/11/2024 12:41:13 PM ******/
DROP PROCEDURE [dbo].[sp_LoadStop_GetCertainStop]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadStop_GetCertainStop]    Script Date: 8/11/2024 12:41:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


		CREATE PROCEDURE [dbo].[sp_LoadStop_GetCertainStop]
		(
			@LoadStopId int
		)
		AS
		BEGIN

			SET NOCOUNT ON;

			-- sp_LoadStop_GetCertainStop 26436
			-- sp_LoadStop_GetCertainStop 25939
			-- sp_LoadStop_GetCertainStop 667
			-- sp_LoadStop_GetCertainStop 26321

			DECLARE @LastUpdtPersonId int = 0
	
			SELECT	s.LoadStopId, 
					s.LoadId, 
					CurrentStopStatusTypeId, 
					s.LoadStopTypeId, 
					LoadStopTypeName = UPPER(lst.StopNm),
					StopNumber, 
					EdiSequenceNumber = CAST(COALESCE(EdiSequenceNumber, 0) AS smallint),
					StopTypeNumber, 
					s.Driver1_PersonId, 
					s.Driver2_PersonId, 
					s.TruckPunitId, 
					s.Trailer1_TrailerId, 
					s.Trailer2_TrailerId, 
					s.EquipmentTypeId, 
					LoadApptTypeId, 
					s.ClientId, 
					Notes = (SELECT dbo.GetLoadStopNotes(l.LoadId, s.LoadStopId, 1, 0)), 
					NoteCount = (SELECT COUNT(*) FROM dispatch.LoadNotes WHERE LoadId = l.LoadId AND LoadStopId = s.LoadStopId AND ArchivedInd = 0),
					--AllStopsNoteCount = (SELECT COUNT(*) FROM dispatch.LoadNotes WHERE LoadId = l.LoadId AND LoadStopId <> 0 AND ArchivedInd = 0),
					StartDateTime, 
					ThroughDateTime, 
					PONumber, 
					BillOfLading, 
					PUNumber, 
					Other, 
					DeliveryNumber1, 
					DeliveryNumber2, 
					DeliveryNumber3, 
					DeliveryNumber4, 
					AdhocClientName, 
					AdhocClientAddressLine1, 
					AdhocClientAddressLine2, 
					AdhocClientCity, 
					AdhocClientState, 
					AdhocClientZipCode, 
					AdhocTimeZone, 
					GasStationId, 
					StartDateTime_DisplayTimeInd, 
					ThroughDateTime_DisplayTimeInd, 
					FuelGallons, 
					DEFGallons,
					s.PaidMiles, 
					s.PaidEmpty,
					DropStartDateTime, 
					DropStartDateTime_DisplayTimeInd, 
					ArrivalDateTime,
					DepartureDateTime,
					LoadTypeId,
					LastUpdtPersonId = @LastUpdtPersonId,
					TrailerDropDateTime,
					Mode = COALESCE(t.UsageIndicator, 'P'),
					DispatchStartDateTime,
					DispatchThroughDateTime,
					DispatchStartDateTime_DisplayTimeInd,
					DispatchThroughDateTime_DisplayTimeInd,
					ShowOnDispatchSheet,
					s.DispatchFleetManagerId
			FROM	dispatch.LoadStop s
					LEFT JOIN dispatch.Load l ON l.LoadId = s.LoadId
					LEFT JOIN dispatch.LoadStopType lst ON lst.LoadStopTypeId = s.LoadStopTypeId
					LEFT JOIN edi.LoadTenders t ON t.TenderId = l.TenderId
					LEFT JOIN edi.LoadTenders_Stops lts ON lts.LoadTenderTenderId = t.TenderId AND lts.SequenceNumber = s.EdiSequenceNumber
					--LEFT JOIN dispatch.LoadNotes ln ON ln.LoadId = l.LoadId AND ln.LoadStopId = l.LoadStopId -- ln.NoteTypeId = 2
			WHERE	s.LoadStopId = @LoadStopId
			ORDER BY StopNumber

		END
		--	SELECT	ls.LoadStopId, 
		--			ls.LoadId, 
		--			CurrentStopStatusTypeId, 
		--			ls.LoadStopTypeId, 
		--			LoadStopTypeName = UPPER(lst.StopNm),
		--			StopNumber, 
		--			StopTypeNumber, 
		--			EdiSequenceNumber = CAST(COALESCE(EdiSequenceNumber, 0) AS smallint),
		--			Driver1_PersonId, 
		--			Driver2_PersonId, 
		--			TruckPunitId, 
		--			Trailer1_TrailerId, 
		--			Trailer2_TrailerId, 
		--			EquipmentTypeId, 
		--			LoadApptTypeId, 
		--			ClientId, 
		--			Notes = (SELECT dbo.GetLoadStopNotes(ls.LoadId, ls.LoadStopId, 1, 0)), 
		--			StartDateTime, 
		--			ThroughDateTime, 
		--			PONumber, 
		--			BillOfLading, 
		--			PUNumber, 
		--			Other, 
		--			DeliveryNumber1, 
		--			DeliveryNumber2, 
		--			DeliveryNumber3, 
		--			DeliveryNumber4, 
		--			AdhocClientName, 
		--			AdhocClientAddressLine1, 
		--			AdhocClientAddressLine2, 
		--			AdhocClientCity, 
		--			AdhocClientState, 
		--			AdhocClientZipCode, 
		--			AdhocTimeZone, 
		--			GasStationId, 
		--			StartDateTime_DisplayTimeInd, 
		--			ThroughDateTime_DisplayTimeInd, 
		--			FuelGallons, 
		--			DEFGallons,
		--			PaidMiles, 
		--			PaidEmpty, 
		--			DropStartDateTime, 
		--			DropStartDateTime_DisplayTimeInd, 
		--			ArrivalDateTime,
		--			DepartureDateTime,
		--			LoadTypeId,
		--			LastUpdtPersonId = @LastUpdtPersonId
		--	FROM	dispatch.LoadStop ls
		--			LEFT JOIN dispatch.LoadStopType lst ON lst.LoadStopTypeId = ls.LoadStopTypeId
		--			--LEFT JOIN dispatch.LoadNotes ln ON ln.LoadId = ls.LoadId AND ln.LoadStopId = ls.LoadStopId -- ln.NoteTypeId = 2
		--	WHERE	ls.LoadId = @LoadId
		--	ORDER BY StopNumber

		--END
GO








/****** Object:  StoredProcedure [dbo].[sp_Load_Select]    Script Date: 8/11/2024 12:42:45 PM ******/
DROP PROCEDURE [dbo].[sp_Load_Select]
GO

/****** Object:  StoredProcedure [dbo].[sp_Load_Select]    Script Date: 8/11/2024 12:42:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


		CREATE PROCEDURE [dbo].[sp_Load_Select]
		(
			@LoadId int
		)
		AS
		BEGIN
			SET NOCOUNT ON;

			-- sp_Load_Select 6858

			SELECT	l.LoadId,
					TripNumber,
					TenderId = COALESCE(l.TenderId, 0),
					l.ClientId,
					Charges,
					ExtraCharges,
					Miles,
					PaidMiles,
					PaidEmpty,
					DeadHead,
					BillableMiles,
					Paid,
					RatePerMile,
					DispatcherPersonId,
					CreatedTs,
					AvailableBilling,
					--Notes = ln.NoteText + char(13) + char(10) +  + FORMAT(ln.NoteDate, 'd', 'us') + ' - ' + p.FirstName + ' ' + p.LastName,
					Notes = (SELECT dbo.GetLoadNotes(@LoadId, 1)),
					--Notes = '',
					NoteCountAll =	(SELECT COUNT(*) FROM dispatch.LoadNotes WHERE LoadId = @LoadId AND LoadStopid = 0 AND ArchivedInd = 0),
					NoteCountBilling =	(SELECT COUNT(*) FROM dispatch.LoadNotes WHERE LoadId = @LoadId AND LoadStopid = 0 AND NoteTypeId = 8 and ArchivedInd = 0),
					CommodityTypeId,
					LoadPlannerPersonId,
					EquipmentTypeId,
					Driver1_PersonId,
					Driver2_PersonId,
					TruckPunitId,
					Trailer1_TrailerId,
					Trailer2_TrailerId,
					Temperature,
					TemperatureTypeId,
					l.CustomerLoadNumber,
					l.Weight,
					l.Rate,
					LoadStatusTypeId,
					GrossRevenue,
					CreatedDt,
					CreatePersonId,
					LastUpdtDt,
					LastUpdtPersonId,
					SubTotal,
					LockedPersonId,
					Pieces,
					SendOriginalsInd,
					LoadTotal,
					AutoRatingInd,
					AccChargesTotal,
					PaperworkRecvdDate,
					InvoiceDate,
					ProblemInd,
					AllowPerBOLInd,
					BillableTotal,
					MileageFromLEGOverrideInd,
					Mode = COALESCE(t.UsageIndicator, 'P'),
					InvoiceApprovedByOps,
					InvoiceApprovedByAcctg,
					DispatchFleetManagerId
			FROM	dispatch.Load l
					LEFT JOIN edi.LoadTenders t ON t.TenderId = l.TenderId
					--LEFT JOIN dispatch.LoadNotes ln ON ln.LoadId = l.LoadId
					--LEFT JOIN main.Person p ON p.PersonId = ln.NotePersonId
			WHERE	l.LoadId = @LoadId

		END
GO


