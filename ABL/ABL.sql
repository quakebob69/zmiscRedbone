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
























