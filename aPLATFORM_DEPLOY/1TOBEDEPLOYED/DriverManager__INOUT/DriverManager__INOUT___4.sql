			DROP TABLE IF EXISTS #TEMP_PUnit_Active
			CREATE TABLE #TEMP_PUnit_Active(
			PUnitId int NULL
			,Unit_ID [varchar](50) NULL
			,VIN [varchar](50) NULL
			,PUnitMakeId int NULL
			,PUnitMakeModelId int NULL
			,Mod_Year int NULL
			,Notes [text] NULL
			,InService [datetime] NULL
			,ActiveInd bit NULL
			,PlateNumber varchar(50) NULL
			,TireSize varchar(20) NULL
			,Company varchar(50) NULL
			,Division varchar(50) NULL
			,[Group] varchar(50) NULL
			, Client varchar(100) NULL
			,[Location] varchar(50) NULL
			,Indicator bit NULL
			,Indicatoryellow bit NULL
			,EquipTypeId int NULL
			)
			
			INSERT INTO #TEMP_PUnit_Active
			EXEC [dbo].[sp_Equipment_PUnit_For_Grid] 0






			DROP TABLE IF EXISTS #TEMP_PUnit_AssignedToDriverMans
			CREATE TABLE #TEMP_PUnit_AssignedToDriverMans(
			PUnitId int NULL
			)			
			INSERT INTO #TEMP_PUnit_AssignedToDriverMans (PUnitId)
			SELECT PUnitId FROM dispatch.vFleetManagerDriver where DispatchFleetManagerId = 1
			UNION ALL
			SELECT PUnitId FROM dispatch.vFleetManagerDriver where DispatchFleetManagerId = 2
			UNION ALL
			SELECT PUnitId FROM dispatch.vFleetManagerDriver where DispatchFleetManagerId = 3

			select
			(select count(distinct allTrcks.PUnitId) from #TEMP_PUnit_Active allTrcks)			
			-
			(select count(distinct asgnedTrucks.PUnitId) from #TEMP_PUnit_AssignedToDriverMans asgnedTrucks)

			select count(distinct allTrcks.PUnitId) from
			#TEMP_PUnit_Active allTrcks
			left join #TEMP_PUnit_AssignedToDriverMans asgnedTrucks on allTrcks.PUnitId = asgnedTrucks.PUnitId
			where asgnedTrucks.PUnitId IS NULL

			
			select count(distinct allTrcks.PUnitId) from #TEMP_PUnit_Active allTrcks
			
			select count(distinct asgnedTrucks.PUnitId) from #TEMP_PUnit_AssignedToDriverMans asgnedTrucks
			
			select distinct allTrcks.PUnitId from
			#TEMP_PUnit_Active allTrcks
			left join #TEMP_PUnit_AssignedToDriverMans asgnedTrucks on allTrcks.PUnitId = asgnedTrucks.PUnitId
			where asgnedTrucks.PUnitId IS NULL

