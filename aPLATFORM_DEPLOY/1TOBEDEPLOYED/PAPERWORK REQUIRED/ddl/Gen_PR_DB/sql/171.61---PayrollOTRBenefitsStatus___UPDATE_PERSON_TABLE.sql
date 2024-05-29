DECLARE @UnassignedId INT

SET @UnassignedId =
	(
		SELECT PayrollOTRBenefitsStatusId from [payroll].[PayrollOTRBenefitsStatus] where Name = 'Unassigned'
	)


--SELECT * from [payroll].[PayrollOTRBenefitsStatus] where PayrollOTRBenefitsStatusid = @FullTimeStatusId


--All
UPDATE [main].[Person] SET PayrollOTRBenefitsStatusId = @UnassignedId
WHERE personid in (select personid from main.person /*WHERE IsActive = 1*/)


DECLARE @FullTimeEligibleDate date
SET @FullTimeEligibleDate = '11/01/2011'

UPDATE [main].[Person] SET FullTimeEligibleDate = @FullTimeEligibleDate
WHERE personid in (select personid from main.person /*WHERE IsActive = 1*/)