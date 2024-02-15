---------------------------------
--select * from dispatch.Load where loadid = 55734
--select * from dispatch.LoadStop where loadid = 55734
--1752
--2383
--select * from dispatch.Load where loadid = 1974
--select * from dispatch.LoadStop where loadid = 1974
--1988
--1752
--select * from vendor.VendorPay order by PayDate






------------------------------------------------------------------
	--OTR
		--BAD
			--@BeginDate date,
			--@EndDate date
--EXEC sp_PR_OTRMileageByDriver '11/01/2023', '11/30/2023'
					--EXEC sp_PR_OTRMileageByDateRange '11/01/2023', '11/30/2023'

		--GOOD
			--@ShowCancelledLoads bit,
			--@ShowBilledLoads bit,
			--@ShowReimbursablesOnly bit = 0,
			--@ShowNoBolAttachedOnly bit = 0,
			--@ShowClientType char(1) = 'A',
			--@ShowNoDropDatesOnly bit = 0,
			--@SearchAllString varchar(max) = ''
				EXEC sp_LoadsForStatus_Get___asdf____asdf 0, 1, 0, 0, 'A', 0, ''
				--EXEC sp_PR_OTRMileageByDateRange____________DELETETHIS____new 0, 1, 0, 0, 'A', 0, ''
				--EXEC sp_LoadsForStatus_Get 0, 1, 0, 0, 'A', 0, ''
					--EXEC sp_SettlementStmt_History_Report_Dates__________________________DELETETHIS 2482, '11/30/2023', '11/01/2023'
--EXEC sp_PR_OTRMileageByDateRange '11/01/2023', '11/30/2023'
---------------EXEC sp_PR_OTRMileageByDateRange____________DELETETHIS '11/01/2023', '11/30/2023'




--=format("{0:d}", Parameters.BeginDate.Value) + "  to  " + format("{0:d}", Parameters.EndDate.Value)

--DriverPaidMilesDetail_SettlementStmt.trdp (sp_LoadsForStatus_Get)
	--=RowNumber()
	--=Fields.Name
	--=sum(Fields.Quantity)


--asdf (sp_SettlementStmt_History_Report_Dates)
	--asdf
	--asdf
	--asdf





	-- FED EX
		--BAD
			--@PersonId int NULL
				--SELECT personid from main.person where FirstName = 'PABLO' and LastName = 'ROBLEDO'
			--@EndDate date
			--@BeginDate date
				--EXEC sp_SettlementStmt_History_Report_Dates__________________________DELETETHIS 2482, '11/30/2023', '11/01/2023'

		--GOOD
			--@ShowCancelledLoads bit,
			--@ShowBilledLoads bit,
			--@ShowReimbursablesOnly bit = 0,
			--@ShowNoBolAttachedOnly bit = 0,
			--@ShowClientType char(1) = 'A',
			--@ShowNoDropDatesOnly bit = 0,
			--@SearchAllString varchar(max) = ''
				--EXEC sp_LoadsForStatus_Get_DELETETHIS 0, 1, 0, 0, 'A', 0, ''

