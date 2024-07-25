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
DECLARE @TermQuitDate VARCHAR(100);
DECLARE @PhoneNUMB VARCHAR(100);
DECLARE @LicenseNumb VARCHAR(100);
DECLARE @LicenseState VARCHAR(100);
DECLARE @IDList TABLE (PersonId INT);




INSERT INTO @IDList (PersonId)
SELECT
	--TOP 30 p.personid
	DISTINCT p.personid
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
			-- @LAST_HiringStatusType
			SET @LAST_HiringStatusType = '';
			SELECT TOP 1 @LAST_HiringStatusType = PersonHiringStatusTypeId
			FROM main.PersonHiringStatusHistory
			WHERE PERSONID = @PERSONID
			order by StatusChangeDate desc;

			--phone
			SET @PhoneNUMB = '';
			SELECT TOP 1 @PhoneNUMB = PhoneNumber
			FROM main.PersonPhoneNumber
			WHERE PERSONID = @PERSONID
			and UseForDispatch = 1

			SET @LicenseNumb = '';
			--LicenseNumb
			SELECT TOP 1 @LicenseNumb= CertificationCode
			FROM main.CertificationPersonMapping
			where
			PERSONID = @PERSONID
			and CertificationTypeId = 4

			SET @LicenseState = '';
			--LicenseState
			SELECT TOP 1 @LicenseState= CertificationState
			FROM main.CertificationPersonMapping
			where
			PERSONID = @PERSONID
			and CertificationTypeId = 4


			IF @LAST_HiringStatusType = 1 OR @LAST_HiringStatusType = 4
			BEGIN

						
				--hire/rehire date
				SET @HireRehireDate = ''
				SELECT TOP 1 @HireRehireDate = Convert(VARCHAR, StatusChangeDate, 101)
				FROM main.PersonHiringStatusHistory
				WHERE PERSONID = @PERSONID
				order by StatusChangeDate desc;


										INSERT INTO @FINAL_LIST
										(
											PersonId
											,FirstName
											,LastName
											,Birthday
											,LicenseNumb
											,LicenseState
											,CDL_Y_N
											,PhoneNumber
											,DateHire
											,DateTermination
										)
										select top 1 
											@PERSONID,
											p.FirstName
											,p.LastName
	
											,Convert(VARCHAR, p.Birthday, 101)

												,@LicenseNumb
												,@LicenseState
												,'TODO?'
	
												,@PhoneNUMB
	
												,@HireRehireDate as 'Date of Hire (MM/DD/YYYY)'
		
												,'N/A'
	
										/*	,'-------------------------' as '-------------------------'
	
											,pt.PersonType-- as 'Person Type'
											,phst.Description as 'HiringS tatus Type'
											,Convert(VARCHAR, sh.StatusChangeDate, 101) as 'Status Change Date'

											,'-------------------------' as '-------------------------'

											--,'asdf' as 'asdf'
	
											,*
											*/
	
										from
											--main.CertificationPersonMapping cpm
											--join main.PersonHiringStatusHistory sh on cpm.PersonId = sh.Personid
											main.PersonHiringStatusHistory sh
											--join main.PersonHiringStatusType phst on phst.PersonHiringStatusTypeId = sh.PersonHiringStatusTypeId
											join main.Person p on p.PersonId = sh.PersonId
											--join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
											--join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
											--join main.CertificationPersonMapping cpm on cpm.PersonId = p.personid
										where
											p.PERSONID = @PERSONID
											--and cpm.CertificationTypeId = 4-- or cpm.CertificationTypeId is null
											--and StatusChangeDate >= DATEADD(day, -366, GETDATE())
										order by
											StatusChangeDate desc;
			END

			ELSE
			BEGIN

				if exists (
						select top 1 
						@PERSONID,
						p.FirstName
						,p.LastName
	
						,Convert(VARCHAR, p.Birthday, 101)

							,@LicenseNumb
							,@LicenseState
							,'TODO?'
	
							,@PhoneNUMB
	
							,@HireRehireDate as 'Date of Hire (MM/DD/YYYY)'
		
							,'N/A'
	
					/*	,'-------------------------' as '-------------------------'
	
						,pt.PersonType-- as 'Person Type'
						,phst.Description as 'HiringS tatus Type'
						,Convert(VARCHAR, sh.StatusChangeDate, 101) as 'Status Change Date'

						,'-------------------------' as '-------------------------'

						--,'asdf' as 'asdf'
	
						,*
						*/
	
					from
						--main.CertificationPersonMapping cpm
						--join main.PersonHiringStatusHistory sh on cpm.PersonId = sh.Personid
						main.PersonHiringStatusHistory sh
						--join main.PersonHiringStatusType phst on phst.PersonHiringStatusTypeId = sh.PersonHiringStatusTypeId
						join main.Person p on p.PersonId = sh.PersonId
						--join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
						--join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
						--join main.CertificationPersonMapping cpm on cpm.PersonId = p.personid
					where
						p.PERSONID = @PERSONID
						and StatusChangeDate >= DATEADD(day, -365, GETDATE())
					order by
						StatusChangeDate desc)

						BEGIN

							SET @HireRehireDate = '';
							--hire/rehire date
							SELECT TOP 1 @HireRehireDate = Convert(VARCHAR, StatusChangeDate, 101)
							FROM main.PersonHiringStatusHistory
							WHERE PERSONID = @PERSONID
							AND PersonHiringStatusTypeId = 1
							order by StatusChangeDate;
						
							--TermQuit date
							SET @TermQuitDate = '';
							SELECT TOP 1 @TermQuitDate = Convert(VARCHAR, StatusChangeDate, 101)
							FROM main.PersonHiringStatusHistory
							WHERE PERSONID = @PERSONID
							order by StatusChangeDate desc;



													INSERT INTO @FINAL_LIST
													(
														PersonId
														,FirstName
														,LastName
														,Birthday
														,LicenseNumb
														,LicenseState
														,CDL_Y_N
														,PhoneNumber
														,DateHire
														,DateTermination
													)
													select top 1 
														@PERSONID,
														p.FirstName
														,p.LastName
	
														,Convert(VARCHAR, p.Birthday, 101)

															,@LicenseNumb
															,@LicenseState
															,'asdf2'
	
															,@PhoneNUMB
	
															,@HireRehireDate
		
															,@TermQuitDate
	
													/*	,'-------------------------' as '-------------------------'
	
														,pt.PersonType-- as 'Person Type'
														,phst.Description as 'HiringS tatus Type'
														,Convert(VARCHAR, sh.StatusChangeDate, 101) as 'Status Change Date'

														,'-------------------------' as '-------------------------'

														--,'asdf' as 'asdf'
	
														,*
														*/
	
													from
														--main.CertificationPersonMapping cpm
														--join main.PersonHiringStatusHistory sh on cpm.PersonId = sh.Personid
														main.PersonHiringStatusHistory sh
														--join main.PersonHiringStatusType phst on phst.PersonHiringStatusTypeId = sh.PersonHiringStatusTypeId
														join main.Person p on p.PersonId = sh.PersonId
														--join main.PersonTypeMapping ptm on p.PersonId = ptm.PersonId
														--join main.PersonTypes pt on pt.PersonTypeId = ptm.PersonTypeId
														--join main.CertificationPersonMapping cpm on cpm.PersonId = p.personid
													where
														p.PERSONID = @PERSONID
														--and cpm.CertificationTypeId = 4-- or cpm.CertificationTypeId is null
														--and StatusChangeDate >= DATEADD(day, -366, GETDATE())
													order by
														StatusChangeDate desc;




						END
				END





			FETCH NEXT FROM PersonId_cursor INTO @PERSONID;
		END
	CLOSE PersonId_cursor;

DEALLOCATE PersonId_cursor;




SELECT
	FirstName as 'Driver First Name'
	,LastName as 'Driver Last Name'
	,Birthday 'Date of Birth (MM/DD/YYYY)'

		,LicenseNumb as 'License #'
		,LicenseState as 'License State'
		,'Y' as 'CDL (Y/N)'

		,PhoneNumber as 'Phone Number'
	
	,DateHire as 'Date of Hire (MM/DD/YYYY)'
	,DateTermination as 'Date of Termination (MM/DD/YYYY)'
FROM
@FINAL_LIST
order by FirstName + ' ' + LastName
;














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
	main.PersonHiringStatusHistory sh
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
	p.Personid


	*/