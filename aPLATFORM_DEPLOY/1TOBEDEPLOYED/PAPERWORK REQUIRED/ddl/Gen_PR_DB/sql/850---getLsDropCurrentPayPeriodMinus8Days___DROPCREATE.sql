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

						(select top 1 loadid from dispatch.LoadStop where StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))

					<=


						(select top 1 loadid from dispatch.LoadStop where DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))

					, (select top 1 loadid from dispatch.LoadStop where StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))
					, (select top 1 loadid from dispatch.LoadStop where DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod))

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




		/*				
    SELECT
		*
    FROM
		dispatch.LoadStop
    WHERE
		LoadId =
				IIF(
					(select top 1 loadid from dispatch.LoadStop s WHERE s.LOAdid = 1) > (SELECT top 1 s.LOAdid FROM dispatch.LoadStop s WHERE s.LOAdid = 1)
					,(SELECT top 1 s.loadid FROM dispatch.LoadStop s WHERE s.loadid = 1)
					,(SELECT top 1 s.loadid FROM dispatch.LoadStop s WHERE s.loadid = 1)
				)*/
)




