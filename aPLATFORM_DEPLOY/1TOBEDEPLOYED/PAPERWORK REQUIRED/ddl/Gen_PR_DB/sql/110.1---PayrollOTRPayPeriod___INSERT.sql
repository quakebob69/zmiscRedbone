DELETE FROM [payroll].[PayrollOTRPayPeriod];
GO

INSERT INTO [payroll].[PayrollOTRPayPeriod] ([Code], [FY], [NUMBER], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES ('2350', 2023, 50, 1, 0, '2023-12-10 00:00:00.000', '2023-12-17 00:00:00.000', 0, 0);
INSERT INTO [payroll].[PayrollOTRPayPeriod] ([Code], [FY], [NUMBER], [PayrollOTRStatusId], [IsOpen] ,[BeginDate] ,[EndDate], [LoadDataIsStaged], [DriverPayDataIsStaged]) VALUES ('2351', 2023, 51, 1, 0, '2023-12-17 00:00:00.000', '2023-12-24 00:00:00.000', 0, 0);
GO
