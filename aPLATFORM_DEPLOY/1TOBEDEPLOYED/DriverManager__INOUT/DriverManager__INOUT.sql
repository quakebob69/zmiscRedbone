--DROP STUFF
------------------------------------------------
	DROP PROCEDURE IF EXISTS [dbo].[sp_LoadStop_SaveFleetManager]
	GO

	DROP VIEW IF EXISTS [dispatch].[vFleetManagerDriver]
	GO

	DROP VIEW IF EXISTS [dispatch].[vInOut]
	GO

	DROP PROCEDURE IF EXISTS [dbo].[sp_Load_SaveFleetManager]
	GO

	DROP PROCEDURE IF EXISTS [dbo].[sp_Load_Select]
	GO

	DROP PROCEDURE IF EXISTS [dbo].[sp_LoadStop_GetCertainStop]
	GO


	IF EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE Name = N'DispatchFleetManagerId'
		AND Object_ID = Object_ID(N'[dispatch].[LoadStop]')
	)
	BEGIN
		update [dispatch].[LoadStop] set [DispatchFleetManagerId] = null;

		ALTER TABLE [dispatch].[LoadStop]
			DROP CONSTRAINT [FK_LoadStop_DispatchFleetManager]

		ALTER TABLE [dispatch].[LoadStop]
			DROP COLUMN IF EXISTS [DispatchFleetManagerId];
	END


	IF EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE Name = N'DispatchFleetManagerId'
		AND Object_ID = Object_ID(N'[dispatch].[Load]')
	)
	BEGIN
		update [dispatch].[Load] set [DispatchFleetManagerId] = null;

		ALTER TABLE [dispatch].[Load]
			DROP CONSTRAINT [FK_Load_DispatchFleetManager]

		ALTER TABLE [dispatch].[Load]
			DROP COLUMN IF EXISTS [DispatchFleetManagerId];
	END
	 

	IF EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE Name = N'DispatchFleetManagerId'
		AND Object_ID = Object_ID(N'[equipment].[PUnit]')
	)
	BEGIN
		update [equipment].[PUnit] set [DispatchFleetManagerId] = null;

		ALTER TABLE [equipment].[PUnit]
			DROP CONSTRAINT [FK_PUnit_DispatchFleetManager];

		ALTER TABLE [equipment].[PUnit]
			DROP COLUMN IF EXISTS [DispatchFleetManagerId];
	END
	  

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dispatch].[DispatchFleetManager]') AND type in (N'U'))
	BEGIN
		DELETE FROM [dispatch].[DispatchFleetManager]

		ALTER TABLE [dispatch].[DispatchFleetManager]
			DROP CONSTRAINT FK_DispatchFleetManager_Person;

		DROP TABLE [dispatch].[DispatchFleetManager]
	END










