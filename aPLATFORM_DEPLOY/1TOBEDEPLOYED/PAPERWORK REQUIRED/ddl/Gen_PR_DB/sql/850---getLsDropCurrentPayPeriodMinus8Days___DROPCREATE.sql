DROP FUNCTION IF EXISTS [payroll].[getLsDropCurrentPayPeriodMinus8Days]
GO

CREATE FUNCTION [payroll].[getLsDropCurrentPayPeriodMinus8Days] (@Status INT)
RETURNS TABLE
AS
RETURN
(

	SELECT
		*
	FROM
		dispatch.LoadStop
	WHERE
		LoadId > = 
			IIF(
					(select top 1 loadid from dispatch.LoadStop where StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
					<=
					(select top 1 loadid from dispatch.LoadStop where DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))

					,(select top 1 loadid from dispatch.LoadStop where StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
					,(select top 1 loadid from dispatch.LoadStop where DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
			)

)




