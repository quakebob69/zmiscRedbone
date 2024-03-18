USE [RedBoneThomas]
GO


		DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetRecordsFromLoad_____loaddata___payrollTEMPDANNY]
		GO
		

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetRecordsFromLoad_____loaddata___payrollTEMPDANNY]    Script Date: 3/18/2024 10:47:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [payroll].[sp_Payroll_OTR_GetRecordsFromLoad_____loaddata___payrollTEMPDANNY]
(
	@PayPeriodStart date
	,@PayPeriodEnd date
)
as
/*
	exec sp_Payroll_OTR_GetRecordsFromLoad_____loaddata___payrollTEMPDANNY '12/10/2023', '12/16/2023'
*/

SET NOCOUNT ON;
IF 1=0 BEGIN
SET FMTONLY OFF
END

	--asdf
        SELECT [Name]
        , LoadId
        , TripNumber
        , TruckNumber
        , Client_Id
        , PickupBy
        , DeliverBy
        , DriverType
        , LegInd
        , PickOrigin
        , DropDest
        , DriverPersonId
        , PayCode
        , PayId
        , Quantity
        , PayRateAmount
		, PUnitId
        FROM [payroll].[PayrollOTRStaging_____loaddata___payrollTEMPDANNY]
GO