USE [RedBoneThomas]
GO

--ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject] DROP CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_PersonPTOType]
--GO

--ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject] DROP CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_Person]
--GO

/****** Object:  Table [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject]    Script Date: 2/21/2024 12:18:31 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject]') AND type in (N'U'))
DROP TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject]
GO

/****** Object:  Table [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject]    Script Date: 2/21/2024 12:18:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject](
	[PersonPTOId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[PersonPTOTypeId] [int] NULL,
	[Notes] [text] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[LastUpdatePersonId] [int] NULL,
	[PersonPTOValue] [decimal](18, 2) NULL,
	[PersonPTOQty] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PersonPTO] PRIMARY KEY CLUSTERED 
(
	[PersonPTOId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject] CHECK CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_Person]
GO

ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_PersonPTOType] FOREIGN KEY([PersonPTOTypeId])
REFERENCES [main].[PersonPTOType] ([PersonPTOTypeId])
GO
ALTER TABLE [zzztempdannydeletethisafterproject].[PersonPTO___zzztempdannydeletethisafterproject] CHECK CONSTRAINT [FK_PersonPTO___zzztempdannydeletethisafterproject_PersonPTOType]
GO


