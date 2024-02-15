USE [RedBone]
GO




--DECLARE @ShowInActiveInd INT; -- Declare the variable
--SET @ShowInActiveInd = 0;


drop table if exists #TEMP
drop table if exists #TEMP1



 SET NOCOUNT ON;
     IF 1=0 BEGIN
       SET FMTONLY OFF
     END
	 
			drop table if exists #tempred
			select a.PunitId, a.PUnitRegistrationtypeId, expirationdate = max(a.expirationdate)
			into #tempred
			FROM equipment.punitregistrationmapping a
			JOIN equipment.punitregistrationtype b on b.PUNitRegistrationTypeId = a.PUnitRegistrationTypeId
			--where a.PUnitRegistrationTypeId in (13,15)
			where b.validateload = 1 and a.PUnitRegistrationTypeId = 15 --**modified by Matt**
			group by a.PUnitId, a.PUnitRegistrationtypeId, b.ValidateLoad


			select PUnitId,1 AS indicator 
			INTO #TEMP
			from #tempred
			WHERE datediff(dd,getdate(),expirationdate) < 0 



drop table if exists #tempyellow
select a.PunitId, a.PUnitRegistrationtypeId, expirationdate = max(a.expirationdate)
into #tempyellow
FROM equipment.punitregistrationmapping a
JOIN equipment.punitregistrationtype b on b.PUNitRegistrationTypeId = a.PUnitRegistrationTypeId
--where a.PUnitRegistrationTypeId in (13,15)
where b.validateload = 1 and a.PUnitRegistrationTypeId = 13 --**modified by Matt**
group by a.PUnitId, a.PUnitRegistrationtypeId, b.ValidateLoad


select PUnitId,1 AS indicatoryellow
INTO #TEMP1
from #tempyellow
WHERE datediff(dd,getdate(),expirationdate) < 30 and datediff(dd,getdate(),expirationdate) > 0 --30 days to expire



SELECT        
p.PUnitId
, pm.Unit_ID
, p.VIN
, makemodel.PUnitMakeId
, makemodel.PUnitMakeModelId
, p.Mod_Year
, p.Notes
--, p.InService
--, p.ActiveInd
, p.InService
, ActiveInd = pm.PUnitActiveTypeId
, PlateNumber = regmapping.RegistrationValue
, TireSize = spcmapping.SpecificationValue
, Company = be.BusinessEntity
, Division = dt.Division
, [Group] = gt.[Group]
, Client = c.ClientName
, [Location] = lt.[Location]
, CAST(isnull(a.Indicator,0) as bit) as Indicator
, CAST(isnull(a1.Indicatoryellow,0) as bit) as Indicatoryellow
, p.EquipTypeId --added



FROM            equipment.PUnit AS p 
LEFT OUTER JOIN equipment.PUnitMakeModel AS makemodel ON makemodel.PUnitMakeModelId = p.PUnitMakeModelId


LEFT JOIN equipment.punitregistrationmapping as regmapping on regmapping.PUnitId = p.PUnitId and regmapping.PUnitRegistrationMappingId = 
																																		(select top 1 PUnitRegistrationMappingId
																																		from equipment.PUnitRegistrationMapping as PRM
																																		where PUnitId = p.PUnitId and 
																																		prm.PUnitRegistrationTypeId = 1)

--Modified because of duplicates
--LEFT JOIN equipment.punitregistrationmapping as regmapping on regmapping.PUnitId = p.PUnitId and regmapping.punitregistrationtypeid =  

--	(select PUnitRegistrationTypeId from equipment.punitregistrationtype where description = 'Plate Number')

LEFT JOIN equipment.punitspecificationmapping as spcmapping on spcmapping.PUnitId = p.PUnitId and spcmapping.PUnitSpecificationTypeId = 

		(select PUnitSpecificationTypeId from equipment.punitspecificationType where Description = 'Tire Size')


 JOIN equipment.PUnitMapping pm on pm.PUnitId = p.PUnitId
LEFT JOIN main.BusinessEnityType be on be.BusinessEntityTypeId = pm.BusinessEntityTypeId
LEFT JOIN main.DivisionType dt on dt.DivisionTypeId = pm.DivisionTypeId
LEFT JOIN main.LocationType lt on lt.LocationTypeId = pm.LocationTypeId
LEFT JOIN main.GroupType gt on gt.GroupTypeId = pm.GroupTypeId
LEFT JOIN #TEMP a on a.PUnitId = p.PUnitId
LEFT JOIN #TEMP1 a1 on a1.PUnitId = p.PUnitId
LEFT JOIN main.Client c on c.ClientId = pm.ClientId


--WHERE        (@ShowInActiveInd = 0) AND (p.ActiveInd = 1) OR

--  WHERE
--	(@ShowInActiveInd = 0) 
--		AND
--	(
--		(getdate() between pm.effectivedate and pm.expirationdate)
--			and
--		pm.PUnitActiveTypeId = 1
--	)
--		AND
--	p.EquipTypeId = 1 --trucks


--		OR


--	(
--		(@ShowInActiveInd = 1)
--			AND
--		p.EquipTypeId = 1 --trucks
--	) 
	
	ORDER BY LEN(p.Unit_ID), p.Unit_ID



