USE [RedBoneThomas]
GO

--#######################################################
--SOURCE: vPayrollOTRStaging___withpersonsremoved
--#######################################################

--------------------------------------------------------------------------------------------------------------------------
--SETUP
--------------------------------------------------------------------------------------------------------------------------
	--literals
		DECLARE @QBENTRYTYPE_EARNINGS VARCHAR(8)
		SET @QBENTRYTYPE_EARNINGS = 'Earnings';
		DECLARE @QBENTRYTYPE_OTHERPAYROLLITEMS VARCHAR(25)
		SET @QBENTRYTYPE_OTHERPAYROLLITEMS = 'Other Payroll Items';

		--qb item names
		DECLARE @QBITEMNAME_PERMILEOTR VARCHAR(25)
		SET @QBITEMNAME_PERMILEOTR = 'Per Mile (Redbone - OTR)';
		DECLARE @QBITEMNAME_DOUBLEMILES VARCHAR(25)
		SET @QBITEMNAME_DOUBLEMILES = 'Double Miles';
		DECLARE @QBITEMNAME_DROPANDHOOK VARCHAR(25)
		SET @QBITEMNAME_DROPANDHOOK = 'Drop & Hook';
		DECLARE @QBITEMNAME_EXTRASTOPS VARCHAR(25)
		SET @QBITEMNAME_EXTRASTOPS = 'Extra Stops';
		DECLARE @QBITEMNAME_OTHERPAY VARCHAR(25)
		SET @QBITEMNAME_OTHERPAY = 'Other Pay';

		--wizard pay ids and paycodes
		DECLARE @PAYID_DOUBLEMILES INT
		SET @PAYID_DOUBLEMILES = 76;

		DECLARE @PAYCODE_DROPANDHOOK VARCHAR(25)
		SET @PAYCODE_DROPANDHOOK = 'Drop & Hook';

		DECLARE @PAYCODE_EXTRASTOPS VARCHAR(25)
		SET @PAYCODE_EXTRASTOPS = 'Extra Stops';

		DECLARE @PAYCODE_OTHERPAY VARCHAR(25)
		SET @PAYCODE_OTHERPAY = 'Other Pay';

	--get 'OTR' PersonTypeId
		DECLARE @OTRPERSONTYPE VARCHAR(25)
		SET @OTRPERSONTYPE = 'OTR';
		DECLARE @OTRPERSONTID int
		SET @OTRPERSONTID = (SELECT PersonTypeId FROM main.PersonTypes pt WHERE PersonType = @OTRPERSONTYPE);


--------------------------------------------------------------------------------------------------------------------------
--DriverPaidMiles
--------------------------------------------------------------------------------------------------------------------------	
	--'Per Diem' Pay Code
		DECLARE @PerDiemPayCode VARCHAR(8)
		SET @PerDiemPayCode = 'Per Diem';

		DECLARE @DriverPaidMiles TABLE (PersonId int NULL, DriverPaidMiles int NULL);
			INSERT INTO @DriverPaidMiles
			SELECT
				DriverPersonId as PersonId, ROUND(SUM(Quantity), 2) as DriverPaidMiles
			FROM
				payroll.vPayrollOTRStaging___withpersonsremoved ps
			WHERE
				PayCode = @PerDiemPayCode
			GROUP BY
				DriverPersonId
			--ORDER BY pm.PersonId
			;
			--SELECT * FROM @DriverPaidMiles;


