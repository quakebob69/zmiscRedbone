USE [RedBone]
GO




--TABLES
	--TODO



--STORED PROCEDURES
	--PAY
																--DROP PROCEDURE IF EXISTS [asdf].[ASDF]
																--GO
	sp_PR_OTRReviewToHistory
	sp_DriverPayRollByDeliveryDate_Pay
	sp_DriverPayRollByDeliveryDate_sub_Processing

	--PTO
	sp_Payroll_PTO_Accrual_OTR
	sp_Payroll_PTO_Accrual_Admin

	--OTHER (DON'T SEEM TO BE IN USE)
	sp_Payroll_PTO_Accrual_Admin_Test
	sp_Payroll_PTO_Accrual_OTR_Test
	sp_Payroll_PTO_Detail
	sp_Payroll_PTO_Detail_Scheduled

