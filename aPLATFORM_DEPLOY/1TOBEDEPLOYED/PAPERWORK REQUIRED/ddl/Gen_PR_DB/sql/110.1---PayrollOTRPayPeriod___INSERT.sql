SET QUOTED_IDENTIFIER ON
DELETE FROM [payroll].[PayrollOTRPayPeriod];
GO

DECLARE @PayrollOTRStatusId_FINALIZED INT
SET @PayrollOTRStatusId_FINALIZED = 7;

--PAST
--INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
--VALUES ('2023', '46', '2346', @PayrollOTRStatusId_FINALIZED, 0, 0, '2023-11-19 00:00:00.000', '2023-11-26 00:00:00.000', '2023-12-01 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
--INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
--VALUES ('2023', '47', '2347', @PayrollOTRStatusId_FINALIZED, 0, 0, '2023-11-26 00:00:00.000', '2023-12-03 00:00:00.000', '2023-12-08 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
--INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
--VALUES ('2023', '48', '2348', @PayrollOTRStatusId_FINALIZED, 0, 0, '2023-12-03 00:00:00.000', '2023-12-10 00:00:00.000', '2023-12-15 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.0, 411, 1117.325, 53446.62, 12846.01);
--GO

--FUTURE
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
VALUES ('2023', '49', '2349', 1, 1, 0, 0, '2023-12-10 00:00:00.000', '2023-12-17 00:00:00.000', '2023-12-22 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
VALUES ('2023', '50', '2350', 1, 0, 0, 0, '2023-12-17 00:00:00.000', '2023-12-24 00:00:00.000', '2023-12-29 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
VALUES ('2023', '51', '2351', 1, 0, 0, 0, '2023-12-24 00:00:00.000', '2023-12-31 00:00:00.000', '2023-01-05 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
--INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
--VALUES ('2023', '52', '2352', 1, 0, 0, 0, '2023-12-31 00:00:00.000', '2024-01-07 00:00:00.000', '2023-01-12 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
--INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount]) 
--VALUES ('2024', '01', '2401', 1, 0, 0, 0, '2024-01-07 00:00:00.000', '2024-01-14 00:00:00.000', '2023-01-19 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
--INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
--VALUES ('2024', '02', '2402', 1, 0, 0, 0, '2024-01-14 00:00:00.000', '2024-01-21 00:00:00.000', '2023-01-26 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
--INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsActive],  [IsOpen], [IsDataLocked], [BeginDate], [EndDate], [CheckDate], [IsDataStaged], [TotalMiles], [TotalMilesValue], [TotalHeldAmount], [TotalOtherpayrollitemsAmount], [UTOTotalDaysAccrual], [UTOTotalDaysValue], [TotalEarningsAmount], [TotalDriverPayAmount])
--VALUES ('2024', '03', '2403', 1, 0, 0, 0, '2024-01-21 00:00:00.000', '2024-01-28 00:00:00.000', '2023-02-02 00:00:00.000', 0, 62463, 53446.62, 7846.88, 728.00, 411, 1117.325, 53446.62, 12846.01);
GO
