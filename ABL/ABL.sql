use [ABL2.0];

/*
	SELECT 
		SCHEMA_NAME(schema_id) AS SchemaName,
		t.name AS TableName,
		SUM(p.rows) AS Row_Count
	FROM 
		sys.tables t
	INNER JOIN      
		sys.partitions p ON t.object_id = p.object_id
	WHERE 
		t.is_ms_shipped = 0
		AND p.index_id IN (0,1)
	GROUP BY 
		SCHEMA_NAME(schema_id), t.name
	ORDER BY 
		SchemaName, Row_Count desc, TableName
*/


update company.GeneralInfo set CompanyName = 'ABL Trucking';

delete from dbo.LoadTrace_bak;
delete from dbo.CLIENT_FUEL_TRANS_Stage;
delete from dbo.DRIVERPAY_temp;
delete from dbo.ClientAddress_bak_12_31_20;
delete from dbo.DRV_POINTS_NEW_delete;
delete from dbo.PR_Staged_DD;
delete from dbo.DRIVER_Temp;
delete from dbo.VENDOR;
delete from dbo."PUNIT_FromAccess09.29.20";
delete from dbo."TRAILER10.23.20";
delete from dbo.GOALS_Stage;
delete from dbo.FedExId_Staging;
delete from dbo.LineHaul_PD;
delete from dbo.Loads_bak_12_31_20;


--dbo.sysdiagrams
	-- Drop the sysdiagrams table
	IF OBJECT_ID('dbo.sysdiagrams', 'U') IS NOT NULL
		DROP TABLE dbo.sysdiagrams;

	-- Drop the stored procedures
	IF OBJECT_ID('dbo.sp_alterdiagram', 'P') IS NOT NULL
		DROP PROCEDURE dbo.sp_alterdiagram;

	IF OBJECT_ID('dbo.sp_creatediagram', 'P') IS NOT NULL
		DROP PROCEDURE dbo.sp_creatediagram;

	IF OBJECT_ID('dbo.sp_dropdiagram', 'P') IS NOT NULL
		DROP PROCEDURE dbo.sp_dropdiagram;

	IF OBJECT_ID('dbo.sp_helpdiagramdefinition', 'P') IS NOT NULL
		DROP PROCEDURE dbo.sp_helpdiagramdefinition;

	IF OBJECT_ID('dbo.sp_helpdiagrams', 'P') IS NOT NULL
		DROP PROCEDURE dbo.sp_helpdiagrams;

	IF OBJECT_ID('dbo.sp_renamediagram', 'P') IS NOT NULL
		DROP PROCEDURE dbo.sp_renamediagram;

	IF OBJECT_ID('dbo.sp_upgraddiagrams', 'P') IS NOT NULL
		DROP PROCEDURE dbo.sp_upgraddiagrams;


delete from dbo.GOALS_DISPATCHER_Stage;
delete from dbo.TestData_Employees;
delete from dbo."1";
delete from dbo.proto_DispatcherByDivisionPerformance;
delete from dbo.proto_DispatcherPerformance;
delete from dbo.LeaseOperatorSettlementReportSummary;

delete from dispatch.FUEL_IMPORT;
delete from dispatch.LoadStatus;
delete from dispatch.PR_SettlementStmt_History;


	delete from equipment.DocumentApproval;
		delete from equipment.ConditionRecord;


	delete from dispatch.LoadFileRequestTemp;
	delete from dispatch.LoadFileRequest;
	delete from dispatch.LoadDriverEvent;
	delete from dispatch.LoadStatusUpdate_Pending;
	delete from dispatch.LoadFile;
	delete from dispatch.AccCharge;
		delete from dispatch.LoadStop;


delete from dispatch.LoadNotes;
delete from dispatch.FUEL_IMPORT_Archive;
delete from dispatch.PR_OTR_History;
delete from dispatch.Log;
delete from dispatch.TRANSCHECK_IMPORT;


	delete from dispatch.LoadTrace;
	delete from dispatch.LoadBilling;
	delete from dispatch.Load_BusinessInstructions;
	delete from dispatch.LoadStop_Time_Updates;
	delete from dispatch.LoadToLoadStatusSubType;
		delete from dispatch.Load;


delete from dispatch.LoadStop_ReferenceNumbers;
delete from dispatch.DriverPay;
delete from dispatch.GasStation;
delete from dispatch.FuelTaxRates;
delete from dispatch.TerminalList;
delete from dispatch.Mileage_DD_Staged;
delete from dispatch.PR_Staged_GJ;
delete from dispatch.PR_Staged_DD;
delete from dispatch.LoadFileRequest;
delete from dispatch.PR_SettlementStmt_Processing;
delete from dispatch.PR_Staged_RB;
delete from dispatch.MileageGoals;


	delete from dispatch.ScheduleDrivers;
	delete from dispatch.ScheduleDaysMapping;
	delete from dispatch.Schedule;
		delete from dispatch.Punit;


