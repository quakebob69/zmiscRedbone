--DROP STUFF
------------------------------------------------
	DROP VIEW IF EXISTS [dispatch].[vInOut]
	GO

	DROP PROCEDURE IF EXISTS [dbo].[sp_Load_SaveFleetManager]
	GO

	DROP PROCEDURE IF EXISTS [dbo].[sp_Load_Select]
	GO


	IF EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE Name = N'DispatchFleetManagerId'
		AND Object_ID = Object_ID(N'[dispatch].[Load]')
	)
	BEGIN
		update [dispatch].[Load] set [DispatchFleetManagerId] = null;

		ALTER TABLE [dispatch].[Load]
			DROP CONSTRAINT [FK_Load_DispatchFleetManager];

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
		[DispatchFleetManagerId] [int] IDENTITY(1,1) NOT NULL,
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
	/****** Object:  StoredProcedure [dbo].sp_Load_SaveFleetManager]    Script Date: 7/10/2024 7:11:14 PM ******/
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
																																						select top 100 loadid from dispatch.load order by loadid desc
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





										l.loadid > 
										
										
														63741
										
										
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





--INSERT STUFF
-------------------------------------------------------------------------------------------------------------
	INSERT INTO [dispatch].[DispatchFleetManager] ([Name] ,[PersonId], [PhoneNumber]) VALUES ('Dickie Dos' , 45, '(801) 111-1111')
	INSERT INTO [dispatch].[DispatchFleetManager] ([Name] ,[PersonId], [PhoneNumber]) VALUES ('OTaRmy' , 2467, '(801) 222-2222')
	INSERT INTO [dispatch].[DispatchFleetManager] ([Name] ,[PersonId], [PhoneNumber]) VALUES ('Whirling Dervishes' , 2484, '(801) 333-3333')
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



	--Update [dispatch].[Load] set [DispatchFleetManagerId] = 2 where LoadId = 62602;	
	Update [dispatch].[Load] set [DispatchFleetManagerId] = 1 where LoadId % 10 IN (1, 2, 3);
	Update [dispatch].[Load] set [DispatchFleetManagerId] = 2 where LoadId % 10 IN (4, 5, 6);
	Update [dispatch].[Load] set [DispatchFleetManagerId] = 3 where LoadId % 10 IN (7, 8, 9);


--CHECK
-------------------------------------------------------------------------------------------------------------
	SELECT * FROM [dispatch].[DispatchFleetManager] 
	SELECT * FROM [equipment].[PUnit] WHERE [DispatchFleetManagerId] IS NOT NULL



/*
	--62602

	1642	260
	1591	261
	1648	262
	1649	263
	1650	264
	1651	265
	1652	266
	1653	267
	1654	268
	1655	269



	207 = spare
	272 = spare
*/








											------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												--63830
													--reset
														update dispatch.LoadStop set ArrivalDateTime = NULL where LoadId = 63830
														update dispatch.LoadStop set DepartureDateTime = NULL where LoadId = 63830



												--update dispatch.LoadStop set ArrivalDateTime = '2024-07-04 00:00:00.000' where LoadStopId = 106715
												--update dispatch.LoadStop set DepartureDateTime = '2024-07-04 00:00:00.000' where LoadStopId = 106715



												SELECT * FROM [dispatch].[vInOut]
												SELECT * FROM [dispatch].[vInOut] where loadid = 63830
											------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
											
