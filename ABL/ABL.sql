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

delete from main.TimeClockEntry;


delete from main.BusinessEntityPersonMapping;
	delete from main.BusinessEnityType;


delete from main.ClientFuelSurcharge_WeekEnding;
delete from main.AccessToPlatformSync;
delete from main.AppNotification;
delete from main.ClientNote;
delete from main.QuickBooksSyncIssueNotificationPerson;
delete from main.System;
delete from main.FedExLinehaulRevenue;
delete from main.ClientFuelTrans;
delete from main.ClientFuelTrans;
delete from main.FedExFuel;



--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL
	--VIEWS
		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDF]
		GO

		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataPastPDFDetail]
		GO

		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataAllPDFHeld]
		GO

		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDF]
		GO

		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFDetail]
		GO

		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFHeld]
		GO
	
		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriodPDFReleased]
		GO

		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataHeld]
		GO




		DROP VIEW IF EXISTS [export].[vAccountingExportPayrollDataCurrentPeriod]
		GO

		DROP VIEW IF EXISTS [payroll].[vPayrollOTROpenPayPeriod]
		GO

		DROP VIEW IF EXISTS [payroll].[vPayrollOTRCurrentPayPeriod]
		GO
	
		DROP VIEW IF EXISTS [payroll].[vLoadCurrentPayPeriod]
		GO

		DROP VIEW IF EXISTS [payroll].[vLoadStopCurrentPayPeriod]
		GO

		--temp...
			DROP VIEW IF EXISTS [payroll].[vPR_OTR_History___withpersonsremoved]
			GO

			DROP VIEW IF EXISTS [payroll].[vPayrollOTRStaging___withpersonsremoved]
			GO
	
	
	--USER DEFINED FUNCTIONS
		DROP FUNCTION IF EXISTS [payroll].[getLoadStopCurrentPayPeriodLoadIds]
		GO


	--STORED PROCEDURES
		--'payroll' schema 
			DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_Admin_Accrual]
			GO

			DROP PROCEDURE IF EXISTS [payroll].[sp_PayrollPTO_OTR_Accrual]
			GO
		

			---------
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodFinalize]
			GO
		
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodTotals]
			GO
									
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodValidate]
			GO
						
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodSubmitForValidation]
			GO
		
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodUnHoldPayments]
			GO
		
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodHoldPayments]
			GO
						
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGenerateExportRecords]
			GO
						
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayroll]
			GO
		
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayrollLoad]
			GO

			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_StagePayrollDriverPay]
			GO	
		
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetRecordsFromLoad]
			GO
						  
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetRecordsFromDriverPay]
			GO
				
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodReset]
			GO
				
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodOpen]
			GO
				
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGetOpen]
			GO
				
			DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodGetActive]	
			GO
		
		
	--TABLES
		--'export' schema 
			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollData]') AND type in (N'U'))
				DROP TABLE [export].[AccountingExportPayrollData]
			GO

		
			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollItem]') AND type in (N'U'))
				DROP TABLE [export].[AccountingExportPayrollItem]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportPayrollEntryType]') AND type in (N'U'))
				DROP TABLE [export].[AccountingExportPayrollEntryType]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[export].[AccountingExportCompany]') AND type in (N'U'))
				DROP TABLE [export].[AccountingExportCompany]
			GO



		--'payroll' schema
			DROP TABLE IF EXISTS [payroll].[PayrollOTRDriverLoadChain]	
	
	
			DROP TABLE IF EXISTS [payroll].[PayrollOTRBenefitsEligibility]
	

			--PayrollOTRPersonLeaveType
				ALTER TABLE [main].[Person] DROP CONSTRAINT IF EXISTS DF_mainPerson_PayrollOTRPersonLeaveTypeId
				ALTER TABLE [main].[Person] DROP CONSTRAINT IF EXISTS [FK_Person_PayrollOTRPersonLeaveType];
				ALTER TABLE [main].[Person] DROP COLUMN IF EXISTS [PayrollOTRPersonLeaveTypeId];
				DROP TABLE IF EXISTS [payroll].[PayrollOTRPersonLeaveType]
		

			--PayrollOTRBenefitsStatus
				ALTER TABLE [main].[Person] DROP CONSTRAINT IF EXISTS [FK_Person_PayrollOTRBenefitsStatus];
				ALTER TABLE [main].[Person] DROP COLUMN IF EXISTS [PayrollOTRBenefitsStatusId];
				ALTER TABLE [main].[Person] DROP COLUMN IF EXISTS [FullTimeEligibleDate];
				DROP TABLE IF EXISTS [payroll].[PayrollOTRBenefitsStatus]
		

			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeaveScheduled]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRLeaveScheduled]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPaymentHoldReason]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRPaymentHoldReason]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeave]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRLeave]
			GO
		

			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRLeaveType]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRLeaveType]
			GO
		

			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStaging]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRStaging]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPayPeriod]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRPayPeriod]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRDataSource]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRDataSource]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRStatus]') AND type in (N'U'))
				DROP TABLE [payroll].[PayrollOTRStatus]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[Holiday]') AND type in (N'U'))
				DROP TABLE [payroll].[Holiday]
			GO


			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[main].[FY]') AND type in (N'U'))
				DROP TABLE [main].[FY]
			GO
