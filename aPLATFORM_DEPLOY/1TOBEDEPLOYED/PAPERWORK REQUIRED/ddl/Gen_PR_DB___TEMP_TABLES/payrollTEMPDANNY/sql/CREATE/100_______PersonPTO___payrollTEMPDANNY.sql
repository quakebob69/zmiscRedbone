USE [RedBoneThomas]
GO

--ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY] DROP CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_PersonPTOType]
--GO

--ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY] DROP CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_Person]
--GO

/****** Object:  Table [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY]    Script Date: 2/21/2024 12:18:31 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY]') AND type in (N'U'))
DROP TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY]
GO

/****** Object:  Table [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY]    Script Date: 2/21/2024 12:18:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY](
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


ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY] CHECK CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_Person]
GO

ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_PersonPTOType] FOREIGN KEY([PersonPTOTypeId])
REFERENCES [main].[PersonPTOType] ([PersonPTOTypeId])
GO
ALTER TABLE [payrollTEMPDANNY].[PersonPTO___payrollTEMPDANNY] CHECK CONSTRAINT [FK_PersonPTO___payrollTEMPDANNY_PersonPTOType]
GO


