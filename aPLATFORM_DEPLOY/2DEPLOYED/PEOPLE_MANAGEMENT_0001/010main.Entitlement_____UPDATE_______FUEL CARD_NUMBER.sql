USE Redbone
GO

UPDATE
	[main].[Entitlement]
SET
EntitlementName = 'Fuel-Card-Number-Modify', Description = 'Ability to modify Fuel Card Number'
WHERE Entitlementid = 2508

GO
