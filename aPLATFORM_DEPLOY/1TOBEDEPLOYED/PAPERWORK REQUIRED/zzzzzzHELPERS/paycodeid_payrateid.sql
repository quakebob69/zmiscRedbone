USE [RedBone]
GO

declare	@PayDateStartDt datetime
set	@PayDateStartDt = '01-01-2023';
declare	@PayDateEndDt datetime
set	@PayDateEndDt = '01-01-2028';

	--DriverPay
		--PayCodeId = dispatch.Paycode
			select distinct dp.PayCodeId
			from dispatch.DriverPay dp
			where
			cast(dp.PayDate as date) between @PayDateStartDt and @PayDateEndDt
			order by dp.PayCodeId

	--PR_OTR_History
		--PayCode (made up in sql script [ie not reference table]?)
			select distinct hist.PayCode 
			from [dispatch].[PR_OTR_History] hist
			where
			hist.PayPeriodEnding > '01-01-2023'
			order by PayCode

		--PayId = PersonPayRate? (not foreign keyed)
			select distinct hist.PayId
			from [dispatch].[PR_OTR_History] hist
			where
			hist.PayPeriodEnding > '01-01-2023'
			order by PayId

 		--PayCode and PayId
			select distinct hist.PayCode, hist.PayId
			from [dispatch].[PR_OTR_History] hist
			where
			hist.PayPeriodEnding > '01-01-2023'
			order by PayCode, PayId

 