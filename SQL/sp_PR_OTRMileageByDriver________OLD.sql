Declare @BeginDate date
declare @EndDate date
set @BeginDate = '11/01/2023'
set @EndDate = '11/30/2023'

		SELECT  
			Name
			,TripNumber
			,PickupBy
			,DeliverBy 
			,LegInd 
			,PickOrigin 
			,DropDest 
			,PayCode 
			,Quantity 
			,PayPeriodEnding 
			,P.PersonId

		FROM dispatch.PR_OTR_History h
		JOIN main.person p on p.PersonId = h.DriverPersonId
		JOIN main.PersonTypeMapping ptm on ptm.PersonId = p.PersonId

		WHERE paycode like '%Per Mile%'
		AND paycode not like '%Doubles%'
		AND ptm.PersonTypeId = 4
		AND p.PersonId NOT in (8,73,1599)	--Exlude Al Jones, John Norris, James Young
		AND p.IsActive = 1
		AND h.PayPeriodEnding between @BeginDate and @EndDate



union all


	select 

	p.FirstName + ' ' + p.LastName as [name],
	--vp.VendorId,
	vp.TripNumber,
	'' as PickupBy,
	'' as DeliverBy,
	0 as LegInd,
	'' as PickOrgin,
	'' as DropDest,
	CAST(vp.VendorPayCodeId as varchar) as PayCode,
	vp.PayQuantity,
	vp.PayDate as PayPeriodEnding,
	vp.Driver1PersonId



	from vendor.VendorPay as VP

	join main.person as P on p.PersonId = vp.Driver1PersonId


	where vp.PayDate between @BeginDate and @EndDate
	and vp.VendorPayCodeId = 79


order by name desc


