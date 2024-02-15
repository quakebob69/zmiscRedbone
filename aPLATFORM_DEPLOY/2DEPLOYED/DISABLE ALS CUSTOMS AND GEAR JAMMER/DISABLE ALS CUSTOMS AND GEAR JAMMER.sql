
  SELECT TOP (1000) [PersonTypeId]
      ,[PersonType]
      ,[Enabled]
  FROM [RedBone].[main].[PersonTypes]


  update [RedBone].[main].[PersonTypes]
  set Enabled = 0 where PersonTypeid = 18

  ---------------------------------------------------


  SELECT TOP (1000) [BusinessEntityTypeId]
      ,[BusinessEntity]
      ,[Enabled]
  FROM [RedBone].[main].[BusinessEnityType]

    update [RedBone].[main].[BusinessEnityType]
  set Enabled = 0 where BusinessEntityTypeId = 3

