USE [RedBone]
GO

DECLARE @FromUserLogin varchar(50);
DECLARE @ToUserLogin varchar(50);

	Set @FromUserLogin='matt@redbonetrucking.com';
	Set @ToUserLogin='Danny@redbonetrucking.com';

DECLARE @FromUser int;
DECLARE @ToUser int;

Set @ToUser=(Select PersonId from main.person where LoginId=@ToUserLogin);
Set @FromUser=(Select PersonId from main.person where LoginId=@FromUserLogin);

--INSERT INTO [main].[PersonEntitlementMapping] (EntitlementId, PersonId)
(
	SELECT
		EntitlementId, @ToUser
	FROM [main].[PersonEntitlementMapping]
	WHERE PersonId = @FromUser
)

/*
	delete
	FROM [main].[PersonEntitlementMapping]
	WHERE PersonId = @ToUser
*/

/*
	SELECT count(*) [EntitlementId]
		,[PersonId]
	FROM [main].[PersonEntitlementMapping]
	where personid = 6 or personid = 2394
	group by PersonId
*/


/*
	SELECT * from main.person;

	SELECT * FROM [main].[PersonEntitlementMapping]
	where personid = 8;
*/