--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL--PAYROLL



delete from main.PersonPTO;
delete from main.ClientAddress;


delete from main.ClientPerMileOverride;
delete from main.ClientBillingDefaults;
delete from main.ClientContactMapping;
delete from main.ClientFuelSurcharge;
delete from dispatch.AutoRatingDetail;
delete from main.ClientFuelCard;
delete from main.ClientFuel;



	delete from Service.ServiceStatus;					
		----------------------------------
		delete from Service.LaborStory;
		delete from Service.OrderClock;
			delete from Service.OrderDetail;	
		----------------------------------
			delete from Service.WorkOrder;

				delete from factoring.PlanDetail;
				delete from factoring.Plans;
				delete from main.ClientEdi_StatusSettings;

					delete from main.Client;



--asdf


delete from main.Client_Staging;
delete from main.ClientPerMileOverride;
delete from main.QuickBooksCompanyFileUpdateHistory;
delete from main.QuickBooksUpdateNeeded;


delete from main.PersonMessagePersonDisplayType;
	delete from main.PersonMessage;


delete from main.PersonNote;
delete from main.PersonQuitList;
delete from main.PersonPay;
delete from main.CertificationPersonMapping;
delete from main.PersonMessageViewRecord;
delete from main.PersonEntitlementMapping;
delete from main.PersonHiringStatusHistory;
delete from main.PersonPhoneNumber;
delete from main.FinancialTransaction;
		

														delete from main.LocationPersonMapping;
															delete from main.Driver;

																--------------------------------------
																delete from main.Feature;
																	delete from main.ReleaseNote;
																--------------------------------------
		
																delete from main.PersonTypeMapping;
																delete from main.PersonPTOGroupMapping;
																delete from main.PersonAddress;
































select * from Vendor.VendorPayCode;
;



select top 100 * from dispatch.PayCode;






DELETE FROM Vendor.VendorRating;
DELETE FROM Vendor.VendorDocument;
DELETE FROM Vendor.VendorContactMapping;
DELETE FROM Vendor.VendorPhoneNumber;
DELETE FROM Vendor.VendorAddress;
delete from Vendor.VendorPay;
DELETE FROM Vendor.VendorPayMemorized;
DELETE FROM Vendor.VendorPayMemorized_Staging;
delete from Vendor.VendorMC;
delete from Vendor.Insurance;
delete from Vendor.VendorFuelSurcharge;
delete from Vendor.VendorFuelSurcharge_WeekEnding;
	DELETE FROM Vendor.Carrier;
							
			
			






	delete from main.DivisionPersonMapping;
	delete from main.PersonEmailAddress;
	delete from main.UsageStatistic;
	delete from main.PersonPreference;
	delete from main.PersonPTOScheduled;
	delete from main.PersonDeviceNotificationMapping;
	delete from main.AppLayoutAppPreference;
	delete from main.AppLayout;
	delete from main.PersonPay_FedExDriver_Default;
	delete from main.PersonEntitlementGroup;
	delete from main.PersonEmploymentHistoryToCommercialEquipmentType;
	delete from main.PersonEmploymentHistory;
	delete from recruiting.ProfileChecklistItem;
	delete from recruiting.ProfileEventDetail;
	delete from recruiting.ProfileEvent;






	-- insert basic users for entry into the wizard



	recruiting.ExternalMessage











		delete from main.Person
		where
		(personid not in (select distinct CreatedByPersonId from Vendor.VendorPayCode))
		and
		(personid not in (select distinct CreatedByPersonId from dispatch.PayCode))
		
















select * from main.Person




































