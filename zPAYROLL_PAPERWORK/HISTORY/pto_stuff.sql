--2023-12-23 = SAT


--PR_OTR_History
--========================================================
	SELECT count(*) from dispatch.PR_OTR_History;

	SELECT distinct(PayPeriodEnding), count(PayPeriodEnding) from dispatch.PR_OTR_History
	group by PayPeriodEnding
	order by PayPeriodEnding desc;

	--asdf
	SELECT * from dispatch.PR_OTR_History where PayPeriodEnding = '2023-12-23 00:00:00.000'
	ORDER BY PayCode;
--========================================================




--PersonPTO
------------------------------------------------------------------------------------------
	SELECT count(*) from main.PersonPTO;

	SELECT * from main.PersonPTO
	where CreatedOn = '2023-12-23 00:00:00.000';

	SELECT distinct(CreatedOn), count(CreatedOn) from main.PersonPTO
	group by CreatedOn
	order by CreatedOn desc;


	SELECT distinct(PersonPTOTypeId), count(PersonPTOTypeId) from main.PersonPTO
	where CreatedOn = '2023-12-23 00:00:00.000'
	group by PersonPTOTypeId
	order by PersonPTOTypeId;

	--------------------
	--asdf
	SELECT * from main.PersonPTO
	where PersonPTOTypeId in (11,12)
	and notes like '%iles%'
	and notes not like '%EDEX%'
	and CreatedOn = '2023-12-23 00:00:00.000'
	order by PersonPTOId desc

	SELECT distinct(CreatedOn) from main.PersonPTO
	where PersonPTOTypeId in (11,12)
	and notes like '%iles%'
	and notes not like '%EDEX%'
	order by CreatedOn desc
	--------------------

		SELECT * from main.PersonPTO
		where PersonPTOTypeId in (11,12)
		and notes not like '%EDEX%'
		order by PersonPTOId desc

		SELECT * from main.PersonPTO
		where PersonPTOTypeId in (11,12)
		and notes not like '%iles%'
		and notes not like '%EDEX%'
		order by PersonPTOId desc

		SELECT * from main.PersonPTO
		where PersonPTOTypeId NOT in (11,12)
		and notes like '%iles%'
		order by PersonPTOId desc

		SELECT * from main.Person where PersonId in (1794, 2618, 2073);

--*************************************************
	--3
		SELECT TOP (1000) [PersonPTOGroupId]
			,[PersonPTOGroupName]
			,[Enabled]
		FROM [RedBone].[main].[PersonPTOGroup]
		where PersonPTOGroupName = 'Driver';

	--11,12
		SELECT [PersonPTOTypeId]
			,[LowerPTO]
			,[UpperPTO]
			,[PersonPTOName]
			,[PersonPTOValue]
			,[PersonPTOGroupTypeId]
			,[PTOSort]
			,[Enabled]
			,[PersonPTOQty]
		FROM [RedBone].[main].[PersonPTOType]
		where PersonPTOGroupTypeId = 3;
--*************************************************
------------------------------------------------------------------------------------------

























