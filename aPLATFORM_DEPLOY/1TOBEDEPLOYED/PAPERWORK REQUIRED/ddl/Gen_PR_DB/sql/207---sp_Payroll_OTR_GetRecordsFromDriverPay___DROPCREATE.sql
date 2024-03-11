/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetRecordsFromDriverPay]    Script Date: 2/14/2024 10:05:27 AM ******/
DROP PROCEDURE IF EXISTS [payroll].[sp_Payroll_OTR_GetRecordsFromDriverPay]
GO

/****** Object:  StoredProcedure [payroll].[sp_Payroll_OTR_GetRecordsFromDriverPay]    Script Date: 2/14/2024 10:05:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [payroll].[sp_Payroll_OTR_GetRecordsFromDriverPay]
(
	@PayDateStartDt date
	,@PayDateEndDt date
)
as

/*
	exec sp_Payroll_OTR_GetRecordsFromDriverPay '12/10/2023', '12/16/2023'
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
		and p.IsActive = 1

GO


