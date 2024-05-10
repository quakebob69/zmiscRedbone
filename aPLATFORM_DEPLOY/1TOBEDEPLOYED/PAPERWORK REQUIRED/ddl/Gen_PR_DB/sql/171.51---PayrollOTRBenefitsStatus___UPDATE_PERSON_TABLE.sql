DECLARE @FullTimeStatusId INT

SET @FullTimeStatusId =
	(
		SELECT PayrollOTRBenefitsStatusId from [payroll].[PayrollOTRBenefitsStatus] where Name = 'Full-Time'
	)


--SELECT * from [payroll].[PayrollOTRBenefitsStatus] where PayrollOTRBenefitsStatusid = @FullTimeStatusId


--All
UPDATE [main].[Person] SET PayrollOTRBenefitsStatusId = @FullTimeStatusId
WHERE personid in (select personid from main.person WHERE IsActive = 1)

