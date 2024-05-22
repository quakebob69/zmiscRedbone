			select TOP (1000000) 
				exdata.PayPeriodId as period_code,
				OriginatingOTRPayPeriodId,
				CONCAT(pers.firstName, ' ', pers.lastName) AS full_name,
				typ.Name as type_name,
				itm.Name as item_name,
				ppo.Code as period_code_orig,
				LoadIdOrDriverPayId,
				PayrollOTRPaymentHoldReasonId,
				Rate,
				Hours,
				Quantity
			from 
				export.AccountingExportPayrollData exdata
				join main.Person pers on exdata.PersonId = pers.PersonId
				join export.AccountingExportPayrollEntryType typ on exdata.AccountingExportPayrollEntryTypeId = typ.AccountingExportPayrollEntryTypeId
				join export.AccountingExportPayrollItem itm on exdata.AccountingExportPayrollItemId = itm.AccountingExportPayrollItemId
				join payroll.PayrollOTRPayPeriod ppo on exdata.OriginatingOTRPayPeriodId = ppo.PayrollOTRPayPeriodId
			where------------------------------------------------------------------------
				--(exdata.PersonId = 2451 OR exdata.PersonId =  1252) and
				(OriginatingOTRPayPeriodId = (SELECT
													TOP 1 PayrollOTRPayPeriodId 
													FROM [payroll].[PayrollOTRPayPeriod]
													WHERE
													IsActive = 1)
				AND
				PayPeriodId IS NULL)


				--OR
				--()

			order by 
				period_code,
				full_name,
				typ.Name,
				itm.Name
