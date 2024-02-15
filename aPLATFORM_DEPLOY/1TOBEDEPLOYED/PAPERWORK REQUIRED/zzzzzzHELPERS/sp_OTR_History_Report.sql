USE [RedBone]
GO

/****** Object:  StoredProcedure [dbo].[sp_OTR_History_Report]    Script Date: 2/5/2024 8:53:50 AM ******/
DROP PROCEDURE [dbo].[sp_OTR_History_Report]
GO

/****** Object:  StoredProcedure [dbo].[sp_OTR_History_Report]    Script Date: 2/5/2024 8:53:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_OTR_History_Report]
(
	@PersonId int --= 1977
	,@PayPeriodEnding date

	--sp_OTR_History_Report 1759, '12/16/2023'
)
as 

 SET NOCOUNT ON;
     IF 1=0 BEGIN
       SET FMTONLY OFF
     END


select  
	PersonId = DriverPersonId
	,FullName = p.FirstName + ' ' + p.LastName
	,LoadId
	,TripNumber
	,TruckNumber
	,PickupBy
	,DeliverBy
	,LegInd
	,PickOrigin
	,DropDest
	,PayCode
	,PayId
	,Quantity
	,PayRateAmount
	,TotalPay
	,PayPeriodEnding
	,PayrollNotes

from dispatch.PR_OTR_History h
join main.person p on p.PersonId = h.DriverPersonId

where h.DriverPersonId = @PersonId
and h.PayPeriodEnding = @PayPeriodEnding

ORDER BY PersonId, PickupBy, case when PayCode = 'Other Pay' then 2 else 1 end
GO