--------------------------------------------------------------------------------------------------------------------------
--#QuickBooksData INSERTS
--------------------------------------------------------------------------------------------------------------------------
	-- #QuickBooksData
		DROP TABLE IF EXISTS #QuickBooksData;
		CREATE TABLE #QuickBooksData
		(

			personId INT,
			entryType VARCHAR(50),
			itemName VARCHAR(50),
			quantity INT,
			otherPayrollItemsPay decimal(18,2),
			PayId INT,
			PayCode VARCHAR(25),
			PickOrigin VARCHAR(25)
		);










	--Driver Paid Miles (@@DriverPaidMiles)
		--85
		INSERT INTO #QuickBooksData (personId, entryType, itemName, quantity, otherPayrollItemsPay, PayId, PayCode, PickOrigin)
			SELECT dpm.PersonId, @QBENTRYTYPE_EARNINGS, @QBITEMNAME_PERMILEOTR, dpm.DriverPaidMiles, NULL, NULL, NULL, NULL
			FROM @DriverPaidMiles dpm
		;






					SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 100) as 'Entry Type', itemName as 'Item Type', quantity as 'Quantity', otherPayrollItemsPay as 'Other Pay', PayId, PayCode, PickOrigin
					FROM
					#QuickBooksData qbd
					JOIN main.Person p ON qbd.personId = p.PersonId
					--WHERE LastName = 'ONTIVEROS'
					ORDER BY
					p.FirstName, p.LastName, entryType, itemName, quantity, otherPayrollItemsPay
					;







	/*

		--76
	--Double Miles
		INSERT INTO #QuickBooksData (personId, entryType, itemName, quantity, otherPayrollItemsPay, PayId)
			SELECT ps.DriverPersonId, @QBENTRYTYPE_EARNINGS, @QBITEMNAME_DOUBLEMILES, ROUND(SUM(Quantity), 2), NULL, @PAYID_DOUBLEMILES
				FROM
					--payroll.PayrollStagingOTR_10_10__10_17_____2023 ps
					payroll.vPayrollOTRStaging___withpersonsremoved ps
			WHERE 
			PayId = @PAYID_DOUBLEMILES
			GROUP BY ps.DriverPersonId
		;

		--73
	--Drop & Hook
		INSERT INTO #QuickBooksData (personId, entryType, itemName, quantity, otherPayrollItemsPay)
			SELECT ps.DriverPersonId, @QBENTRYTYPE_EARNINGS, @QBITEMNAME_DROPANDHOOK, ROUND(SUM(Quantity), 2), NULL
				FROM
					--payroll.PayrollStagingOTR_10_10__10_17_____2023 ps
					payroll.vPayrollOTRStaging___withpersonsremoved ps
			WHERE
			paycode = @PAYCODE_DROPANDHOOK
			GROUP BY ps.DriverPersonId
		;

		--73
	--Extra Stops
		INSERT INTO #QuickBooksData (personId, entryType, itemName, quantity, otherPayrollItemsPay)
			SELECT ps.DriverPersonId, @QBENTRYTYPE_EARNINGS, @QBITEMNAME_EXTRASTOPS, ROUND(SUM(Quantity), 2), NULL
				FROM
					--payroll.PayrollStagingOTR_10_10__10_17_____2023 ps
					payroll.vPayrollOTRStaging___withpersonsremoved ps
			WHERE
			paycode = @PAYCODE_EXTRASTOPS
			GROUP BY ps.DriverPersonId
		;


	--Other Pay
		INSERT INTO #QuickBooksData (personId, entryType, itemName, quantity, otherPayrollItemsPay)
			SELECT ps.DriverPersonId, @QBENTRYTYPE_OTHERPAYROLLITEMS, PickOrigin, ROUND(SUM(Quantity), 2), ROUND(SUM(TOTALPAY), 2)
				FROM
					--payroll.PayrollStagingOTR_10_10__10_17_____2023 ps
					payroll.vPayrollOTRStaging___withpersonsremoved ps
			WHERE
			paycode = @PAYCODE_OTHERPAY
			GROUP BY ps.DriverPersonId, PickOrigin
		;


--------------------------------------------------------------------------------------------------------------------------
--asdf
--------------------------------------------------------------------------------------------------------------------------

*/

























		
--======================================================================
/*

		SELECT itemName, sum(quantity) as 'quantity total', sum(otherPayrollItemsPay) as 'pay total'
		FROM
		#QuickBooksData qbd
		JOIN main.Person p ON qbd.personId = p.PersonId
		group by itemName
		ORDER BY
		'pay total'
		;
	
		SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 1) as 'tp', itemName, quantity as 'quant', otherPayrollItemsPay as 'Oth Pay'--, p.PersonId
		FROM
		#QuickBooksData qbd
		JOIN main.Person p ON qbd.personId = p.PersonId
		where itemName= 'Extra Stops'
		ORDER BY
		p.FirstName, p.LastName, entryType, itemName
		;
		
		----------------------
					SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 100) as 'tp', itemName, quantity as 'quant', otherPayrollItemsPay as 'Oth Pay'--, p.PersonId
					FROM
					#QuickBooksData qbd
					JOIN main.Person p ON qbd.personId = p.PersonId
					--WHERE LastName = 'ONTIVEROS'
					ORDER BY
					p.FirstName, p.LastName, entryType, itemName, quantity, otherPayrollItemsPay
					;
		----------------------
		
			SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 100) as 'tp', itemName, quantity as 'quant', otherPayrollItemsPay as 'Oth Pay'--, p.PersonId
			FROM
			#QuickBooksData qbd
			JOIN main.Person p ON qbd.personId = p.PersonId
			WHERE entryType = 'Earnings'
			ORDER BY
			p.FirstName, p.LastName, entryType, itemName, quantity, otherPayrollItemsPay
			;
		
			SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 100) as 'tp', itemName, quantity as 'quant', otherPayrollItemsPay as 'Oth Pay'--, p.PersonId
			FROM
			#QuickBooksData qbd
			JOIN main.Person p ON qbd.personId = p.PersonId
			WHERE entryType = 'Other Payroll Items'
			ORDER BY
			p.FirstName, p.LastName, entryType, itemName, quantity, otherPayrollItemsPay
			;


		SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 1) as 'tp', itemName, quantity as 'quant', otherPayrollItemsPay as 'Oth Pay'--, p.PersonId
		FROM
		#QuickBooksData qbd
		JOIN main.Person p ON qbd.personId = p.PersonId
		ORDER BY
		p.FirstName, p.LastName, entryType, itemName
		;
		

--SELECT ps.name, driverpersonid, * FROM payroll.vPayrollOTRStaging___withpersonsremoved ps where driverpersonid = 2518 order by ps.name, paycode 
--SELECT ps.name, driverpersonid, * FROM payroll.vPayrollOTRStaging___withpersonsremoved ps where totalPay = '50.00' and payperiodending = '2023-12-16 00:00:00.000' order by ps.name, paycode 
--SELECT ps.name, driverpersonid, * FROM dispatch.PR_OTR_History ps where totalPay = '50.00' and payperiodending = '2023-12-16 00:00:00.000' order by ps.name, paycode 


		SELECT distinct(itemName) FROM #QuickBooksData qbd 
		WHERE otherPayrollItemsPay is null
		ORDER BY  itemName

		SELECT distinct(itemName) FROM #QuickBooksData qbd 
		WHERE otherPayrollItemsPay is not null
		ORDER BY  itemName
			
		--Double Miles
		--Drop & Hook
		--Extra Stops
		--Per Mile (Redbone - OTR)

		--ADVANCE
		--ADVANCE FEE
		--Clean Inspection
		--DETENTION
		--LAYOVER
		--Orientation Bonus
		--REIMBURSE
		
		--PayId
		--PayCode

*/














