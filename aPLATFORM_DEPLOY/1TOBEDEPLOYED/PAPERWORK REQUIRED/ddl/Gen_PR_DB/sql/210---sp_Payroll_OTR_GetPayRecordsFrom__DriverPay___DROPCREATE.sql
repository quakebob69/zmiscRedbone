/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetPayRecordsFrom__DriverPay]    Script Date: 2/14/2024 10:05:27 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetPayRecordsFrom__DriverPay]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetPayRecordsFrom__DriverPay]    Script Date: 2/14/2024 10:05:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [payroll].[sp_Payroll_OTR_GetPayRecordsFrom__DriverPay]
(
	@PayDateStartDt date
	,@PayDateEndDt date
	--,@DriverPersonId int
)
as

/*
exec sp_Payroll_OTR_GetPayRecordsFrom__DriverPay '08/01/2021', '08/07/2021'
*/

SELECT 
	DriverId 
	,DriverName = p.FirstName + ' ' + p.LastName
	,pc.PayCode
	,pc.PayCodeDescription
	,dp.PayNotes
	,PayQuantity = cast(dp.PayQuantity as decimal(10,2))
	,PayRate = cast(dp.PayRate as decimal(10,2))
	,TotalPay = cast(dp.TotalPay as decimal(10,2))
	,TripNumber = dp.TripNumber
	,dp.PayDate
	,pEntered.FirstName
	,DriverPersonId = cast(p.PersonId as int)
FROM
	dispatch.DriverPay dp inner join main.Person p on dp.PersonId = p.PersonId
	inner join main.Driver d on d.PersonId = dp.PersonId
	inner join dispatch.PayCode pc on dp.PayCodeId = pc.PayCodeId
	inner join main.Person pEntered on pEntered.PersonId = dp.UpdatedByPersonId
WHERE 
	cast(dp.PayDate as date) between @PayDateStartDt and @PayDateEndDt
	and p.PersonId in (select PersonId from main.PersonTypeMapping where PersonId = p.PersonId and PersonTypeId = 4) -- PersonType OTR
	and p.PersonId in (select PersonId from main.BusinessEntityPersonMapping where PersonId = p.PersonId and BusinessEntityTypeId in (1,2)) -- Redbone Trucking Inc or Double Down Trucking Inc
--	and p.PersonId = @DriverPersonId
	and p.IsActive = 1
	
/*


select * from dispatch.DriverPay


select * from dispatch.PayCode


Old Access query for reference
-- DRIVER_PAY_bydel_new.sql 
-- sub report query
SELECT 
	P.DRIVER_ID, 
	D.LAST_NAME & ', ' & D.FIRST_NAME AS NAME, 
	P.PAY_CODE, 
	P.PAY_DESCRIPTION, 
	P.PAY_NOTES, 
	P.TOTAL_PAY, 
	P.TRIP_NUMBER, 
	P.PAY_DATE, 
	P.ENTERED_BY
FROM 
	DRIVERPAY AS P INNER JOIN DRIVER AS D ON D.DRIVER_ID = P.DRIVER_ID
WHERE 
	PAY_DATE >= FORMS!PAYROLL_DATES_bydel!TEXT0 
	AND PAY_DATE <= FORMS!PAYROLL_DATES_bydel!TEXT2 & " 23:59:59" 
	and driver_type = 'C' 
	and EMPLOYED_BY IN ('REDBONE','DOUBLE DOWN');

*/

GO


