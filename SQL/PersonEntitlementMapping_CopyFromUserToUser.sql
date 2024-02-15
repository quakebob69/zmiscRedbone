DECLARE @FROMLoginId NVARCHAR(100)	= 'matt@redbonetrucking.com'
DECLARE @toLoginId NVARCHAR(100)	= 'danny@redbonetrucking.com'

--SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @toLoginId)
--1) DELETE 
	DELETE FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @toLoginId)

--2) INSERT
	INSERT INTO 
		main.PersonEntitlementMapping (personid, EntitlementId)
	(
	SELECT personid = 
		(SELECT PersonId FROM main.person WHERE LoginId = @toLoginId),
		EntitlementId
	FROM
		main.PersonEntitlementMapping
	WHERE personid in
		(SELECT PersonId FROM main.person WHERE LoginId = @FROMLoginId)
	)

--SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = @toLoginId)
GO


/*
	SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'danny@redbonetrucking.com')
	SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'matt@redbonetrucking.com')
	SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'danny@redbonetrucking.com' or LoginId = 'matt@redbonetrucking.com')
	SELECT count(distinct EntitlementId) FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'matt@redbonetrucking.com')

--JOINS
	SELECT
		d1.PersonId, d1.EntitlementId, d2.PersonId, d2.EntitlementId
	FROM 
		(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'matt@redbonetrucking.com')) d1
	LEFT JOIN
		(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'danny@redbonetrucking.com')) d2
	ON 
		d1.EntitlementId = d2.EntitlementId
	WHERE
		d2.EntitlementId IS NULL

	SELECT
		d1.PersonId, d1.EntitlementId, d2.PersonId, d2.EntitlementId
	FROM 
		(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'danny@redbonetrucking.com')) d1
	LEFT JOIN
		(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'matt@redbonetrucking.com')) d2
	ON 
		d1.EntitlementId = d2.EntitlementId
	WHERE
		d2.EntitlementId IS NULL
*/

/*
select * from main.PersonEntitlementMapping where personid in (select PersonId from main.person where LoginId = 'danny@redbonetrucking.com')
select * from main.PersonEntitlementMapping where personid in (select PersonId from main.person where LoginId = 'matt@redbonetrucking.com')
select * from main.PersonEntitlementMapping where personid in (select PersonId from main.person where LoginId = 'danny@redbonetrucking.com' or LoginId = 'matt@redbonetrucking.com')
select count(distinct EntitlementId) from main.PersonEntitlementMapping where personid in (select PersonId from main.person where LoginId = 'matt@redbonetrucking.com')


SELECT
	d1.PersonId, d1.EntitlementId, d2.PersonId, d2.EntitlementId
FROM 
	(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'matt@redbonetrucking.com')) d1
LEFT JOIN
	(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'danny@redbonetrucking.com')) d2
ON 
	d1.EntitlementId = d2.EntitlementId
WHERE
	d2.EntitlementId IS NULL

SELECT
	d1.PersonId, d1.EntitlementId, d2.PersonId, d2.EntitlementId
FROM 
	(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'danny@redbonetrucking.com')) d1
LEFT JOIN
	(SELECT * FROM main.PersonEntitlementMapping WHERE personid in (SELECT PersonId FROM main.person WHERE LoginId = 'matt@redbonetrucking.com')) d2
ON 
	d1.EntitlementId = d2.EntitlementId
WHERE
	d2.EntitlementId IS NULL
*/