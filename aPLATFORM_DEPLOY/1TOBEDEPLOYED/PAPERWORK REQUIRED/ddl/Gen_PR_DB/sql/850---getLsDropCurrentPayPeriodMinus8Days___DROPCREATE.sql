DROP FUNCTION IF EXISTS [payroll].[getLsDropCurrentPayPeriodMinus8Days]
GO

CREATE FUNCTION [payroll].[getLsDropCurrentPayPeriodMinus8Days] (@Status INT)
RETURNS TABLE
AS
RETURN
(
/*
	SELECT
		*
	FROM
		dispatch.LoadStop
	WHERE
		
		LoadId > = 
			IIF(
					EXISTS (
						(select top 1 loadid, StartDateTime from dispatch.LoadStop where StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
					)
					<=
					3
					--EXISTS (
					--	(select top 1 loadid, DropStartDateTime from dispatch.LoadStop where DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
					--)		
					,1,2
					--, (select top 1 loadid, StartDateTime from dispatch.LoadStop where StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
					--, (select top 1 loadid, DropStartDateTime from dispatch.LoadStop where DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
				--)
				)



		--(StartDateTime >= DATEADD(day, -2, ()))
		--IIF(select BeginDate from payroll.vPayrollOTRCurrentPayPeriod < , true_value, false_value)
		--LoadId >= 56201 and LoadId <= 56769 
		*/


		/*
	SELECT c.LoadId, c.StartDateTime, c.DropStartDateTime
    FROM dispatch.LoadStop c
    WHERE c.LoadId =
						IIF((SELECT s.LOAdid FROM dispatch.LoadStop s WHERE s.LOAdid = 1) = 1,
						
						
						1,
						
						
						0
	
	
						)*/




						
    SELECT c.LoadId, c.StartDateTime, c.DropStartDateTime
    FROM dispatch.LoadStop c
    WHERE c.LoadId = IIF((SELECT s.LOAdid FROM dispatch.LoadStop s WHERE s.LOAdid = 1) > (SELECT s.LOAdid FROM dispatch.LoadStop s WHERE s.LOAdid = 1), (SELECT s.loadid FROM dispatch.LoadStop s WHERE s.loadid = 1), (SELECT s.loadid FROM dispatch.LoadStop s WHERE s.loadid = 1))




)




