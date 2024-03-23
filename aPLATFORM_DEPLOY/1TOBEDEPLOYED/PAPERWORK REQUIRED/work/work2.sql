
 --either select otr or local on load (then check if they should be paid for it or not (per leg?)

--ask alyssa what qb rates, amouts (eg my salary) are not stored in qb and only stored in the wizard (need to think about this in terms of history [eg employee raises history] - could you get this from qb?  the question is, what can''t you get from qb???)


--people management -- base top tabs based on person type (ie i shouldnt have driver pay)

--Alyssa gets an email from taylor for the additions (she said only miles are generated from the wizard currently) - move this functionality into the wizard to allow taylor to directly enter these items into driver pay (need to think about how entitlements would work for this)

--Alyssa get the xls fedex spreadsheet from the wizard payroll process

-- what is "Spot or Days" for fedex (from fedex xls for qb entry)?


-- think about how to do orientation since this is in vendor pay (but needs to not be paid until the driver gets at least 1 mile)
-- need to change in the wizard fedex's payroll item descriptions



-- need a hard cutoff for OTR payroll - Tuesday Midnight

-- ask if fedex is moving or otr

-- think of elegant solution to bad miles that are caught down the road

-- late paperwork will not show up in qb!  need to manage this in the wizard

-- al told alyssa that he told the managers that schedule vacation needs to be entered

-- think about 

-- FROM ALYSSA
	-- a fix in the wizard that would be amazing if it is possible...when we try to edit any of the driver pay items, it doesn't save any of the edits. if we enter them incorrectly we have to fully delete them and redo them. would be amazing if the "edit" button would do what it says it's doing


--THINK ABOUT THE BROKER THING THAT THEY USE AL FOR (AND OTHER MASSAGED/CONTRIVED DATA)

--TAKE ALL TEAMS STUFF OUT
--ASK ALL WHAT TO DO ABOUT HISTORY (GET A BETTER PICTURE OF OPTIONS BEFORE PRESENTING TO HIM)
--take the made up PayCode that is only used in sp code and turn it into a reference table
--take out 62 (--62 = customer info in personpayrate) from personpayrate (need to chnage all old 62's into 85s first in base table and all foreign keyed tables) [maybe create an active column]?
--take all crap out of all payroll tables that aren't being used (personPayRate, Paycode, Payitem etc etc.) [maybe create an active column?])
--OTR Drop Solo
--payroll audit will catch rates
--question - rafael he got 8 + 4 drops (8 solo and 4 doubles) [this is correct in the wizard and qb as per matt)
--the payroll generator looks at biz entities.  if you turn a person off/on from a biz entitie it changes the history.
--CHANGE ALL OF THE THINGS THAT HISTORY LOOKS AT THAT REFERENCES TABLES THAT CAN CHANGE (IF THIS ISN'T DONE, THE HISTORY WILL CHANGE AND GIVE INACCURATE RESULTS).  Need to capture snapshots for this and not allow any old data to be deleted etc.
 

--qb items:
	--Earnings:
		-- 'Per Mile (Redbone - Dedicated)'
		-- 'Doubles (Albertsons)'
		-- 'OTR Drop Solo'
		-- 'Drop & Hook (Doubles)'
	--other payroll items:
		-- 'Per Diem'


--ADD PAY DAY DATE TO PAY PERIOD TABLE?  (USE THIS TO DETECT WHAT SHOULD BE THE "ACTIVE PAYROLL PERIOD"?
--ISSUE - 1) HISTORY LINKS TO PERSON TABLE WHICH CHANGES OVER TIME 2) REPORTS/HISTORY SPs join to person for driver types as input.  3) reports will change based on what the person type is [I think the only thing that changes is whether the person is active or not.  Not sure why this is the case]
--LOOK at all of the crossed out or marked things on the pdf files
--Reimbursement, Deduction, Per Diem = other items as per Alyssa)
--LOOK FOR THE .10 CENT RATE THING IN THE HISTORY TABLE (CUZ NEED TO ADD IT TO THE QBDATA TABLE EITHER WAY (BETTER TO READ IT FROM THE TABLE THAN TO CONTRIVE IT FROM THE PER DIEM MILES)
--PER DIEM IS SET IN ONE PLACE IN QBs


USE [RedBoneThomas]
GO

--#######################################################
--SOURCE TABLE = PayrollStagingOTR_10_10__10_17_____2023
--#######################################################

--------------------------------------------------------------------------------------------------------------------------
--Return Data (#QuickBooksData)
--------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS #QuickBooksData;
CREATE TABLE #QuickBooksData
(

	personId INT,
	entryType VARCHAR(50),
	itemName VARCHAR(50),
	quantity INT,
	otherPayrollItemsPay decimal(18,2),
	PayId INT,
	PayCode VARCHAR(25)
);


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
				
	--'Per Diem' Pay Code
		DECLARE @PerDiemPayCode VARCHAR(8)
		SET @PerDiemPayCode = 'Per Diem';


--------------------------------------------------------------------------------------------------------------------------
--Driver Paid Miles (@DriverPaidMilesLegit)
--------------------------------------------------------------------------------------------------------------------------
	--populate @LegitOTRDrivers with legit OTR drivers (persons that that are only 'OTR' person types)
		--@PersonsWithOnePersonType
			DECLARE @PersonsWithOnePersonType TABLE (PersonId int NULL);
				INSERT INTO @PersonsWithOnePersonType
					SELECT
						p.PersonId--, count(pm.PersonTypeId) as NumPersonMappedTypes
					FROM
						main.Person p
						JOIN main.PersonTypeMapping pm ON p.PersonId = pm.PersonId
					GROUP BY
						p.PersonId
					HAVING
						COUNT(pm.PersonTypeId) = 1
				--ORDER BY p.PersonId
				;
			--SELECT * FROM @PersonsWithOnePersonType;

		--@PersonsWithOTRPersonType
			DECLARE @PersonsWithOTRPersonType TABLE (PersonId int NULL);
				INSERT INTO @PersonsWithOTRPersonType
					SELECT
						pm.PersonId
					FROM
						main.PersonTypeMapping pm
					WHERE
						pm.PersonTypeId = @OTRPERSONTID
					--ORDER BY pm.PersonId
				;
			--SELECT * FROM @PersonsWithOTRPersonType;

		--@LegitOTRDrivers
			DECLARE @LegitOTRDrivers TABLE (PersonId int NULL);
				INSERT INTO @LegitOTRDrivers
					SELECT
						p.PersonId
					FROM
						main.Person P
				;
			--SELECT * FROM @LegitOTRDrivers;

				/*
				OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD 
					DECLARE @LegitOTRDrivers TABLE (PersonId int NULL);
						INSERT INTO @LegitOTRDrivers
							SELECT
								one.PersonId
							FROM
								@PersonsWithOnePersonType one
								JOIN @PersonsWithOTRPersonType otr ON one.PersonId = otr.PersonId
							--ORDER BY pm.PersonId
						;
					--SELECT * FROM @LegitOTRDrivers;
				*/

		--@DriverPaidMilesLegit (exclude non-OTRs by joining with @LegitOTRDrivers)
			DECLARE @DriverPaidMilesLegit TABLE (PersonId int NULL, DriverPaidMiles int NULL);
				INSERT INTO @DriverPaidMilesLegit
				SELECT
					DriverPersonId as PersonId, ROUND(SUM(Quantity), 2) as DriverPaidMiles
				FROM
					--payroll.PayrollStagingOTR_10_10__10_17_____2023 ps
					payroll.vPayrollOTRStaging___withpersonsremoved ps
					--JOIN @LegitOTRDrivers legit ON ps.DriverPersonId = legit.PersonId
				WHERE
					PayCode = @PerDiemPayCode
				GROUP BY
					DriverPersonId
				--ORDER BY pm.PersonId
				;
			--SELECT * FROM @DriverPaidMilesLegit;


--------------------------------------------------------------------------------------------------------------------------
--#QuickBooksData INSERTS
--------------------------------------------------------------------------------------------------------------------------
	--Driver Paid Miles (@DriverPaidMilesLegit)
		--85
		INSERT INTO #QuickBooksData (personId, entryType, itemName, quantity, otherPayrollItemsPay)
			SELECT legit.PersonId, @QBENTRYTYPE_EARNINGS, @QBITEMNAME_PERMILEOTR, legit.DriverPaidMiles, NULL
			FROM @DriverPaidMilesLegit legit
		;

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




					SELECT p.FirstName, p.LastName, SUBSTRING(entryType, 1, 100) as 'tp', itemName, quantity as 'quant', otherPayrollItemsPay as 'Oth Pay', PayId, PayCode FROM #QuickBooksData qbd JOIN main.Person p ON qbd.personId = p.PersonId
					--WHERE LastName = 'ONTIVEROS'
					--WHERE otherPayrollItemsPay is not null
					ORDER BY p.FirstName, p.LastName, entryType, itemName, quantity, otherPayrollItemsPay;







				DECLARE @PerDiemPayCode VARCHAR(8)
				SET @PerDiemPayCode = 'Per Diem';

				SELECT top 2000
					 PayCode, payid, PickOrigin, *
				FROM
					--payroll.PayrollStagingOTR_10_10__10_17_____2023 ps
					dispatch.PR_OTR_History ps
					--JOIN @LegitOTRDrivers legit ON ps.DriverPersonId = legit.PersonId
				WHERE
					PayPeriodEnding = '2023-12-16 00:00:00.000'
					--PayCode = @PerDiemPayCode


