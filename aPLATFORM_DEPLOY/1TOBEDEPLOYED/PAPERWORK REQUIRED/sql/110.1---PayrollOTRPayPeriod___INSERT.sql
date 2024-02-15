USE [RedBone]
GO

DELETE FROM [payroll].[PayrollOTRPayPeriod];

INSERT INTO [payroll].[PayrollOTRPayPeriod] ([Code] ,[PayrollOTRStatusId] ,[BeginDate] ,[EndDate]) VALUES ('2350', 1, '2023-12-10 00:00:00.000', '2023-12-17 00:00:00.000');
GO

SELECT count(*) as 'Number OTR Pay Periods' FROM [payroll].[PayrollOTRPayPeriod];
GO

