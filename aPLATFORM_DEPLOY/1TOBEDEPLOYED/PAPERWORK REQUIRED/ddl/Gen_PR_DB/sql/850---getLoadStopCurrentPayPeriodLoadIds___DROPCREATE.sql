DROP FUNCTION IF EXISTS [payroll].[getLoadStopCurrentPayPeriodLoadIds]
GO

CREATE FUNCTION [payroll].[getLoadStopCurrentPayPeriodLoadIds] ()
RETURNS @CurrentPayPeriodLoadIds TABLE(loadid int)
AS
BEGIN

	--VARS
		--First
			DECLARE @FirstStartDateTimeLoadId INT
			DECLARE @FirstDropStartDateTimeLoadId INT
		--Last
			DECLARE @LastStartDateTimeLoadId INT
			DECLARE @LastDropStartDateTimeLoadId INT

	--
	SELECT TOP 1 @FirstStartDateTimeLoadId = loadid
	FROM dispatch.LoadStop
	WHERE StartDateTime > (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod) order by loadid

	SELECT top 1 @FirstDropStartDateTimeLoadId = loadid
	FROM dispatch.LoadStop
	WHERE DropStartDateTime > (select BeginDate from payroll.vPayrollOTRCurrentPayPeriod) order by loadid

					SELECT TOP 1 @LastStartDateTimeLoadId = loadid
					FROM dispatch.LoadStop
					WHERE StartDateTime < (select EndDate from payroll.vPayrollOTRCurrentPayPeriod) order by loadid desc

					SELECT TOP 1 @LastStartDateTimeLoadId = loadid
					FROM dispatch.LoadStop
					WHERE DropStartDateTime < (select EndDate from payroll.vPayrollOTRCurrentPayPeriod) order by loadid desc


	--get loadids
		INSERT INTO
			@CurrentPayPeriodLoadIds
		SELECT
			loadid
		FROM
			dispatch.LoadStop
		WHERE
			(
				LoadId >=
					--get smaller loadid of 2 dates
					IIF(
							@FirstDropStartDateTimeLoadId
							<=
							@FirstStartDateTimeLoadId

							,@FirstDropStartDateTimeLoadId
							,@FirstStartDateTimeLoadId
					)
			)
			AND
			(
				LoadId >=
					--get smaller loadid of 2 dates
					IIF(
							@FirstDropStartDateTimeLoadId
							<=
							@FirstStartDateTimeLoadId

							,@FirstDropStartDateTimeLoadId
							,@FirstStartDateTimeLoadId
					)
			)

	RETURN		

END

