SET QUOTED_IDENTIFIER ON
DELETE FROM [payroll].[PayrollOTRPayPeriod];
GO

--PAST
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '46', 'ASDF', 6, 0, '2023-11-19 00:00:00.000', '2023-11-26 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '47', 'ASDF', 6, 0, '2023-11-26 00:00:00.000', '2023-12-03 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '48', 'ASDF', 6, 0, '2023-12-03 00:00:00.000', '2023-12-10 00:00:00.000', 0, 0);
GO

--FUTURE
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '49', 'ASDF', 1, 0, '2023-12-10 00:00:00.000', '2023-12-17 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '50', 'ASDF', 1, 0, '2023-12-17 00:00:00.000', '2023-12-24 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '51', 'ASDF', 1, 0, '2023-12-24 00:00:00.000', '2023-12-31 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2023', '52', 'ASDF', 1, 0, '2023-12-31 00:00:00.000', '2024-01-07 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2024', '01', 'ASDF', 1, 0, '2024-01-07 00:00:00.000', '2024-01-14 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2024', '02', 'ASDF', 1, 0, '2024-01-14 00:00:00.000', '2024-01-21 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([FY], [NUMBER], [CODE], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES (
'2024', '03', 'ASDF', 1, 0, '2024-01-21 00:00:00.000', '2024-01-28 00:00:00.000', 0, 0);
GO
