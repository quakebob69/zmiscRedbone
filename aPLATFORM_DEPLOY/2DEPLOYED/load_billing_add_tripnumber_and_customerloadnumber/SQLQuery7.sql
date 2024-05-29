
/****** Object:  UserDefinedFunction [dbo].[ufn_Load_Search_MultiFields]    Script Date: 5/29/2024 9:16:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
	Search certain fields in all loads for specific text and return list of LoadIds
	Load:
	CustomerLoadNumber

	LoadTrace:
	TraceNumber

	LoadStop Picks:
	PONumber
	BillOfLading
	PUNumber
	Other

	LoadStop Drops:
	DeliveryNumber1
	DeliveryNumber2
	DeliveryNumber3
	DeliveryNumber4
	Other

	Test:
	select * from dbo.ufn_Load_Search_MultiFields('348229028')

	*/
CREATE function asdf.[ufn_Load_Search_MultiFields](@SearchString varchar(max))
RETURNS @Loads table(LoadId int)
AS 
BEGIN 

	/* ------------------------------
	Search CustomerLoadNumbers in Load
	--------------------------------*/
	INSERT	INTO @Loads
	SELECT	LoadId
	FROM	dispatch.Load
	WHERE	CustomerLoadNumber LIKE '%' + @SearchString + '%' 
	--AND		LoadId NOT IN (SELECT LoadId FROM @Loads)

	/* ------------------------------
	Search TraceNumbers in LoadTrace
	--------------------------------*/
	INSERT	INTO @Loads
	SELECT	LoadId
	FROM	dispatch.LoadTrace
	WHERE	TraceNumber LIKE '%' + @SearchString + '%' 
	AND		LoadId NOT IN (SELECT LoadId FROM @Loads)

	/* ------------------------------
	Search the following fields in LoadStop for Picks and Drops
	PONumber
	BillOfLading
	PUNumber
	Other

	LoadStop Drops:
	DeliveryNumber1
	DeliveryNumber2
	DeliveryNumber3
	DeliveryNumber4
	Other
	--------------------------------*/
	INSERT	INTO @Loads
	SELECT	LoadId 
	FROM	dispatch.LoadStop
	WHERE	(	ISNULL(PONumber, '') LIKE '%' + @SearchString + '%' OR 
				ISNULL(BillOfLading, '') LIKE '%' + @SearchString + '%' OR 
				ISNULL(PUNumber, '') LIKE '%' + @SearchString + '%' OR 
				ISNULL(Other, '') LIKE '%' + @SearchString + '%' OR 
				ISNULL(DeliveryNumber1, '') LIKE '%' + @SearchString + '%' OR 
				ISNULL(DeliveryNumber2, '') LIKE '%' + @SearchString + '%' OR 
				ISNULL(DeliveryNumber3, '') LIKE '%' + @SearchString + '%' OR 
				ISNULL(DeliveryNumber4, '') LIKE '%' + @SearchString + '%' 
			)
	AND		LoadStopTypeId IN (1,3) -- picks and drops
	AND		LoadId NOT IN (SELECT LoadId FROM @Loads)

	RETURN
END
GO


