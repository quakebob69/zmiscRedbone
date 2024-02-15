USE [RedBone]
GO

INSERT INTO
	[main].[PersonEntitlementMapping]
	(Entitlementid, PersonId)
VALUES
	(2508, 8)
GO

INSERT INTO
	[main].[PersonEntitlementMapping]
	(Entitlementid, PersonId)
VALUES
	(2508, 2775)
GO

delete from 
--select * from
[main].[PersonEntitlementMapping]
where 
Entitlementid = 2508
and 
PersonId = 8
