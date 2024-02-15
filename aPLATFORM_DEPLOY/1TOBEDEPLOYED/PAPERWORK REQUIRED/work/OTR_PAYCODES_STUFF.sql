--00000000000000000000000000000000000000000000000000000000000000000000000
--2023-12-10 00:00:00.000
--2023-12-16 00:00:00.000
--00000000000000000000000000000000000000000000000000000000000000000000000

--GROUP BY PAYCODE
SELECT DISTINCT(PayCode), COUNT(PayCode)
FROM dispatch.PR_OTR_History ph
WHERE 
PayPeriodEnding = '2023-12-16 00:00:00.000'
GROUP BY PayCode
ORDER BY PayCode;

--ALL
SELECT TruckNumber, TripNumber, DeliverBy, Name, '---co-driver (not available)---', Quantity, *
FROM dispatch.PR_OTR_History ph
WHERE 
PayPeriodEnding = '2023-12-16 00:00:00.000'
ORDER BY ph.Name, PayCode desc;



------------------------------------------------
------------------------------------------------
------------------------------------------------
	--Paid Miles
	SELECT Name AS Driver, sum(Quantity) AS 'Total Driver Paid Miles'
	FROM dispatch.PR_OTR_History ph
	WHERE 
	PayPeriodEnding = '2023-12-16 00:00:00.000'
	AND payId = 84
	GROUP BY Name
	--ORDER BY Name

	--Double Miles (76)
	SELECT Name AS Driver, sum(Quantity) AS 'Double Miles'
	FROM dispatch.PR_OTR_History ph
	WHERE 
	PayPeriodEnding = '2023-12-16 00:00:00.000'
	AND PayId = 76
	GROUP BY Name
	--ORDER BY Name

	--Drop & Hook (73)
	SELECT Name AS Driver, sum(Quantity) AS 'Drop & Hook'
	FROM dispatch.PR_OTR_History ph
	WHERE 
	PayPeriodEnding = '2023-12-16 00:00:00.000'
	AND paycode = 'Drop & Hook'
	GROUP BY Name
	--ORDER BY Name

	--Extra Stops (73)
	SELECT Name AS Driver, sum(Quantity) AS 'Extra Stops'
	FROM dispatch.PR_OTR_History ph
	WHERE 
	PayPeriodEnding = '2023-12-16 00:00:00.000'
	AND paycode = 'Extra Stops'
	GROUP BY Name
	--ORDER BY Name



------------------------------------------------
------------------------------------------------
------------------------------------------------
	--Other Pay (NULL)
	SELECT *, Name AS Driver, TOTALPAY as 'Other Pay'
	FROM dispatch.PR_OTR_History ph
	WHERE 
	PayPeriodEnding = '2023-12-16 00:00:00.000'
	AND paycode = 'Other Pay'
	ORDER BY ph.Name, PayCode desc;





--SELECT * FROM main.PersonPTO
--WHERE PersonPTOTypeId in (11,12)
--AND notes like '%iles%'
--AND notes not like '%EDEX%'
--AND CreatedOn = '2023-12-16 00:00:00.000'
--order by PersonPTOId desc

