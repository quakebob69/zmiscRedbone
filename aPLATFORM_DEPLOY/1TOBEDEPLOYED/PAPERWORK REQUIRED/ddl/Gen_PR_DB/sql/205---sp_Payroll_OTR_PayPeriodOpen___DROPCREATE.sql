/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodOpen]    Script Date: 2/14/2024 2:10:19 PM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_PayPeriodOpen]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_PayPeriodOpen]    Script Date: 2/14/2024 2:10:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [payroll].[sp_Payroll_OTR_PayPeriodOpen]
(
	@LastUpdateBy INT
)
AS
/*
	exec [payroll].[sp_Payroll_OTR_PayPeriodOpen] 2775
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	DECLARE @ChangeToStatus VARCHAR(30)
	SET @ChangeToStatus = 'STAGING'

	DECLARE @ActivePayPeriodId INT
	EXEC @ActivePayPeriodId = [payroll].[sp_Payroll_OTR_PayPeriodGetActive] @LastUpdateBy
	
	--table(s)
		DELETE FROM [payroll].[PayrollOTRStaging]
		
		DELETE FROM [export].[AccountingExportPayrollData]
		WHERE OriginatingOTRPayPeriodId = @ActivePayPeriodId

	--IsOpen/PayrollOTRStatus
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET IsOpen = 1, PayrollOTRStatusId = (select PayrollOTRStatusId from payroll.PayrollOTRStatus where Name = @ChangeToStatus)
		WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId
		
	--Zero out pay period
		UPDATE [payroll].[PayrollOTRPayPeriod]
		SET
			IsDataLocked = 0,
			LoadDataIsStaged = 0,
			DriverPayDataIsStaged = 0--,
			--TotalMiles = 0,
			--TotalMilesValue = 0,
			--TotalHeldAmount = 0,
			--TotalOtherpayrollitemsAmount = 0,
			--UTOTotalDaysAccrual = 0,
			--UTOTotalDaysValue = 0,
			--TotalEarningsAmount = 0,
			--TotalDriverPayAmount = 0
		WHERE PayrollOTRPayPeriodId = @ActivePayPeriodId

GO