--ADD STUFF
------------------------------------------------
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE [dispatch].[DispatchFleetManager](
		[DispatchFleetManagerId] [int] NOT NULL,
		[Name] [varchar](128) NOT NULL,
		[PersonId] [int] NULL,
		[PhoneNumber] [varchar](50) NULL
	 CONSTRAINT [PK_DispatchFleetManager] PRIMARY KEY CLUSTERED 
	(
		[DispatchFleetManagerId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	 CONSTRAINT [UQ_DispatchFleetManager] UNIQUE NONCLUSTERED 
	(
		[Name]
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	GO

	ALTER TABLE [dispatch].[DispatchFleetManager]  WITH CHECK ADD  CONSTRAINT [FK_DispatchFleetManager_Person] FOREIGN KEY([PersonId])
	REFERENCES [main].[Person] ([PersonId])
	GO
	ALTER TABLE [dispatch].[DispatchFleetManager] CHECK CONSTRAINT [FK_DispatchFleetManager_Person]
	GO



	------------
	ALTER TABLE [equipment].[PUnit]
	ADD [DispatchFleetManagerId] [int] NULL
	GO

	ALTER TABLE [equipment].[PUnit]  WITH CHECK ADD  CONSTRAINT [FK_PUnit_DispatchFleetManager] FOREIGN KEY([DispatchFleetManagerId])
	REFERENCES [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId])
	GO
	ALTER TABLE [equipment].[PUnit] CHECK CONSTRAINT [FK_PUnit_DispatchFleetManager]
	GO



	------------
	ALTER TABLE [dispatch].[Load]
	ADD [DispatchFleetManagerId] [int] NULL
	GO

	ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_DispatchFleetManager] FOREIGN KEY([DispatchFleetManagerId])
	REFERENCES [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId])
	GO
	ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_DispatchFleetManager]
	GO



	------------
	ALTER TABLE [dispatch].[LoadStop]
	ADD [DispatchFleetManagerId] [int] NULL
	GO

	ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_DispatchFleetManager] FOREIGN KEY([DispatchFleetManagerId])
	REFERENCES [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId])
	GO
	ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_DispatchFleetManager]
	GO



	------------
		/****** Object:  StoredProcedure [dbo].[sp_Load_Select]    Script Date: 7/10/2024 6:26:48 PM ******/
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






	------------
		/****** Object:  StoredProcedure [dbo].[sp_LoadStop_GetCertainStop]    Script Date: 7/17/2024 11:46:37 PM ******/
		DROP PROCEDURE IF EXISTS [dbo].[sp_LoadStop_GetCertainStop]
		GO

		/****** Object:  StoredProcedure [dbo].[sp_LoadStop_GetCertainStop]    Script Date: 7/17/2024 11:46:37 PM ******/
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











	------------
	/****** Object:  StoredProcedure [dbo].[sp_Load_SaveFleetManager]    Script Date: 7/10/2024 7:11:14 PM ******/
		SET ANSI_NULLS ON
		GO

		SET QUOTED_IDENTIFIER ON
		GO

		CREATE procedure [dbo].[sp_Load_SaveFleetManager]
		(
			@LoadId int
			,@DispatchFleetManagerId int
		)
		as 
		UPDATE       
			dispatch.[Load]
		SET                
			DispatchFleetManagerId = @DispatchFleetManagerId
		WHERE        
			(LoadId = @LoadId)
		GO







------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																																				DROP VIEW IF EXISTS [dispatch].[vInOut]
																																				GO

																																				CREATE VIEW [dispatch].[vInOut] AS
																																					/*
																																						select top 6 loadid from dispatch.load order by loadid desc
																																					*/

																																					select top 1000
																																						l.dispatchFleetManagerid as DispatchFleetManagerId
																																						,fm.Name as DispatchFleetName
																																						,p.FirstName + ' ' + p.LastName as DispatchFleetManagerFullName
																																						,l.loadid
																																						,ls.loadStopid
																																						,lst.StopNm as StopTypeName
																																						,CONVERT(VARCHAR(16), ls.StartDateTime, 120) AS Scheduled
																																						,CAST(ls.StartDateTime AS DATE) AS ScheduledDate
																																						,CONVERT(VARCHAR(5), ls.StartDateTime, 108) AS ScheduledTime
																																						,ls.ArrivalDateTime as ActualArrivalDateTime
																																						,ls.DepartureDateTime as ActualDepartureDateTime
																																					from
																																						dispatch.load l
																																						join dispatch.loadStop ls on l.loadid = ls.loadid
																																						join dispatch.LoadStopType lst on ls.LoadStopTypeId = lst.LoadStopTypeId
																																						left outer join dispatch.DispatchFleetManager fm on l.dispatchFleetManagerid = fm.DispatchFleetManagerId
																																						left outer join main.Person p on p.PersonId = fm.PersonId
																																					where





										l.loadid >= 
										
										
														63853
										
										
										and





																																						(ls.LoadStopTypeId = 1 or ls.LoadStopTypeId = 3)
																																						and
																																						(ls.ArrivalDateTime is null OR ls.DepartureDateTime is null)

																																					order by
																																					l.dispatchFleetManagerid
																																					,l.LoadId desc
																																					,ls.StopNumber
																																					
																																				GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------






