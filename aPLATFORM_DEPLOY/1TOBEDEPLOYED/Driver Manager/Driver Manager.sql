--DROP STUFF
------------------------------------------------
	IF EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE Name = N'DispatchFleetManagerId'
		AND Object_ID = Object_ID(N'[dispatch].[Load]')
	)
	BEGIN
		update [dispatch].[Load] set [DispatchFleetManagerId] = null;

		ALTER TABLE [dispatch].[Load]
			DROP CONSTRAINT [FK_Load_DispatchFleetManager];

		ALTER TABLE [dispatch].[Load]
			DROP COLUMN IF EXISTS [DispatchFleetManagerId];
	END
	 

	IF EXISTS (
		SELECT 1 
		FROM sys.columns 
		WHERE Name = N'DispatchFleetManagerId'
		AND Object_ID = Object_ID(N'[equipment].[PUnit]')
	)
	BEGIN
		update [equipment].[PUnit] set [DispatchFleetManagerId] = null;

		ALTER TABLE [equipment].[PUnit]
			DROP CONSTRAINT [FK_PUnit_DispatchFleetManager];

		ALTER TABLE [equipment].[PUnit]
			DROP COLUMN IF EXISTS [DispatchFleetManagerId];
	END
	  

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dispatch].[DispatchFleetManager]') AND type in (N'U'))
	BEGIN
		DELETE FROM [dispatch].[DispatchFleetManager]

		ALTER TABLE [dispatch].[DispatchFleetManager]
			DROP CONSTRAINT FK_DispatchFleetManager_Person;

		DROP TABLE [dispatch].[DispatchFleetManager]
	END





--ADD STUFF
------------------------------------------------
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE [dispatch].[DispatchFleetManager](
		[DispatchFleetManagerId] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](128) NULL,
		[PersonId] [int] NOT NULL,
		[PhoneNumber] [varchar](50) NOT NULL
	 CONSTRAINT [PK_DispatchFleetManager] PRIMARY KEY CLUSTERED 
	(
		[DispatchFleetManagerId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	 CONSTRAINT [UQ_DispatchFleetManager] UNIQUE NONCLUSTERED 
	(
		[Name]
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	GO

	ALTER TABLE [dispatch].[DispatchFleetManager]  WITH CHECK ADD  CONSTRAINT [FK_DispatchFleetManager_Person] FOREIGN KEY([PersonId])
	REFERENCES [main].[Person] ([PersonId])
	GO
	ALTER TABLE [dispatch].[DispatchFleetManager] CHECK CONSTRAINT [FK_DispatchFleetManager_Person]
	GO



	------------
	ALTER TABLE [equipment].[PUnit]
	ADD [DispatchFleetManagerId] [int] NULL
	GO

	ALTER TABLE [equipment].[PUnit]  WITH CHECK ADD  CONSTRAINT [FK_PUnit_DispatchFleetManager] FOREIGN KEY([DispatchFleetManagerId])
	REFERENCES [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId])
	GO
	ALTER TABLE [equipment].[PUnit] CHECK CONSTRAINT [FK_PUnit_DispatchFleetManager]
	GO



	------------
	ALTER TABLE [dispatch].[Load]
	ADD [DispatchFleetManagerId] [int] NULL
	GO

	ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_DispatchFleetManager] FOREIGN KEY([DispatchFleetManagerId])
	REFERENCES [dispatch].[DispatchFleetManager] ([DispatchFleetManagerId])
	GO
	ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_DispatchFleetManager]
	GO




--INSERT STUFF
-------------------------------------------------------------------------------------------------------------
	INSERT INTO [dispatch].[DispatchFleetManager] ([Name] ,[PersonId], [PhoneNumber]) VALUES  ('Dickie Dos' , 45, '(801) 111-1111')
	INSERT INTO [dispatch].[DispatchFleetManager] ([Name] ,[PersonId], [PhoneNumber]) VALUES  ('OTaRmy' , 2467, '(801) 222-2222')
	INSERT INTO [dispatch].[DispatchFleetManager] ([Name] ,[PersonId], [PhoneNumber]) VALUES  ('Whirling Dervishes' , 2484, '(801) 333-3333')
	GO


	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '261';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '262';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 1 WHERE unit_id = '263';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '264';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '265';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 2 WHERE unit_id = '266';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '267';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '268';
	UPDATE [equipment].[PUnit] SET [DispatchFleetManagerId] = 3 WHERE unit_id = '269';
	GO




--CHECK
-------------------------------------------------------------------------------------------------------------
	SELECT COUNT(*) FROM [equipment].[PUnit] WHERE [DispatchFleetManagerId] IS NOT NULL


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