USE [RedBone]
GO

DELETE FROM payroll.PayrollStagingOTR_10_10__10_17_____2023;
GO

INSERT INTO payroll.PayrollStagingOTR_10_10__10_17_____2023
SELECT * FROM payroll.PayrollStagingOTR_10_10__10_17_____2023___DATA;
GO