------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	DROP VIEW IF EXISTS [dispatch].[vFleetManagerDriver]
	GO

	CREATE VIEW [dispatch].[vFleetManagerDriver] AS

		select  top 1000
			e.Unit_ID
			,e.PunitId
			,dfm.DispatchFleetManagerId
			,dfm.name as 'DriverManagerName'
			,ISNULL(p.PersonId, 0) AS PersonId
			,p.FirstName + ' ' + p.LastName as DriverFullName
			,p.FirstName as DriverFirstName
			,p.LastName as DriverLastName
		from
			main.Driver d
			full join main.Person p on d.PersonId = p.personid	
			full join equipment.PUnit e on d.PunitId = e.punitid
			full join dispatch.DispatchFleetManager dfm on dfm.DispatchFleetManagerid = e.DispatchFleetManagerid
			full join equipment.PunitMapping pum on e.PUnitId = pum.PunitId
			full join main.GroupType gt on gt.GroupTypeId = pum.GroupTypeId
		where 
			ActiveInd = 1
			and
			pum.PUnitActiveTypeId = 1
		ORDER BY TRY_CAST(e.Unit_ID AS INT)

	GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------














------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	/****** Object:  StoredProcedure [dbo].[sp_LoadStop_SaveFleetManager]    Script Date: 7/10/2024 7:11:14 PM ******/
		SET ANSI_NULLS ON
		GO

		SET QUOTED_IDENTIFIER ON
		GO

		CREATE procedure [dbo].[sp_LoadStop_SaveFleetManager]
		(
			@LoadId int
			,@LoadStopId int
			,@DispatchFleetManagerId int
		)
		as 
		UPDATE       
			dispatch.[LoadStop]
		SET                
			DispatchFleetManagerId = @DispatchFleetManagerId
		WHERE        
			(LoadId = @LoadId)
			and
			(LoadStopId = @LoadStopId)
		GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




























--INSERT STUFF
-------------------------------------------------------------------------------------------------------------
	INSERT INTO [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId], [Name], [PersonId], [PhoneNumber]) VALUES (1, 'Driver Manager 1' , 45, '(801) 111-1111')
	INSERT INTO [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId], [Name], [PersonId], [PhoneNumber]) VALUES (2, 'Driver Manager 2' , 2467, '(801) 222-2222')
	INSERT INTO [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId], [Name], [PersonId], [PhoneNumber]) VALUES (3, 'Driver Manager 3' , 2484, '(801) 333-3333')
	GO



	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '204';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '205';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '206';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '207';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '208';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '209';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '210';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '211';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '212';
	GO




	
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '261';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '262';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '263';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '264';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '265';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '266';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '267';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '268';
		UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '269';
		GO


UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '234';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '235';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '236';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '237';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '238';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '239';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '240';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '241';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '242';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '243';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '244';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '245';


UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '181';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '182';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '183';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '184';
UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '185';


	/**/



	Update [dispatch].[Load] set [DispatchFleetManagerId] = 1 where LoadId % 10 IN (1, 2, 3, 4);
	Update [dispatch].[Load] set [DispatchFleetManagerId] = 2 where LoadId % 10 IN (6);
	Update [dispatch].[Load] set [DispatchFleetManagerId] = 3 where LoadId % 10 IN (7, 8, 9);


--CHECK
-------------------------------------------------------------------------------------------------------------
	SELECT * FROM [dispatch].[DispatchFleetManager] 
	SELECT * FROM [equipment].[PUnit] WHERE [DispatchFleetManagerId] IS NOT NULL

	SELECT count(*) as vFleetManagerDriver__count FROM [dispatch].[vFleetManagerDriver] 
	SELECT * FROM [dispatch].[vFleetManagerDriver]

	--normal
	SELECT PersonId, DispatchFleetManagerId FROM [dispatch].[vFleetManagerDriver] where Unit_ID = '266'

	--spare
		SELECT PersonId, DispatchFleetManagerId FROM [dispatch].[vFleetManagerDriver] where Unit_ID = '207'

		SELECT PersonId, DispatchFleetManagerId FROM [dispatch].[vFleetManagerDriver] where PersonId = 2970











											------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												--63830
													--reset
														update dispatch.LoadStop set ArrivalDateTime = NULL where LoadId = 63853
														update dispatch.LoadStop set DepartureDateTime = NULL where LoadId = 63853



												--update dispatch.LoadStop set ArrivalDateTime = '2024-07-04 00:00:00.000' where LoadStopId = 106715
												--update dispatch.LoadStop set DepartureDateTime = '2024-07-04 00:00:00.000' where LoadStopId = 106715



												--SELECT * FROM [dispatch].[vInOut]
												--SELECT * FROM [dispatch].[vInOut] where loadid = 63856
											------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
											


											