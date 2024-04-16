DROP FUNCTION IF EXISTS [payroll].[getLoadStopCurrentPayPeriodLoadIds]
GO

CREATE FUNCTION [payroll].[getLoadStopCurrentPayPeriodLoadIds] ()
RETURNS @CurrentPayPeriodLoadIds TABLE(loadid int)
AS
BEGIN

	--VARS
		DECLARE @FirstStartDateTimeLoadId INT
		DECLARE @FirstDropStartDateTimeLoadId INT

		SELECT TOP 1 @FirstStartDateTimeLoadId = loadid
		FROM dispatch.LoadStop
		WHERE StartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)

		SELECT top 1 @FirstDropStartDateTimeLoadId = loadid
		FROM dispatch.LoadStop
		WHERE DropStartDateTime >= (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod)
	
	--get loadids
		INSERT INTO
			@CurrentPayPeriodLoadIds
		SELECT
			loadid
		FROM
			dispatch.LoadStop
		WHERE
			--get smaller loadid of 2 dates
			LoadId >=
				IIF(
						@FirstDropStartDateTimeLoadId
						<=
						@FirstStartDateTimeLoadId

						,@FirstDropStartDateTimeLoadId
						,@FirstStartDateTimeLoadId
				)
			
	RETURN		

END
