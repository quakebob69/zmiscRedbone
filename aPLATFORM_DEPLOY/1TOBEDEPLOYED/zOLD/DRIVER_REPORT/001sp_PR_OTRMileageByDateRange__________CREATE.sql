USE [RedBone_DriverReport]
GO

/****** Object:  StoredProcedure [dbo].[sp_PR_OTRMileageByDateRange]    Script Date: 12/13/2023 2:52:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_PR_OTRMileageByDateRange]

/*This sproc is used for the OTR ranking by miles for a dashboard report*/

(

@BeginDate date,
@EndDate date

--EXEC sp_PR_OTRMileageByDateRange '10/22/2023', '11/28/2023'
--
)

AS
BEGIN

/*
Declare @BeginDate date
declare @EndDate date
set @BeginDate = '09/01/2021'
set @EndDate = '09/30/2021'
*/

SELECT  
	Name
	,TripNumber
	,PickupBy
	,DeliverBy 
	,LegInd 
	,PickOrigin 
	,DropDest 
	,PayCode 
	,Quantity 
	,PayPeriodEnding 
	,P.PersonId

FROM dispatch.PR_OTR_History h
JOIN main.person p on p.PersonId = h.DriverPersonId
JOIN main.PersonTypeMapping ptm on ptm.PersonId = p.PersonId

WHERE paycode like '%Per Mile%'
AND paycode not like '%Doubles%'
AND ptm.PersonTypeId = 4
AND p.PersonId NOT in (8,73,1599)	--Exlude Al Jones, John Norris, James Young
AND p.IsActive = 1
AND h.PayPeriodEnding between @BeginDate and @EndDate

union all


select 

p.FirstName + ' ' + p.LastName as [name],
--vp.VendorId,
vp.TripNumber,
'' as PickupBy,
'' as DeliverBy,
0 as LegInd,
'' as PickOrgin,
'' as DropDest,
CAST(vp.VendorPayCodeId as varchar) as PayCode,
vp.PayQuantity,
vp.PayDate as PayPeriodEnding,
vp.Driver1PersonId



from vendor.VendorPay as VP

join main.person as P on p.PersonId = vp.Driver1PersonId


where vp.PayDate between @BeginDate and @EndDate
and vp.VendorPayCodeId = 79

order by name desc


END



GO

