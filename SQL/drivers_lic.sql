SELECT TOP (1000) [DriversLicenseId]
      ,[Class]
      ,[StateId]
      ,[Number]
      ,[Expiration]
      ,[Endorsements]
      ,[ProfileId]
      ,[Photo_ProfileFileId]
  FROM [RedBone].[recruiting].[DriversLicense]

				USE [RedBone]
				GO

				/****** Object:  Table [recruiting].[DriversLicense]    Script Date: 12/12/2023 9:59:12 AM ******/
				SET ANSI_NULLS ON
				GO

				SET QUOTED_IDENTIFIER ON
				GO

				--CREATE TABLE [recruiting].[DriversLicense](
					[DriversLicenseId] [int] IDENTITY(1,1) NOT NULL,
					[Class] [varchar](10) NOT NULL,
					[StateId] [int] NULL,
					[Number] [nvarchar](50) NOT NULL,
					[Expiration] [datetime] NOT NULL,
					[Endorsements] [nvarchar](50) NULL,
					[ProfileId] [int] NOT NULL,
					[Photo_ProfileFileId] [int] NULL,
				 CONSTRAINT [PK_DriversLicense] PRIMARY KEY CLUSTERED 
				(
					[DriversLicenseId] ASC
				)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
				) ON [PRIMARY]
				GO

				ALTER TABLE [recruiting].[DriversLicense]  WITH CHECK ADD  CONSTRAINT [FK_DriversLicense_Profile] FOREIGN KEY([ProfileId])
				REFERENCES [recruiting].[Profile] ([ProfileId])
				GO

				ALTER TABLE [recruiting].[DriversLicense] CHECK CONSTRAINT [FK_DriversLicense_Profile]
				GO



SELECT TOP (1000) [ProfileFileId]
      ,[Name]
      ,[Data]
      ,[MimeType]
  FROM [RedBone].[recruiting].[ProfileFile]

				USE [RedBone]
				GO

				/****** Object:  Table [recruiting].[ProfileFile]    Script Date: 12/12/2023 10:00:06 AM ******/
				SET ANSI_NULLS ON
				GO

				SET QUOTED_IDENTIFIER ON
				GO

				CREATE TABLE [main].[ProfileFile](
					[ProfileFileId] [int] IDENTITY(1,1) NOT NULL,
					[Name] [nvarchar](50) NULL,
					[Data] [varbinary](max) NULL,
					[MimeType] [nvarchar](50) NOT NULL,
				 CONSTRAINT [PK_ProfileFile] PRIMARY KEY CLUSTERED 
				(
					[ProfileFileId] ASC
				)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
				) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
				GO

