SELECT TOP (1000) [PUnitId]
      ,[Unit_ID]
      ,[VIN]
      ,[PUnitMakeModelId]
      ,[Mod_Year]
      ,[Notes]
      ,[InService]
      ,[ActiveInd]
      ,[ClientId]
      ,[EquipTypeId]
  FROM [RedBone].[equipment].[PUnit]
  where VIN = '3AKJHHDR3PSNV9035';



  SELECT TOP (1000) [PUnitMappingId]
      ,[PunitId]
      ,[BusinessEntityTypeId]
      ,[DivisionTypeId]
      ,[LocationTypeId]
      ,[EffectiveDate]
      ,[ExpirationDate]
      ,[UpdatedBy]
      ,[LastUpdate]
      ,[GroupTypeId]
      ,[Unit_ID]
      ,[PUnitStatusTypeId]
      ,[PUnitActiveTypeId]
      ,[ClientId]
  FROM [RedBone].[equipment].[PunitMapping]
  where PunitId = 1235;



