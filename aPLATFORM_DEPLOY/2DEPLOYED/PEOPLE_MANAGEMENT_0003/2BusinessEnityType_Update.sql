UPDATE [RedBone].[main].[BusinessEnityType] SET ENABLED = 0 WHERE BusinessEntity = 'Overkill Racing and Chassis';
INSERT INTO [RedBone].[main].[BusinessEnityType] ([BusinessEntity] ,[Enabled]) VALUES ('Al''s Customs', 1)
INSERT INTO [RedBone].[main].[BusinessEnityType] ([BusinessEntity] ,[Enabled]) VALUES ('Salt Lake Manufacturing', 1)
SELECT * FROM [RedBone].[main].[BusinessEnityType]
