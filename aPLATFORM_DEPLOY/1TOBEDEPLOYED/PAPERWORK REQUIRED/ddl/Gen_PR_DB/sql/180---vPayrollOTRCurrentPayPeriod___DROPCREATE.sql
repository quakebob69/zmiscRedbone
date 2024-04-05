

DROP VIEW IF EXISTS [payroll].[vPayrollOTRCurrentPayPeriod]
GO
	


CREATE VIEW [payroll].[vPayrollOTRCurrentPayPeriod] AS
SELECT *
FROM [payroll].[PayrollOTRStaging] AS s
/*
WHERE 
s.DriverPersonId
	not in (


			select personid from main.Person 
				where
					(LastName like 'COLE' and firstName like 'JACK') or
					(LastName like 'JONES' and firstName like 'AL') or
					(LastName like 'TRIBE' and firstName like 'WILLIAM') or
					(LastName like 'SOTO' and firstName like 'VALMORE') or
					(LastName like 'SPENCER' and firstName like 'JOHN') or
					(LastName like 'NORTON' and firstName like 'JERRY')
		
		
		)
*/
GO