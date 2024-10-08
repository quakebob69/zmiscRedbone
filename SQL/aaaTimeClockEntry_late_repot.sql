DECLARE @emailName NVARCHAR(25) = 'danny';


--ARRIVE
		SELECT
			top 100 *
		FROM
			[RedBone].[main].[TimeClockEntry]	
		WHERE
			personid in (SELECT PersonId FROM main.person WHERE LoginId = @emailName + '@redbonetrucking.com')
				and
			DATEPART(HOUR, ClockIn) > 7		
		order by
			EntryId desc


--LEAVE
					