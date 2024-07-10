--DROP STUFF
------------------------------------------------
	IF EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE Name = N'columnName'
		AND Object_ID = Object_ID(N'[equipment].[PUnit]')
	)
	BEGIN
		delete from [dispatch].[DispatchFleet]
		update [equipment].[PUnit] set [DispatchFleetId] = null;
	END
	  

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dispatch].[DispatchFleet]') AND type in (N'U'))
	BEGIN
		ALTER TABLE [dispatch].[DispatchFleet]
			DROP CONSTRAINT FK_DispatchFleet_Person;

		ALTER TABLE [equipment].[PUnit]
			DROP CONSTRAINT [FK_PUnit_DispatchFleet];

		ALTER TABLE [equipment].[PUnit]
			DROP COLUMN IF EXISTS [DispatchFleetId];

		DROP TABLE [dispatch].[DispatchFleet]
	END





--ADD STUFF
------------------------------------------------
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE [dispatch].[DispatchFleet](
		[DispatchFleetId] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](128) NULL,
		[PersonId] [int] NOT NULL
	 CONSTRAINT [PK_DispatchFleet] PRIMARY KEY CLUSTERED 
	(
		[DispatchFleetId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	 CONSTRAINT [UQ_DispatchFleet] UNIQUE NONCLUSTERED 
	(
		[Name]
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	GO

	ALTER TABLE [dispatch].[DispatchFleet]  WITH CHECK ADD  CONSTRAINT [FK_DispatchFleet_Person] FOREIGN KEY([PersonId])
	REFERENCES [main].[Person] ([PersonId])
	GO
	ALTER TABLE [dispatch].[DispatchFleet] CHECK CONSTRAINT [FK_DispatchFleet_Person]
	GO



	------------
	ALTER TABLE [equipment].[PUnit]
	ADD [DispatchFleetId] [int] NULL
	GO

	ALTER TABLE [equipment].[PUnit]  WITH CHECK ADD  CONSTRAINT [FK_PUnit_DispatchFleet] FOREIGN KEY([DispatchFleetId])
	REFERENCES [dispatch].[DispatchFleet] ([DispatchFleetId])
	GO
	ALTER TABLE [equipment].[PUnit] CHECK CONSTRAINT [FK_PUnit_DispatchFleet]
	GO





--INSERT STUFF
-------------------------------------------------------------------------------------------------------------
	INSERT INTO [dispatch].[DispatchFleet] ([Name] ,[PersonId]) VALUES  ('Dickie Dos' , 45)
	INSERT INTO [dispatch].[DispatchFleet] ([Name] ,[PersonId]) VALUES  ('OTaRmy' , 2467)
	INSERT INTO [dispatch].[DispatchFleet] ([Name] ,[PersonId]) VALUES  ('Whirling Dervishes' , 2484)
	GO


	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 1 WHERE unit_id = '261';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 1 WHERE unit_id = '262';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 1 WHERE unit_id = '263';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 2 WHERE unit_id = '264';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 2 WHERE unit_id = '265';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 2 WHERE unit_id = '266';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 3 WHERE unit_id = '267';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 3 WHERE unit_id = '268';
	UPDATE [equipment].[PUnit] SET [DispatchFleetId] = 3 WHERE unit_id = '269';
	GO




--CHECK
-------------------------------------------------------------------------------------------------------------
	SELECT COUNT(*) FROM [equipment].[PUnit] WHERE [DispatchFleetId] IS NOT NULL


/*
	--62602

	1642	260
	1591	261
	1648	262
	1649	263
	1650	264
	1651	265
	1652	266
	1653	267
	1654	268
	1655	269



	207 = spare
	272 = spare
*/