/*

					--****
						SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 100) as 'tp', itemName, quantity as 'quant', otherPayrollItemsPay as 'Oth Pay', PayId, PayCode FROM #QuickBooksData qbd JOIN main.Person p ON qbd.personId = p.PersonId
						--WHERE LastName = 'ONTIVEROS'
						--WHERE otherPayrollItemsPay is not null
						ORDER BY p.FirstName, p.LastName, entryType, itemName, quantity, otherPayrollItemsPay;








				SELECT top 2000
					 name, PayCode, payid, PickOrigin, *
				FROM
					dispatch.PR_OTR_History ps
				WHERE
					PayPeriodEnding = '2023-12-16 00:00:00.000'
					--and name like '%Ont%'

				order by ps.name


				



				SELECT top 2000
					 name, PayCode, payid, PickOrigin, *
				FROM
					dispatch.PR_OTR_History ps
				WHERE
					PayPeriodEnding = '2023-12-16 00:00:00.000'
					--and payid is null
					and payid is not null
					--and paycode = 'Other Pay'
				order by ps.name





						--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
									--**PayId/PayCode
										SELECT 
											 payid, paycode
										FROM
											dispatch.PR_OTR_History ps
										WHERE
											PayPeriodEnding = '2023-12-16 00:00:00.000'
										group by payid, paycode
										order by payid, paycode



									--**PayCode/PickOrigin
										SELECT 
											 PayCode, PickOrigin
										FROM
											dispatch.PR_OTR_History ps
										WHERE
											payid is null
											and
											PayPeriodEnding = '2023-12-16 00:00:00.000'										
										group by PayCode, PickOrigin
										order by PayCode, PickOrigin
						--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^











					

				SELECT
					 name, PayCode, payid, PickOrigin, *
				FROM
					dispatch.PR_OTR_History ps
				WHERE
					PayPeriodEnding = '2023-12-16 00:00:00.000'
					--and name like '%Ont%'

				order by ps.name


				



				/*
				PayId/PayCode rules:
					- id is null
						- code = 'Other Pay'
					- id is not null
						- code = 'Other Pay'

				*/



*/