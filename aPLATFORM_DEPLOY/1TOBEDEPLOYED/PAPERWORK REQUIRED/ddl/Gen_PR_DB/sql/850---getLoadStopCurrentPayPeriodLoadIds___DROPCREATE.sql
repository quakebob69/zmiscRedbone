DROP FUNCTION IF EXISTS [payroll].[getLoadStopCurrentPayPeriodLoadIds]
GO

CREATE FUNCTION [payroll].[getLoadStopCurrentPayPeriodLoadIds] ()
RETURNS @LoadIds TABLE(loadid int)
AS
BEGIN

	--VARS
		DECLARE @StartDateTimeLoadId INT
		DECLARE @DropStartDateTimeLoadId INT

		SELECT TOP 1 @StartDateTimeLoadId = loadid
		FROM dispatch.LoadStop
		WHERE StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)

		SELECT top 1 @DropStartDateTimeLoadId = loadid
		FROM dispatch.LoadStop
		WHERE DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)
	
	--get loadids
		INSERT INTO
			@LoadIds
		SELECT
			loadid
		FROM
			dispatch.LoadStop
		WHERE
			--get earlier of 2 dates
			LoadId >=
				IIF(
						@DropStartDateTimeLoadId
						<=
						@StartDateTimeLoadId

						,@DropStartDateTimeLoadId
						,@StartDateTimeLoadId
				)
			
	RETURN		

END