delete from dispatch.TargetVsActualMileage;
delete from dispatch.MileageActual;
delete from dispatch.Trailer;
delete from dispatch.PUNIT_Staging;
delete from dispatch.FuelSurcharge;
delete from dispatch.CompanyGoal;
delete from dispatch.DispatcherGoal;
delete from dispatch.DivisionGoal;
delete from dispatch.MileageDivisionDesc;


	delete from equipment.PUnitRegistrationMapping;										
	update equipment.PUnit set DispatchFleetId = NULL;
	update equipment.PUnit set DispatchFleetManagerId = NULL;
	update main.Driver set PunitId = NULL;
	delete from equipment.PunitMapping;
	delete from equipment.PUnitSpecificationMapping;
	delete from equipment.PUnitServiceIntervalMapping;
	delete from equipment.PunitMappingPerson;
	delete from equipment.PUnit;
		delete from dispatch.DispatchFleet;


delete from equipment.PUnitGoalMapping;
delete from equipment.PUnitRegistrationTemplateMapping;
delete from equipment.PUnitSpecificationTemplateMapping;
delete from factoring.Settings;

delete from feeds.Omnitracs_T2060_Proximity;
delete from feeds.Omnitracs_T2060;
delete from feeds.Omnitracs_T2060_Equipment;
delete from feeds.Omnitracs_DriverLog;
delete from feeds.Omnitracs_T4010_Proximity;
delete from feeds.Omnitracs_T4010;
delete from feeds.Omnitracs_T4010_Equipment;
delete from feeds.Omnitracs_Control;

delete from logistics.LoadStatus;
delete from logistics.LoadStop;
delete from logistics.Carrier_AccCharge;
delete from logistics.AccCharge;
delete from logistics.LoadFile;
delete from logistics.LoadNotes;
delete from logistics.LoadTrace;
delete from logistics.Load;

delete from edi.LoadTenders_Updates_Stops_MarksAndNumbers;
delete from edi.LoadTenders_Stops_MarksAndNumbers;
delete from edi.LoadTenders_Updates_Stops_OrderIdDetail;
delete from edi.LoadTenders_Updates_BusinessInstructions;
delete from edi.LoadTenders_Updates_Stops;
delete from edi.LoadTenders_Updates_Stops_ReferenceNumbers;
delete from edi.Incoming;
delete from edi.LoadTenders_Updates;
delete from edi.LoadTenders_Updates_Parties;
delete from edi.LoadTenders_Updates_Equipment;
delete from edi.LoadTenders_Stops_OrderIdDetail;
delete from edi.Outgoing_214;
delete from edi.LoadTenders_Stops_ReferenceNumbers;
delete from edi.LoadTenders_Stops;
delete from edi.LoadTenders_BusinessInstructions;
delete from edi.LoadTenders;
delete from edi.LoadTenders_Parties;
delete from edi.Outgoing_990;
delete from edi.LoadTenders_Equipment;



































select TOP 100 * from main.BusinessEnityType;

select TOP 100 * from main.PhoneNumberType;
select TOP 100 * from main.ClientEdi_StatusSettings;
select TOP 100 * from main.PersonPayRateAttributeMapping;
select TOP 100 * from main.QuickBooksCompanyFileToSync;
select TOP 100 * from main.AvailabilityType;
select TOP 100 * from main.ClientType;
select TOP 100 * from main.DivisionType;
select TOP 100 * from main.LocationType;
select TOP 100 * from main.PersonHiringStatusType;
select TOP 100 * from main.PersonMessageType;
select TOP 100 * from main.PersonPTOGroup;
select TOP 100 * from main.TimeClockZone;
select TOP 100 * from main.AddressType;
select TOP 100 * from main.ClientStatusType;
select TOP 100 * from main.PersonPay_FedExDriver_Desc;
select TOP 100 * from main.proto_CompanyPerformance;
select TOP 100 * from main.SubmitType;
select TOP 100 * from main.ClientFuelSurcharge_WeekEnding;
select TOP 100 * from main.ClientNote;
select TOP 100 * from main.FundingType;
select TOP 100 * from main.PersonGender;
select TOP 100 * from main.AccessToPlatformSync;
select TOP 100 * from main.AppNotification;
select TOP 100 * from main.AppNotificationType;
select TOP 100 * from main.PersonMessageDisplayType;




