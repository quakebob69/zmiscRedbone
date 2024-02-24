SET QUOTED_IDENTIFIER ON
DELETE FROM [payroll].[PayrollOTRPayPeriod];
GO

--PAST
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '46', '2346', 6, 0, '2023-11-19 00:00:00.000', '2023-11-26 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '47', '2347', 6, 0, '2023-11-26 00:00:00.000', '2023-12-03 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '48', '2348', 6, 0, '2023-12-03 00:00:00.000', '2023-12-10 00:00:00.000', 0, 0);
GO

--FUTURE
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '49', '2349', 1, 0, '2023-12-10 00:00:00.000', '2023-12-17 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '50', '2350', 1, 0, '2023-12-17 00:00:00.000', '2023-12-24 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '51', '2351', 1, 0, '2023-12-24 00:00:00.000', '2023-12-31 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '52', '2352', 1, 0, '2023-12-31 00:00:00.000', '2024-01-07 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2024', '01', '2401', 1, 0, '2024-01-07 00:00:00.000', '2024-01-14 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2024', '02', '2402', 1, 0, '2024-01-14 00:00:00.000', '2024-01-21 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2024', '03', '2403', 1, 0, '2024-01-21 00:00:00.000', '2024-01-28 00:00:00.000', 0, 0);
GO
