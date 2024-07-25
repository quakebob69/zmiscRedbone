DECLARE @PERSON_LIST TABLE
	(
		PersonId int
		,FirstName VARCHAR(100)
		,LastName VARCHAR(100)
		,Birthday VARCHAR(100)
	)

DECLARE @FINAL_LIST TABLE
	(
		PersonId int
		,FirstName VARCHAR(100)
		,LastName VARCHAR(100)
		,Birthday VARCHAR(100)
		,LicenseNumb VARCHAR(100)
		,LicenseState VARCHAR(100)
		,CDL_Y_N VARCHAR(100)
		,PhoneNumber VARCHAR(100)
		,DateHire VARCHAR(100)
		,DateTermination VARCHAR(100)
	)




DECLARE @PERSONID INT;
DECLARE @LAST_HiringStatusType INT;
DECLARE @HireRehireDate VARCHAR(100);
DECLARE @IDList TABLE (PersonId INT);




INSERT INTO @IDList (PersonId)
SELECT
	DISTINCT TOP 30 p.personid
	--p.personid
from
	main.PersonHiringStatusHistory sh
	join main.PersonHiringStatusType phst on phst.PersonHiringStatusTypeId = sh.PersonHiringStatusTypeId
	join main.Person p on p.PersonId = sh.PersonId
	join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
	join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
where
	ptm.PersonTypeId = 4
ORDER BY
	P.PersonId DESC;





DECLARE PersonId_cursor CURSOR FOR
SELECT PersonId FROM @IDList;

	OPEN PersonId_cursor;
		FETCH NEXT FROM PersonId_cursor INTO @PERSONID;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Perform the lookup here
			-- Replace this with your actual lookup logic
				--SELECT 'Result for ID ' + CAST(@PERSONID AS VARCHAR(10))
				--SELECT @LookupResult = 'Result for ID ' + CAST(@ID AS VARCHAR(10))
				--FROM SomeTable
				--WHERE SomeColumn = @ID;

			-- @LAST_HiringStatusType
			SELECT TOP 1 @LAST_HiringStatusType = PersonHiringStatusTypeId
			FROM main.PersonHiringStatusHistory
			WHERE PERSONID = @PERSONID
			order by StatusChangeDate desc;
			
			--hire/rehire date
			SELECT TOP 1 @HireRehireDate = StatusChangeDate
			FROM main.PersonHiringStatusHistory
			WHERE PERSONID = @PERSONID
			order by StatusChangeDate desc;

			IF @LAST_HiringStatusType = 1 OR @LAST_HiringStatusType = 4
			--IF @LAST_HiringStatusType = 1 OR @LAST_HiringStatusType = 2 OR @LAST_HiringStatusType = 3 OR @LAST_HiringStatusType = 4
			BEGIN


				INSERT INTO @FINAL_LIST
				(
					PersonId
					,FirstName
					,LastName
					,Birthday
					/*,LicenseNumb
					,LicenseState
					,CDL_Y_N
					,PhoneNumber*/
					,DateHire
					,DateTermination
				)
				/*VALUES
				(
					@PERSONID
					,'FirstName'
					,'LastName'
					,'Birthday'/*
					,'LicenseNumb'
					,'LicenseState'
					,'CDL_Y_N'
					,'PhoneNumber'*/
					,'DateHire'
					,''
				)*/
select top 1 
	@PERSONID,
	p.FirstName as 'Driver First Name'
	,p.LastName as 'Driver Last Name'
	
	,Convert(VARCHAR, p.Birthday, 101) as 'Date of Birth (MM/DD/YYYY)'

		/*,'asdf' as 'License State'
		,'asdf' as 'License #'
		,'asdf' as 'CDL (Y/N)'
	
		,'asdf' as 'Phone Number'*/
	
		,@HireRehireDate as 'Date of Hire (MM/DD/YYYY)'
		
		,''
	
/*	,'-------------------------' as '-------------------------'
	
	,pt.PersonType-- as 'Person Type'
	,phst.Description as 'HiringS tatus Type'
	,Convert(VARCHAR, sh.StatusChangeDate, 101) as 'Status Change Date'

	,'-------------------------' as '-------------------------'

	--,'asdf' as 'asdf'
	
	,*
	*/
	
from
	main.CertificationPersonMapping cpm
	join main.PersonHiringStatusHistory sh on cpm.PersonId = sh.Personid
	join main.PersonHiringStatusType phst on phst.PersonHiringStatusTypeId = sh.PersonHiringStatusTypeId
	join main.Person p on p.PersonId = sh.PersonId
	join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
	join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
where
	p.PERSONID = @PERSONID
		
		--and cpm
		--PHONE NUMBE

	and
	StatusChangeDate >= DATEADD(day, -366, GETDATE())
order by
	p.PersonId, StatusChangeDate



			END




			FETCH NEXT FROM PersonId_cursor INTO @PERSONID;
		END
	CLOSE PersonId_cursor;

DEALLOCATE PersonId_cursor;

SELECT * FROM @FINAL_LIST;














/*
select
	p.FirstName as 'Driver First Name'
	,p.LastName as 'Driver Last Name'
	
	,Convert(VARCHAR, p.Birthday, 101) as 'Date of Birth (MM/DD/YYYY)'

		,'asdf' as 'License State'
		,'asdf' as 'License #'
		,'asdf' as 'CDL (Y/N)'
	
		,'asdf' as 'Phone Number'
	
		,'asdf' as 'Date of Hire (MM/DD/YYYY)'
		
		,'asdf' as 'Date of Termination (MM/DD/YYYY)'
	
	,'-------------------------' as '-------------------------'
	
	,pt.PersonType-- as 'Person Type'
	,phst.Description as 'HiringS tatus Type'
	,Convert(VARCHAR, sh.StatusChangeDate, 101) as 'Status Change Date'

	,'-------------------------' as '-------------------------'

	--,'asdf' as 'asdf'
	
	,*

	
from
	main.CertificationPersonMapping cpm
	join main.PersonHiringStatusHistory sh on cpm.PersonId = sh.Personid
	join main.PersonHiringStatusType phst on phst.PersonHiringStatusTypeId = sh.PersonHiringStatusTypeId
	join main.Person p on p.PersonId = sh.PersonId
	join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
	join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
where
	ptm.PersonTypeId = 4
		
		--and cpm
		--PHONE NUMBE

	and
	StatusChangeDate >= DATEADD(day, -366, GETDATE())
order by
	p.PersonId, StatusChangeDate
	*/