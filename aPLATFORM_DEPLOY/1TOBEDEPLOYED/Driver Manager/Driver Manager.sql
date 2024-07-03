IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dispatch].[DispatchFleet]') AND type in (N'U'))
DROP TABLE [dispatch].[DispatchFleet]
GO




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



INSERT INTO [dispatch].[DispatchFleet] ([Name] ,[PersonId]) VALUES  ('Dickie Dos' , 45)
INSERT INTO [dispatch].[DispatchFleet] ([Name] ,[PersonId]) VALUES  ('OTaRmy' , 2467)
INSERT INTO [dispatch].[DispatchFleet] ([Name] ,[PersonId]) VALUES  ('Whirling Dervishes' , 2484)
GO








ALTER TABLE [equipment].[PUnit]
ADD [DispatchFleetId] [int] NULL
GO

ALTER TABLE [equipment].[PUnit]  WITH CHECK ADD  CONSTRAINT [FK_PUnit_DispatchFleet] FOREIGN KEY([DispatchFleetId])
REFERENCES [payroll].[DispatchFleet] ([DispatchFleetId])
GO
ALTER TABLE [equipment].[PUnit] CHECK CONSTRAINT [FK_PUnit_DispatchFleet]
GO

