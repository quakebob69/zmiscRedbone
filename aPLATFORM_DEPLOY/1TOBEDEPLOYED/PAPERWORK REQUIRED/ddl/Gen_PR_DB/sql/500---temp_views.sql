DROP VIEW IF EXISTS [payroll].[vPR_OTR_History___withpersonsremoved]
GO

DROP VIEW IF EXISTS [payroll].[vPayrollOTRStaging___withpersonsremoved]
GO
	


CREATE VIEW [payroll].[vPayrollOTRStaging___withpersonsremoved] AS
SELECT *
FROM [payroll].[PayrollOTRStaging] AS s
WHERE 
s.DriverPersonId
	not in (


			select personid from main.Person 
				--where
					--(LastName like 'COLE' and firstName like 'JACK') or
					--(LastName like 'JONES' and firstName like 'AL') or
					--(LastName like 'TRIBE' and firstName like 'WILLIAM') or
					--(LastName like 'SOTO' and firstName like 'VALMORE') or
					--(LastName like 'SPENCER' and firstName like 'JOHN') or
					--(LastName like 'NORTON' and firstName like 'JERRY')
		
		
		)
GO


CREATE VIEW [payroll].[vPR_OTR_History___withpersonsremoved] AS
SELECT *
FROM [dispatch].[PR_OTR_History] AS h
WHERE 
h.DriverPersonId 
	not in (


			select personid from main.Person
				--where
					--(LastName like 'COLE' and firstName like 'JACK') or
					--(LastName like 'JONES' and firstName like 'AL') or
					--(LastName like 'TRIBE' and firstName like 'WILLIAM') or
					--(LastName like 'SOTO' and firstName like 'VALMORE') or
					--(LastName like 'SPENCER' and firstName like 'JOHN') or
					--(LastName like 'NORTON' and firstName like 'JERRY')
			
		
		)
GO


