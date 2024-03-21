CREATE VIEW [payroll].[vPayrollOTRStaging] AS
SELECT *
FROM [payroll].[PayrollOTRStaging] AS s
WHERE 
s.DriverPersonId
	not in (
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554 -- asdf 
)
GO


CREATE VIEW [payroll].[vPR_OTR_History] AS
SELECT *
FROM [dispatch].[PR_OTR_History] AS h
WHERE 
h.DriverPersonId 
	not in (
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554, -- asdf 
		54545454554 -- asdf 
	)
GO
