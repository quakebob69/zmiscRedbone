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











										DROP TABLE IF EXISTS [payroll].[PayrollOTRBenefitsStatus]

										/****** Object:  Table [payroll].[PayrollOTRBenefitsStatus]    Script Date: 5/10/2024 7:11:52 AM ******/
										SET ANSI_NULLS ON
										GO

										SET QUOTED_IDENTIFIER ON
										GO

										CREATE TABLE [payroll].[PayrollOTRBenefitsStatus](
											[PayrollOTRBenefitsStatusId] [int] NOT NULL,
											[Name] [varchar](50) NOT NULL,
											[Description] [varchar](500) NULL,
											[DisplayOrder] [int] NOT NULL,
										 CONSTRAINT [PK_PayrollOTRBenefitsStatus] PRIMARY KEY CLUSTERED 
										(
											[PayrollOTRBenefitsStatusId] ASC
										)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
										 CONSTRAINT [UQ_PayrollOTRBenefitsStatus] UNIQUE NONCLUSTERED 
										(
											[Name] ASC
										)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
										) ON [PRIMARY]
										GO

										INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId], [Name] ,[Description] ,[DisplayOrder]) VALUES (1, 'New Employee Waiting Period', 'New Employee Waiting Period' , 1)
										INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId], [Name] ,[Description] ,[DisplayOrder]) VALUES (2, 'Part-Time', 'Part-Time' , 2)
										INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId], [Name] ,[Description] ,[DisplayOrder]) VALUES (3, 'Full-Time', 'Full-Time' , 3)
										INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId], [Name] ,[Description] ,[DisplayOrder]) VALUES (4, 'Probation', 'Probation' , 4)
										INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId], [Name] ,[Description] ,[DisplayOrder]) VALUES (5, 'Unassigned', 'Unassigned' , 5)
										INSERT INTO [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId], [Name] ,[Description] ,[DisplayOrder]) VALUES (6, 'N/A', 'N/A' , 6)	
										GO







										SET ANSI_NULLS ON
										GO
										SET QUOTED_IDENTIFIER ON
										GO

										ALTER TABLE [main].[Person]
										ADD [PayrollOTRBenefitsStatusId] [int] NULL
										GO

										ALTER TABLE [main].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PayrollOTRBenefitsStatus] FOREIGN KEY([PayrollOTRBenefitsStatusId])
										REFERENCES [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId])
										GO
										ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_PayrollOTRBenefitsStatus]
										GO


										ALTER TABLE [main].[Person]
										ADD [FullTimeEligibleDate] [datetime] NULL
										GO






										DECLARE @UnassignedId INT

										SET @UnassignedId =
											(
												SELECT PayrollOTRBenefitsStatusId from [payroll].[PayrollOTRBenefitsStatus] where Name = 'Unassigned'
											)


										--SELECT * from [payroll].[PayrollOTRBenefitsStatus] where PayrollOTRBenefitsStatusid = @FullTimeStatusId


										--All
										UPDATE [main].[Person] SET PayrollOTRBenefitsStatusId = @UnassignedId
										WHERE personid in (select personid from main.person /*WHERE IsActive = 1*/)


										DECLARE @FullTimeEligibleDate date
										SET @FullTimeEligibleDate = '11/01/2011'

										UPDATE [main].[Person] SET FullTimeEligibleDate = @FullTimeEligibleDate
										WHERE personid in (select personid from main.person /*WHERE IsActive = 1*/)





















			/****** Object:  Table [payroll].[PayrollOTRPersonLeaveType]    Script Date: 2/20/2024 9:39:54 AM ******/
			IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRPersonLeaveType]') AND type in (N'U'))
			DROP TABLE [payroll].[PayrollOTRPersonLeaveType]
			GO

			/****** Object:  Table [payroll].[PayrollOTRPersonLeaveType]    Script Date: 2/20/2024 9:39:54 AM ******/
			SET ANSI_NULLS ON
			GO
			SET QUOTED_IDENTIFIER ON
			GO

			CREATE TABLE [payroll].[PayrollOTRPersonLeaveType](
				[PayrollOTRPersonLeaveTypeId] [int] NOT NULL,
				[Type] [varchar](30) NOT NULL,
				[Description] [varchar](128) NOT NULL,
				[Enabled] [bit] NOT NULL,
			 CONSTRAINT [PK_PayrollOTRPersonLeaveType] PRIMARY KEY CLUSTERED 
			(
				[PayrollOTRPersonLeaveTypeId] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
			 CONSTRAINT [UQ_PayrollOTRPersonLeaveType] UNIQUE NONCLUSTERED 
			(
				[Type]
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
			GO





			INSERT INTO [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (1,'OTR' ,'OTR' ,1)
			INSERT INTO [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (2,'FedEx' ,'FedEx' ,1)
			INSERT INTO [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (3,'Salary' ,'Salary' ,1)
			INSERT INTO [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (4,'Hourly' ,'Hourly' ,1)
			INSERT INTO [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (5,'Unassigned' ,'Unassigned' ,1)
			INSERT INTO [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId] ,[Type], [Description], [Enabled]) VALUES (6,'N/A' ,'N/A' ,1)





			SET ANSI_NULLS ON
			GO
			SET QUOTED_IDENTIFIER ON
			GO

			ALTER TABLE [main].[Person]
			ADD [PayrollOTRPersonLeaveTypeId] [int] NULL CONSTRAINT DF_mainPerson_PayrollOTRPersonLeaveTypeId DEFAULT 0
			GO

			ALTER TABLE [main].[Person] WITH CHECK ADD  CONSTRAINT [FK_Person_PayrollOTRPersonLeaveType] FOREIGN KEY([PayrollOTRPersonLeaveTypeId])
			REFERENCES [payroll].[PayrollOTRPersonLeaveType] ([PayrollOTRPersonLeaveTypeId])
			GO
			ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_PayrollOTRPersonLeaveType]
			GO





			--select pers.personid, count(pers.personid) as 'tot types' from main.person pers join main.persontypemapping permap on pers.personid = permap.PersonId where pers.isactive = 1 and (persontypeid = 1 or persontypeid = 3  or persontypeid = 4) group by pers.personid having count(pers.personid) > 1 
			--select * from main.person where personid in (8, 62, 73, 2153)

			--OTR
			UPDATE [main].[Person] SET PayrollOTRPersonLeaveTypeId = 1
			WHERE personid in (select personid from main.persontypemapping permap where persontypeid = 4)

			--Fedex
			UPDATE [main].[Person] SET PayrollOTRPersonLeaveTypeId = 2
			WHERE personid in (select personid from main.persontypemapping permap where persontypeid = 3)

			--Salary
			UPDATE [main].[Person] SET PayrollOTRPersonLeaveTypeId = 3
			WHERE personid in (select personid from main.persontypemapping permap where persontypeid = 1)

			--All
			UPDATE [main].[Person] SET PayrollOTRPersonLeaveTypeId = 5
			WHERE personid in (select personid from main.person per where PayrollOTRPersonLeaveTypeId IS NULL)









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
		delete from recruiting.ExternalMessageAttachment;
		delete from recruiting.ExternalMessage;

				update
					main.Person
					set
						LastName ='USER',
						FirstName ='ADMIN',
						LoginId ='thomas@jadedsaint.com',
						Birthday ='1972-01-01',
						IsActive =1,
						AvailabilityTypeId =3,
						PersonGenderId =1,
						TIN ='111-11-1111',
						PayrollOTRBenefitsStatusId =5,
						FullTimeEligibleDate ='2011-11-01 00:00:00.000',
						PayrollOTRPersonLeaveTypeId =5
					where personid = 6;

					update Vendor.VendorPayCode set CreatedByPersonId = 6
					update dispatch.PayCode set CreatedByPersonId = 6

						delete from main.PersonEntitlementMapping
						insert into main.PersonEntitlementMapping (EntitlementId, PersonId) select Entitlementid, 6 from main.Entitlement where EntitlementId not in (select EntitlementId from main.Entitlement where EntitlementName = 'Reports-Company-Driver Dashboard' or EntitlementName like '%actoring%')

							delete from main.Person
							where
							(personid not in (select distinct CreatedByPersonId from Vendor.VendorPayCode))
							and
							(personid not in (select distinct CreatedByPersonId from dispatch.PayCode))



















