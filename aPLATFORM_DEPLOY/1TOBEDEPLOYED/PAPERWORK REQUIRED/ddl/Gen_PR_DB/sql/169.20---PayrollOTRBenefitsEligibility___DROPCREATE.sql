/****** Object:  Table [payroll].[PayrollOTRBenefitsEligibility]    Script Date: 2/20/2024 9:39:54 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[payroll].[PayrollOTRBenefitsEligibility]') AND type in (N'U'))
DROP TABLE IF EXISTS [payroll].[PayrollOTRBenefitsEligibility]
GO

/****** Object:  Table [payroll].[PayrollOTRBenefitsEligibility]    Script Date: 2/20/2024 9:39:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [payroll].[PayrollOTRBenefitsEligibility](
	[PayrollOTRBenefitsEligibilityId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[PayrollOTRBenefitsStatusId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[FullTimeEligibleDate] [datetime] NULL
 CONSTRAINT [PK_PayrollOTRBenefitsEligibility] PRIMARY KEY CLUSTERED 
(
	[PayrollOTRBenefitsEligibilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_Person]
GO


ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility]  WITH CHECK ADD  CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayrollOTRBenefitsStatus] FOREIGN KEY([PayrollOTRBenefitsStatusId])
REFERENCES [payroll].[PayrollOTRBenefitsStatus] ([PayrollOTRBenefitsStatusId])
GO
ALTER TABLE [payroll].[PayrollOTRBenefitsEligibility] CHECK CONSTRAINT [FK_PayrollOTRBenefitsEligibility_PayrollOTRBenefitsStatus]
GO

