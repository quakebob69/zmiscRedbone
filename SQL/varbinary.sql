--varbinary(MAX) [4 tables]

	--2 records (each with 2 pngs [email logo and stamp image]) 
	--select * from [factoring].[Settings]

	--5 records (2 jpgs)
	select * from [recruiting].[ProfileFile]

	--1 record
	--SELECT * FROM [recruiting].[SignatureImage]

		--0 records
		--select * from [Vendor].[VendorDocument] where DocBinary is not null;

-------------------------------------
/*
	CREATE TABLE [factoring].[Settings](
		[PlanTypeId] [int] NOT NULL,
		[ACHFee] [decimal](5, 2) NOT NULL,
		[BankAccount] [varchar](50) NULL,
		[InvoiceTemplate] [varchar](30) NULL,
		[InvoiceClass] [varchar](20) NULL,
		[InvoiceTerms] [varchar](10) NULL,
		[PurchaseExpenseAccount] [varchar](30) NULL,
		[ServiceChargeExpenseAccount] [varchar](100) NULL,
		[DisbursementServiceChargeExpenseAccount] [varchar](100) NULL,
		[ReserveExpenseAccount] [varchar](100) NULL,
		[CheckExpenseAccount] [varchar](100) NULL,
		[DisbursementCheckExpenseAccount] [varchar](100) NULL,
		[FromEmailAddress] [varchar](100) NULL,
		[FromDisplayName] [varchar](100) NULL,
		[CompanyName] [varchar](100) NULL,
		[EmailLogo] [varbinary](max) NULL,
		[EmailLogoImageType] [varchar](10) NULL,
		[StampImage] [varbinary](max) NULL,
		[StampImageType] [varchar](10) NULL,
		[CCEmailAddress] [varchar](100) NULL,
		[ReverseFee] [decimal](9, 2) NULL,
		[WithdrawalMaxFeePct] [decimal](5, 2) NULL,
		[WithdrawalExpenseAccount] [varchar](100) NULL,
		[WithdrawalACHFeeAccount] [varchar](100) NULL,
	 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
	(
		[PlanTypeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	GO



	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	CREATE TABLE [recruiting].[ProfileFile](
		[ProfileFileId] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](50) NULL,
		[Data] [varbinary](max) NULL,
		[MimeType] [nvarchar](50) NOT NULL,
	 CONSTRAINT [PK_ProfileFile] PRIMARY KEY CLUSTERED 
	(
		[ProfileFileId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



	CREATE TABLE [recruiting].[SignatureImage](
		[SignatureImageId] [int] IDENTITY(1,1) NOT NULL,
		[ImageData] [varbinary](max) NOT NULL,
		[MimeType] [nvarchar](50) NOT NULL,
	 CONSTRAINT [PK_SignatureImage] PRIMARY KEY CLUSTERED 
	(
		[SignatureImageId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
*/