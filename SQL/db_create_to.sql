USE [RedBone]
GO
/****** Object:  Table [company].[GeneralInfo]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [company].[GeneralInfo](
	[GeneralInfoId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_GeneralInfoId] PRIMARY KEY CLUSTERED 
(
	[GeneralInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[1]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[1](
	[PlanId] [varchar](50) NULL,
	[CustomerInvoiceNumber] [varchar](50) NULL,
	[InvoiceNumber] [varchar](50) NULL,
	[InvoiceReceivedDate] [date] NULL,
	[InvoiceDate] [date] NULL,
	[InvoiceAmount] [varchar](50) NULL,
	[InvoicePurchasedDate] [date] NULL,
	[InvoiceSubmittedToCustomerDate] [date] NULL,
	[InvoiceSubmitTypeId] [varchar](50) NULL,
	[InvoiceDueDate] [date] NULL,
	[PurchaseDays] [varchar](50) NULL,
	[CurrentFee] [varchar](50) NULL,
	[CurrentReserve] [varchar](50) NULL,
	[CurrentReservePct] [varchar](50) NULL,
	[InvoiceFundedDate] [date] NULL,
	[InvoiceFundingTypeId] [varchar](50) NULL,
	[AdvancedAmount] [varchar](50) NULL,
	[LastUpDatedBy] [varchar](50) NULL,
	[InvoicePaymentBatchNumber] [varchar](50) NULL,
	[GeneralNotes] [varchar](1000) NULL,
	[InvoiceReceiptVerifiedBy] [varchar](50) NULL,
	[VerifiedVia] [varchar](50) NULL,
	[BillingNotes] [varchar](1000) NULL,
	[PaymentReceivedDate] [date] NULL,
	[PaymentAmount] [varchar](50) NULL,
	[PaymentDifference] [varchar](50) NULL,
	[RebatePercentage] [varchar](50) NULL,
	[RebateAmount] [varchar](50) NULL,
	[RebatePaymentDate] [date] NULL,
	[Notes] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENT_FUEL_TRANS_Stage]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENT_FUEL_TRANS_Stage](
	[TRANS_ID] [int] NOT NULL,
	[FUEL_ID] [int] NULL,
	[CLIENT_ID] [nvarchar](7) NULL,
	[CARD] [int] NULL,
	[INVOICE_NUMBER] [nvarchar](255) NULL,
	[UNIT_NUMBER] [nvarchar](255) NULL,
	[TRANS_DATE] [datetime] NULL,
	[TRANS_TIME] [datetime] NULL,
	[TS_NAME] [nvarchar](255) NULL,
	[BILL_TYPE] [nvarchar](255) NULL,
	[TRIP_NUMBER] [nvarchar](255) NULL,
	[TRAILER] [nvarchar](255) NULL,
	[MILEAGE] [int] NULL,
	[DRIVER] [nvarchar](255) NULL,
	[TS_CITY] [nvarchar](255) NULL,
	[TS_STATE] [nvarchar](2) NULL,
	[PPG] [float] NULL,
	[NET_PPG] [float] NULL,
	[FUEL_GALS] [float] NULL,
	[FUEL_AMT] [float] NULL,
	[RFR_GALS] [float] NULL,
	[RFR_AMT] [float] NULL,
	[MISC] [float] NULL,
	[INV_TOTAL] [float] NULL,
	[FEE] [float] NULL,
	[DISC] [float] NULL,
	[INV_BALANCE] [float] NULL,
	[INSERT_DATE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientAddress_bak_12_31_20]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientAddress_bak_12_31_20](
	[ClientAddressId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[AddressTypeId] [smallint] NOT NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[ZipCode] [varchar](10) NULL,
	[TimeZone] [varchar](5) NULL,
	[UseForBillingInd] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURRENTMILES]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURRENTMILES](
	[CurrentMiles] [decimal](8, 1) NULL,
	[CurrentMilesDate] [datetime] NOT NULL,
	[Unit] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRIVER_Temp]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRIVER_Temp](
	[DRIVER_ID] [nvarchar](255) NULL,
	[OLD_DRIVER_ID] [nvarchar](255) NULL,
	[FIRST_NAME] [nvarchar](255) NULL,
	[LAST_NAME] [nvarchar](255) NULL,
	[BIRTH_DATE] [datetime] NULL,
	[ADDRESS_1] [nvarchar](255) NULL,
	[ADDRESS_2] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP_CODE] [nvarchar](255) NULL,
	[HOME_PHONE] [nvarchar](255) NULL,
	[CELL_PHONE] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[LICENSE_NUMBER] [nvarchar](255) NULL,
	[LICENSE_EXPIRATION] [datetime] NULL,
	[MEDICAL_CARD_EXPIRATION] [datetime] NULL,
	[HIRE_DATE] [datetime] NULL,
	[TERMINATION_DATE] [datetime] NULL,
	[DIVISION] [nvarchar](255) NULL,
	[FEDEX_ID] [float] NULL,
	[DRIVER_TYPE] [nvarchar](255) NULL,
	[COMP_TYPE] [nvarchar](255) NULL,
	[COMP_AMT] [nvarchar](255) NULL,
	[PER_DIEM_AMT] [nvarchar](255) NULL,
	[DEFAULT_PUNIT] [nvarchar](255) NULL,
	[FUEL_CARD_NUMBER] [float] NULL,
	[LAST_REVIEW] [nvarchar](255) NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[DRIVER_PTS] [float] NULL,
	[ACTIVE_DISP] [bit] NOT NULL,
	[ACTIVE_FEDEX] [bit] NOT NULL,
	[ACTIVE_TANK] [bit] NOT NULL,
	[EMPLOYED_BY] [nvarchar](255) NULL,
	[VENDOR_ID] [nvarchar](255) NULL,
	[OCCACC_WAIVER_EXP] [datetime] NULL,
	[OCCACC_POLICY_EXP] [nvarchar](255) NULL,
	[WCCW_EXP] [datetime] NULL,
	[COMM_AUTO_EXP] [datetime] NULL,
	[CARGO_EXP] [nvarchar](255) NULL,
	[PHYSDAM_EXP] [nvarchar](255) NULL,
	[BOBTAIL_EXP] [nvarchar](255) NULL,
	[LEASE_CONTRACT_EXP] [datetime] NULL,
	[CARGO_REQ] [bit] NOT NULL,
	[COMM_AUTO_REQ] [bit] NOT NULL,
	[LEASE_CONTRACT_START] [datetime] NULL,
	[LICENSE_STATE] [nvarchar](255) NULL,
	[FIRST_AID_EXPIRATION] [datetime] NULL,
	[HAZMAT_EXPIRATION] [datetime] NULL,
	[BLOODBOURNE_PATHEGENS] [nvarchar](255) NULL,
	[OSHA_10] [nvarchar](255) NULL,
	[SAFELAND_CERT] [nvarchar](255) NULL,
	[TSA_EXP] [nvarchar](255) NULL,
	[FLYINGJ_QUAL] [bit] NOT NULL,
	[FLYINGJ_NUMBER] [nvarchar](255) NULL,
	[TESORO_QUAL] [bit] NOT NULL,
	[TESORO_NUMBER] [nvarchar](255) NULL,
	[EP_ENERGY_SAFETY] [datetime] NULL,
	[NEW_FIELD_SAFETY] [datetime] NULL,
	[H2S_TRAINING] [datetime] NULL,
	[PAY_PLAN] [nvarchar](255) NULL,
	[BACKGROUND_CHECK] [bit] NOT NULL,
	[SECURITY_TRAINING] [nvarchar](255) NULL,
	[DRUG_TEST] [nvarchar](255) NULL,
	[DRIVER_TRAINER] [bit] NOT NULL,
	[DRIVER_TRAINING] [bit] NOT NULL,
	[AVAILABILITY] [nvarchar](255) NULL,
	[SMITH_SYSTEM_CERT] [nvarchar](255) NULL,
	[SMITH_SYSTEM_EXP] [nvarchar](255) NULL,
	[ACCIDENT] [bit] NOT NULL,
	[DRUG_FAIL] [bit] NOT NULL,
	[REHIREABLE] [bit] NOT NULL,
	[HAZWOPER] [nvarchar](255) NULL,
	[FORKLIFT_CERT] [datetime] NULL,
	[DRIVER_PTS_NEW] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRIVERPAY_MEMORIZED_temp]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRIVERPAY_MEMORIZED_temp](
	[ID] [float] NULL,
	[DRIVER_ID] [nvarchar](255) NULL,
	[PAY_CODE] [nvarchar](255) NULL,
	[PAY_DESCRIPTION] [nvarchar](255) NULL,
	[PAY_NOTES] [nvarchar](255) NULL,
	[PAY_QUANTITY] [float] NULL,
	[PAY_RATE] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[CREATED_BY] [nvarchar](255) NULL,
	[STARTING_DATE] [datetime] NULL,
	[ENDING_DATE] [datetime] NULL,
	[INSERT_FREQUENCY] [nvarchar](255) NULL,
	[TRANS_TYPE] [nvarchar](255) NULL,
	[ACTIVE] [bit] NOT NULL,
	[QB_MAP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRIVERPAY_temp]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRIVERPAY_temp](
	[PAY_ID] [float] NULL,
	[TRIP_NUMBER] [varchar](15) NULL,
	[POWER_UNIT] [nvarchar](255) NULL,
	[DRIVER_ID] [nvarchar](255) NULL,
	[PAY_CODE] [nvarchar](255) NULL,
	[PAY_DESCRIPTION] [nvarchar](255) NULL,
	[PAY_NOTES] [nvarchar](255) NULL,
	[PAY_QTY] [float] NULL,
	[PAY_RATE] [float] NULL,
	[TOTAL_PAY] [float] NULL,
	[PAY_DATE] [datetime] NULL,
	[ENTERED_BY] [nvarchar](255) NULL,
	[PAY_TYPE] [nvarchar](255) NULL,
	[APPROVED_DATE] [datetime] NULL,
	[APPROVED_BY] [nvarchar](255) NULL,
	[APPROVED] [nvarchar](255) NULL,
	[PMT_STATE] [nvarchar](255) NULL,
	[INSERT_DATE] [nvarchar](255) NULL,
	[QB_MAP] [nvarchar](255) NULL,
	[INTERFACED_QB_DATE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRV_POINTS_NEW_delete]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRV_POINTS_NEW_delete](
	[ID] [int] NOT NULL,
	[DRIVER_ID] [nvarchar](7) NULL,
	[VALUE_DESC] [nvarchar](255) NULL,
	[POINT_VALUE] [int] NULL,
	[NOTES] [nvarchar](max) NULL,
	[POINT_DATE] [datetime] NULL,
	[ENTERED_WHEN] [datetime] NULL,
	[ENTERED_BY] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DRV_POINTS_NEW_DriverPointTypeId]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRV_POINTS_NEW_DriverPointTypeId](
	[Description] [nvarchar](max) NOT NULL,
	[DriverPointTypeId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FedExId_Staging]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FedExId_Staging](
	[DRIVER] [nvarchar](255) NULL,
	[FEDEX ID] [float] NULL,
	[Location] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GOALS_DISPATCHER_Stage]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GOALS_DISPATCHER_Stage](
	[ID] [int] NOT NULL,
	[GOAL_YEAR] [smallint] NULL,
	[GOAL_PERIOD] [smallint] NULL,
	[GOAL] [float] NULL,
	[GOAL_DAYS] [smallint] NULL,
	[GOAL_DISPATCHER] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GOALS_Stage]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GOALS_Stage](
	[ID] [int] NOT NULL,
	[GOAL_YEAR] [smallint] NULL,
	[GOAL_PERIOD] [smallint] NULL,
	[GOAL] [int] NULL,
	[GOAL_DAYS] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaseOperatorPay]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaseOperatorPay](
	[ID] [int] NOT NULL,
	[Client_Id] [nvarchar](10) NOT NULL,
	[PAYMENT_TIER] [int] NULL,
	[PAYMENT_ADDITION] [decimal](3, 2) NULL,
	[CLIENT_LOADED] [decimal](19, 2) NULL,
	[CLIENT_EMPTY] [decimal](19, 2) NULL,
	[Miles] [int] NULL,
	[DeadHead] [int] NULL,
	[Charges] [decimal](18, 2) NULL,
	[TripNumber] [varchar](15) NULL,
	[InvoiceDate] [datetime] NULL,
	[PaperworkRecvdDate] [datetime] NULL,
	[CUSTNAME] [varchar](100) NOT NULL,
	[ORIG_CITY] [nvarchar](255) NULL,
	[ORIG_STATE] [varchar](10) NULL,
	[PICKUP_BY] [datetime] NULL,
	[DEST_CITY] [nvarchar](max) NULL,
	[DEST_STATE] [varchar](10) NULL,
	[DELIVER_BY] [datetime] NULL,
	[DRIVER_1] [varchar](101) NOT NULL,
	[DRIVER_1_ID] [varchar](10) NULL,
	[LOADED_MILES] [int] NULL,
	[LOADED_PAY] [decimal](30, 2) NULL,
	[LOADED_PAY_Display] [nvarchar](4000) NULL,
	[EMPTY_MILES] [int] NOT NULL,
	[EMPTY_PAY] [decimal](30, 2) NULL,
	[EMPTY_PAY_Display] [nvarchar](4000) NULL,
	[FUEL_PRICE] [decimal](18, 3) NULL,
	[TOTAL_CHARGES] [decimal](19, 2) NULL,
	[CURRENT_STATUS] [varchar](50) NOT NULL,
	[CARRIER_ID] [varchar](20) NOT NULL,
	[PAY_TYPE] [nvarchar](255) NOT NULL,
	[truck_number] [varchar](255) NULL,
	[driver_2] [varchar](101) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaseOperatorPayOutput]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaseOperatorPayOutput](
	[TripNumber] [varchar](15) NULL,
	[PaperworkRecvdDate] [datetime] NULL,
	[CUSTNAME] [varchar](100) NOT NULL,
	[ORIG_CITY] [nvarchar](255) NULL,
	[ORIG_STATE] [varchar](10) NULL,
	[PICKUP_BY] [datetime] NULL,
	[DEST_CITY] [nvarchar](max) NULL,
	[DEST_STATE] [varchar](10) NULL,
	[DELIVER_BY] [datetime] NULL,
	[DRIVER_1_ID] [varchar](10) NULL,
	[LOADED_MILES] [int] NULL,
	[LOADED_PAY] [decimal](30, 2) NULL,
	[LOADED_PAY_Display] [nvarchar](4000) NULL,
	[EMPTY_MILES] [int] NOT NULL,
	[EMPTY_PAY] [decimal](30, 2) NULL,
	[EMPTY_PAY_Display] [nvarchar](4000) NULL,
	[FUEL_PRICE] [decimal](18, 3) NULL,
	[SURCHARGE] [decimal](18, 2) NULL,
	[SURCHARGE_PAY] [decimal](29, 2) NULL,
	[TOTAL_CHARGES] [decimal](19, 2) NULL,
	[PAY_TYPE] [nvarchar](255) NOT NULL,
	[truck_number] [varchar](255) NULL,
	[DRIVER_1] [varchar](101) NOT NULL,
	[driver_2] [varchar](101) NULL,
	[CARRIER_ID] [varchar](20) NOT NULL,
	[TTL] [decimal](32, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaseOperatorSettlementReportSummary]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaseOperatorSettlementReportSummary](
	[MilePay] [decimal](18, 2) NULL,
	[DriverPay] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[DriverPayADV] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineHaul_PD]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineHaul_PD](
	[PersonId] [int] NULL,
	[Type] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loads_bak_12_31_20]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loads_bak_12_31_20](
	[LoadId] [int] IDENTITY(1,1) NOT NULL,
	[TripNumber] [int] NULL,
	[ClientId] [int] NULL,
	[Charges] [decimal](18, 2) NULL,
	[ExtraCharges] [decimal](18, 2) NULL,
	[Miles] [int] NULL,
	[PaidMiles] [int] NULL,
	[PaidEmpty] [int] NULL,
	[DeadHead] [int] NULL,
	[Paid] [varchar](20) NULL,
	[RatePerMile] [decimal](18, 10) NULL,
	[DispatcherPersonId] [int] NULL,
	[CreatedTs] [datetime] NULL,
	[AvailableBilling] [bit] NULL,
	[Notes] [varchar](max) NULL,
	[CommodityTypeId] [smallint] NULL,
	[LoadPlannerPersonId] [int] NULL,
	[EquipmentTypeId] [smallint] NULL,
	[Driver1_PersonId] [int] NULL,
	[Driver2_PersonId] [int] NULL,
	[TruckPunitId] [int] NULL,
	[Trailer1_TrailerId] [smallint] NULL,
	[Trailer2_TrailerId] [smallint] NULL,
	[Temperature] [decimal](18, 1) NULL,
	[TemperatureTypeId] [smallint] NULL,
	[CustomerLoadNumber] [nchar](10) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 10) NULL,
	[LoadStatusTypeId] [smallint] NULL,
	[GrossRevenue] [decimal](18, 3) NULL,
	[CreatedDt] [datetime] NULL,
	[CreatePersonId] [int] NULL,
	[LastUpdtDt] [datetime] NULL,
	[LastUpdtPersonId] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[LockedPersonId] [int] NULL,
	[Pieces] [int] NULL,
	[SendOriginalsInd] [bit] NULL,
	[LoadTotal] [decimal](18, 2) NULL,
	[AutoRatingInd] [bit] NULL,
	[AccChargesTotal] [decimal](18, 2) NULL,
	[PaperworkRecvdDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[ProblemInd] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoadStopDriver]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoadStopDriver](
	[LoadStopId] [int] NOT NULL,
	[Driver1_PersonId] [int] NULL,
	[Driver2_PersonId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoadTrace_bak]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoadTrace_bak](
	[LoadTraceId] [int] IDENTITY(1,1) NOT NULL,
	[LOAD_ID] [int] NULL,
	[TRACE_NUMBER] [nvarchar](40) NULL,
	[TraceTypeCd] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OO_FSC_toDelete]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OO_FSC_toDelete](
	[ID] [float] NULL,
	[LOWER_PRICE] [float] NULL,
	[UPPER_PRICE] [float] NULL,
	[FUEL_SURCHARGE] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PR_Staged_DD]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PR_Staged_DD](
	[Col 1] [varchar](50) NULL,
	[Col 2] [varchar](50) NULL,
	[Col 3] [varchar](50) NULL,
	[Col 4] [varchar](50) NULL,
	[Col 5] [varchar](50) NULL,
	[Col 6] [varchar](50) NULL,
	[Col 7] [varchar](50) NULL,
	[Col 8] [varchar](50) NULL,
	[Col 9] [varchar](50) NULL,
	[Col 10] [varchar](50) NULL,
	[Col 11] [varchar](50) NULL,
	[Col 12] [varchar](50) NULL,
	[Col 13] [varchar](50) NULL,
	[Col 14] [varchar](50) NULL,
	[Col 15] [varchar](50) NULL,
	[Col 16] [varchar](50) NULL,
	[Col 17] [varchar](50) NULL,
	[Col 18] [varchar](50) NULL,
	[Col 19] [varchar](50) NULL,
	[Col 20] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfilePhoneNumber]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfilePhoneNumber](
	[ProfilePhoneNumberId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumberTypeId] [smallint] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProfilePhoneNumber] PRIMARY KEY CLUSTERED 
(
	[ProfilePhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proto_DispatcherByDivisionPerformance]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proto_DispatcherByDivisionPerformance](
	[DispatcherByDivisionId] [int] NOT NULL,
	[CustName] [varchar](50) NULL,
	[Year] [smallint] NULL,
	[Month] [smallint] NULL,
	[Charges] [decimal](18, 2) NULL,
	[Miles] [int] NULL,
	[Deadhead] [int] NULL,
	[TotalMiles] [int] NULL,
	[RPM] [decimal](18, 2) NULL,
 CONSTRAINT [PK_proto_DispatcherByDivisionPerformance] PRIMARY KEY CLUSTERED 
(
	[DispatcherByDivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proto_DispatcherPerformance]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proto_DispatcherPerformance](
	[DispatcherPerformanceId] [int] NOT NULL,
	[Year] [smallint] NULL,
	[Month] [smallint] NULL,
	[Goal] [decimal](18, 0) NULL,
	[Dispatcher] [varchar](50) NULL,
	[MTDGoal] [decimal](18, 0) NULL,
	[MTDPercent] [decimal](18, 2) NULL,
	[CurrentGoal] [int] NULL,
	[TotalMiles] [int] NULL,
	[Charges] [decimal](18, 2) NULL,
	[RPM] [decimal](18, 2) NULL,
	[Miles] [int] NULL,
	[Deadhead] [int] NULL,
 CONSTRAINT [PK_proto_DispatcherPerformance] PRIMARY KEY CLUSTERED 
(
	[DispatcherPerformanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUNIT_FromAccess09.29.20]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUNIT_FromAccess09.29.20](
	[UNIT_ID] [nvarchar](255) NULL,
	[SAFETY_EXPIRATION] [datetime] NULL,
	[REG_EXPIRATION] [datetime] NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[OTR_PLANNING] [bit] NOT NULL,
	[DEFAULT_DISPATCHER] [nvarchar](255) NULL,
	[IFTA_EXPIRATION] [datetime] NULL,
	[LIABILITY_EXPIRATION] [datetime] NULL,
	[CARGO_EXPIRATION] [datetime] NULL,
	[PLATE_NUMBER] [nvarchar](255) NULL,
	[PRE_PASS] [nvarchar](255) NULL,
	[EZ_PASS] [nvarchar](255) NULL,
	[ID_129K] [nvarchar](255) NULL,
	[MT_95_FT] [nvarchar](255) NULL,
	[UT_OVERWEIGHT] [nvarchar](255) NULL,
	[ND_LENGTH] [nvarchar](255) NULL,
	[ND_WEIGHT] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUNIT_temp]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUNIT_temp](
	[UNIT_ID] [nvarchar](255) NULL,
	[SAFETY_EXPIRATION] [datetime] NULL,
	[REG_EXPIRATION] [datetime] NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[OTR_PLANNING] [bit] NOT NULL,
	[DEFAULT_DISPATCHER] [nvarchar](255) NULL,
	[IFTA_EXPIRATION] [datetime] NULL,
	[LIABILITY_EXPIRATION] [datetime] NULL,
	[CARGO_EXPIRATION] [datetime] NULL,
	[PLATE_NUMBER] [nvarchar](255) NULL,
	[PRE_PASS] [nvarchar](255) NULL,
	[EZ_PASS] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tempPAYCODE]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempPAYCODE](
	[ID] [float] NULL,
	[CODE_ID] [nvarchar](255) NULL,
	[CODE_DESCRIPTION] [nvarchar](255) NULL,
	[CODE_TYPE] [nvarchar](255) NULL,
	[DRIVER_TYPE] [nvarchar](255) NULL,
	[EXPENSE_MAP] [nvarchar](255) NULL,
	[CREATED_BY] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestData_Employees]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestData_Employees](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FIRST_NAME] [varchar](50) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[DIESEL_EMPLOYEE] [varchar](50) NULL,
 CONSTRAINT [PK_TestData_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpLEASE_OPERATOR_INSERT]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpLEASE_OPERATOR_INSERT](
	[TripNumber] [varchar](15) NULL,
	[DRIVER_ID] [varchar](10) NULL,
	[VendorPayCodeId] [int] NULL,
	[PAY_CODE] [varchar](50) NOT NULL,
	[PAY_DESCRIPTION] [varchar](50) NOT NULL,
	[PAY_QUANTITY] [int] NULL,
	[PAY_NOTES] [int] NULL,
	[PAY_RATE] [decimal](29, 13) NULL,
	[TOTAL_PAY] [decimal](18, 2) NULL,
	[PAY_TYPE] [int] NULL,
	[QB_ITEM] [varchar](65) NOT NULL,
	[PAY_DATE] [nvarchar](4000) NULL,
	[ENTERED_BY] [int] NULL,
	[PMT_STATE] [int] NOT NULL,
	[INSERT_DATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRAILER10.23.20]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRAILER10.23.20](
	[TRAILER_ID] [nvarchar](10) NOT NULL,
	[SAFETY_EXPIRATION] [datetime] NULL,
	[REG_EXPIRATION] [datetime] NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[INSURANCE_EXPIRATION] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENDOR]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDOR](
	[VENDORID] [float] NULL,
	[VENDORTYPEID] [float] NULL,
	[VENDORSTATUSTYPEID] [float] NULL,
	[VENDOR_ID] [nvarchar](255) NULL,
	[VENDOR_NAME] [nvarchar](255) NULL,
	[ADDRESS_1] [nvarchar](255) NULL,
	[ADDRESS_2] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[ALT_VENDOR_NAME] [nvarchar](255) NULL,
	[ALT_ADDRESS_1] [nvarchar](255) NULL,
	[ALT_ADDRESS_2] [nvarchar](255) NULL,
	[ALT_CITY] [nvarchar](255) NULL,
	[ALT_STATE] [nvarchar](255) NULL,
	[ALT_ZIP] [nvarchar](255) NULL,
	[ALT_PHONE] [nvarchar](255) NULL,
	[ALT_PHONE_EXT] [nvarchar](255) NULL,
	[BUSINESS_PHONE] [nvarchar](255) NULL,
	[BUSINESS_PHONE_EXT] [nvarchar](255) NULL,
	[CREATEDBYPERSONID] [float] NULL,
	[CREATED_BY] [nvarchar](255) NULL,
	[CREATED_WHEN] [datetime] NULL,
	[CARGO] [nvarchar](255) NULL,
	[CARGO_AMOUNT] [float] NULL,
	[CARGO_DATE] [datetime] NULL,
	[CARGO_POLICY] [nvarchar](255) NULL,
	[CONTACT] [nvarchar](255) NULL,
	[FEDERALID] [nvarchar](255) NULL,
	[TIN] [nvarchar](255) NULL,
	[MC_NUMBER] [float] NULL,
	[US_DOT_NUMBER] [float] NULL,
	[LIABILITY] [nvarchar](255) NULL,
	[LIABILITY_AMT] [float] NULL,
	[LIABILITY_DATE] [datetime] NULL,
	[LIABILITY_POLICY] [nvarchar](255) NULL,
	[ACTIVEIND] [bit] NOT NULL,
	[FAX_PHONE] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[NOTES] [nvarchar](255) NULL,
	[USE_ALT_PAYABLE] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationRequestToCommercialEquipmentType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationRequestToCommercialEquipmentType](
	[VerificationRequestToCommercialEquipmentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[VerificationRequestId] [int] NOT NULL,
	[CommercialEquipmentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_VerificationRequestToCommercialEquipmentType] PRIMARY KEY CLUSTERED 
(
	[VerificationRequestToCommercialEquipmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[AccCharge]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[AccCharge](
	[AccChargeId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[AccChargeTypeId] [smallint] NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Rate] [money] NULL,
	[Amount] [money] NULL,
	[Notes] [varchar](255) NULL,
	[BillToCode] [varchar](10) NULL,
	[Driver_PersonId] [int] NULL,
	[LEGLoadStopId] [int] NULL,
	[BillableInd] [bit] NULL,
	[TransactionTypeId] [smallint] NULL,
	[ReimbursableInd] [bit] NULL,
	[UpdatedByPersonId] [int] NULL,
	[MarkedAsCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_AccCharge] PRIMARY KEY CLUSTERED 
(
	[AccChargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[AccChargeType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[AccChargeType](
	[AccChargeTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[AccChargeTypeCd] [varchar](50) NOT NULL,
	[AccChargeShortDescription] [varchar](100) NULL,
	[Description] [varchar](200) NULL,
	[CarrierInd] [bit] NULL,
	[CustomerInd] [bit] NULL,
	[RevenueInd] [bit] NULL,
	[ReiumbursementInd] [bit] NULL,
	[Enabled] [bit] NOT NULL,
	[AdvanceInd] [bit] NULL,
 CONSTRAINT [PK_AccChargeType] PRIMARY KEY CLUSTERED 
(
	[AccChargeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[AccChargeTypePayCodeMapping]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[AccChargeTypePayCodeMapping](
	[AccChargeTypeId] [smallint] NOT NULL,
	[VendorPayCodeId] [smallint] NOT NULL,
	[PayCodeId] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[AutoRatingACC]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[AutoRatingACC](
	[AutoRatingACCId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[AccChargeTypeId] [smallint] NULL,
	[Quantity] [smallint] NULL,
	[Rate] [decimal](18, 2) NULL,
	[Amount] [smallint] NULL,
	[Notation] [varchar](255) NULL,
	[CalcByMiles] [bit] NULL,
 CONSTRAINT [PK_AutoRatingACC] PRIMARY KEY CLUSTERED 
(
	[AutoRatingACCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[AutoRatingDetail]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[AutoRatingDetail](
	[AutoRatingDetailId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[CommodityTypeId] [smallint] NOT NULL,
	[Rate] [decimal](18, 2) NULL,
	[RateUnit] [varchar](10) NULL,
	[EquipmentTypeId] [smallint] NULL,
	[Weight] [decimal](18, 2) NULL,
	[Temperature] [decimal](18, 1) NULL,
	[Pieces] [smallint] NULL,
	[RatePer] [smallint] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[CalcByMiles] [bit] NULL,
	[TemperatureTypeId] [smallint] NULL,
	[StartDate] [datetime] NULL,
	[ThroughDate] [datetime] NULL,
 CONSTRAINT [PK_AutoRatingDetail] PRIMARY KEY CLUSTERED 
(
	[AutoRatingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[BusinessUnit]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[BusinessUnit](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[TripNumberSuffix] [varchar](2) NULL,
 CONSTRAINT [PK_BusinessUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[CommodityType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[CommodityType](
	[CommodityTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Commodity] [varchar](100) NOT NULL,
	[CommodityDescription] [varchar](max) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_CommodityType] PRIMARY KEY CLUSTERED 
(
	[CommodityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[CompanyGoal]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[CompanyGoal](
	[CompanyGoalId] [smallint] IDENTITY(1,1) NOT NULL,
	[GoalYear] [smallint] NOT NULL,
	[GoalMonth] [smallint] NOT NULL,
	[Goal] [decimal](18, 0) NOT NULL,
	[DaysInMonth] [smallint] NOT NULL,
 CONSTRAINT [PK_CompanyGoal] PRIMARY KEY CLUSTERED 
(
	[CompanyGoalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[DispatcherGoal]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[DispatcherGoal](
	[DispatcherGoalId] [smallint] IDENTITY(1,1) NOT NULL,
	[GoalYear] [smallint] NOT NULL,
	[GoalMonth] [smallint] NOT NULL,
	[Goal] [int] NOT NULL,
	[DaysInMonth] [smallint] NOT NULL,
	[PersonId] [int] NULL,
 CONSTRAINT [PK_DispatcherGoal] PRIMARY KEY CLUSTERED 
(
	[DispatcherGoalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[DivisionDescriptionType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[DivisionDescriptionType](
	[DivisionDescriptionTypeId] [smallint] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DivisionDescriptionType] PRIMARY KEY CLUSTERED 
(
	[DivisionDescriptionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[DivisionGoal]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[DivisionGoal](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[GoalYear] [smallint] NOT NULL,
	[GoalMonth] [smallint] NOT NULL,
	[Goal] [decimal](18, 0) NOT NULL,
	[DivisionDescriptionTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_DivisionGoal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[DriverPay]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[DriverPay](
	[DriverPayId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[PayCodeId] [smallint] NULL,
	[TripNumber] [varchar](15) NULL,
	[PayDescription] [nvarchar](200) NULL,
	[PayNotes] [nvarchar](max) NULL,
	[PayQuantity] [decimal](18, 2) NOT NULL,
	[PayRate] [decimal](18, 2) NOT NULL,
	[TotalPay] [decimal](18, 2) NULL,
	[PayDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedByPersonId] [int] NULL,
	[AccChargeId] [int] NULL,
	[ItemSettled] [bit] NULL,
 CONSTRAINT [PK_DriverPay] PRIMARY KEY CLUSTERED 
(
	[DriverPayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[EquipmentType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[EquipmentType](
	[EquipmentTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[EquipmentType] [varchar](100) NOT NULL,
	[EquipmentDescription] [varchar](max) NULL,
	[TemperatureRequired] [bit] NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[FUEL_IMPORT]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[FUEL_IMPORT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BRANCH] [int] NULL,
	[CARD] [int] NULL,
	[BILL_TYPE] [nvarchar](255) NULL,
	[AUTH_CODE] [nvarchar](255) NULL,
	[INVOICE] [nvarchar](255) NULL,
	[UNIT] [nvarchar](255) NULL,
	[EMP_NUM] [nvarchar](255) NULL,
	[TRIP] [nvarchar](255) NULL,
	[TRAILER] [nvarchar](255) NULL,
	[HUB/SPEED] [bigint] NULL,
	[VEH_LICENSE] [nvarchar](255) NULL,
	[DRIVER] [nvarchar](255) NULL,
	[DATE] [datetime] NULL,
	[SETTLEMENT_DATE] [date] NULL,
	[TIME] [nvarchar](255) NULL,
	[CHAIN] [nvarchar](255) NULL,
	[IN_NETWORK] [nvarchar](255) NULL,
	[TS#] [int] NULL,
	[TS_NAME] [nvarchar](255) NULL,
	[TS_CITY] [nvarchar](255) NULL,
	[TS_STATE] [nvarchar](255) NULL,
	[PPG] [float] NULL,
	[NET_PPG] [float] NULL,
	[FUEL_GALS] [float] NULL,
	[Field1] [nvarchar](255) NULL,
	[FUEL_AMT] [decimal](18, 2) NULL,
	[RFR_GALS] [decimal](18, 2) NULL,
	[RFR_AMT] [decimal](18, 2) NULL,
	[DEF_GALS] [decimal](18, 2) NULL,
	[DEF_AMT] [decimal](18, 2) NULL,
	[CASH] [decimal](18, 2) NULL,
	[MISC] [decimal](18, 2) NULL,
	[INV_TOTAL] [decimal](18, 2) NULL,
	[FEE] [float] NULL,
	[DISC] [float] NULL,
	[INV_BALANCE] [float] NULL,
	[INTERFACED_QB] [bit] NOT NULL,
	[INSERT_DATE] [datetime] NULL,
	[ImportErrors] [varchar](max) NULL,
	[ParentCheckGuid] [varchar](100) NULL,
	[DataFee] [decimal](18, 2) NULL,
	[CreditType] [nvarchar](4) NULL,
 CONSTRAINT [PK_FUEL_IMPORT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[FUEL_IMPORT_Archive]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[FUEL_IMPORT_Archive](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BRANCH] [int] NULL,
	[CARD] [int] NULL,
	[BILL_TYPE] [nvarchar](255) NULL,
	[AUTH_CODE] [nvarchar](255) NULL,
	[INVOICE] [nvarchar](255) NULL,
	[UNIT] [nvarchar](255) NULL,
	[EMP_NUM] [nvarchar](255) NULL,
	[TRIP] [nvarchar](255) NULL,
	[TRAILER] [nvarchar](255) NULL,
	[HUB/SPEED] [int] NULL,
	[VEH_LICENSE] [nvarchar](255) NULL,
	[DRIVER] [nvarchar](255) NULL,
	[DATE] [datetime] NULL,
	[SETTLEMENT_DATE] [date] NULL,
	[TIME] [nvarchar](255) NULL,
	[CHAIN] [nvarchar](255) NULL,
	[IN_NETWORK] [nvarchar](255) NULL,
	[TS#] [int] NULL,
	[TS_NAME] [nvarchar](255) NULL,
	[TS_CITY] [nvarchar](255) NULL,
	[TS_STATE] [nvarchar](255) NULL,
	[PPG] [float] NULL,
	[NET_PPG] [float] NULL,
	[FUEL_GALS] [float] NULL,
	[Field1] [nvarchar](255) NULL,
	[FUEL_AMT] [decimal](18, 2) NULL,
	[RFR_GALS] [decimal](18, 2) NULL,
	[RFR_AMT] [decimal](18, 2) NULL,
	[DEF_GALS] [decimal](18, 2) NULL,
	[DEF_AMT] [decimal](18, 2) NULL,
	[CASH] [decimal](18, 2) NULL,
	[MISC] [decimal](18, 2) NULL,
	[INV_TOTAL] [decimal](18, 2) NULL,
	[FEE] [float] NULL,
	[DISC] [float] NULL,
	[INV_BALANCE] [float] NULL,
	[INTERFACED_QB] [bit] NOT NULL,
	[INSERT_DATE] [date] NULL,
	[ImportErrors] [varchar](max) NULL,
	[ParentCheckGuid] [varchar](100) NULL,
	[DataFee] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[FuelSurcharge]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[FuelSurcharge](
	[FuelSurchargeId] [smallint] IDENTITY(1,1) NOT NULL,
	[FuelPrice] [decimal](18, 3) NOT NULL,
	[FuelPrice_PADD4] [decimal](18, 3) NULL,
	[WeekEnding] [datetime] NOT NULL,
 CONSTRAINT [PK_FuelSurcharge] PRIMARY KEY CLUSTERED 
(
	[FuelSurchargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[FuelTaxRates]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[FuelTaxRates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STATE_ID] [nvarchar](2) NULL,
	[TAX_RATE] [float] NULL,
	[STATE_FSC] [float] NULL,
	[STARTING_DATE] [datetime] NULL,
	[ENDING_DATE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[GasStation]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[GasStation](
	[GasStationId] [int] NOT NULL,
	[StationName] [nvarchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_GasStation] PRIMARY KEY CLUSTERED 
(
	[GasStationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[Load]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[Load](
	[LoadId] [int] NOT NULL,
	[TripNumber] [varchar](15) NULL,
	[ClientId] [int] NULL,
	[Charges] [decimal](18, 2) NULL,
	[ExtraCharges] [decimal](18, 2) NULL,
	[Miles] [int] NULL,
	[PaidMiles] [int] NULL,
	[PaidEmpty] [int] NULL,
	[DeadHead] [int] NULL,
	[Paid] [varchar](20) NULL,
	[RatePerMile] [decimal](18, 10) NULL,
	[DispatcherPersonId] [int] NULL,
	[CreatedTs] [datetime] NULL,
	[AvailableBilling] [bit] NULL,
	[CommodityTypeId] [smallint] NULL,
	[LoadPlannerPersonId] [int] NULL,
	[EquipmentTypeId] [smallint] NULL,
	[Driver1_PersonId] [int] NULL,
	[Driver2_PersonId] [int] NULL,
	[TruckPunitId] [int] NULL,
	[Trailer1_TrailerId] [smallint] NULL,
	[Trailer2_TrailerId] [smallint] NULL,
	[Temperature] [decimal](18, 1) NULL,
	[TemperatureTypeId] [smallint] NULL,
	[CustomerLoadNumber] [varchar](30) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 10) NULL,
	[LoadStatusTypeId] [smallint] NULL,
	[GrossRevenue] [decimal](18, 3) NULL,
	[CreatedDt] [datetime] NULL,
	[CreatePersonId] [int] NULL,
	[LastUpdtDt] [datetime] NULL,
	[LastUpdtPersonId] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[LockedPersonId] [int] NULL,
	[Pieces] [int] NULL,
	[SendOriginalsInd] [bit] NULL,
	[LoadTotal] [decimal](18, 2) NULL,
	[AutoRatingInd] [bit] NULL,
	[AccChargesTotal] [decimal](18, 2) NULL,
	[PaperworkRecvdDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[ProblemInd] [bit] NULL,
	[AllowPerBOLInd] [bit] NULL,
	[BillableTotal] [decimal](18, 2) NULL,
	[MileageFromLEGOverrideInd] [bit] NULL,
 CONSTRAINT [PK_Load] PRIMARY KEY CLUSTERED 
(
	[LoadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadApptType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadApptType](
	[LoadApptTypeId] [smallint] NOT NULL,
	[ApptTypeNm] [varchar](20) NOT NULL,
	[AppliesToPickup] [bit] NULL,
	[AppliesToLEG] [bit] NULL,
	[AppliesToDrop] [bit] NULL,
 CONSTRAINT [PK_LoadApptType] PRIMARY KEY CLUSTERED 
(
	[LoadApptTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadBilling]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadBilling](
	[LoadId] [int] NOT NULL,
	[ImportErrors] [varchar](max) NULL,
	[ImportedDt] [datetime] NULL,
	[ImportSuccess] [bit] NULL,
 CONSTRAINT [PK_LoadBilling] PRIMARY KEY CLUSTERED 
(
	[LoadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadFile]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadFile](
	[LoadFileId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadFileTypeId] [smallint] NOT NULL,
	[AddedByPersonId] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ActiveInd] [bit] NOT NULL,
 CONSTRAINT [PK_LoadFile] PRIMARY KEY CLUSTERED 
(
	[LoadFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadFileType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadFileType](
	[LoadFileTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[FileTypeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_LoadFileType] PRIMARY KEY CLUSTERED 
(
	[LoadFileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadNotes]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadNotes](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[NoteTypeId] [smallint] NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStopid] [int] NOT NULL,
	[NoteDate] [datetime] NULL,
	[NotePersonId] [int] NOT NULL,
	[NoteText] [varchar](max) NOT NULL,
	[ArchivedInd] [bit] NULL,
	[Action] [varchar](2) NULL,
	[ActionPersonId] [int] NULL,
	[ActionDate] [datetime] NULL,
 CONSTRAINT [PK_LoadNotes] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadPlanner]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadPlanner](
	[LoadId] [int] NOT NULL,
	[TenderId] [int] NOT NULL,
	[PlannerPersonId] [int] NULL,
	[ActiveInd] [bit] NOT NULL,
	[BusinessUnitId] [smallint] NULL,
	[Rate] [decimal](18, 10) NULL,
	[TenderAcceptedBy] [int] NULL,
	[RateWasSent] [bit] NOT NULL,
 CONSTRAINT [PK_Loadplanner] PRIMARY KEY CLUSTERED 
(
	[LoadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadPlanner_Notes]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadPlanner_Notes](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[NoteTypeId] [smallint] NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStopid] [int] NOT NULL,
	[NoteDate] [datetime] NULL,
	[NotePersonId] [int] NOT NULL,
	[NoteText] [varchar](max) NOT NULL,
	[ArchivedInd] [bit] NULL,
	[Action] [varchar](2) NULL,
	[ActionPersonId] [int] NULL,
	[ActionDate] [datetime] NULL,
 CONSTRAINT [PK_LoadPlanner_Notes] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadPlanner_Stops]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadPlanner_Stops](
	[LoadStopId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStopTypeId] [smallint] NOT NULL,
	[StopNumber] [smallint] NOT NULL,
	[StopTypeNumber] [smallint] NOT NULL,
	[SequenceNumber] [smallint] NOT NULL,
	[ReasonCode] [varchar](2) NOT NULL,
	[DateQualifier1] [varchar](2) NULL,
	[Date1] [datetime] NULL,
	[DateQualifier2] [varchar](2) NULL,
	[Date2] [datetime] NULL,
	[WeightQualifier] [varchar](2) NULL,
	[WeightUnitCode] [char](1) NULL,
	[Weight] [decimal](10, 2) NULL,
	[LadingQuantity] [int] NULL,
	[VolumeUnitQualifier] [char](1) NULL,
	[Volume] [decimal](10, 2) NULL,
	[QuantityOfPalletsShipped] [int] NULL,
	[PalletExchangeCode] [char](1) NULL,
	[NoteTypeId] [varchar](3) NULL,
	[Notes] [varchar](max) NULL,
	[EntityIdentifierCode] [varchar](3) NULL,
	[EntityName] [varchar](60) NULL,
	[EntityIdentificationCodeQualifier] [varchar](2) NULL,
	[EntityIdentificationCode] [varchar](80) NULL,
	[Address1] [varchar](55) NULL,
	[Address2] [varchar](55) NULL,
	[City] [varchar](30) NULL,
	[StateOrProvince] [varchar](2) NULL,
	[PostalCode] [varchar](15) NULL,
	[CountryCode] [varchar](3) NULL,
	[Contact1FunctionCode] [varchar](2) NULL,
	[Contact1Name] [varchar](60) NULL,
	[Contact1NumberQualifier] [varchar](2) NULL,
	[Contact1Number] [varchar](80) NULL,
	[Contact2FunctionCode] [varchar](2) NULL,
	[Contact2Name] [varchar](60) NULL,
	[Contact2NumberQualifier] [varchar](2) NULL,
	[Contact2Number] [varchar](80) NULL,
	[Contact3FunctionCode] [varchar](2) NULL,
	[Contact3Name] [varchar](60) NULL,
	[Contact3NumberQualifier] [varchar](2) NULL,
	[Contact3Number] [varchar](80) NULL,
	[ClientId] [int] NULL,
	[GasStationId] [int] NULL,
 CONSTRAINT [PK_LoadPlanner_Stops_1] PRIMARY KEY CLUSTERED 
(
	[LoadStopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStatus]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStatus](
	[LoadStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusTs] [datetime] NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStatusTypeId] [smallint] NOT NULL,
	[LstUpdtPersonId] [int] NOT NULL,
	[HeldForApproval] [bit] NOT NULL,
 CONSTRAINT [PK_LoadStatus] PRIMARY KEY CLUSTERED 
(
	[LoadStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStatusSubType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStatusSubType](
	[LoadStatusSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[LoadStatusTypeId] [smallint] NOT NULL,
	[TruckingInd] [bit] NOT NULL,
	[LogisticsInd] [bit] NOT NULL,
 CONSTRAINT [PK_LoadStatusSubType] PRIMARY KEY CLUSTERED 
(
	[LoadStatusSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStatusType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStatusType](
	[LoadStatusTypeId] [smallint] NOT NULL,
	[LoadStatusTypeNm] [varchar](50) NOT NULL,
	[StatusOrder] [smallint] NULL,
	[Notify] [bit] NOT NULL,
	[EdiShipmentStatusCode] [varchar](2) NULL,
 CONSTRAINT [PK_LoadStatusType] PRIMARY KEY CLUSTERED 
(
	[LoadStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStatusUpdate_Pending]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStatusUpdate_Pending](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusinessUnitId] [smallint] NOT NULL,
	[LoadStopId] [int] NOT NULL,
	[OpenInd] [bit] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[DateType] [char](1) NULL,
 CONSTRAINT [PK_LoadStatusUpdate_Pending] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStop]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStop](
	[LoadStopId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[CurrentStopStatusTypeId] [smallint] NULL,
	[LoadStopTypeId] [smallint] NOT NULL,
	[StopNumber] [smallint] NOT NULL,
	[StopTypeNumber] [smallint] NOT NULL,
	[Driver1_PersonId] [int] NULL,
	[Driver2_PersonId] [int] NULL,
	[TruckPunitId] [int] NULL,
	[Trailer1_TrailerId] [smallint] NULL,
	[Trailer2_TrailerId] [smallint] NULL,
	[EquipmentTypeId] [smallint] NULL,
	[LoadApptTypeId] [smallint] NULL,
	[ClientId] [int] NULL,
	[StartDateTime] [datetime] NULL,
	[ThroughDateTime] [datetime] NULL,
	[PONumber] [varchar](100) NULL,
	[BillOfLading] [varchar](100) NULL,
	[PUNumber] [varchar](100) NULL,
	[Other] [varchar](100) NULL,
	[DeliveryNumber1] [varchar](20) NULL,
	[DeliveryNumber2] [varchar](20) NULL,
	[DeliveryNumber3] [varchar](20) NULL,
	[DeliveryNumber4] [varchar](20) NULL,
	[AdhocClientName] [varchar](100) NULL,
	[AdhocClientAddressLine1] [varchar](100) NULL,
	[AdhocClientAddressLine2] [varchar](100) NULL,
	[AdhocClientCity] [varchar](50) NULL,
	[AdhocClientState] [varchar](10) NULL,
	[AdhocClientZipCode] [varchar](10) NULL,
	[AdhocTimeZone] [varchar](5) NULL,
	[GasStationId] [int] NULL,
	[StartDateTime_DisplayTimeInd] [bit] NULL,
	[ThroughDateTime_DisplayTimeInd] [bit] NULL,
	[FuelGallons] [smallint] NULL,
	[DEFGallons] [smallint] NULL,
	[PaidMiles] [int] NULL,
	[PaidEmpty] [int] NULL,
	[DropStartDateTime] [datetime] NULL,
	[DropStartDateTime_DisplayTimeInd] [bit] NULL,
	[StartActualDateTime] [datetime] NULL,
	[ArrivalDateTime] [datetime] NULL,
	[DepartureDateTime] [datetime] NULL,
	[LoadTypeId] [smallint] NULL,
	[TrailerDropDateTime] [datetime] NULL,
 CONSTRAINT [PK_LoadStop] PRIMARY KEY CLUSTERED 
(
	[LoadStopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStop_ReferenceNumbers]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStop_ReferenceNumbers](
	[LoadStopId] [int] NOT NULL,
	[LoadId] [int] NOT NULL,
	[ReferenceIdentificationQualifierCode] [varchar](3) NOT NULL,
	[ReferenceIdentification] [varchar](30) NULL,
 CONSTRAINT [PK_LoadStop_ReferenceNumbers] PRIMARY KEY CLUSTERED 
(
	[LoadId] ASC,
	[LoadStopId] ASC,
	[ReferenceIdentificationQualifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStopStatusType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStopStatusType](
	[LoadStopStatusTypeId] [smallint] NOT NULL,
	[LoadStopStatusTypeNm] [varchar](50) NOT NULL,
	[EdiShipmentStatusCode] [varchar](2) NOT NULL,
	[StatusOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_LoadStopStatusType] PRIMARY KEY CLUSTERED 
(
	[LoadStopStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadStopType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadStopType](
	[LoadStopTypeId] [smallint] NOT NULL,
	[StopNm] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LoadStopType] PRIMARY KEY CLUSTERED 
(
	[LoadStopTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadToLoadStatusSubType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadToLoadStatusSubType](
	[LoadToLoadStatusSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStatusSubTypeId] [int] NOT NULL,
	[CustomVal] [varchar](100) NULL,
 CONSTRAINT [PK_LoadToLoadStatusSubType] PRIMARY KEY CLUSTERED 
(
	[LoadToLoadStatusSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadTrace]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadTrace](
	[LoadTraceId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NULL,
	[TraceNumber] [nvarchar](40) NULL,
	[LoadTraceTypeId] [int] NOT NULL,
 CONSTRAINT [PK_LoadTrace] PRIMARY KEY CLUSTERED 
(
	[LoadTraceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadTraceType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadTraceType](
	[LoadTraceTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TraceTypeCd] [nvarchar](1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoadTraceType] PRIMARY KEY CLUSTERED 
(
	[LoadTraceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LoadType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LoadType](
	[LoadTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[LoadTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LoadType] PRIMARY KEY CLUSTERED 
(
	[LoadTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[Log]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[LoadId] [int] NOT NULL,
	[StopId] [int] NOT NULL,
	[TripNumber] [varchar](15) NOT NULL,
	[CustomerLoadNumber] [varchar](30) NOT NULL,
	[LogEventTypeId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[ExtraInformation] [varchar](max) NOT NULL,
	[TenderId] [int] NOT NULL,
 CONSTRAINT [PK_Dispatch_LogId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[LogEventType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[LogEventType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dispatch_LogEventTypeId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[Mileage_DD_Staged]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[Mileage_DD_Staged](
	[Date] [datetime] NULL,
	[SourceName] [nvarchar](255) NULL,
	[PayrollItem] [nvarchar](255) NULL,
	[Quantity] [float] NULL,
	[Class] [nvarchar](255) NULL,
	[NameAccountNumber] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[MileageActual]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[MileageActual](
	[MileageActualId] [int] IDENTITY(1,1) NOT NULL,
	[ActualDate] [datetime] NOT NULL,
	[Mileage] [int] NOT NULL,
	[MileageDivisionDescId] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MileageActualId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[MileageDivisionDesc]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[MileageDivisionDesc](
	[MileageDivisionDescId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MileageDivisionDescId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[MileageGoals]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[MileageGoals](
	[MileageGoalsId] [int] IDENTITY(1,1) NOT NULL,
	[GoalDate] [datetime] NOT NULL,
	[Mileage] [int] NOT NULL,
	[MileageDivisionDescId] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MileageGoalsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[NoteType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[NoteType](
	[NoteTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[NoteTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_NoteType] PRIMARY KEY CLUSTERED 
(
	[NoteTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[OO_FuelSurcharge]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[OO_FuelSurcharge](
	[OO_FuelSurchargeId] [smallint] NOT NULL,
	[FuelSurcharge] [decimal](18, 2) NOT NULL,
	[DoublesSurcharge] [decimal](18, 2) NOT NULL,
	[LowerPrice] [decimal](18, 3) NOT NULL,
	[UpperPrice] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_OO_FuelSurcharge_1] PRIMARY KEY CLUSTERED 
(
	[OO_FuelSurchargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[OperationsUnitType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[OperationsUnitType](
	[OperationsUnitTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[OperationsUnitTypeName] [varchar](60) NOT NULL,
 CONSTRAINT [PK_OperationsUnitType] PRIMARY KEY CLUSTERED 
(
	[OperationsUnitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PayCode]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PayCode](
	[PayCodeId] [smallint] IDENTITY(1,1) NOT NULL,
	[PayCode] [varchar](50) NOT NULL,
	[PayCodeDescription] [nvarchar](255) NULL,
	[PayCodeType] [nvarchar](255) NULL,
	[VendorPayTypeId] [smallint] NULL,
	[CreatedByPersonId] [int] NULL,
 CONSTRAINT [PK_PayCode] PRIMARY KEY CLUSTERED 
(
	[PayCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_OTR_History]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_OTR_History](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[LoadId] [int] NULL,
	[TripNumber] [varchar](15) NULL,
	[TruckNumber] [int] NULL,
	[Client_Id] [varchar](max) NULL,
	[PickupBy] [datetime] NULL,
	[DeliverBy] [datetime] NULL,
	[DriverType] [varchar](max) NULL,
	[LegInd] [bit] NULL,
	[PickOrigin] [varchar](max) NULL,
	[DropDest] [varchar](max) NULL,
	[DriverPersonId] [int] NULL,
	[PayCode] [varchar](max) NULL,
	[PayId] [int] NULL,
	[Quantity] [decimal](10, 2) NULL,
	[PayRateAmount] [decimal](10, 2) NULL,
	[TotalPay] [decimal](10, 2) NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PayrollNotes] [varchar](max) NULL,
	[LastUpdate] [datetime] NOT NULL,
	[LastUpdateBy] [int] NOT NULL,
	[PUnitId] [int] NULL,
 CONSTRAINT [PK_PR_OTR_History] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_OTR_Processing]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_OTR_Processing](
	[ProcessingId] [int] IDENTITY(1,1) NOT NULL,
	[Driver1] [varchar](50) NULL,
	[Driver1Id] [int] NULL,
	[Driver2] [varchar](50) NULL,
	[Driver2Id] [int] NULL,
	[LoadId] [int] NULL,
	[TripNumber] [varchar](15) NULL,
	[LegInd] [bit] NULL,
	[PUnitId] [int] NULL,
	[TruckNumber] [varchar](50) NULL,
	[Client_Id] [varchar](max) NULL,
	[ClientName] [varchar](50) NULL,
	[PickupBy] [datetime] NULL,
	[DeliverBy] [datetime] NULL,
	[PickOrigin] [varchar](max) NULL,
	[DropDest] [varchar](max) NULL,
	[StopCount] [int] NULL,
	[MilesLoaded] [int] NULL,
	[MilesDeadHead] [int] NULL,
	[MilesPaid] [int] NULL,
	[PayRateId] [int] NULL,
	[Description] [varchar](max) NULL,
	[PayQuantity] [decimal](10, 2) NULL,
	[PayRate] [decimal](10, 2) NULL,
	[PayTotal] [decimal](10, 2) NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PayrollNotes] [varchar](max) NULL,
 CONSTRAINT [PK_PR_OTR_Processing] PRIMARY KEY CLUSTERED 
(
	[ProcessingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_Fuel]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_Fuel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TripDate] [datetime] NOT NULL,
	[TicketNumber] [varchar](50) NOT NULL,
	[Vehicle] [int] NOT NULL,
	[TruckStop] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Qty] [decimal](10, 2) NOT NULL,
	[Amt] [decimal](10, 2) NOT NULL,
	[Company] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_History]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_History](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityTypeId] [smallint] NULL,
	[LocationTypeId] [smallint] NULL,
	[PunitId] [int] NULL,
	[TripDate] [datetime] NULL,
	[TripNumber] [varchar](15) NULL,
	[OriginTerminalList] [varchar](100) NULL,
	[DestinationTerminalList] [varchar](100) NULL,
	[Type] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[PayRate] [decimal](10, 2) NULL,
	[MilesDays] [int] NULL,
	[PaidMiles] [decimal](10, 2) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Extended] [decimal](10, 2) NULL,
	[FedExType] [smallint] NULL,
	[PersonId] [int] NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PayrollNotes] [varchar](max) NULL,
	[FedExId2] [int] NULL,
	[PersonId2] [int] NULL,
	[FedExId] [int] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_PR_SettlementStmt_History] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_History_delete]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_History_delete](
	[Company] [varchar](max) NULL,
	[Emp_Location] [varchar](max) NULL,
	[Vehicle] [int] NULL,
	[FedExId] [int] NULL,
	[FullName] [varchar](max) NULL,
	[TripDate] [datetime] NULL,
	[Origin] [varchar](max) NULL,
	[Destination] [varchar](max) NULL,
	[Type] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[PayRate] [decimal](10, 2) NULL,
	[Miles] [int] NULL,
	[PaidMiles/Days] [decimal](10, 2) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Extended] [decimal](10, 2) NULL,
	[DefaultDriverType] [varchar](max) NULL,
	[PersonId] [int] NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PayrollNotes] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_Linehaul]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_Linehaul](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TripDate] [datetime] NOT NULL,
	[TripNumber] [varchar](15) NOT NULL,
	[LegOrg] [varchar](10) NOT NULL,
	[LegDest] [varchar](10) NOT NULL,
	[MilesQty] [int] NOT NULL,
	[TotalRate] [varchar](50) NOT NULL,
	[TotalAmount] [varchar](50) NOT NULL,
	[Driver1] [varchar](50) NOT NULL,
	[Driver2] [varchar](50) NOT NULL,
	[Company] [varchar](50) NOT NULL,
	[Vehicle] [int] NOT NULL,
	[VMRCatDom] [varchar](20) NULL,
	[VMRRate] [decimal](18, 3) NULL,
	[MileagePlus] [decimal](18, 3) NULL,
	[Premiums] [decimal](18, 3) NULL,
	[Fuel] [decimal](18, 4) NULL,
	[DAndH] [decimal](18, 2) NULL,
	[Tolls] [decimal](18, 2) NULL,
	[FlatRate] [decimal](18, 2) NULL,
	[DailyGrossAmt] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_PD]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_PD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TripDate] [datetime] NOT NULL,
	[AVR] [int] NOT NULL,
	[TripNumber] [varchar](15) NOT NULL,
	[SpotName] [varchar](50) NOT NULL,
	[MilesQty] [int] NOT NULL,
	[SpotAmt] [decimal](10, 2) NOT NULL,
	[Driver1] [varchar](50) NOT NULL,
	[Driver2] [varchar](50) NULL,
	[Company] [varchar](50) NOT NULL,
	[Vehicle] [int] NOT NULL,
	[SiteName] [varchar](200) NULL,
	[FuelAmt] [decimal](18, 2) NULL,
	[LiveAmt] [decimal](18, 2) NULL,
	[MileageAmt] [decimal](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_Processing]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_Processing](
	[ProcessingId] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityTypeId] [smallint] NULL,
	[LocationTypeId] [smallint] NULL,
	[PunitId] [int] NULL,
	[TripDate] [datetime] NULL,
	[TripNumber] [varchar](15) NULL,
	[OriginTerminalList] [varchar](100) NULL,
	[DestinationTerminalList] [varchar](100) NULL,
	[Type] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[PayRate] [decimal](10, 2) NULL,
	[MilesDays] [int] NULL,
	[PaidMiles] [decimal](10, 2) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Extended] [decimal](10, 2) NULL,
	[FedExType] [smallint] NULL,
	[PersonId] [int] NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PayrollNotes] [varchar](max) NULL,
	[FedExId2] [int] NULL,
	[PersonId2] [int] NULL,
	[FedExId] [int] NULL,
 CONSTRAINT [PK_PR_SettlementStmt_Processing] PRIMARY KEY CLUSTERED 
(
	[ProcessingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_Review]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityTypeId] [smallint] NULL,
	[LocationTypeId] [smallint] NULL,
	[PunitId] [int] NULL,
	[Vehicle] [varchar](50) NULL,
	[TripDate] [datetime] NULL,
	[TripNumber] [varchar](15) NULL,
	[OriginTerminalList] [varchar](max) NULL,
	[DestinationTerminalList] [varchar](max) NULL,
	[Type] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[PayRate] [decimal](10, 2) NULL,
	[MilesDays] [int] NULL,
	[PaidMiles] [decimal](10, 2) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Extended] [decimal](10, 2) NULL,
	[FedExType] [smallint] NULL,
	[PersonId] [int] NULL,
	[FedExId] [int] NULL,
	[PayPeriodEnding] [datetime] NULL,
	[PersonId2] [int] NULL,
	[FedExId2] [int] NULL,
 CONSTRAINT [PK_PR_SettlementStmt_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_SettlementStmt_Staging_Delete]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_SettlementStmt_Staging_Delete](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Col1_TripDate_TripDate_TripDate] [datetime] NOT NULL,
	[Col2_TripNumber_AVR_TicketNumber] [varchar](50) NOT NULL,
	[Col3_LegOrg_TripNumber_Vehicle] [varchar](50) NOT NULL,
	[Col4_LegDest_SpotName_TruckStop] [varchar](50) NOT NULL,
	[Col5_Blank_Blank_City] [varchar](50) NOT NULL,
	[Col6_MilesQty_Blank_State] [varchar](50) NOT NULL,
	[Col7_Blank_Blank_Qty] [varchar](50) NOT NULL,
	[Col9_Blank_MilesQty_Blank] [varchar](50) NOT NULL,
	[Col11_TotalRate_Blank_Blank] [varchar](50) NOT NULL,
	[Col12_TotalAmt_SpotAmt_Blank] [varchar](50) NOT NULL,
	[Col14_Blank_Blank_Amt] [varchar](50) NOT NULL,
	[Col19_Driver1_Driver_Blank] [varchar](50) NOT NULL,
	[Col20_Driver2_Blank_Blank] [varchar](50) NOT NULL,
	[Company] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_Staged_DD]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_Staged_DD](
	[Col 1] [varchar](50) NULL,
	[Col 2] [varchar](50) NULL,
	[Col 3] [varchar](50) NULL,
	[Col 4] [varchar](50) NULL,
	[Col 5] [varchar](50) NULL,
	[Col 6] [varchar](50) NULL,
	[Col 7] [varchar](50) NULL,
	[Col 8] [varchar](50) NULL,
	[Col 9] [varchar](50) NULL,
	[Col 10] [varchar](50) NULL,
	[Col 11] [varchar](50) NULL,
	[Col 12] [varchar](50) NULL,
	[Col 13] [varchar](50) NULL,
	[Col 14] [varchar](50) NULL,
	[Col 15] [varchar](50) NULL,
	[Col 16] [varchar](50) NULL,
	[Col 17] [varchar](50) NULL,
	[Col 18] [varchar](50) NULL,
	[Col 19] [varchar](50) NULL,
	[Col 20] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_Staged_GJ]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_Staged_GJ](
	[Col 1] [varchar](50) NULL,
	[Col 2] [varchar](50) NULL,
	[Col 3] [varchar](50) NULL,
	[Col 4] [varchar](50) NULL,
	[Col 5] [varchar](50) NULL,
	[Col 6] [varchar](50) NULL,
	[Col 7] [varchar](50) NULL,
	[Col 8] [varchar](50) NULL,
	[Col 9] [varchar](50) NULL,
	[Col 10] [varchar](50) NULL,
	[Col 11] [varchar](50) NULL,
	[Col 12] [varchar](50) NULL,
	[Col 13] [varchar](50) NULL,
	[Col 14] [varchar](50) NULL,
	[Col 15] [varchar](50) NULL,
	[Col 16] [varchar](50) NULL,
	[Col 17] [varchar](50) NULL,
	[Col 18] [varchar](50) NULL,
	[Col 19] [varchar](50) NULL,
	[Col 20] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PR_Staged_RB]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PR_Staged_RB](
	[Col 1] [nvarchar](255) NULL,
	[Col 2] [nvarchar](255) NULL,
	[Col 3] [nvarchar](255) NULL,
	[Col 4] [nvarchar](255) NULL,
	[Col 5] [nvarchar](255) NULL,
	[Col 6] [nvarchar](255) NULL,
	[Col 7] [nvarchar](255) NULL,
	[Col 8] [nvarchar](255) NULL,
	[Col 9] [nvarchar](255) NULL,
	[Col 10] [nvarchar](255) NULL,
	[Col 11] [nvarchar](255) NULL,
	[Col 12] [nvarchar](255) NULL,
	[Col 13] [nvarchar](255) NULL,
	[Col 14] [nvarchar](255) NULL,
	[Col 15] [nvarchar](255) NULL,
	[Col 16] [nvarchar](255) NULL,
	[Col 17] [nvarchar](255) NULL,
	[Col 18] [nvarchar](255) NULL,
	[Col 19] [nvarchar](255) NULL,
	[Col 20] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[Punit]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[Punit](
	[PunitId] [int] IDENTITY(1,1) NOT NULL,
	[Unit_ID] [varchar](255) NULL,
	[SafetyExpiration] [datetime] NULL,
	[RegExpiration] [datetime] NULL,
	[ActiveInd] [bit] NOT NULL,
	[OTR_Planning] [bit] NOT NULL,
	[DefaultDispatcher] [varchar](255) NULL,
	[IFTAExpiration] [datetime] NULL,
	[LiabilityExpiration] [datetime] NULL,
	[CargoExpiration] [datetime] NULL,
	[PlateNumber] [varchar](255) NULL,
	[PrePass] [varchar](255) NULL,
	[EZPass] [varchar](255) NULL,
	[ID_129K] [datetime] NULL,
	[MT_95_FT] [datetime] NULL,
	[UT_OVERWEIGHT] [datetime] NULL,
	[ND_LENGTH] [datetime] NULL,
	[ND_WEIGHT] [datetime] NULL,
	[ColoradoLVCDt] [datetime] NULL,
	[LastWashDt] [datetime] NULL,
	[VIN] [nchar](255) NULL,
	[Make] [nchar](255) NULL,
	[Model] [nchar](255) NULL,
	[Mod_Year] [int] NULL,
	[InService] [datetime] NULL,
	[Division] [smallint] NULL,
 CONSTRAINT [PK_Punit] PRIMARY KEY CLUSTERED 
(
	[PunitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Unit_ID] UNIQUE NONCLUSTERED 
(
	[Unit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[PUNIT_Staging]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[PUNIT_Staging](
	[UNIT_ID] [nvarchar](10) NOT NULL,
	[SAFETY_EXPIRATION] [datetime] NULL,
	[REG_EXPIRATION] [datetime] NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[OTR_PLANNING] [bit] NOT NULL,
	[DEFAULT_DISPATCHER] [nvarchar](30) NULL,
	[IFTA_EXPIRATION] [datetime] NULL,
	[LIABILITY_EXPIRATION] [datetime] NULL,
	[CARGO_EXPIRATION] [datetime] NULL,
	[PLATE_NUMBER] [nvarchar](255) NULL,
	[PRE_PASS] [nvarchar](255) NULL,
	[EZ_PASS] [nvarchar](255) NULL,
	[ID_129K] [datetime] NULL,
	[MT_95_FT] [datetime] NULL,
	[UT_OVERWEIGHT] [datetime] NULL,
	[ND_LENGTH] [datetime] NULL,
	[ND_WEIGHT] [datetime] NULL,
	[CO_LVC] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[Schedule]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[Schedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NULL,
	[BusinessEntityTypeId] [smallint] NOT NULL,
	[PUnitId] [int] NOT NULL,
	[RunDescription] [varchar](200) NOT NULL,
	[FedExAssign] [varchar](200) NULL,
	[Decline] [decimal](5, 2) NULL,
	[ScheduleOddEvenId] [int] NOT NULL,
	[ScheduleShortLongId] [int] NOT NULL,
	[Bump] [bit] NULL,
	[BumpDescription] [varchar](200) NULL,
	[ScheduleTime] [time](7) NULL,
	[LocationTypeId] [int] NULL,
	[ScheduleDays] [int] NULL,
	[Notes] [text] NULL,
	[Miles] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LastUpdatedBy] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Client_Id] UNIQUE NONCLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[ScheduleDays]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[ScheduleDays](
	[ScheduleDaysId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleDaysDesc] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ScheduleDays] PRIMARY KEY CLUSTERED 
(
	[ScheduleDaysId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[ScheduleDaysMapping]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[ScheduleDaysMapping](
	[ScheduleId] [int] NOT NULL,
	[ScheduleDaysId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[ScheduleDrivers]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[ScheduleDrivers](
	[ScheduleDriversId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[ScheduleDriverWeekId] [int] NOT NULL,
	[ScheduleDriver1] [int] NULL,
	[ScheduleDriver2] [int] NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ScheduleDrivers] PRIMARY KEY CLUSTERED 
(
	[ScheduleDriversId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[ScheduleOddEven]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[ScheduleOddEven](
	[ScheduleOddEvenId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleOddEvenDesc] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ScheduleOddEven] PRIMARY KEY CLUSTERED 
(
	[ScheduleOddEvenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[ScheduleShortLong]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[ScheduleShortLong](
	[ScheduleShortLongId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleShortLongDesc] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ScheduleShortLong] PRIMARY KEY CLUSTERED 
(
	[ScheduleShortLongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[TargetOrActualType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[TargetOrActualType](
	[TargetOrActualTypeId] [smallint] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TargetOrActualType] PRIMARY KEY CLUSTERED 
(
	[TargetOrActualTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[TargetVsActualDesc]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[TargetVsActualDesc](
	[TargetVsActualDescId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TargetVsActualDescId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[TargetVsActualMileage]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[TargetVsActualMileage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EvalDate] [datetime] NOT NULL,
	[Mileage] [int] NOT NULL,
	[TargetOrActualTypeId] [smallint] NOT NULL,
	[TargetVsActualDescId] [smallint] NOT NULL,
 CONSTRAINT [PK_TargetVsActualMileage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[TemperatureType]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[TemperatureType](
	[TemperatureTypeId] [smallint] NOT NULL,
	[TemperatureType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TemperatureType] PRIMARY KEY CLUSTERED 
(
	[TemperatureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[TerminalList]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[TerminalList](
	[TerminalListId] [int] IDENTITY(1,1) NOT NULL,
	[TerminalNumber] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TerminalList] PRIMARY KEY CLUSTERED 
(
	[TerminalListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_TerminalNumber] UNIQUE NONCLUSTERED 
(
	[TerminalNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[Trailer]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[Trailer](
	[TrailerId] [smallint] IDENTITY(1,1) NOT NULL,
	[Trailer_ID] [varchar](255) NOT NULL,
	[SafetyExpiration] [datetime] NULL,
	[RegExpiration] [datetime] NULL,
	[ActiveInd] [bit] NOT NULL,
	[InsuranceExpiration] [datetime] NULL,
	[LastWashDt] [datetime] NULL,
	[LicensePlate] [varchar](255) NULL,
 CONSTRAINT [PK_Trailer] PRIMARY KEY CLUSTERED 
(
	[TrailerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Trailer_ID] UNIQUE NONCLUSTERED 
(
	[Trailer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dispatch].[TRANSCHECK_IMPORT]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dispatch].[TRANSCHECK_IMPORT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BRANCH] [float] NULL,
	[DATE] [datetime] NULL,
	[TIME] [nvarchar](255) NULL,
	[F4] [nvarchar](255) NULL,
	[BOOK #] [float] NULL,
	[TRANSACTION] [float] NULL,
	[F7] [nvarchar](255) NULL,
	[AMOUNT] [float] NULL,
	[F9] [nvarchar](255) NULL,
	[FEE] [float] NULL,
	[CHECK #] [float] NULL,
	[F12] [nvarchar](255) NULL,
	[CASHING ID] [nvarchar](255) NULL,
	[F14] [nvarchar](255) NULL,
	[F15] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[CONTROL CARD] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[UNIT] [nvarchar](255) NULL,
	[PRODUCT TYPE] [nvarchar](255) NULL,
	[F26] [nvarchar](255) NULL,
	[EXPLANATION] [nvarchar](255) NULL,
	[WAYBILL #] [nvarchar](255) NULL,
	[F29] [nvarchar](255) NULL,
	[PAYEE] [nvarchar](255) NULL,
	[GENERAL LEDGER] [nvarchar](255) NULL,
	[INTERFACED_QB] [bit] NOT NULL,
	[ImportErrors] [varchar](max) NULL,
	[ParentCheckGuid] [varchar](100) NULL,
	[InsertDate] [datetime] NULL,
	[CreditType] [nvarchar](4) NULL,
 CONSTRAINT [PK_TRANSCHECK_IMPORT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [edi].[CommodityCodeQualifier]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[CommodityCodeQualifier](
	[CommodityCodeQualifierId] [varchar](2) NOT NULL,
	[Description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_EDI_CommodityCodeQualifierId] PRIMARY KEY CLUSTERED 
(
	[CommodityCodeQualifierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[CommunicationNumberQualifier]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[CommunicationNumberQualifier](
	[CommunicationNumberQualifierId] [varchar](2) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EDI_CommunicationNumberQualifierId] PRIMARY KEY CLUSTERED 
(
	[CommunicationNumberQualifierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[ContactFunction]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[ContactFunction](
	[ContactFunctionId] [varchar](2) NOT NULL,
	[Description] [varchar](70) NOT NULL,
 CONSTRAINT [PK_EDI_ContactFunctionId] PRIMARY KEY CLUSTERED 
(
	[ContactFunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[Control]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[Control](
	[ControlNumberPrefix] [smallint] NOT NULL,
	[ControlNumber] [int] NOT NULL,
	[SenderInterchangeId] [char](15) NULL,
	[SenderInterchangeIdQualifier] [varchar](2) NULL,
	[SenderAlphaCode] [varchar](4) NULL,
	[SenderInterchangeIdTest] [char](15) NULL,
	[SenderAlphaCodeTest] [varchar](4) NULL,
	[SenderAs2Id] [varchar](50) NULL,
	[SenderAs2IdTest] [varchar](15) NULL,
	[SenderName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[DateQualifier]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[DateQualifier](
	[DateQualifierCode] [varchar](2) NOT NULL,
	[DateQualifierName] [varchar](60) NOT NULL,
 CONSTRAINT [PK_EDI_DateQualifier] PRIMARY KEY CLUSTERED 
(
	[DateQualifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[EntityIdentifierCode]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[EntityIdentifierCode](
	[EntityIdentifierCode] [varchar](3) NOT NULL,
	[EntityIdentifierName] [varchar](175) NOT NULL,
 CONSTRAINT [PK_EntityIdentifierCode] PRIMARY KEY CLUSTERED 
(
	[EntityIdentifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[EquipmentDescriptionCode]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[EquipmentDescriptionCode](
	[EquipmentDescriptionCode] [varchar](2) NOT NULL,
	[EquipmentDescriptionName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EDI_EquipmentDescriptionCode] PRIMARY KEY CLUSTERED 
(
	[EquipmentDescriptionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[HazardMaterialShipmentInformationQualifier]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[HazardMaterialShipmentInformationQualifier](
	[HazardMaterialShipmentInformationQualifierId] [varchar](3) NOT NULL,
	[Description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_EDI_HazardMaterialShipmentInformationQualifierId] PRIMARY KEY CLUSTERED 
(
	[HazardMaterialShipmentInformationQualifierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[HazardMaterialShippingNameQualifier]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[HazardMaterialShippingNameQualifier](
	[HazardMaterialShippingNameQualifierId] [char](1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EDI_HazardMaterialShippingNameQualifierId] PRIMARY KEY CLUSTERED 
(
	[HazardMaterialShippingNameQualifierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[IdentificationCodeQualifier]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[IdentificationCodeQualifier](
	[IdentificationCodeQualifierCode] [varchar](2) NOT NULL,
	[IdentificationCodeQualifierName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_EDI_IdentificationCodeQualifierCode] PRIMARY KEY CLUSTERED 
(
	[IdentificationCodeQualifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[Incoming]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[Incoming](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XmlDocument] [nvarchar](max) NOT NULL,
	[X12Document] [nvarchar](max) NOT NULL,
	[DateReceived] [datetime] NOT NULL,
	[From] [varchar](15) NOT NULL,
	[To] [varchar](15) NOT NULL,
	[TransactionSet] [varchar](10) NOT NULL,
	[ShipmentId] [varchar](30) NOT NULL,
	[PurposeCode] [varchar](2) NOT NULL,
	[StatusId] [char](1) NOT NULL,
	[UsageIndicator] [char](1) NOT NULL,
	[Mode] [char](1) NOT NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_Incoming] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [edi].[InterchangeQualifier]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[InterchangeQualifier](
	[InterchangeQualifierId] [varchar](2) NOT NULL,
	[InterchangeQualifierName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_EDI_InterchangeQualifierId] PRIMARY KEY CLUSTERED 
(
	[InterchangeQualifierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders](
	[TenderId] [int] NOT NULL,
	[SenderCode] [varchar](30) NOT NULL,
	[ShipmentIdNumber] [varchar](30) NULL,
	[CustomerLoadNumber] [varchar](30) NOT NULL,
	[ReceivedDate] [date] NOT NULL,
	[ReceivedTime] [time](0) NOT NULL,
	[GroupControlNumber] [varchar](9) NULL,
	[PaymentMethod] [varchar](2) NULL,
	[PurposeCode] [varchar](2) NULL,
	[PurposeApplicationType] [varchar](2) NULL,
	[MustRespondByDate] [date] NULL,
	[MustRespondByTime] [time](0) NULL,
	[NoteTypeId] [varchar](3) NULL,
	[Notes] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[StatusId] [char](1) NOT NULL,
	[UsageIndicator] [char](1) NOT NULL,
	[Rate] [decimal](18, 2) NULL,
	[Weight] [decimal](10, 2) NULL,
	[WeightQualifier] [varchar](2) NULL,
	[RateValueQualifier] [char](2) NULL,
	[Charge] [decimal](12, 2) NULL,
	[Advances] [decimal](9, 2) NULL,
	[PrepaidAmount] [decimal](9, 2) NULL,
	[SpecialChargeOrAllowanceCode] [char](3) NULL,
	[Volume] [decimal](10, 2) NULL,
	[VolumeUnitQualifier] [char](1) NULL,
	[LadingQuantity] [int] NULL,
	[WeightUnitCode] [char](1) NULL,
	[TariffNumber] [varchar](7) NULL,
	[DeclaredValue] [decimal](12, 2) NULL,
	[RateValueQualifier2] [char](2) NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_LoadTenders_1] PRIMARY KEY CLUSTERED 
(
	[TenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_BusinessInstructions]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_BusinessInstructions](
	[LoadTenderBusinessInstructionId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[ReferenceIdentification] [varchar](30) NULL,
	[ReferenceIdentificationQualifier] [varchar](3) NULL,
	[Description] [varchar](80) NULL,
 CONSTRAINT [PK_LoadTenders_BusinessInstructions] PRIMARY KEY CLUSTERED 
(
	[LoadTenderBusinessInstructionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Equipment]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Equipment](
	[LoadTenderEquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[EquipmentInitial] [varchar](4) NULL,
	[EquipmentNumber] [varchar](10) NOT NULL,
	[Weight] [decimal](12, 2) NULL,
	[WeightQualifier] [varchar](2) NULL,
	[TareWeight] [int] NULL,
	[WeightAllowance] [int] NULL,
	[Dunnage] [int] NULL,
	[Volume] [decimal](10, 2) NULL,
	[VolumeUnitQualifier] [varchar](1) NULL,
	[OwnershipCode] [varchar](1) NULL,
	[EquipmentDescriptionCode] [varchar](2) NULL,
	[StandardCarrierAlphaCode] [varchar](4) NULL,
	[TemperatureControl] [varchar](6) NULL,
	[Position] [varchar](3) NULL,
	[EquipmentLength] [int] NULL,
	[TareQualifierCode] [varchar](1) NULL,
	[WeightUnitCode] [varchar](1) NULL,
	[EquipmentNumberCheckDigit] [int] NULL,
	[TypeOfServiceCode] [varchar](2) NULL,
	[Height] [decimal](10, 2) NULL,
	[Width] [decimal](10, 2) NULL,
	[EquipmentType] [varchar](4) NULL,
	[CarTypeCode] [varchar](4) NULL,
 CONSTRAINT [PK_LoadTenders_Equipment] PRIMARY KEY CLUSTERED 
(
	[LoadTenderEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Parties]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Parties](
	[LoadTenderPartyId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[EntityIdentifierCode] [varchar](3) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[AdditionalName1] [varchar](60) NULL,
	[AdditionalName2] [varchar](60) NULL,
	[Address1] [varchar](55) NOT NULL,
	[Address2] [varchar](55) NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[PostalCode] [varchar](15) NOT NULL,
	[Contact1FunctionCode] [varchar](2) NULL,
	[Contact1Name] [varchar](60) NULL,
	[Contact1NumberQualifier] [varchar](2) NULL,
	[Contact1Number] [varchar](80) NULL,
	[Contact1InquiryReference] [varchar](20) NULL,
	[Contact2FunctionCode] [varchar](2) NULL,
	[Contact2Name] [varchar](60) NULL,
	[Contact2NumberQualifier] [varchar](2) NULL,
	[Contact2Number] [varchar](80) NULL,
	[Contact2InquiryReference] [varchar](20) NULL,
	[Contact3FunctionCode] [varchar](2) NULL,
	[Contact3Name] [varchar](60) NULL,
	[Contact3NumberQualifier] [varchar](2) NULL,
	[Contact3Number] [varchar](80) NULL,
	[Contact3InquiryReference] [varchar](20) NULL,
 CONSTRAINT [PK_LoadTenders_Parties] PRIMARY KEY CLUSTERED 
(
	[LoadTenderPartyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops](
	[StopId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[SequenceNumber] [smallint] NOT NULL,
	[ReasonCode] [varchar](2) NOT NULL,
	[DateQualifier1] [varchar](2) NULL,
	[Date1] [datetime] NULL,
	[DateQualifier2] [varchar](2) NULL,
	[Date2] [datetime] NULL,
	[WeightQualifier] [varchar](2) NULL,
	[WeightUnitCode] [char](1) NULL,
	[Weight] [decimal](10, 2) NULL,
	[LadingQuantity] [int] NULL,
	[VolumeUnitQualifier] [char](1) NULL,
	[Volume] [decimal](10, 2) NULL,
	[QuantityOfPalletsShipped] [int] NULL,
	[PalletExchangeCode] [char](1) NULL,
	[NoteTypeId] [varchar](3) NULL,
	[Notes] [varchar](max) NULL,
	[EntityIdentifierCode] [varchar](3) NULL,
	[EntityName] [varchar](60) NULL,
	[EntityIdentificationCodeQualifier] [varchar](2) NULL,
	[EntityIdentificationCode] [varchar](80) NULL,
	[Address1] [varchar](55) NULL,
	[Address2] [varchar](55) NULL,
	[City] [varchar](30) NULL,
	[StateOrProvince] [varchar](2) NULL,
	[PostalCode] [varchar](15) NULL,
	[CountryCode] [varchar](3) NULL,
	[Contact1FunctionCode] [varchar](2) NULL,
	[Contact1Name] [varchar](60) NULL,
	[Contact1NumberQualifier] [varchar](2) NULL,
	[Contact1Number] [varchar](80) NULL,
	[Contact2FunctionCode] [varchar](2) NULL,
	[Contact2Name] [varchar](60) NULL,
	[Contact2NumberQualifier] [varchar](2) NULL,
	[Contact2Number] [varchar](80) NULL,
	[Contact3FunctionCode] [varchar](2) NULL,
	[Contact3Name] [varchar](60) NULL,
	[Contact3NumberQualifier] [varchar](2) NULL,
	[Contact3Number] [varchar](80) NULL,
	[MappedClientId] [int] NULL,
 CONSTRAINT [PK_LoadTenders_Stops_1] PRIMARY KEY CLUSTERED 
(
	[StopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_Contact]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_Contact](
	[LoadTenderStopContactId] [int] NOT NULL,
	[TenderId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[ContactFunctionCode] [varchar](2) NOT NULL,
	[ContactName] [varchar](60) NULL,
	[CommunicationNumberQualifierCode] [varchar](2) NULL,
	[CommunicationNumber] [varchar](80) NULL,
 CONSTRAINT [PK_LoadTenders_Stops_Contact] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_MarksAndNumbers]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_MarksAndNumbers](
	[LoadTenderStopMarksAndNumberId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[LoadTendersStopsStopId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[LadingLineItemNumber] [int] NOT NULL,
	[LadingDescription] [varchar](50) NULL,
	[CommodityCode] [varchar](30) NULL,
	[CommodityCodeQualifier] [varchar](1) NULL,
	[MarksAndNumbers] [varchar](48) NULL,
	[MarksAndNumbersQualifier] [varchar](2) NOT NULL,
 CONSTRAINT [PK_LoadTenders_Stops_MarksAndNumbers_1] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopMarksAndNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_MarksAndNumbersContacts]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_MarksAndNumbersContacts](
	[LoadTenderStopMarksAndNumbersContactId] [int] IDENTITY(1,1) NOT NULL,
	[LoadtenderTenderId] [int] NOT NULL,
	[LoadTendersStopsStopId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[LadingLineItemNumber] [int] NOT NULL,
	[ContactFunctionCode] [varchar](2) NOT NULL,
	[ContactName] [varchar](60) NULL,
	[CommunicationNumberQualifierCode] [varchar](2) NULL,
	[CommunicationNumber] [varchar](80) NULL,
 CONSTRAINT [PK_LoadTenders_Stops_MarksAndNumbersContacts] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopMarksAndNumbersContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_MarksAndNumbersHazards]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_MarksAndNumbersHazards](
	[LoadTenderStopMarksAndNumbersHazardId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[LoadTendersStopsStopId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[LadingLineItemNumber] [int] NOT NULL,
	[UnitOrBasisForMeasurementCode] [varchar](2) NULL,
	[LadingQuantity] [int] NULL,
 CONSTRAINT [PK_LoadTenders_Stops_MarksAndNumbersHazards] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopMarksAndNumbersHazardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_MarksAndNumbersHazardsFreeform]    Script Date: 12/11/2023 11:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_MarksAndNumbersHazardsFreeform](
	[LoadTenderStopMarksAndNumbersHazardFreeformId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[LoadTendersStopsStopId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[LadingLineItemNumber] [int] NOT NULL,
	[HazardMaterialShipmentInformationQualifier] [varchar](3) NULL,
	[HazardMaterialShipmentInformation] [varchar](25) NULL,
 CONSTRAINT [PK_LoadTenders_Stops_MarksAndNumbersHazardsFreeform] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopMarksAndNumbersHazardFreeformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_MarksAndNumbersHazardsNames]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_MarksAndNumbersHazardsNames](
	[LoadTenderStopMarksAndNumbersHazardNameId] [int] IDENTITY(1,1) NOT NULL,
	[LoadtenderTenderId] [int] NOT NULL,
	[LoadTendersStopsStopId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[LadingLineItemNumber] [int] NOT NULL,
	[HazardMaterialShippingName] [varchar](25) NULL,
	[HazardMaterialShippingNameQualifier] [varchar](1) NULL,
 CONSTRAINT [PK_LoadTenders_Stops_MarksAndNumbersHazardsNames] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopMarksAndNumbersHazardNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_OrderIdDetail]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_OrderIdDetail](
	[LoadTenderStopOrderIdDetailId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[LoadTendersStopsStopId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[ReferenceId] [varchar](30) NOT NULL,
	[PurchaseOrderNumber] [varchar](22) NULL,
	[UnitOrBasisForMeasurementCode] [varchar](2) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[WeightUnitCode] [varchar](1) NULL,
	[Weight] [decimal](18, 2) NULL,
	[VolumeUnitQualifier] [varchar](1) NULL,
	[Volume] [decimal](18, 2) NULL,
 CONSTRAINT [PK_LoadTenders_Stops_OrderIdDetail] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopOrderIdDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[LoadTenders_Stops_ReferenceNumbers]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[LoadTenders_Stops_ReferenceNumbers](
	[LoadTenderStopReferenceNumberId] [int] IDENTITY(1,1) NOT NULL,
	[LoadTenderTenderId] [int] NOT NULL,
	[LoadTendersStopsStopId] [int] NOT NULL,
	[LoadTendersStopsSequenceNumber] [smallint] NOT NULL,
	[ReferenceIdentificationQualifierCode] [varchar](3) NOT NULL,
	[ReferenceIdentification] [varchar](30) NULL,
 CONSTRAINT [PK_LoadTenders_Stops_ReferenceNumbers] PRIMARY KEY CLUSTERED 
(
	[LoadTenderStopReferenceNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[MarksAndNumbersQualifier]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[MarksAndNumbersQualifier](
	[MarksAndNumbersQualifierId] [varchar](2) NOT NULL,
	[Description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_EDI_MarksAndNumbersQualifierId] PRIMARY KEY CLUSTERED 
(
	[MarksAndNumbersQualifierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[NoteType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[NoteType](
	[NoteTypeId] [varchar](3) NOT NULL,
	[NoteTypeName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_EDI_NoteType] PRIMARY KEY CLUSTERED 
(
	[NoteTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[Outgoing]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[Outgoing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XmlDocument] [nvarchar](max) NULL,
	[X12Document] [nvarchar](max) NULL,
	[DateSent] [datetime] NOT NULL,
	[SenderIdQualifier] [char](2) NOT NULL,
	[SenderId] [char](15) NOT NULL,
	[SenderAlphaId] [varchar](4) NOT NULL,
	[ReceiverIdQualifier] [char](2) NOT NULL,
	[ReceiverId] [char](15) NOT NULL,
	[ReceiverAlphaId] [varchar](4) NOT NULL,
	[ReceiverUrl] [varchar](500) NOT NULL,
	[TransactionSet] [varchar](10) NOT NULL,
	[ShipmentNumber] [varchar](30) NOT NULL,
	[Accept] [bit] NOT NULL,
	[PurposeCode] [varchar](2) NULL,
	[StatusId] [char](1) NOT NULL,
	[Mode] [char](1) NOT NULL,
 CONSTRAINT [PK_Outgoing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [edi].[Outgoing_214]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[Outgoing_214](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XmlDocument] [nvarchar](max) NULL,
	[X12Document] [nvarchar](max) NULL,
	[DateSent] [datetime] NOT NULL,
	[SenderIdQualifier] [char](2) NOT NULL,
	[SenderId] [char](15) NOT NULL,
	[SenderAlphaId] [varchar](4) NOT NULL,
	[ReceiverIdQualifier] [char](2) NOT NULL,
	[ReceiverId] [char](15) NOT NULL,
	[ReceiverAlphaId] [varchar](4) NOT NULL,
	[ReceiverUrl] [varchar](500) NOT NULL,
	[TransactionSet] [varchar](10) NOT NULL,
	[ShipmentNumber] [varchar](30) NOT NULL,
	[ReferenceIdentification] [varchar](30) NULL,
	[AssignedNumber] [varchar](6) NULL,
	[ShipmentStatusCode] [char](2) NOT NULL,
	[ShipmentStatusDateTime] [datetime] NOT NULL,
	[ShipmentStatusOrAppointmentReasonCode] [char](2) NULL,
	[ShipmentAppointmentStatusCode] [char](2) NULL,
	[ShipmentStatusOrAppointmentReasonCode2] [char](2) NULL,
	[BusinessInstructionsReferenceIdentification] [varchar](310) NULL,
	[BusinessInstructionsReferenceIdentificationQualifier] [varchar](40) NULL,
	[StatusId] [char](1) NOT NULL,
	[TruckNumber] [varchar](15) NULL,
	[LoadId] [int] NULL,
	[TrailerNumber] [varchar](10) NULL,
	[StopNumber] [int] NULL,
	[ShipmentStatusReason] [varchar](2) NULL,
	[SenderAs2Id] [varchar](50) NULL,
	[ReceiverAs2Id] [varchar](50) NULL,
	[StatusType] [int] NULL,
	[StatusDateType] [int] NULL,
	[PurposeCode] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Outgoing_214] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [edi].[Outgoing_990]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[Outgoing_990](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XmlDocument] [nvarchar](max) NULL,
	[X12Document] [nvarchar](max) NULL,
	[DateSent] [datetime] NOT NULL,
	[SenderIdQualifier] [char](2) NOT NULL,
	[SenderId] [char](15) NOT NULL,
	[SenderAlphaId] [varchar](4) NOT NULL,
	[ReceiverIdQualifier] [char](2) NOT NULL,
	[ReceiverId] [char](15) NOT NULL,
	[ReceiverAlphaId] [varchar](4) NOT NULL,
	[ReceiverUrl] [varchar](500) NOT NULL,
	[TransactionSet] [varchar](10) NOT NULL,
	[ShipmentNumber] [varchar](30) NOT NULL,
	[Accept] [bit] NOT NULL,
	[PurposeCode] [varchar](2) NOT NULL,
	[StatusId] [char](1) NOT NULL,
	[Mode] [char](1) NOT NULL,
	[BookingDate] [date] NULL,
	[LoadId] [int] NULL,
	[ReceiverAs2Id] [varchar](50) NULL,
	[SenderAs2Id] [varchar](50) NULL,
 CONSTRAINT [PK_Outgoing_990] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [edi].[OwnershipCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[OwnershipCode](
	[OwnershipCodeId] [varchar](2) NOT NULL,
	[Description] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EDIOwnershipCodeId] PRIMARY KEY CLUSTERED 
(
	[OwnershipCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[PalletExchangeCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[PalletExchangeCode](
	[PalletExchangeCode] [varchar](1) NOT NULL,
	[PalletExchangeName] [varchar](40) NOT NULL,
 CONSTRAINT [PK_EDI_PalletExchangeCode] PRIMARY KEY CLUSTERED 
(
	[PalletExchangeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[Partners]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[InterchangeId] [char](15) NOT NULL,
	[InterchangeIdQualifier] [varchar](2) NOT NULL,
	[CarrierAlphaCode] [varchar](4) NULL,
	[Address1] [varchar](55) NULL,
	[Address2] [varchar](55) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](15) NULL,
	[Country] [varchar](3) NULL,
	[IS2Id] [varchar](50) NULL,
	[Mode] [char](1) NOT NULL,
 CONSTRAINT [PK_EDI_PartnersId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[PaymentMethod]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[PaymentMethod](
	[PaymentMethodId] [varchar](2) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EDI_PaymentMethodId] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[PurposeApplicationType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[PurposeApplicationType](
	[PurposeApplicationTypeId] [varchar](2) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EDI_PurposeApplicationTypeId] PRIMARY KEY CLUSTERED 
(
	[PurposeApplicationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[PurposeCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[PurposeCode](
	[PurposeCode] [varchar](2) NOT NULL,
	[Description] [varchar](40) NOT NULL,
 CONSTRAINT [PK_EDI_PurposeCode] PRIMARY KEY CLUSTERED 
(
	[PurposeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[ReferenceIdentificationQualifier]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[ReferenceIdentificationQualifier](
	[ReferenceIdentificationQualifierCode] [varchar](3) NOT NULL,
	[ReferenceIdentificationQualifierName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_EDI_ReferenceIdentificationQualifier] PRIMARY KEY CLUSTERED 
(
	[ReferenceIdentificationQualifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[ShipmentAppointmentStatusCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[ShipmentAppointmentStatusCode](
	[Id] [varchar](2) NOT NULL,
	[Description] [varchar](70) NOT NULL,
 CONSTRAINT [PK_EDI_ShipmentAppointmentStatusCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[ShipmentOrAppointmentReasonCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[ShipmentOrAppointmentReasonCode](
	[Id] [varchar](2) NOT NULL,
	[Description] [varchar](70) NOT NULL,
 CONSTRAINT [PK_EDI_ShipmentOrAppointmentReasonCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[ShipmentStatusCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[ShipmentStatusCode](
	[Id] [varchar](2) NOT NULL,
	[Description] [varchar](70) NOT NULL,
 CONSTRAINT [PK_EDI_ShipmentStatusCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[StatusCodes]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[StatusCodes](
	[Id] [char](1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EDI_StatusCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[StopReasonCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[StopReasonCode](
	[StopReasonCode] [varchar](2) NOT NULL,
	[StopReasonName] [varchar](50) NOT NULL,
	[PickOrDrop] [char](1) NULL,
 CONSTRAINT [PK_EDI_StopReasonCode] PRIMARY KEY CLUSTERED 
(
	[StopReasonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[TareQualifierCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[TareQualifierCode](
	[TareQualifierCodeId] [varchar](2) NOT NULL,
	[Description] [varchar](10) NOT NULL,
 CONSTRAINT [PK_EDI_TareQualifierCodeId] PRIMARY KEY CLUSTERED 
(
	[TareQualifierCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[TenderStatus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[TenderStatus](
	[Id] [char](1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EDI_TenderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[TimeCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[TimeCode](
	[Id] [varchar](2) NOT NULL,
	[Description] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EDI_TimeCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[TypeOfServiceCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[TypeOfServiceCode](
	[TypeOfServiceCodeId] [varchar](2) NOT NULL,
	[Description] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EDI_TypeOfServiceCodeId] PRIMARY KEY CLUSTERED 
(
	[TypeOfServiceCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[UnitOrBasisForMeasurement]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[UnitOrBasisForMeasurement](
	[UnitOrBasisForMeasurementId] [varchar](2) NOT NULL,
	[Description] [varchar](65) NOT NULL,
 CONSTRAINT [PK_EDI_UnitOrBasisForMeasurementId] PRIMARY KEY CLUSTERED 
(
	[UnitOrBasisForMeasurementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[VolumeUnitQualifier]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[VolumeUnitQualifier](
	[VolumeUnitQualifierCode] [varchar](1) NOT NULL,
	[VolumeUnitQualifierName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EDI_VolumeUnitQualifier] PRIMARY KEY CLUSTERED 
(
	[VolumeUnitQualifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[WeightQualifier]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[WeightQualifier](
	[WeightQualifierCode] [varchar](2) NOT NULL,
	[WeightQualifierName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EDI_WeightQualifier] PRIMARY KEY CLUSTERED 
(
	[WeightQualifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[WeightUnit]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[WeightUnit](
	[WeightUnitCode] [varchar](2) NOT NULL,
	[WeightUnitName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_EDI_WeightUnit] PRIMARY KEY CLUSTERED 
(
	[WeightUnitCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [edi].[X12_204]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [edi].[X12_204](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XmlDocument] [xml] NOT NULL,
	[X12Document] [nvarchar](max) NOT NULL,
	[DateReceived] [datetime] NOT NULL,
	[Processed] [bit] NOT NULL,
 CONSTRAINT [PK_EDI_X12_204] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [equipment].[EquipType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[EquipType](
	[EquipTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[EquipTypeDescription] [varchar](max) NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[EquipTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [equipment].[GoalUnit]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[GoalUnit](
	[GoalUnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitDescription] [varchar](255) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK__GoalUnit] PRIMARY KEY CLUSTERED 
(
	[GoalUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnit]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnit](
	[PUnitId] [int] IDENTITY(1,1) NOT NULL,
	[Unit_ID] [varchar](50) NULL,
	[VIN] [varchar](50) NULL,
	[PUnitMakeModelId] [int] NULL,
	[Mod_Year] [int] NULL,
	[Notes] [text] NULL,
	[InService] [datetime] NULL,
	[ActiveInd] [bit] NULL,
	[ClientId] [int] NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK_PUnit] PRIMARY KEY CLUSTERED 
(
	[PUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Unit_ID] UNIQUE NONCLUSTERED 
(
	[Unit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitActiveType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitActiveType](
	[PUnitActiveTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Active] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PUnitActiveType] PRIMARY KEY CLUSTERED 
(
	[PUnitActiveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_ActiveType] UNIQUE NONCLUSTERED 
(
	[Active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitGoalMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitGoalMapping](
	[PUnitGoalMappingId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitGoalValue] [int] NULL,
	[BusinessEntityTypeId] [smallint] NULL,
	[DivisionTypeId] [smallint] NULL,
	[LocationTypeId] [smallint] NULL,
	[GroupTypeId] [smallint] NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[GoalUnitId] [int] NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_PUnitGoalMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitGoalMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitMake]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitMake](
	[PUnitMakeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK__PUnitMake] PRIMARY KEY CLUSTERED 
(
	[PUnitMakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitMakeModel]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitMakeModel](
	[PUnitMakeModelId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitMakeId] [int] NOT NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_PUnitModel] PRIMARY KEY CLUSTERED 
(
	[PUnitMakeModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PunitMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PunitMapping](
	[PUnitMappingId] [int] IDENTITY(1,1) NOT NULL,
	[PunitId] [int] NOT NULL,
	[BusinessEntityTypeId] [smallint] NULL,
	[DivisionTypeId] [smallint] NULL,
	[LocationTypeId] [smallint] NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[GroupTypeId] [smallint] NULL,
	[Unit_ID] [varchar](50) NULL,
	[PUnitStatusTypeId] [smallint] NULL,
	[PUnitActiveTypeId] [smallint] NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_PunitMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PunitMappingPerson]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PunitMappingPerson](
	[PUnitMappingPersonId] [int] IDENTITY(1,1) NOT NULL,
	[PunitId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_PunitMappingPerson] PRIMARY KEY CLUSTERED 
(
	[PUnitMappingPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitRegistrationMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitRegistrationMapping](
	[PUnitRegistrationMappingId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitRegistrationTypeId] [int] NOT NULL,
	[PUnitId] [int] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[RegistrationValue] [varchar](50) NULL,
	[Attachment] [varchar](200) NULL,
 CONSTRAINT [PK_PUnitRegistrationMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitRegistrationMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitRegistrationTemplate]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitRegistrationTemplate](
	[PUnitRegistrationTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitRegistrationTemplateDescription] [varchar](255) NULL,
	[Enabled] [bit] NOT NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK_PUnitRegistrationTemplate] PRIMARY KEY CLUSTERED 
(
	[PUnitRegistrationTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitRegistrationTemplateMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitRegistrationTemplateMapping](
	[PUnitRegistrationTemplateId] [int] NOT NULL,
	[PUnitRegistrationTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PUnitRegistrationTemplateMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitRegistrationTemplateId] ASC,
	[PUnitRegistrationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitRegistrationType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitRegistrationType](
	[PUnitRegistrationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Notes] [text] NULL,
	[Enabled] [bit] NOT NULL,
	[ValidateLoad] [bit] NOT NULL,
	[AttachReqd] [bit] NOT NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK__PUnitReg__6B67A84D95C3D86E] PRIMARY KEY CLUSTERED 
(
	[PUnitRegistrationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitServiceIntervalMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitServiceIntervalMapping](
	[PUnitServiceIntervalMappingId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitServiceIntervalTypeId] [int] NULL,
	[PUnitId] [int] NOT NULL,
	[ServiceIntervalValue] [int] NULL,
	[ServiceIntervalUnitId] [int] NULL,
	[UpdatedBy] [int] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_PUnitServiceIntervalMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitServiceIntervalMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [PUnitServiceInterval_PUnit] UNIQUE NONCLUSTERED 
(
	[PUnitServiceIntervalTypeId] ASC,
	[PUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitServiceIntervalTemplate]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitServiceIntervalTemplate](
	[PUnitServiceIntervalTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitServiceIntervalTemplateDescription] [varchar](255) NULL,
	[Enabled] [bit] NOT NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK_PUnitServiceIntervalTemplate] PRIMARY KEY CLUSTERED 
(
	[PUnitServiceIntervalTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitServiceIntervalTemplateMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitServiceIntervalTemplateMapping](
	[PUnitServiceIntervalTemplateId] [int] NOT NULL,
	[PUnitServiceIntervalTypeId] [int] NOT NULL,
	[ServiceIntervalValue] [int] NULL,
	[ServiceIntervalUnitId] [int] NULL,
 CONSTRAINT [PK_PUnitServiceIntervalTemplateMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitServiceIntervalTemplateId] ASC,
	[PUnitServiceIntervalTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitServiceIntervalType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitServiceIntervalType](
	[PUnitServiceIntervalTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[Notes] [text] NULL,
	[Enabled] [bit] NOT NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK__PUnitSer__DF8319335B691EFE] PRIMARY KEY CLUSTERED 
(
	[PUnitServiceIntervalTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitServiceIntervalTypeItems]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitServiceIntervalTypeItems](
	[ServiceIntTypeItemId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitServiceIntervalTypeId] [int] NOT NULL,
	[LaborItemId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitSpecificationMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitSpecificationMapping](
	[PUnitSpecificationMappingId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitSpecificationTypeId] [int] NULL,
	[PUnitId] [int] NOT NULL,
	[SpecificationValue] [varchar](20) NULL,
	[SpecificationUnitId] [int] NULL,
	[UpdatedBy] [int] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_PUnitSpecificationMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitSpecificationMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [PUnitSpecification_PUnit] UNIQUE NONCLUSTERED 
(
	[PUnitSpecificationTypeId] ASC,
	[PUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitSpecificationTemplate]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitSpecificationTemplate](
	[PUnitSpecificationTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[PUnitSpecificationTemplateDescription] [varchar](255) NULL,
	[Enabled] [bit] NOT NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK_PUnitSpecificationTemplate] PRIMARY KEY CLUSTERED 
(
	[PUnitSpecificationTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitSpecificationTemplateMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitSpecificationTemplateMapping](
	[PUnitSpecificationTemplateId] [int] NOT NULL,
	[PUnitSpecificationTypeId] [int] NOT NULL,
	[SpecificationValue] [varchar](20) NULL,
	[SpecificationUnitId] [int] NULL,
 CONSTRAINT [PK_PUnitSpecificationTemplateMapping] PRIMARY KEY CLUSTERED 
(
	[PUnitSpecificationTemplateId] ASC,
	[PUnitSpecificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitSpecificationType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitSpecificationType](
	[PUnitSpecificationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[Notes] [text] NULL,
	[Enabled] [bit] NOT NULL,
	[EquipTypeId] [smallint] NULL,
 CONSTRAINT [PK__PUnitSpecificationType] PRIMARY KEY CLUSTERED 
(
	[PUnitSpecificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [equipment].[PUnitStatusType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[PUnitStatusType](
	[PUnitStatusTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PUnitStatusType] PRIMARY KEY CLUSTERED 
(
	[PUnitStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_StatusType] UNIQUE NONCLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[ServiceIntervalUnit]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[ServiceIntervalUnit](
	[ServiceIntervalUnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitDescription] [varchar](255) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK__ServiceI__125E6BB95EE34DF2] PRIMARY KEY CLUSTERED 
(
	[ServiceIntervalUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [equipment].[SpecificationUnit]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [equipment].[SpecificationUnit](
	[SpecificationUnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitDescription] [varchar](255) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK__SpecificationUnit] PRIMARY KEY CLUSTERED 
(
	[SpecificationUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[EmailTemplate_SmartFields]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[EmailTemplate_SmartFields](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [varchar](500) NOT NULL,
	[FieldDescription] [varchar](300) NOT NULL,
	[Tag] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EmailTemplate_SmartFields] PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[EmailTemplate_SmartFields_Mapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[EmailTemplate_SmartFields_Mapping](
	[SmartFieldId] [int] NOT NULL,
	[TemplateId] [int] NOT NULL,
 CONSTRAINT [PK_EmailTemplate_SmartFields_Mapping] PRIMARY KEY CLUSTERED 
(
	[SmartFieldId] ASC,
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[EmailTemplates]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[EmailTemplates](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](100) NOT NULL,
	[TemplateDescription] [varchar](1000) NULL,
	[PlanTypeId] [int] NOT NULL,
	[EmailSubject] [varchar](100) NOT NULL,
	[EmailBody] [varchar](max) NOT NULL,
 CONSTRAINT [PK_EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [factoring].[FileType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[FileType](
	[FileTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FileTypeName] [varchar](50) NOT NULL,
	[FileTypePath] [varchar](200) NULL,
 CONSTRAINT [PK_Factoring_FileType] PRIMARY KEY CLUSTERED 
(
	[FileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[PlanDetail]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[PlanDetail](
	[PlanDetailId] [int] IDENTITY(1,1) NOT NULL,
	[PlanId] [int] NOT NULL,
	[AgingDaysFrom] [smallint] NULL,
	[AgingDaysTo] [smallint] NULL,
	[ReservePayoutPct] [decimal](4, 3) NULL,
	[FeePct] [decimal](4, 3) NULL,
	[Range] [smallint] NULL,
	[Advance] [decimal](4, 3) NULL,
	[TowardReservePct] [decimal](4, 3) NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PlanDetail] PRIMARY KEY CLUSTERED 
(
	[PlanDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[PlanFields]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[PlanFields](
	[PlanFieldId] [int] IDENTITY(1,1) NOT NULL,
	[PlanTypeId] [int] NOT NULL,
	[FieldName] [varchar](100) NOT NULL,
	[FieldDescription] [varchar](200) NULL,
	[FieldUIName] [varchar](100) NULL,
	[FieldUIType] [varchar](20) NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PlanFields] PRIMARY KEY CLUSTERED 
(
	[PlanFieldId] ASC,
	[PlanTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[Plans]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[Plans](
	[PlanId] [int] IDENTITY(1,1) NOT NULL,
	[PlanTypeId] [int] NOT NULL,
	[ClientId] [int] NULL,
	[PlanName] [varchar](100) NOT NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndDate] [date] NULL,
	[Locked] [bit] NOT NULL,
	[InitialARTotal] [decimal](9, 2) NULL,
 CONSTRAINT [PK_Plans] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[PlanType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[PlanType](
	[PlanTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PlanTypeName] [varchar](50) NOT NULL,
	[PlanTypeDescription] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PlanType] PRIMARY KEY CLUSTERED 
(
	[PlanTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [factoring].[Settings]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [factoring].[Transactions]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[FactoringDebtorId] [int] NULL,
	[PlanId] [int] NOT NULL,
	[CustomerInvoiceNumber] [varchar](20) NULL,
	[InvoiceNumber] [varchar](20) NULL,
	[InvoiceReceivedDate] [date] NULL,
	[InvoiceDate] [date] NULL,
	[InvoiceAmount] [decimal](9, 2) NULL,
	[InvoicePurchasedDate] [date] NULL,
	[InvoiceSubmittedToCustomerDate] [date] NULL,
	[InvoiceSubmitTypeId] [smallint] NULL,
	[InvoiceDueDate] [date] NULL,
	[PurchaseDays] [int] NULL,
	[CurrentFee] [decimal](9, 2) NULL,
	[CurrentFeePct] [decimal](4, 3) NULL,
	[CurrentReserveFee] [decimal](9, 2) NULL,
	[ReserveTotal] [decimal](9, 2) NULL,
	[CurrentReservePct] [decimal](4, 3) NULL,
	[AdvancedAmount] [decimal](9, 2) NULL,
	[InvoiceFundedDate] [date] NULL,
	[InvoiceFundingTypeId] [smallint] NULL,
	[AdvancePaymentBatchNumber] [varchar](20) NULL,
	[LoadNumber] [varchar](20) NULL,
	[InvoiceReceiptVerified] [bit] NOT NULL,
	[InvoiceReceiptVerifiedBy] [int] NULL,
	[LastUpDatedBy] [int] NOT NULL,
	[PaymentReceived] [bit] NULL,
	[PaymentReceivedDate] [date] NULL,
	[PaymentAmount] [decimal](9, 2) NULL,
	[PaymentDifference] [decimal](9, 2) NULL,
	[DisbursedPercentage] [decimal](4, 3) NULL,
	[DisbursedAmount] [decimal](9, 2) NULL,
	[DisbursedPaymentDate] [date] NULL,
	[Notes] [varchar](max) NULL,
	[Attachment] [varchar](200) NULL,
	[TransactionTypeId] [smallint] NOT NULL,
	[DisbursedPaymentBatchNumber] [varchar](20) NULL,
	[Disburse] [bit] NOT NULL,
	[SentToQB] [bit] NOT NULL,
	[AdvanceSentToQBDate] [datetime] NULL,
	[QBErrors] [varchar](max) NULL,
	[AdvanceInvoiceGUID] [varchar](100) NULL,
	[AdvanceCheckGUID] [varchar](100) NULL,
	[AdvanceCheckSentToQB] [bit] NOT NULL,
	[AdvanceInvoiceSentToQB] [bit] NOT NULL,
	[Reversed] [bit] NOT NULL,
	[DisbursementCheckSentToQB] [bit] NOT NULL,
	[DisbursementSentToQBDate] [datetime] NULL,
	[DisbursementCheckGUID] [varchar](100) NULL,
	[WithdrawalCheckSentToQB] [bit] NOT NULL,
	[WithdrawalSentToQBDate] [datetime] NULL,
	[WithdrawalCheckGUID] [varchar](100) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [factoring].[Transactions2]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[Transactions2](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[FactoringDebtorId] [int] NULL,
	[PlanId] [int] NOT NULL,
	[CustomerInvoiceNumber] [varchar](10) NULL,
	[InvoiceNumber] [varchar](10) NULL,
	[InvoiceReceivedDate] [date] NULL,
	[InvoiceDate] [date] NULL,
	[InvoiceAmount] [decimal](9, 2) NULL,
	[InvoicePurchasedDate] [date] NULL,
	[InvoiceSubmittedToCustomerDate] [date] NULL,
	[InvoiceSubmitTypeId] [smallint] NULL,
	[InvoiceDueDate] [date] NULL,
	[PurchaseDays] [int] NULL,
	[CurrentFee] [decimal](9, 2) NULL,
	[CurrentFeePct] [decimal](4, 3) NULL,
	[CurrentReserveFee] [decimal](9, 2) NULL,
	[ReserveTotal] [decimal](9, 2) NULL,
	[CurrentReservePct] [decimal](4, 3) NULL,
	[AdvancedAmount] [decimal](9, 2) NULL,
	[InvoiceFundedDate] [date] NULL,
	[InvoiceFundingTypeId] [smallint] NULL,
	[AdvancePaymentBatchNumber] [varchar](20) NULL,
	[LoadNumber] [varchar](20) NULL,
	[InvoiceReceiptVerified] [bit] NOT NULL,
	[InvoiceReceiptVerifiedBy] [int] NULL,
	[LastUpDatedBy] [int] NOT NULL,
	[PaymentReceived] [bit] NULL,
	[PaymentReceivedDate] [date] NULL,
	[PaymentAmount] [decimal](9, 2) NULL,
	[PaymentDifference] [decimal](9, 2) NULL,
	[DisbursedPercentage] [decimal](4, 3) NULL,
	[DisbursedAmount] [decimal](9, 2) NULL,
	[DisbursedPaymentDate] [date] NULL,
	[Notes] [varchar](max) NULL,
	[Attachment] [varchar](200) NULL,
	[TransactionTypeId] [smallint] NOT NULL,
	[DisbursedPaymentBatchNumber] [varchar](20) NULL,
	[Disburse] [bit] NOT NULL,
	[SentToQB] [bit] NOT NULL,
	[SentToQBDate] [datetime] NULL,
	[QBErrors] [varchar](max) NULL,
	[InvoiceGUID] [varchar](100) NULL,
	[CheckGUID] [varchar](100) NULL,
	[CheckSentToQB] [bit] NOT NULL,
	[InvoiceSentToQB] [bit] NOT NULL,
	[Reversed] [bit] NOT NULL,
 CONSTRAINT [PK_Transactions2] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [factoring].[TransactionType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [factoring].[TransactionType](
	[TransactionTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[TransactionType] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_Control]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_Control](
	[ESSLastTransactionId] [int] NOT NULL,
	[HOSLastLogId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_DriverLog]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_DriverLog](
	[DriverId] [varchar](15) NOT NULL,
	[TractorId] [varchar](20) NOT NULL,
	[Activity] [varchar](20) NULL,
	[StartTime] [datetime] NULL,
	[Duration] [int] NULL,
	[Edit] [varchar](10) NULL,
	[State] [varchar](20) NULL,
	[DistanceDriven] [int] NULL,
	[Odometer] [decimal](8, 1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_T2060]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_T2060](
	[TransactionId] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[DriverId] [varchar](15) NULL,
	[PositionLongitude] [decimal](9, 6) NULL,
	[PositionLatitude] [decimal](9, 6) NULL,
	[PositionHardwareType] [tinyint] NULL,
	[IgnitionStatus] [tinyint] NULL,
	[TripStatus] [char](1) NULL,
	[LifeToDistanceDistance] [decimal](9, 2) NULL,
	[Speed] [tinyint] NULL,
	[Heading] [decimal](5, 2) NULL,
	[Odometer] [decimal](8, 1) NULL,
	[DriverId2] [varchar](15) NULL,
	[PositionTimestamp] [datetime] NULL,
 CONSTRAINT [PK_Omnitracs_T2060] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_T2060_Equipment]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_T2060_Equipment](
	[TransactionId] [int] NOT NULL,
	[EquipmentId] [varchar](20) NOT NULL,
	[EquipmentType] [varchar](30) NULL,
	[EquipmentUnitAddress] [varchar](30) NULL,
	[EquipmentMobileType] [tinyint] NULL,
 CONSTRAINT [PK_Omnitracs_T2060_Equipment] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC,
	[EquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_T2060_Proximity]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_T2060_Proximity](
	[TransactionId] [int] NOT NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [varchar](10) NULL,
	[StateProv] [varchar](10) NULL,
	[City] [varchar](30) NULL,
	[Direction] [varchar](3) NULL,
	[Distance] [decimal](9, 2) NULL,
	[PlaceType] [varchar](20) NULL,
	[PlaceName] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_T4010]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_T4010](
	[TransactionId] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[DriverId] [varchar](15) NULL,
	[PositionLongitude] [decimal](9, 6) NULL,
	[PositionLatitude] [decimal](9, 6) NULL,
	[PositionHardwareType] [tinyint] NULL,
	[PositionTimestamp] [datetime] NULL,
	[IgnitionStatus] [tinyint] NULL,
	[TripStatus] [char](1) NULL,
	[DataStartTimestamp] [datetime] NULL,
	[DataEndTimestamp] [datetime] NULL,
	[Distance] [int] NULL,
	[DriveTime] [int] NULL,
	[EngineTime] [int] NULL,
	[MoveTime] [int] NULL,
	[IntertripIdleTime] [int] NULL,
	[ShortIdleTime] [int] NULL,
	[TotalFuelUsed] [decimal](5, 1) NULL,
	[IdleFuelUsed] [decimal](5, 1) NULL,
	[FaultFlag] [char](1) NULL,
	[RegisteredDriver] [char](1) NULL,
	[CruiseCtrlTime] [int] NULL,
	[TopGearTime] [int] NULL,
	[GearDataSource] [char](1) NULL,
	[SpdRpmTimesUnits] [varchar](3) NULL,
	[SpdRpmTimeMatrix] [varchar](2500) NULL,
	[DataEndOdometer] [decimal](9, 1) NULL,
	[DataEndOdometerTimestamp] [datetime] NULL,
	[FuelSource] [char](1) NULL,
	[DriverId2] [varchar](15) NULL,
 CONSTRAINT [PK_Omnitracs_T4010] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_T4010_Equipment]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_T4010_Equipment](
	[TransactionId] [int] NOT NULL,
	[EquipmentId] [varchar](20) NOT NULL,
	[EquipmentType] [varchar](30) NULL,
	[EquipmentUnitAddress] [varchar](30) NULL,
	[EquipmentMobileType] [tinyint] NULL,
 CONSTRAINT [PK_Omnitracs_T4010_Equipment] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC,
	[EquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [feeds].[Omnitracs_T4010_Proximity]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [feeds].[Omnitracs_T4010_Proximity](
	[TransactionId] [int] NOT NULL,
	[PostalCode] [varchar](10) NULL,
	[Country] [varchar](10) NULL,
	[StateProv] [varchar](10) NULL,
	[City] [varchar](30) NULL,
	[Direction] [varchar](3) NULL,
	[Distance] [decimal](9, 2) NULL,
	[PlaceType] [varchar](20) NULL,
	[PlaceName] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[AccCharge]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[AccCharge](
	[AccChargeId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[AccChargeTypeId] [smallint] NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Rate] [money] NULL,
	[Amount] [money] NULL,
	[Notes] [varchar](255) NULL,
	[BillToCode] [varchar](10) NULL,
 CONSTRAINT [PK_AccCharge] PRIMARY KEY CLUSTERED 
(
	[AccChargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[Carrier_AccCharge]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[Carrier_AccCharge](
	[AccChargeId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[AccChargeTypeId] [smallint] NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Rate] [money] NULL,
	[Amount] [money] NULL,
	[Notes] [varchar](255) NULL,
	[BillToCode] [varchar](10) NULL,
 CONSTRAINT [PK_Carrier_AccCharge] PRIMARY KEY CLUSTERED 
(
	[AccChargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[Carrier_AutoRatingACC]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[Carrier_AutoRatingACC](
	[AutoRatingACCId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[AccChargeTypeId] [smallint] NULL,
	[Quantity] [smallint] NULL,
	[Rate] [decimal](18, 2) NULL,
	[Amount] [smallint] NULL,
	[Notation] [varchar](255) NULL,
	[CalcByMiles] [bit] NULL,
 CONSTRAINT [PK_Carrier_AutoRatingACC] PRIMARY KEY CLUSTERED 
(
	[AutoRatingACCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[Carrier_AutoRatingDetail]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[Carrier_AutoRatingDetail](
	[AutoRatingDetailId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[CommodityTypeId] [smallint] NULL,
	[Rate] [decimal](18, 2) NULL,
	[RateUnit] [varchar](10) NULL,
	[EquipmentTypeId] [smallint] NULL,
	[Weight] [decimal](18, 2) NULL,
	[Temperature] [decimal](18, 1) NULL,
	[Pieces] [smallint] NULL,
	[RatePer] [smallint] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[CalcByMiles] [bit] NULL,
	[TemperatureTypeId] [smallint] NULL,
	[StartDate] [datetime] NULL,
	[ThroughDate] [datetime] NULL,
 CONSTRAINT [PK_Carrier_AutoRatingDetail] PRIMARY KEY CLUSTERED 
(
	[AutoRatingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[Load]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[Load](
	[LoadId] [int] NOT NULL,
	[TripNumber] [varchar](15) NULL,
	[ClientId] [int] NULL,
	[Charges] [decimal](18, 2) NULL,
	[ExtraCharges] [decimal](18, 2) NULL,
	[Miles] [int] NULL,
	[PaidMiles] [int] NULL,
	[PaidEmpty] [int] NULL,
	[DeadHead] [int] NULL,
	[Paid] [varchar](20) NULL,
	[RatePerMile] [decimal](18, 10) NULL,
	[DispatcherPersonId] [int] NULL,
	[CreatedTs] [datetime] NULL,
	[AvailableBilling] [bit] NULL,
	[CommodityTypeId] [smallint] NULL,
	[BrokerPersonId] [int] NULL,
	[EquipmentTypeId] [smallint] NULL,
	[Temperature] [decimal](18, 1) NULL,
	[TemperatureTypeId] [smallint] NULL,
	[CustomerLoadNumber] [varchar](30) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 10) NULL,
	[LoadStatusTypeId] [smallint] NULL,
	[GrossRevenue] [decimal](18, 3) NULL,
	[CreatedDt] [datetime] NULL,
	[CreatePersonId] [int] NULL,
	[LastUpdtDt] [datetime] NULL,
	[LastUpdtPersonId] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[LockedPersonId] [int] NULL,
	[Pieces] [int] NULL,
	[SendOriginalsInd] [bit] NULL,
	[LoadTotal] [decimal](18, 2) NULL,
	[AutoRatingInd] [bit] NULL,
	[AccChargesTotal] [decimal](18, 2) NULL,
	[PaperworkRecvdDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[ProblemInd] [bit] NULL,
	[AllowPerBOLInd] [bit] NULL,
	[Driver1] [varchar](100) NULL,
	[Driver2] [varchar](100) NULL,
	[Truck] [varchar](100) NULL,
	[Trailer1] [varchar](100) NULL,
	[Trailer2] [varchar](100) NULL,
	[Driver1Phone] [varchar](30) NULL,
	[CarrierId] [int] NULL,
	[CarrierNotes] [varchar](max) NULL,
	[CarrierAccChargesBillable] [decimal](18, 2) NULL,
	[CarrierAccChargesNonBillable] [decimal](18, 2) NULL,
	[CarrierRate] [decimal](18, 10) NULL,
	[Margin] [decimal](18, 2) NULL,
	[MarginPercent] [decimal](5, 4) NULL,
	[CarrierPayTotal] [decimal](18, 2) NULL,
	[QBCarrierBillErrors] [varchar](max) NULL,
	[QBCarrierBillGuid] [varchar](100) NULL,
	[QBClientInvoiceErrors] [varchar](max) NULL,
	[QBClientInvoiceGuid] [varchar](100) NULL,
	[QBAdvanceCheckErrors] [varchar](max) NULL,
	[QBAdvanceCheckGuid] [varchar](100) NULL,
	[QBClientInvoiceSent] [bit] NULL,
	[QBCarrierBillSent] [bit] NULL,
	[QBAdvanceCheckSent] [bit] NULL,
	[QBClientInvoiceSentDate] [datetime] NULL,
	[QBCarrierBillSentDate] [datetime] NULL,
	[QBAdvanceCheckSentDate] [datetime] NULL,
	[CarrierAutoRatingInd] [bit] NULL,
 CONSTRAINT [PK_Load] PRIMARY KEY CLUSTERED 
(
	[LoadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadBilling]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadBilling](
	[LoadId] [int] NOT NULL,
	[ImportErrors] [varchar](max) NULL,
	[ImportedDt] [datetime] NULL,
	[ImportSuccess] [bit] NULL,
 CONSTRAINT [PK_Logistics_LoadBilling] PRIMARY KEY CLUSTERED 
(
	[LoadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadFile]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadFile](
	[LoadFileId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadFileTypeId] [smallint] NOT NULL,
	[AddedByPersonId] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ActiveInd] [bit] NOT NULL,
 CONSTRAINT [PK_LoadFile] PRIMARY KEY CLUSTERED 
(
	[LoadFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadNotes]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadNotes](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[NoteTypeId] [smallint] NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStopid] [int] NOT NULL,
	[NoteDate] [datetime] NULL,
	[NotePersonId] [int] NOT NULL,
	[NoteText] [varchar](max) NOT NULL,
	[ArchivedInd] [bit] NULL,
	[Action] [varchar](2) NULL,
	[ActionPersonId] [int] NULL,
	[ActionDate] [datetime] NULL,
 CONSTRAINT [PK_Logistics_LoadNotes] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadStatus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadStatus](
	[LoadStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusTs] [datetime] NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStatusTypeId] [smallint] NOT NULL,
	[LstUpdtPersonId] [int] NOT NULL,
 CONSTRAINT [PK_LoadStatus] PRIMARY KEY CLUSTERED 
(
	[LoadStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadStatusUpdate_Pending]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadStatusUpdate_Pending](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusinessUnitId] [smallint] NOT NULL,
	[LoadStopId] [int] NOT NULL,
	[OpenInd] [bit] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[DateType] [char](1) NULL,
 CONSTRAINT [PK_Logistics_LoadStatusUpdate_Pending] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadStop]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadStop](
	[LoadStopId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[CurrentStopStatusTypeId] [smallint] NULL,
	[LoadStopTypeId] [smallint] NOT NULL,
	[StopNumber] [smallint] NOT NULL,
	[StopTypeNumber] [smallint] NOT NULL,
	[EquipmentTypeId] [smallint] NULL,
	[LoadApptTypeId] [smallint] NULL,
	[ClientId] [int] NULL,
	[Notes] [varchar](max) NULL,
	[StartDateTime] [datetime] NULL,
	[ThroughDateTime] [datetime] NULL,
	[PONumber] [varchar](100) NULL,
	[BillOfLading] [varchar](100) NULL,
	[PUNumber] [varchar](100) NULL,
	[Other] [varchar](100) NULL,
	[DeliveryNumber1] [varchar](20) NULL,
	[DeliveryNumber2] [varchar](20) NULL,
	[DeliveryNumber3] [varchar](20) NULL,
	[DeliveryNumber4] [varchar](20) NULL,
	[AdhocClientName] [varchar](100) NULL,
	[AdhocClientAddressLine1] [varchar](100) NULL,
	[AdhocClientAddressLine2] [varchar](100) NULL,
	[AdhocClientCity] [varchar](50) NULL,
	[AdhocClientState] [varchar](10) NULL,
	[AdhocClientZipCode] [varchar](10) NULL,
	[AdhocTimeZone] [varchar](5) NULL,
	[GasStationId] [int] NULL,
	[StartDateTime_DisplayTimeInd] [bit] NULL,
	[ThroughDateTime_DisplayTimeInd] [bit] NULL,
	[FuelGallons] [smallint] NULL,
	[DEFGallons] [smallint] NULL,
	[PaidMiles] [int] NULL,
	[PaidEmpty] [int] NULL,
	[DropStartDateTime] [datetime] NULL,
	[DropStartDateTime_DisplayTimeInd] [bit] NULL,
	[OldStartActualDateTime] [datetime] NULL,
	[Driver1] [varchar](100) NULL,
	[Driver2] [varchar](100) NULL,
	[Truck] [varchar](100) NULL,
	[Trailer1] [varchar](100) NULL,
	[Trailer2] [varchar](100) NULL,
	[CarrierId] [int] NULL,
	[ArrivalDateTime] [datetime] NULL,
	[DepartureDateTime] [datetime] NULL,
	[LoadTypeId] [smallint] NOT NULL,
	[HookTrailer1] [varchar](50) NULL,
	[TrailerDropDateTime] [datetime] NULL,
 CONSTRAINT [PK_LoadStop] PRIMARY KEY CLUSTERED 
(
	[LoadStopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadStop_ReferenceNumbers]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadStop_ReferenceNumbers](
	[LoadStopId] [int] NOT NULL,
	[LoadId] [int] NOT NULL,
	[ReferenceIdentificationQualifierCode] [varchar](3) NOT NULL,
	[ReferenceIdentification] [varchar](30) NULL,
 CONSTRAINT [PK_LoadStop_ReferenceNumbers] PRIMARY KEY CLUSTERED 
(
	[LoadId] ASC,
	[LoadStopId] ASC,
	[ReferenceIdentificationQualifierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadToLoadStatusSubType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadToLoadStatusSubType](
	[LoadToLoadStatusSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NOT NULL,
	[LoadStatusSubTypeId] [int] NOT NULL,
	[CustomVal] [varchar](100) NULL,
 CONSTRAINT [PK_Logistics_LoadToLoadStatusSubType] PRIMARY KEY CLUSTERED 
(
	[LoadToLoadStatusSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[LoadTrace]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[LoadTrace](
	[LoadTraceId] [int] IDENTITY(1,1) NOT NULL,
	[LoadId] [int] NULL,
	[TraceNumber] [nvarchar](40) NULL,
	[LoadTraceTypeId] [int] NOT NULL,
 CONSTRAINT [PK_LoadTrace] PRIMARY KEY CLUSTERED 
(
	[LoadTraceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [logistics].[Settings]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [logistics].[Settings](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[AfterHoursPhone] [varchar](30) NULL,
	[RateConfirmHeaderNotes] [varchar](1000) NULL,
	[RateConfirmFooterNotesLeft] [varchar](1000) NULL,
	[RateConfirmFooterNotesRight] [varchar](1000) NULL,
	[RateConfirmFooterNotesBottom] [varchar](1000) NULL,
	[EmailHost] [varchar](50) NULL,
	[EmailPort] [varchar](10) NULL,
	[EmailUserName] [varchar](50) NULL,
	[EmailUserPassword] [varchar](50) NULL,
	[EmailLogoPath] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [main].[AccessToPlatformSync]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AccessToPlatformSync](
	[SyncId] [int] NOT NULL,
	[RedboneDispatchClientPath] [varchar](1000) NULL,
 CONSTRAINT [PK_AccessToPlatformSync] PRIMARY KEY CLUSTERED 
(
	[SyncId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[AddressType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AddressType](
	[AddressTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[AppDefinition]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AppDefinition](
	[AppId] [smallint] NOT NULL,
	[AppName] [varchar](50) NOT NULL,
	[AppDescription] [text] NULL,
 CONSTRAINT [PK_AppDefinition] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[AppLayout]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AppLayout](
	[AppLayoutId] [smallint] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[AppLayoutName] [varchar](50) NOT NULL,
	[OpenOnStartup] [bit] NOT NULL,
 CONSTRAINT [PK_AppLayout] PRIMARY KEY CLUSTERED 
(
	[AppLayoutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[AppLayoutAppPreference]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AppLayoutAppPreference](
	[AppLayoutAppId] [smallint] IDENTITY(1,1) NOT NULL,
	[AppLayoutId] [smallint] NOT NULL,
	[AppId] [smallint] NULL,
	[AppTopPos] [smallint] NULL,
	[AppLeftPos] [smallint] NULL,
	[AppWidth] [smallint] NULL,
	[AppHeight] [smallint] NULL,
	[AppPinned] [bit] NULL,
 CONSTRAINT [PK_AppLayoutAppPreference] PRIMARY KEY CLUSTERED 
(
	[AppLayoutAppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[AppNotification]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AppNotification](
	[AppId] [smallint] NOT NULL,
	[AppNotificationTypeId] [smallint] NOT NULL,
	[CallbackAddress] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AppNotification] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[AppNotificationType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AppNotificationType](
	[AppNotificationTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Decription] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AppNotificationType] PRIMARY KEY CLUSTERED 
(
	[AppNotificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[AvailabilityType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[AvailabilityType](
	[AvailabilityTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_AvailabilityType] PRIMARY KEY CLUSTERED 
(
	[AvailabilityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_AvailabilityType] UNIQUE NONCLUSTERED 
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[BasicAuthUser]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[BasicAuthUser](
	[BasicAuthUserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[AccessKey] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BasicAuthUser] PRIMARY KEY CLUSTERED 
(
	[BasicAuthUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[BusinessEnityType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[BusinessEnityType](
	[BusinessEntityTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[BusinessEntity] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_BusinessEnityType] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_BusinessEnityType] UNIQUE NONCLUSTERED 
(
	[BusinessEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[BusinessEntityPersonMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[BusinessEntityPersonMapping](
	[PersonId] [int] NOT NULL,
	[BusinessEntityTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_BusinessEntityPersonMapping] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[BusinessEntityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[CellCarrier]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[CellCarrier](
	[CellCarrierId] [smallint] IDENTITY(1,1) NOT NULL,
	[Carrier] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Gateway] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CellCarrier] PRIMARY KEY CLUSTERED 
(
	[CellCarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[CertificationPersonMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[CertificationPersonMapping](
	[CertificationPersonMappingId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[CertificationTypeId] [smallint] NOT NULL,
	[ReceivedDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[Notes] [text] NULL,
	[CertificationCode] [varchar](100) NULL,
	[CertificationState] [varchar](2) NULL,
	[ActiveInd] [bit] NULL,
 CONSTRAINT [PK_CertificationPersonMapping] PRIMARY KEY CLUSTERED 
(
	[CertificationPersonMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[CertificationType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[CertificationType](
	[CertificationTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[CertificationDescription] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Certification] PRIMARY KEY CLUSTERED 
(
	[CertificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_CertificationType] UNIQUE NONCLUSTERED 
(
	[CertificationDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[Client]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Client_Id] [nchar](10) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[CreatedByPersonId] [int] NOT NULL,
	[ClientName] [varchar](100) NOT NULL,
	[AltClientName] [varchar](100) NULL,
	[BillToInd] [bit] NOT NULL,
	[ShipperInd] [bit] NOT NULL,
	[ConsigneeInd] [bit] NOT NULL,
	[ClientTypeId] [smallint] NOT NULL,
	[ClientStatusTypeId] [smallint] NOT NULL,
	[Notes] [text] NULL,
	[PickupNotes] [text] NULL,
	[DropNotes] [text] NULL,
	[BackOfficeNotes] [text] NULL,
	[FuelClientInd] [bit] NOT NULL,
	[FactoringInd] [bit] NOT NULL,
	[FactoringDebtorInd] [bit] NOT NULL,
	[FactoringDebtorEmailAddress] [varchar](500) NULL,
	[FactoringEmailAddress] [varchar](500) NULL,
	[DieselClientInd] [bit] NOT NULL,
	[AssignToPunitInd] [bit] NOT NULL,
	[EdiInd] [bit] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Client_Id] UNIQUE NONCLUSTERED 
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[Client_Staging]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Client_Staging](
	[ID] [int] NOT NULL,
	[CLIENT_ID] [nvarchar](7) NOT NULL,
	[ADDITION_DATE] [datetime] NULL,
	[CREATED_BY] [nvarchar](20) NULL,
	[CLIENT_NAME] [nvarchar](50) NULL,
	[ADDRESS_1] [nvarchar](50) NULL,
	[ADDRESS_2] [nvarchar](50) NULL,
	[CITY] [nvarchar](30) NULL,
	[STATE] [nvarchar](4) NULL,
	[ZIP] [nvarchar](10) NULL,
	[ALT_ADDRESS_1] [nvarchar](255) NULL,
	[ALT_ADDRESS_2] [nvarchar](255) NULL,
	[ALT_CITY] [nvarchar](255) NULL,
	[ALT_STATE] [nvarchar](255) NULL,
	[ALT_ZIP] [nvarchar](255) NULL,
	[ALT_CLIENT_NAME] [nvarchar](255) NULL,
	[BUSINESS_PHONE] [nvarchar](20) NULL,
	[BUSINESS_PHONE_EXT] [nvarchar](10) NULL,
	[FAX_PHONE] [nvarchar](20) NULL,
	[COMMENTS] [nvarchar](max) NULL,
	[CONTACT] [nvarchar](40) NULL,
	[CONTACT_EMAIL] [nvarchar](255) NULL,
	[CREDIT_STATUS] [nvarchar](20) NULL,
	[CREDIT_LIMIT] [int] NULL,
	[BILLING_CONTACT] [nvarchar](50) NULL,
	[BILLING_PHONE] [nvarchar](20) NULL,
	[BILLING_FAX] [nvarchar](20) NULL,
	[BILLING_EMAIL] [nvarchar](255) NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[IS_BLOCKED] [bit] NOT NULL,
	[IS_BILL_TO] [bit] NOT NULL,
	[IS_SHIPPER] [bit] NOT NULL,
	[IS_CONSIGNEE] [bit] NOT NULL,
	[CUSTOMER_TYPE] [nvarchar](1) NULL,
	[TIME_ZONE] [nvarchar](7) NULL,
	[DRIVER_LOADED_MILE_RATE] [float] NULL,
	[DRIVER_EMPTY_MILE_RATE] [float] NULL,
	[EXTRA_STOP_PAY] [bit] NOT NULL,
	[PRINT_INVOICE] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientAddress]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientAddress](
	[ClientAddressId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[AddressTypeId] [smallint] NOT NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[ZipCode] [varchar](10) NULL,
	[TimeZone] [varchar](5) NULL,
	[UseForBillingInd] [bit] NULL,
 CONSTRAINT [PK_ClientAddress] PRIMARY KEY CLUSTERED 
(
	[ClientAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientBillingDefaults]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientBillingDefaults](
	[ClientBillingDefaultId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[PaymentTerms] [varchar](50) NULL,
	[InvoiceTemplate] [varchar](50) NULL,
	[ToPrint] [bit] NULL,
	[LogisticsInvoiceTemplate] [varchar](50) NULL,
 CONSTRAINT [PK_ClientBillingDefaults] PRIMARY KEY CLUSTERED 
(
	[ClientBillingDefaultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientContactMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientContactMapping](
	[ClientId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_ClientContactMapping] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientEdi]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientEdi](
	[ClientId] [int] NOT NULL,
	[InterchangeId] [char](15) NULL,
	[InterchangeIdQualifier] [varchar](2) NULL,
	[CarrierAlphaCode] [varchar](4) NULL,
	[As2Url] [varchar](500) NULL,
	[InterchangeIdTest] [char](15) NULL,
	[As2Id] [varchar](50) NULL,
	[As2UrlTest] [varchar](500) NULL,
	[As2IdTest] [varchar](50) NULL,
 CONSTRAINT [PK_ClientEdi] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientEdi_StatusSettings]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientEdi_StatusSettings](
	[ClientId] [int] NOT NULL,
	[PickupEarlyArrivalThreshold] [int] NOT NULL,
	[PickupEarlyDepartureThreshold] [int] NOT NULL,
	[DropEarlyArrivalThreshold] [int] NOT NULL,
	[DropEarlyDepartureThreshold] [int] NOT NULL,
	[PickupLateArrivalThreshold] [int] NOT NULL,
	[PickupLateDepartureThreshold] [int] NOT NULL,
	[DropLateArrivalThreshold] [int] NOT NULL,
	[DropLateDepartureThreshold] [int] NOT NULL,
 CONSTRAINT [PK_ClientEdi_StatusSettings] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[PickupEarlyArrivalThreshold] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientFuel]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientFuel](
	[ClientFuelId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[DISCOUNT_PERCENTAGE] [decimal](18, 2) NULL,
	[START_DATE] [datetime] NULL,
	[SHOW_TIME] [bit] NOT NULL,
	[ReportGroupingPreference] [varchar](50) NULL,
	[ReeferAllow] [bit] NOT NULL,
	[BillingAllow] [bit] NOT NULL,
 CONSTRAINT [PK_ClientFuel] PRIMARY KEY CLUSTERED 
(
	[ClientFuelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientFuelCard]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientFuelCard](
	[FC_ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[CLIENT_ID] [nvarchar](7) NULL,
	[FUEL_CARD_NUMBER] [nvarchar](255) NULL,
	[TRUCK_NUMBER] [nvarchar](10) NULL,
	[DRIVER_NAME] [nvarchar](30) NULL,
 CONSTRAINT [PK_ClientFuelCard] PRIMARY KEY CLUSTERED 
(
	[FC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientFuelSurcharge]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientFuelSurcharge](
	[ClientFuelSurchargeId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[LowerPrice] [decimal](18, 3) NULL,
	[UpperPrice] [decimal](18, 3) NULL,
	[Surcharge] [decimal](18, 3) NULL,
 CONSTRAINT [PK_ClientFuelSurcharge] PRIMARY KEY CLUSTERED 
(
	[ClientFuelSurchargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientFuelSurcharge_WeekEnding]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientFuelSurcharge_WeekEnding](
	[WeekEndingId] [smallint] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[WeekEndingNum] [smallint] NOT NULL,
 CONSTRAINT [PK_ClientFuelSurcharge_WeekEnding] PRIMARY KEY CLUSTERED 
(
	[WeekEndingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientFuelTrans]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientFuelTrans](
	[TRANS_ID] [int] IDENTITY(1,1) NOT NULL,
	[FUEL_ID] [int] NULL,
	[CLIENT_ID] [nvarchar](7) NULL,
	[INVOICE_NUMBER] [nvarchar](255) NULL,
	[UNIT_NUMBER] [nvarchar](255) NULL,
	[TRANS_DATE] [datetime] NULL,
	[TRANS_TIME] [datetime] NULL,
	[TS_NAME] [nvarchar](255) NULL,
	[BILL_TYPE] [nvarchar](255) NULL,
	[TRIP_NUMBER] [nvarchar](255) NULL,
	[TRAILER] [nvarchar](255) NULL,
	[MILEAGE] [int] NULL,
	[DRIVER] [nvarchar](255) NULL,
	[TS_CITY] [nvarchar](255) NULL,
	[TS_STATE] [nvarchar](2) NULL,
	[PPG] [float] NULL,
	[NET_PPG] [float] NULL,
	[FUEL_GALS] [float] NULL,
	[FUEL_AMT] [float] NULL,
	[RFR_GALS] [float] NULL,
	[RFR_AMT] [float] NULL,
	[MISC] [float] NULL,
	[INV_TOTAL] [float] NULL,
	[FEE] [float] NULL,
	[DISC] [float] NULL,
	[INV_BALANCE] [float] NULL,
	[INSERT_DATE] [datetime] NULL,
 CONSTRAINT [PK_ClientFuelTrans] PRIMARY KEY CLUSTERED 
(
	[TRANS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientNote]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientNote](
	[ClientNoteId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Notes] [text] NULL,
	[PersonIdUpdatedBy] [int] NOT NULL,
	[ClientNoteUpdatedDate] [datetime] NOT NULL,
	[ClientNoteFollowUpDate] [datetime] NULL,
	[ClientNoteComplete] [bit] NOT NULL,
 CONSTRAINT [PK_ClientNote] PRIMARY KEY CLUSTERED 
(
	[ClientNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientPerMileOverride]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientPerMileOverride](
	[ClientPerMileOverrideId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[DriverLoadedMileRate] [decimal](18, 2) NULL,
	[DriverEmptyMileRate] [decimal](18, 2) NULL,
	[ExtraStopsInd] [bit] NULL,
 CONSTRAINT [PK_ClientPerMileOverride] PRIMARY KEY CLUSTERED 
(
	[ClientPerMileOverrideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientStatusType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientStatusType](
	[ClientStatusTypeId] [smallint] NOT NULL,
	[ClientStatusDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClientStatusType] PRIMARY KEY CLUSTERED 
(
	[ClientStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ClientType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ClientType](
	[ClientTypeId] [smallint] NOT NULL,
	[ClientType] [varchar](20) NOT NULL,
	[ClientTypeDescription] [varchar](100) NULL,
 CONSTRAINT [PK_ClientType] PRIMARY KEY CLUSTERED 
(
	[ClientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[Country]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[DivisionPersonMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[DivisionPersonMapping](
	[PersonId] [int] NOT NULL,
	[DivisionTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_DivisionPersonMapping] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[DivisionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[DivisionType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[DivisionType](
	[DivisionTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Division] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_DivisionType] PRIMARY KEY CLUSTERED 
(
	[DivisionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_DivisionType] UNIQUE NONCLUSTERED 
(
	[Division] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[Driver]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Driver](
	[PersonId] [int] NOT NULL,
	[StartingPoints] [int] NOT NULL,
	[DriverId] [varchar](10) NULL,
	[OldDriverId] [varchar](10) NULL,
	[FuelCardNumber] [int] NULL,
	[PunitId] [int] NULL,
	[EmployedByVendorId] [int] NULL,
	[LeaseContractStartDt] [datetime] NULL,
	[LeaseContractExpireDt] [datetime] NULL,
	[OCCACCWaiverExpDt] [datetime] NULL,
	[WCCWExpDt] [datetime] NULL,
	[CommAutoExpDt] [datetime] NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[DRIVER_Staging]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[DRIVER_Staging](
	[DRIVER_ID] [nvarchar](10) NOT NULL,
	[OLD_DRIVER_ID] [nvarchar](10) NULL,
	[FIRST_NAME] [nvarchar](30) NULL,
	[LAST_NAME] [nvarchar](30) NULL,
	[BIRTH_DATE] [datetime] NULL,
	[ADDRESS_1] [nvarchar](255) NULL,
	[ADDRESS_2] [nvarchar](255) NULL,
	[CITY] [nvarchar](30) NULL,
	[STATE] [nvarchar](3) NULL,
	[ZIP_CODE] [nvarchar](12) NULL,
	[HOME_PHONE] [nvarchar](15) NULL,
	[CELL_PHONE] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[LICENSE_NUMBER] [nvarchar](255) NULL,
	[LICENSE_EXPIRATION] [datetime] NULL,
	[MEDICAL_CARD_EXPIRATION] [datetime] NULL,
	[HIRE_DATE] [datetime] NULL,
	[TERMINATION_DATE] [datetime] NULL,
	[DIVISION] [nvarchar](10) NULL,
	[FEDEX_ID] [int] NULL,
	[DRIVER_TYPE] [nvarchar](1) NULL,
	[COMP_TYPE] [nvarchar](25) NULL,
	[COMP_AMT] [float] NULL,
	[PER_DIEM_AMT] [float] NULL,
	[DEFAULT_PUNIT] [nvarchar](255) NULL,
	[FUEL_CARD_NUMBER] [int] NULL,
	[LAST_REVIEW] [datetime] NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[DRIVER_PTS] [int] NULL,
	[ACTIVE_DISP] [bit] NOT NULL,
	[ACTIVE_FEDEX] [bit] NOT NULL,
	[ACTIVE_TANK] [bit] NOT NULL,
	[EMPLOYED_BY] [nvarchar](255) NULL,
	[VENDOR_ID] [nvarchar](7) NULL,
	[OCCACC_WAIVER_EXP] [datetime] NULL,
	[OCCACC_POLICY_EXP] [datetime] NULL,
	[WCCW_EXP] [datetime] NULL,
	[COMM_AUTO_EXP] [datetime] NULL,
	[CARGO_EXP] [datetime] NULL,
	[PHYSDAM_EXP] [datetime] NULL,
	[BOBTAIL_EXP] [datetime] NULL,
	[LEASE_CONTRACT_EXP] [datetime] NULL,
	[CARGO_REQ] [bit] NOT NULL,
	[COMM_AUTO_REQ] [bit] NOT NULL,
	[LEASE_CONTRACT_START] [datetime] NULL,
	[LICENSE_STATE] [nvarchar](20) NULL,
	[FIRST_AID_EXPIRATION] [datetime] NULL,
	[HAZMAT_EXPIRATION] [datetime] NULL,
	[BLOODBOURNE_PATHEGENS] [datetime] NULL,
	[OSHA_10] [datetime] NULL,
	[SAFELAND_CERT] [datetime] NULL,
	[TSA_EXP] [datetime] NULL,
	[FLYINGJ_QUAL] [bit] NOT NULL,
	[FLYINGJ_NUMBER] [nvarchar](255) NULL,
	[TESORO_QUAL] [bit] NOT NULL,
	[TESORO_NUMBER] [nvarchar](255) NULL,
	[EP_ENERGY_SAFETY] [datetime] NULL,
	[NEW_FIELD_SAFETY] [datetime] NULL,
	[H2S_TRAINING] [datetime] NULL,
	[PAY_PLAN] [nvarchar](10) NULL,
	[BACKGROUND_CHECK] [bit] NOT NULL,
	[SECURITY_TRAINING] [datetime] NULL,
	[DRUG_TEST] [datetime] NULL,
	[DRIVER_TRAINER] [bit] NOT NULL,
	[DRIVER_TRAINING] [bit] NOT NULL,
	[AVAILABILITY] [nvarchar](255) NULL,
	[SMITH_SYSTEM_CERT] [datetime] NULL,
	[SMITH_SYSTEM_EXP] [datetime] NULL,
	[ACCIDENT] [bit] NOT NULL,
	[DRUG_FAIL] [bit] NOT NULL,
	[REHIREABLE] [bit] NOT NULL,
	[HAZWOPER] [datetime] NULL,
	[FORKLIFT_CERT] [datetime] NULL,
	[DRIVER_PTS_NEW] [int] NULL,
	[INITIAL_LEASE_DATE] [datetime] NULL,
	[SHIRT_SIZE] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [main].[DriverPoint]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[DriverPoint](
	[DriverPointId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[DriverPointTypeId] [int] NULL,
	[Notes] [text] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[LastUpdatePersonId] [int] NULL,
	[DriverPointsValue] [int] NULL,
 CONSTRAINT [PK_DriverPoint] PRIMARY KEY CLUSTERED 
(
	[DriverPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[DriverPointType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[DriverPointType](
	[DriverPointTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DriverPointName] [varchar](255) NOT NULL,
	[DriverPointsValue] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_DriverPointType] PRIMARY KEY CLUSTERED 
(
	[DriverPointTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_DriverPointType] UNIQUE NONCLUSTERED 
(
	[DriverPointName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[DriverStuff]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[DriverStuff](
	[DriverStuffId] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [main].[EmploymentHistoryRequest]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[EmploymentHistoryRequest](
	[EmploymentHistoryRequestId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[AccessCode] [nvarchar](50) NULL,
	[ReleasePath] [nvarchar](500) NULL,
	[RequestorEmail] [nvarchar](500) NULL,
	[Complete] [bit] NOT NULL,
	[RequestedDate] [datetime] NOT NULL,
	[CompletedDate] [datetime] NULL,
	[Approved] [bit] NOT NULL,
	[Denied] [bit] NOT NULL,
	[DeniedExp] [nvarchar](max) NULL,
	[AccessCount] [int] NOT NULL,
	[OneTimeHistoryId] [int] NULL,
 CONSTRAINT [PK_EmploymentHistoryRequest] PRIMARY KEY CLUSTERED 
(
	[EmploymentHistoryRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[Entitlement]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Entitlement](
	[EntitlementId] [smallint] NOT NULL,
	[EntitlementName] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[Enabled] [bit] NOT NULL,
	[SortId] [bigint] NULL,
 CONSTRAINT [PK_Entitlement] PRIMARY KEY CLUSTERED 
(
	[EntitlementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[EntitlementGroup]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[EntitlementGroup](
	[EntitlementGroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupDescription] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EntitlementGroup] PRIMARY KEY CLUSTERED 
(
	[EntitlementGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_GroupDescription] UNIQUE NONCLUSTERED 
(
	[GroupDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[EntitlementGroupToEntitlement]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[EntitlementGroupToEntitlement](
	[EntitlementGroupToEntitlementId] [int] IDENTITY(1,1) NOT NULL,
	[EntitlementGroupId] [int] NOT NULL,
	[EntitlementId] [smallint] NOT NULL,
 CONSTRAINT [PK_EntitlementGroupToEntitlement] PRIMARY KEY CLUSTERED 
(
	[EntitlementGroupToEntitlementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ExpirationDateType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ExpirationDateType](
	[ExpirationDateTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ExpirationDateType] PRIMARY KEY CLUSTERED 
(
	[ExpirationDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[Feature]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Feature](
	[FeatureId] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [varchar](50) NOT NULL,
	[RequestedPersonId] [int] NULL,
	[RequestedDate] [datetime] NULL,
	[HoursEstimate] [smallint] NULL,
	[FeatureDevStatusTypeId] [int] NULL,
	[Priority] [smallint] NULL,
	[ReleaseNoteId] [smallint] NULL,
	[GoogleDocUrl] [varchar](500) NULL,
	[FeatureDesc] [varchar](max) NULL,
	[AssignedPersonId] [int] NULL,
	[ProjectedCompletionDate] [datetime] NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_FeatureName] UNIQUE NONCLUSTERED 
(
	[FeatureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[FeatureDevStatusHistory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FeatureDevStatusHistory](
	[FeatureDevStatusHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[FeatureDevStatusTypeId] [int] NOT NULL,
	[ChangedPersonId] [int] NOT NULL,
	[StatusTs] [datetime] NOT NULL,
 CONSTRAINT [PK_FeatureDevStatusHistory] PRIMARY KEY CLUSTERED 
(
	[FeatureDevStatusHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[FeatureDevStatusType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FeatureDevStatusType](
	[FeatureDevStatusTypeId] [int] NOT NULL,
	[FeatureDevStatusTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FeatureDevStatusType] PRIMARY KEY CLUSTERED 
(
	[FeatureDevStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[FedExFuel]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FedExFuel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Division] [nvarchar](10) NOT NULL,
	[TransDate] [date] NOT NULL,
	[AuthCode] [nvarchar](50) NOT NULL,
	[Vehicle] [nvarchar](10) NOT NULL,
	[FuelStop] [nvarchar](100) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](3) NOT NULL,
	[Quantity] [decimal](18, 3) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[WeekEnding] [date] NULL,
	[InsertDate] [datetime] NULL,
 CONSTRAINT [PK_FedExFuelHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[FedExLinehaulRevenue]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FedExLinehaulRevenue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DIVISION] [nchar](10) NULL,
	[TripNumber] [nvarchar](50) NULL,
	[LoadDate] [date] NULL,
	[VEHICLE] [nvarchar](10) NULL,
	[LegOrg] [nvarchar](10) NULL,
	[LegDest] [nvarchar](10) NULL,
	[VMRCatdom] [nvarchar](15) NULL,
	[MilesQty] [int] NULL,
	[VmrRate] [decimal](18, 3) NULL,
	[MileagePlus] [decimal](18, 2) NULL,
	[Premiums] [decimal](18, 2) NULL,
	[FUEL] [decimal](18, 4) NULL,
	[TotalRate] [decimal](18, 4) NULL,
	[Amount] [decimal](18, 2) NULL,
	[D_H] [decimal](18, 2) NULL,
	[TOLLS] [decimal](18, 2) NULL,
	[FlatRate] [decimal](18, 2) NULL,
	[DailyGross] [decimal](18, 2) NULL,
	[Driver1] [nvarchar](20) NULL,
	[Driver2] [nvarchar](20) NULL,
	[WeekEnding] [date] NULL,
	[InsertDate] [datetime] NULL,
 CONSTRAINT [PK_FedExLinehaulRevenue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[FedExSpotRevenue]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FedExSpotRevenue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Division] [nchar](10) NOT NULL,
	[LoadDate] [date] NOT NULL,
	[Vehicle] [nvarchar](10) NOT NULL,
	[AVR] [nvarchar](10) NOT NULL,
	[TripNumber] [nvarchar](50) NULL,
	[LegOrg] [nvarchar](100) NULL,
	[LegDest] [nvarchar](100) NULL,
	[Miles] [smallint] NULL,
	[FuelAmt] [decimal](18, 2) NULL,
	[SpotAmt] [decimal](18, 2) NULL,
	[MileAmt] [decimal](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Driver1] [nchar](20) NULL,
	[Driver2] [nchar](20) NULL,
	[WeekEnding] [date] NULL,
	[InsertDate] [datetime] NULL,
 CONSTRAINT [PK_Main.FedExSpotRevenue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[FinancialTransaction]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FinancialTransaction](
	[TRANSACTION_ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[ACCOUNT_ID] [nvarchar](255) NULL,
	[INVOICE_NUMBER] [nvarchar](255) NULL,
	[TRANSACTION_TYPE_CODE] [nvarchar](255) NULL,
	[TRANSACTION_DATE] [datetime] NULL,
	[TRANSACTION_AMOUNT] [float] NULL,
	[TRANSACTION_DETAILS] [nvarchar](255) NULL,
 CONSTRAINT [PK_FinancialTransaction] PRIMARY KEY CLUSTERED 
(
	[TRANSACTION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[FinancialTransaction_Staging]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FinancialTransaction_Staging](
	[TRANSACTION_ID] [int] NOT NULL,
	[ACCOUNT_ID] [nvarchar](7) NULL,
	[INVOICE_NUMBER] [nvarchar](255) NULL,
	[TRANSACTION_TYPE_CODE] [nvarchar](255) NULL,
	[TRANSACTION_DATE] [datetime] NULL,
	[TRANSACTION_AMOUNT] [float] NULL,
	[TRANSACTION_DETAILS] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[Fuel_EFS_Stage]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Fuel_EFS_Stage](
	[Fuel_EFS_StageId] [int] IDENTITY(1,1) NOT NULL,
	[F1] [nvarchar](255) NULL,
	[All Fuel - Line Item Discount] [decimal](18, 2) NULL,
	[All Fuel - Line Item Gross] [decimal](18, 2) NULL,
	[All Fuel - Price Per Unit] [decimal](18, 3) NULL,
	[All Fuel - Quantity] [decimal](18, 2) NULL,
	[All Fuel - Retail PPU] [decimal](18, 3) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Authorization Code] [nvarchar](255) NULL,
	[Card Number] [nvarchar](255) NULL,
	[Chain Description] [nvarchar](255) NULL,
	[Chain ID] [nvarchar](255) NULL,
	[Direct Bill / Funded] [nvarchar](255) NULL,
	[Driver ID] [nvarchar](255) NULL,
	[Driver Name] [nvarchar](255) NULL,
	[Invoice] [nvarchar](255) NULL,
	[Location City] [nvarchar](255) NULL,
	[Location ID] [nvarchar](255) NULL,
	[Location Name] [nvarchar](255) NULL,
	[Location State/Province] [nvarchar](255) NULL,
	[Odometer] [nvarchar](255) NULL,
	[POS Date] [nvarchar](255) NULL,
	[POS Time] [nvarchar](255) NULL,
	[Policy Number] [nvarchar](255) NULL,
	[Product Code] [nvarchar](255) NULL,
	[Trailer Number] [nvarchar](255) NULL,
	[Transaction Date] [nvarchar](255) NULL,
	[Transaction Fee] [decimal](18, 2) NULL,
	[Transaction ID] [nvarchar](255) NULL,
	[Transaction Time] [nvarchar](255) NULL,
	[Trip Number] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[DataFee] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Fuel_EFS_Stage] PRIMARY KEY CLUSTERED 
(
	[Fuel_EFS_StageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[Fuel_EFS_Stage_Bak]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Fuel_EFS_Stage_Bak](
	[Fuel_EFS_StageId] [int] IDENTITY(1,1) NOT NULL,
	[F1] [nvarchar](255) NULL,
	[All Fuel - Line Item Discount] [float] NULL,
	[All Fuel - Line Item Gross] [float] NULL,
	[All Fuel - Price Per Unit] [float] NULL,
	[All Fuel - Quantity] [float] NULL,
	[All Fuel - Retail PPU] [float] NULL,
	[Amount] [float] NULL,
	[Authorization Code] [nvarchar](255) NULL,
	[Card Number] [nvarchar](255) NULL,
	[Chain Description] [nvarchar](255) NULL,
	[Chain ID] [nvarchar](255) NULL,
	[Direct Bill / Funded] [nvarchar](255) NULL,
	[Driver ID] [nvarchar](255) NULL,
	[Driver Name] [nvarchar](255) NULL,
	[Invoice] [nvarchar](255) NULL,
	[Location City] [nvarchar](255) NULL,
	[Location ID] [nvarchar](255) NULL,
	[Location Name] [nvarchar](255) NULL,
	[Location State/Province] [nvarchar](255) NULL,
	[Odometer] [nvarchar](255) NULL,
	[POS Date] [nvarchar](255) NULL,
	[POS Time] [nvarchar](255) NULL,
	[Policy Number] [nvarchar](255) NULL,
	[Product Code] [nvarchar](255) NULL,
	[Trailer Number] [nvarchar](255) NULL,
	[Transaction Date] [nvarchar](255) NULL,
	[Transaction Fee] [float] NULL,
	[Transaction ID] [nvarchar](255) NULL,
	[Transaction Time] [nvarchar](255) NULL,
	[Trip Number] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [main].[Fuel_QuikQ_Stage]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Fuel_QuikQ_Stage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](255) NULL,
	[Truck Stop] [nvarchar](255) NULL,
	[Date] [nvarchar](255) NULL,
	[Time] [nvarchar](255) NULL,
	[Truck Stop City] [nvarchar](255) NULL,
	[Truck Stop State] [nvarchar](255) NULL,
	[Transaction #] [nvarchar](255) NULL,
	[Sequence] [nvarchar](255) NULL,
	[POS Ticket #] [nvarchar](255) NULL,
	[Product Description] [nvarchar](255) NULL,
	[Quantity] [nvarchar](255) NULL,
	[UnitPrice] [nvarchar](255) NULL,
	[Tax] [nvarchar](255) NULL,
	[Discount] [nvarchar](255) NULL,
	[Subtotal] [nvarchar](255) NULL,
	[Adjusted Unit Price] [nvarchar](255) NULL,
	[Adjusted Total] [nvarchar](255) NULL,
	[Driver Name] [nvarchar](255) NULL,
	[Unit Code] [nvarchar](255) NULL,
	[Trailer Code] [nvarchar](255) NULL,
	[Authorization #] [nvarchar](255) NULL,
	[Credit] [nvarchar](255) NULL,
	[Driver Code] [nvarchar](255) NULL,
	[Data Cap Unit Code] [nvarchar](255) NULL,
	[Driver Division] [nvarchar](255) NULL,
	[Unit Division] [nvarchar](255) NULL,
	[Trailer Division] [nvarchar](255) NULL,
	[Card Number] [nvarchar](255) NULL,
	[Tag Number] [nvarchar](255) NULL,
	[DC Trailer Number] [nvarchar](255) NULL,
	[Fee] [nvarchar](255) NULL,
	[Start Code] [nvarchar](255) NULL,
	[Product Code] [nvarchar](255) NULL,
	[Truck Stop Status] [nvarchar](255) NULL,
	[Order #] [nvarchar](255) NULL,
	[Odometer] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [main].[FundingType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[FundingType](
	[FundingTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[FundingType] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_FundingType] PRIMARY KEY CLUSTERED 
(
	[FundingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[GroupType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[GroupType](
	[GroupTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Group] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_GroupType] PRIMARY KEY CLUSTERED 
(
	[GroupTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_GroupType] UNIQUE NONCLUSTERED 
(
	[Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[LocationPersonMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[LocationPersonMapping](
	[PersonId] [int] NOT NULL,
	[LocationTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_LocationPersonMapping] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[LocationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[LocationType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[LocationType](
	[LocationTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_LocationType] PRIMARY KEY CLUSTERED 
(
	[LocationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_LocationType] UNIQUE NONCLUSTERED 
(
	[Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[Person]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[MiddleInitial] [varchar](5) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[Notes] [text] NULL,
	[LoginId] [varchar](50) NULL,
	[Birthday] [date] NULL,
	[IsActive] [bit] NULL,
	[AvailabilityTypeId] [smallint] NULL,
	[PersonGenderId] [smallint] NULL,
	[TIN] [varchar](20) NULL,
	[ShirtSize] [varchar](100) NULL,
	[FedExId] [int] NULL,
	[RegionId] [smallint] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonAddress]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonAddress](
	[PersonAddressId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](10) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[AddressTypeId] [smallint] NOT NULL,
	[StateId] [smallint] NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[PersonAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonEmailAddress]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonEmailAddress](
	[PersonEmailAddressId] [smallint] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[EmailAddress] [varchar](75) NOT NULL,
	[UseForDispatch] [bit] NULL,
	[UseForQuickApps] [bit] NULL,
 CONSTRAINT [PK_PersonEmailAddress] PRIMARY KEY CLUSTERED 
(
	[PersonEmailAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_PersonEmailAddress] UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonEmploymentHistory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonEmploymentHistory](
	[PersonEmploymentHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CommercialVehicle] [bit] NULL,
	[DriverType] [nvarchar](100) NULL,
	[Performance] [nvarchar](100) NULL,
	[ReasonForLeaving] [nvarchar](max) NULL,
	[EligibleforRehire] [nvarchar](100) NULL,
	[Accidents] [bit] NULL,
	[ReleasePath] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[OneTime] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_PersonEmploymentHistory] PRIMARY KEY CLUSTERED 
(
	[PersonEmploymentHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonEmploymentHistoryAccident]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonEmploymentHistoryAccident](
	[PersonEmploymentHistoryAccidentId] [int] IDENTITY(1,1) NOT NULL,
	[PersonEmploymentHistoryId] [int] NULL,
	[Date] [datetime] NOT NULL,
	[City] [nvarchar](100) NULL,
	[StateId] [int] NULL,
	[Injuries] [int] NULL,
	[Fatalities] [int] NULL,
	[DOTRecordable] [bit] NULL,
	[Preventable] [bit] NULL,
	[HazMat] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_PersonEmploymentHistoryAccident] PRIMARY KEY CLUSTERED 
(
	[PersonEmploymentHistoryAccidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonEmploymentHistoryToCommercialEquipmentType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonEmploymentHistoryToCommercialEquipmentType](
	[PersonEmploymentHistoryToCommercialEquipmentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CommercialEquipmentTypeId] [int] NOT NULL,
	[PersonEmploymentHistoryId] [int] NOT NULL,
 CONSTRAINT [PK_PersonEmploymentHistoryToCommercialEquipmentType] PRIMARY KEY CLUSTERED 
(
	[PersonEmploymentHistoryToCommercialEquipmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonEntitlementGroup]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonEntitlementGroup](
	[PersonEntitlementGroupId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[EntitlementGroupId] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[PersonIdUpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_PersonEntitlementGroup] PRIMARY KEY CLUSTERED 
(
	[PersonEntitlementGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonEntitlementMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonEntitlementMapping](
	[EntitlementId] [smallint] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_PersonEntitlementMapping] PRIMARY KEY CLUSTERED 
(
	[EntitlementId] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonGender]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonGender](
	[PersonGenderId] [smallint] NOT NULL,
	[GenderDescription] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PersonGender] PRIMARY KEY CLUSTERED 
(
	[PersonGenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonHiringStatusHistory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonHiringStatusHistory](
	[PersonHiringStatusHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[PersonHiringStatusTypeId] [smallint] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Notes] [text] NULL,
	[PersonIdUpdatedBy] [int] NOT NULL,
	[DrugTest] [bit] NULL,
	[Accident] [bit] NULL,
	[Rehirable] [bit] NULL,
	[StatusChangeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PersonHiringStatusHistory] PRIMARY KEY CLUSTERED 
(
	[PersonHiringStatusHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonHiringStatusType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonHiringStatusType](
	[PersonHiringStatusTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PersonHiringStatusType] PRIMARY KEY CLUSTERED 
(
	[PersonHiringStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonNote]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonNote](
	[PersonNoteId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Notes] [text] NULL,
	[PersonIdUpdatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[PersonNoteTypeId] [smallint] NOT NULL,
	[NoteDate] [datetime] NULL,
 CONSTRAINT [PK_PersonNote] PRIMARY KEY CLUSTERED 
(
	[PersonNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonNoteType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonNoteType](
	[PersonNoteTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonNoteTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPay]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPay](
	[PersonPayId] [smallint] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[PayRateId] [smallint] NOT NULL,
	[PayRateAmount] [decimal](18, 2) NULL,
	[EnteredBy] [int] NOT NULL,
	[EnteredDate] [datetime] NOT NULL,
	[DefaultPayId] [bit] NULL,
	[PayRateBeginDate] [datetime] NOT NULL,
	[PayRateEndDate] [datetime] NULL,
 CONSTRAINT [PK__PersonPa__502E05840E086154] PRIMARY KEY CLUSTERED 
(
	[PersonPayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_PersonPay] UNIQUE NONCLUSTERED 
(
	[PersonPayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPay_FedExDriver_Default]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPay_FedExDriver_Default](
	[PersonId] [int] NOT NULL,
	[FedExType] [smallint] NOT NULL,
 CONSTRAINT [PK_PersonId] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPay_FedExDriver_Desc]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPay_FedExDriver_Desc](
	[FedExType] [smallint] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK__PersonPa__575014FDC52A6D22] PRIMARY KEY CLUSTERED 
(
	[FedExType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPayMaster]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPayMaster](
	[PersonPayMasterId] [smallint] IDENTITY(1,1) NOT NULL,
	[PayRateId] [smallint] NOT NULL,
	[PayRateAmount] [decimal](18, 2) NULL,
	[EnteredBy] [int] NOT NULL,
	[EnteredDate] [datetime] NOT NULL,
	[PayRateBeginDate] [datetime] NOT NULL,
	[PayRateEndDate] [datetime] NULL,
	[PerDiem] [decimal](18, 2) NULL,
	[SafetyBonus] [decimal](18, 2) NULL,
	[YearsExperience] [int] NULL,
 CONSTRAINT [PK_PersonPayMasterId] PRIMARY KEY CLUSTERED 
(
	[PersonPayMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [PK_PersonPayMaster] UNIQUE NONCLUSTERED 
(
	[PersonPayMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_PersonPayMaster] UNIQUE NONCLUSTERED 
(
	[PersonPayMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPayRate]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPayRate](
	[PersonPayRateId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[SyncToQB] [bit] NULL,
	[SortOrder] [smallint] NULL,
	[SyncToQBAvoidInd] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonPayRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPayRateAttribute]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPayRateAttribute](
	[PersonPayRateAttributeId] [smallint] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[AttributeQty] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_PersonPayRateAttribute] PRIMARY KEY CLUSTERED 
(
	[PersonPayRateAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPayRateAttributeMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPayRateAttributeMapping](
	[PersonPayRateId] [smallint] NOT NULL,
	[PersonPayRateAttributeId] [smallint] NOT NULL,
 CONSTRAINT [PK_PersonPayRateAttributeMapping] PRIMARY KEY CLUSTERED 
(
	[PersonPayRateId] ASC,
	[PersonPayRateAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPhoneNumber]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPhoneNumber](
	[PersonPhoneNumberId] [smallint] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[PhoneNumberTypeId] [smallint] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[CellCarrierId] [smallint] NULL,
	[UseForDispatch] [bit] NULL,
	[UseForQuickApps] [bit] NULL,
 CONSTRAINT [PK_PersonPhoneNumber_1] PRIMARY KEY CLUSTERED 
(
	[PersonPhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPreference]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPreference](
	[PersonId] [int] NOT NULL,
	[KeyName] [varchar](30) NOT NULL,
	[Setting] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PersonPreference] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[KeyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPTO]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPTO](
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
/****** Object:  Table [main].[PersonPTODailyRate]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPTODailyRate](
	[PersonPTODailyRateId] [int] IDENTITY(1,1) NOT NULL,
	[DriverRate] [decimal](18, 2) NOT NULL,
	[DailyRate] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonPTODailyRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPTOGroup]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPTOGroup](
	[PersonPTOGroupId] [smallint] IDENTITY(1,1) NOT NULL,
	[PersonPTOGroupName] [varchar](255) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PersonPTOGroup] PRIMARY KEY CLUSTERED 
(
	[PersonPTOGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_PersonPTOGroup] UNIQUE NONCLUSTERED 
(
	[PersonPTOGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPTOGroupMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPTOGroupMapping](
	[PersonId] [int] NOT NULL,
	[PersonPTOGroupId] [smallint] NOT NULL,
 CONSTRAINT [PK_PersonPTOGroupMapping] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[PersonPTOGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPTOScheduled]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPTOScheduled](
	[PersonPTOScheduledId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[PersonPTOQty] [decimal](18, 2) NULL,
	[Notes] [text] NULL,
	[LastUpdate] [datetime] NULL,
	[LastUpdatePersonId] [int] NULL,
 CONSTRAINT [PK_PersonPTOScheduled] PRIMARY KEY CLUSTERED 
(
	[PersonPTOScheduledId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonPTOType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonPTOType](
	[PersonPTOTypeId] [int] IDENTITY(1,1) NOT NULL,
	[LowerPTO] [int] NULL,
	[UpperPTO] [int] NULL,
	[PersonPTOName] [varchar](255) NOT NULL,
	[PersonPTOValue] [decimal](18, 3) NOT NULL,
	[PersonPTOGroupTypeId] [smallint] NULL,
	[PTOSort] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[PersonPTOQty] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_PersonPTOType] PRIMARY KEY CLUSTERED 
(
	[PersonPTOTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonQuitList]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonQuitList](
	[PersonQuitListId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[PersonQuitListTypeId] [smallint] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[PersonIdUpdatedBy] [int] NOT NULL,
	[Complete] [bit] NOT NULL,
 CONSTRAINT [PK_PersonQuitList] PRIMARY KEY CLUSTERED 
(
	[PersonQuitListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonQuitListType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonQuitListType](
	[PersonQuitListTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[HRType] [bit] NOT NULL,
 CONSTRAINT [PK_PersonQuitListType] PRIMARY KEY CLUSTERED 
(
	[PersonQuitListTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonTypeMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonTypeMapping](
	[PersonId] [int] NOT NULL,
	[PersonTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_PersonTypeMapping] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[PersonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PersonTypes]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PersonTypes](
	[PersonTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[PersonType] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PersonTypes] PRIMARY KEY CLUSTERED 
(
	[PersonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_PersonTypes] UNIQUE NONCLUSTERED 
(
	[PersonType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[PhoneNumberType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[PhoneNumberType](
	[PhoneNumberTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PhoneNumberType] PRIMARY KEY CLUSTERED 
(
	[PhoneNumberTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[proto_CompanyPerformance]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[proto_CompanyPerformance](
	[CompanyPerformanceId] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[Goal] [int] NULL,
	[Period] [smallint] NULL,
	[MTDGoal] [int] NULL,
	[MDTPercent] [decimal](18, 2) NULL,
	[TotalMiles] [int] NULL,
	[Charges] [money] NULL,
	[RPM] [money] NULL,
	[Miles] [decimal](18, 2) NULL,
	[Deadhead] [int] NULL,
	[CurrentGoal] [int] NULL,
	[DeadheadPercent] [decimal](18, 3) NULL,
 CONSTRAINT [PK_proto_CompanyPerformance] PRIMARY KEY CLUSTERED 
(
	[CompanyPerformanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[proto_LOADS]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[proto_LOADS](
	[ID] [float] NOT NULL,
	[PARENT_ID] [float] NULL,
	[TRIP_NUMBER] [float] NULL,
	[STOP_NUMBER] [float] NULL,
	[CURRENT_STATUS] [nvarchar](255) NULL,
	[CUSTNAME] [nvarchar](255) NULL,
	[CLIENT_ID] [nvarchar](255) NULL,
	[CUSTADDR1] [nvarchar](255) NULL,
	[CUSTADDR2] [nvarchar](255) NULL,
	[CUST_CITY] [nvarchar](255) NULL,
	[CUST_STATE] [nvarchar](255) NULL,
	[CUST_ZIP] [nvarchar](255) NULL,
	[ORIGIN] [nvarchar](255) NULL,
	[ORIGNAME] [nvarchar](255) NULL,
	[ORIG_CITY] [nvarchar](255) NULL,
	[ORIG_STATE] [nvarchar](255) NULL,
	[ORIG_ADDR1] [nvarchar](255) NULL,
	[ORIG_ADDR2] [nvarchar](255) NULL,
	[ORIG_ZIP] [nvarchar](255) NULL,
	[PICKUP_BY] [datetime] NULL,
	[PICKUP_BY_END] [datetime] NULL,
	[DESTINATION] [nvarchar](255) NULL,
	[DESTNAME] [nvarchar](255) NULL,
	[DESTADDR1] [nvarchar](255) NULL,
	[DESTADDR2] [nvarchar](255) NULL,
	[DEST_CITY] [nvarchar](255) NULL,
	[DEST_STATE] [nvarchar](255) NULL,
	[DEST_ZIP] [nvarchar](255) NULL,
	[DELIVER_BY] [datetime] NULL,
	[DELIVER_BY_END] [datetime] NULL,
	[Charges] [float] NULL,
	[EXTRA_CHARGES] [float] NULL,
	[INT_PAYABLE_AMT] [float] NULL,
	[MILES] [float] NULL,
	[PAID_MILES] [float] NULL,
	[PAID_EMPTY] [float] NULL,
	[Deadhead] [float] NULL,
	[Drops] [nvarchar](255) NULL,
	[Hours] [float] NULL,
	[Paid] [nvarchar](255) NULL,
	[Rate_Per_Mile] [float] NULL,
	[Lumper] [float] NULL,
	[Driver_1] [nvarchar](255) NULL,
	[Driver_2] [nvarchar](255) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[ORIGINALS_REQUIRED] [bit] NOT NULL,
	[INVOICE_MEDIUM] [nvarchar](255) NULL,
	[INVOICE_RECEIPT_DATE] [datetime] NULL,
	[INVOICE_VERIFIED_BY] [nvarchar](255) NULL,
	[CARRIER_PAPERWORK_RECD] [datetime] NULL,
	[Logs] [nvarchar](255) NULL,
	[Oregon] [float] NULL,
	[Truck_Number] [nvarchar](255) NULL,
	[TRAILER_1] [nvarchar](255) NULL,
	[TRAILER_2] [nvarchar](255) NULL,
	[DISPATCHER] [nvarchar](255) NULL,
	[CREATED_TIME] [datetime] NULL,
	[PAYMENT] [datetime] NULL,
	[DRIVER_1_ID] [nvarchar](255) NULL,
	[DRIVER_2_ID] [nvarchar](255) NULL,
	[CURRENT_MILEAGE] [float] NULL,
	[MILEAGE_DATE] [datetime] NULL,
	[TRL_HOURS] [float] NULL,
	[TRL_HOURS_DATE] [datetime] NULL,
	[TRL_2_HOURS] [float] NULL,
	[TRL_2_HOURS_DATE] [datetime] NULL,
	[AVAIL_BILLING] [bit] NOT NULL,
	[NOTES] [nvarchar](max) NULL,
	[ORIGIN_APPT] [nvarchar](255) NULL,
	[DEST_APPT] [nvarchar](255) NULL,
	[TRIP_ENV_START] [float] NULL,
	[TRIP_ENV_END] [float] NULL,
	[CARRIER_ID] [nvarchar](255) NULL,
	[LOAD_TENDER_RETURNED] [bit] NOT NULL,
	[PAPERWORK_REC] [datetime] NULL,
	[PAPER_LOGS] [bit] NOT NULL,
	[BILLING_USER] [nvarchar](255) NULL,
 CONSTRAINT [PK_proto_LOADS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[proto_LoadStatus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[proto_LoadStatus](
	[LoadStatusId] [int] IDENTITY(1,1) NOT NULL,
	[TripNo] [int] NULL,
	[Customer] [varchar](50) NULL,
	[StartLocation] [varchar](100) NULL,
	[EndLocation] [varchar](100) NULL,
	[Driver] [varchar](50) NULL,
	[TruckNo] [varchar](10) NULL,
	[MIleage] [nchar](10) NULL,
 CONSTRAINT [PK_proto_LoadStatus] PRIMARY KEY CLUSTERED 
(
	[LoadStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[proto_PUNIT]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[proto_PUNIT](
	[proto_PUNITId] [int] IDENTITY(1,1) NOT NULL,
	[UNIT_ID] [nvarchar](255) NULL,
	[SAFETY_EXPIRATION] [datetime] NULL,
	[REG_EXPIRATION] [datetime] NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[OTR_PLANNING] [bit] NOT NULL,
	[DEFAULT_DISPATCHER] [nvarchar](255) NULL,
	[IFTA_EXPIRATION] [datetime] NULL,
	[LIABILITY_EXPIRATION] [datetime] NULL,
	[CARGO_EXPIRATION] [datetime] NULL,
	[PLATE_NUMBER] [nvarchar](255) NULL,
	[PRE_PASS] [nvarchar](255) NULL,
	[EZ_PASS] [nvarchar](255) NULL,
 CONSTRAINT [PK_proto_PUNIT] PRIMARY KEY CLUSTERED 
(
	[proto_PUNITId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[proto_TRAILER]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[proto_TRAILER](
	[proto_TRAILERId] [int] IDENTITY(1,1) NOT NULL,
	[TRAILER_ID] [nvarchar](255) NULL,
	[SAFETY_EXPIRATION] [datetime] NULL,
	[REG_EXPIRATION] [datetime] NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[INSURANCE_EXPIRATION] [datetime] NULL,
 CONSTRAINT [PK_proto_TRAILER] PRIMARY KEY CLUSTERED 
(
	[proto_TRAILERId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[QuickBooksCompanyFileToSync]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[QuickBooksCompanyFileToSync](
	[CompanyFileToSyncId] [int] NOT NULL,
	[CompanyFileNamePath] [varchar](500) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ErrorAccessingFile] [bit] NULL,
	[LastAttemptToAccessDt] [datetime] NULL,
	[FileAccessError] [varchar](max) NULL,
 CONSTRAINT [PK_QuickBooksCompanyFileToSync] PRIMARY KEY CLUSTERED 
(
	[CompanyFileToSyncId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[QuickBooksCompanyFileUpdateHistory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[QuickBooksCompanyFileUpdateHistory](
	[CompanyFileUpdatedHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[QuickBooksUpdateNeededId] [int] NOT NULL,
	[CompanyFileToSyncId] [int] NOT NULL,
	[CompletedInd] [bit] NOT NULL,
	[UpdatedTs] [datetime] NOT NULL,
	[UpdateLog] [varchar](max) NULL,
	[CompletedWithErrorInd] [bit] NULL,
 CONSTRAINT [PK_QuickBooksCompanyFileUpdateHistory] PRIMARY KEY CLUSTERED 
(
	[CompanyFileUpdatedHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[QuickBooksSyncIssueNotificationHistory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[QuickBooksSyncIssueNotificationHistory](
	[PersonIdToNotify] [int] NOT NULL,
	[NotifiedTs] [datetime] NOT NULL,
	[NotifyLog] [varchar](max) NULL,
 CONSTRAINT [PK_QuickBooksSyncIssueNotificationHistory] PRIMARY KEY CLUSTERED 
(
	[PersonIdToNotify] ASC,
	[NotifiedTs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[QuickBooksSyncIssueNotificationPerson]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[QuickBooksSyncIssueNotificationPerson](
	[PersonIdToNotify] [int] NOT NULL,
 CONSTRAINT [PK_QuickBooksSyncIssueNotificationPerson] PRIMARY KEY CLUSTERED 
(
	[PersonIdToNotify] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[QuickBooksUpdateNeeded]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[QuickBooksUpdateNeeded](
	[QuickBooksUpdateNeededId] [int] IDENTITY(1,1) NOT NULL,
	[SchemaChanged] [varchar](50) NOT NULL,
	[TableChanged] [varchar](50) NOT NULL,
	[TableChangedDt] [datetime] NOT NULL,
	[RowPKValue] [int] NOT NULL,
	[ChangeType] [char](1) NULL,
	[CompleteInd] [bit] NULL,
	[UpdateLog] [varchar](max) NULL,
	[CompletedWithErrorInd] [bit] NULL,
	[SearchVal] [varchar](500) NULL,
 CONSTRAINT [PK_QuickBooksUpdateNeeded] PRIMARY KEY CLUSTERED 
(
	[QuickBooksUpdateNeededId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[Region]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[Region](
	[RegionId] [smallint] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ReleaseNote]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ReleaseNote](
	[ReleaseNoteId] [smallint] IDENTITY(1,1) NOT NULL,
	[ReleaseVersion] [varchar](50) NOT NULL,
	[ReleaseNotes] [text] NULL,
	[CreatedByPersonId] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[TestedInd] [bit] NULL,
	[TestCompletedByPersonId] [int] NULL,
	[TestCompletedDateTime] [datetime] NULL,
	[NotesUpdatedDateTime] [datetime] NULL,
	[GoogleDocUrl] [varchar](500) NULL,
 CONSTRAINT [PK_ReleaseNotes] PRIMARY KEY CLUSTERED 
(
	[ReleaseNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[State]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nchar](3) NOT NULL,
	[StateName] [nvarchar](128) NOT NULL,
	[RegionId] [smallint] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[SubmitType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[SubmitType](
	[SubmitTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[SubmitType] [varchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_SubmitType] PRIMARY KEY CLUSTERED 
(
	[SubmitTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[System]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[System](
	[CurrentLoadId] [int] NULL,
	[CurrentTripId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [main].[TimeClockEntry]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[TimeClockEntry](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[ClockIn] [datetime] NULL,
	[ClockOut] [datetime] NULL,
	[Approved] [bit] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[ApprovedBy] [int] NULL,
	[LastModifiedBy] [int] NULL,
	[ClockInAdj] [datetime] NULL,
	[ClockOutAdj] [datetime] NULL,
	[LunchAdj] [int] NOT NULL,
 CONSTRAINT [PK_TimeClockEntry] PRIMARY KEY CLUSTERED 
(
	[EntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [main].[UsageStatistic]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[UsageStatistic](
	[UsageStatisticId] [int] IDENTITY(1,1) NOT NULL,
	[UsageStatisticTypeId] [smallint] NOT NULL,
	[PersonId] [int] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[ExtraData] [varchar](200) NULL,
 CONSTRAINT [PK_UsageStatistic] PRIMARY KEY CLUSTERED 
(
	[UsageStatisticId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[UsageStatisticType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[UsageStatisticType](
	[UsageStatisticTypeId] [smallint] NOT NULL,
	[UsageStatisticTypeDescription] [varchar](250) NOT NULL,
 CONSTRAINT [PK_UsageStatisticType] PRIMARY KEY CLUSTERED 
(
	[UsageStatisticTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [main].[ZipCode5Plus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [main].[ZipCode5Plus](
	[City] [nvarchar](28) NULL,
	[ST] [nvarchar](2) NULL,
	[ZIP] [nvarchar](5) NULL,
	[A/C] [nvarchar](3) NULL,
	[FIPS] [nvarchar](5) NULL,
	[County] [nvarchar](25) NULL,
	[Pref?] [nvarchar](1) NULL,
	[T/Z] [nvarchar](5) NULL,
	[DST?] [nvarchar](1) NULL,
	[Type] [nvarchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [quickApp].[QuickAppKSL]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quickApp].[QuickAppKSL](
	[QuickAppKSLId] [int] IDENTITY(1,1) NOT NULL,
	[QuickAppId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](75) NULL,
	[ZipCode] [nchar](10) NULL,
	[EducationLevel] [varchar](50) NULL,
	[YearsOfExperience] [varchar](50) NULL,
 CONSTRAINT [PK_QuickAppKSL] PRIMARY KEY CLUSTERED 
(
	[QuickAppKSLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quickApp].[QuickAppLog]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quickApp].[QuickAppLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ProcessStep] [varchar](50) NOT NULL,
	[ProcessMessage] [nvarchar](max) NULL,
	[ProcessTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_QuickAppLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [quickApp].[QuickAppSourceType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quickApp].[QuickAppSourceType](
	[QuickAppSourceId] [smallint] NOT NULL,
	[SourceDescription] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_QuickAppSourceType] PRIMARY KEY CLUSTERED 
(
	[QuickAppSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [quickApp].[QuickAppTrack]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quickApp].[QuickAppTrack](
	[QuickAppId] [int] IDENTITY(1,1) NOT NULL,
	[QuickAppSourceId] [smallint] NOT NULL,
	[gmailMessageId] [varchar](50) NULL,
	[SentToTenstreetInd] [bit] NULL,
	[PostMessage] [nvarchar](max) NULL,
	[ResponseMessage] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_QuickAppData] PRIMARY KEY CLUSTERED 
(
	[QuickAppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [quickApp].[QuickAppWix]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quickApp].[QuickAppWix](
	[QuickAppWixId] [int] IDENTITY(1,1) NOT NULL,
	[QuickAppId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ZipCode] [nchar](10) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[EmailAddress] [varchar](75) NULL,
	[ExperienceLevel] [varchar](max) NULL,
	[Division] [varchar](max) NULL,
	[ReferredFrom] [varchar](50) NULL,
 CONSTRAINT [PK_WixQuickApp] PRIMARY KEY CLUSTERED 
(
	[QuickAppWixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [quickApp].[QuickAppWixContactForm]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quickApp].[QuickAppWixContactForm](
	[QuickAppWixContactFormId] [int] IDENTITY(1,1) NOT NULL,
	[QuickAppId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](75) NULL,
	[SubjectLine] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_QuickAppWixContactForm] PRIMARY KEY CLUSTERED 
(
	[QuickAppWixContactFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[Accident]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[Accident](
	[AccidentId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[AccidentDate] [datetime] NOT NULL,
	[City] [varchar](50) NULL,
	[StateId] [int] NULL,
	[CommercialVehicle] [bit] NOT NULL,
	[InjuriesFatalities] [bit] NULL,
	[TowingInvolved] [bit] NULL,
	[Details] [varchar](max) NULL,
	[Preventable] [bit] NOT NULL,
	[HazmatSpill] [bit] NULL,
 CONSTRAINT [PK_Accident] PRIMARY KEY CLUSTERED 
(
	[AccidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[BackgroundCheckOrder]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[BackgroundCheckOrder](
	[BackgroundCheckOrderId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[ExternalId] [nvarchar](100) NOT NULL,
	[Product] [nvarchar](100) NOT NULL,
	[BackgroundCheckStatusId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CustomScore] [nvarchar](100) NULL,
	[ReportLink] [nvarchar](100) NULL,
	[BackgroundCheckScoreId] [int] NULL,
	[QuoteBack] [nvarchar](100) NOT NULL,
	[ReportPath] [nvarchar](max) NULL,
	[RequestObject] [nvarchar](max) NULL,
 CONSTRAINT [PK_BackgroundCheckOrder] PRIMARY KEY CLUSTERED 
(
	[BackgroundCheckOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[BackgroundCheckScore]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[BackgroundCheckScore](
	[BackgroundCheckScoreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_BackgroundCheckScore] PRIMARY KEY CLUSTERED 
(
	[BackgroundCheckScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[BackgroundCheckStatus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[BackgroundCheckStatus](
	[BackgroundCheckStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Code] [nvarchar](100) NULL,
 CONSTRAINT [PK_BackgroundCheckStatus] PRIMARY KEY CLUSTERED 
(
	[BackgroundCheckStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[CheckListItemType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[CheckListItemType](
	[CheckListItemTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CheckListItemType] PRIMARY KEY CLUSTERED 
(
	[CheckListItemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[CommercialEquipmentType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[CommercialEquipmentType](
	[CommercialEquipmentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CommercialEquipmentType] PRIMARY KEY CLUSTERED 
(
	[CommercialEquipmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[CommercialWorkType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[CommercialWorkType](
	[CommercialWorkTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CommercialWorkType] PRIMARY KEY CLUSTERED 
(
	[CommercialWorkTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[CustomQuestion]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[CustomQuestion](
	[CustomQuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](500) NOT NULL,
	[Answer] [nvarchar](500) NULL,
	[QuickAppId] [int] NULL,
	[ProfileId] [int] NULL,
 CONSTRAINT [PK_CustomQuestion] PRIMARY KEY CLUSTERED 
(
	[CustomQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[DocumentType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[DocumentType](
	[DocumentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[DriversLicense]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[DriversLicense](
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
/****** Object:  Table [recruiting].[DrivingSchool]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[DrivingSchool](
	[DrivingSchoolId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FMCSRs] [bit] NULL,
	[ProfileId] [int] NOT NULL,
 CONSTRAINT [PK_DrivingSchool] PRIMARY KEY CLUSTERED 
(
	[DrivingSchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[Employer]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[Employer](
	[EmployerId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[CurrentEmployer] [bit] NOT NULL,
	[CompanyName] [varchar](100) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[StateId] [int] NULL,
	[ZipCode] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[PositionHeld] [varchar](max) NULL,
	[DepartureReason] [varchar](500) NULL,
	[CommercialVehicleOperation] [bit] NOT NULL,
	[CommercialsFMCSRs] [bit] NULL,
	[EmployerContactId] [int] NULL,
	[DOT] [bit] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[EmployerContact]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[EmployerContact](
	[EmployerContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[RepFirstName] [varchar](100) NULL,
	[RepLastName] [varchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[City] [varchar](100) NULL,
	[StateId] [int] NULL,
	[ZipCode] [varchar](50) NULL,
	[PreferredContact] [nvarchar](500) NULL,
	[Notes] [nvarchar](max) NULL,
	[statecodetemp] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
 CONSTRAINT [PK_EmployerContact] PRIMARY KEY CLUSTERED 
(
	[EmployerContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[EmployerToCommercialEquipmentType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[EmployerToCommercialEquipmentType](
	[EmployerToCommercialEquipmentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployerId] [int] NOT NULL,
	[CommercialEquipmentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_EmployerToCommercialEquipmentType] PRIMARY KEY CLUSTERED 
(
	[EmployerToCommercialEquipmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[EmployerToCommercialWorkType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[EmployerToCommercialWorkType](
	[EmployerToCommercialWorkTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployerId] [int] NOT NULL,
	[CommercialWorkTypeId] [int] NOT NULL,
 CONSTRAINT [PK_EmployerToCommercialWorkType] PRIMARY KEY CLUSTERED 
(
	[EmployerToCommercialWorkTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[EventAction]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[EventAction](
	[EventActionId] [int] IDENTITY(1,1) NOT NULL,
	[EventActionTriggerId] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[EventActionTypeId] [int] NOT NULL,
	[LeadSourceId] [int] NULL,
	[Active] [bit] NOT NULL,
	[ProfileStageId] [int] NULL,
 CONSTRAINT [PK_EventAction] PRIMARY KEY CLUSTERED 
(
	[EventActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[EventActionDetail]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[EventActionDetail](
	[EventActionDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MessageText] [nvarchar](max) NULL,
	[ExternalMessageTypeId] [int] NULL,
	[NotificationTo] [nvarchar](100) NULL,
	[TargetProfileStage] [int] NULL,
	[EventActionId] [int] NOT NULL,
	[TargetQuickAppStage] [int] NULL,
 CONSTRAINT [PK_EventActionDetail] PRIMARY KEY CLUSTERED 
(
	[EventActionDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[EventActionTrigger]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[EventActionTrigger](
	[EventActionTriggerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_EventActionTrigger] PRIMARY KEY CLUSTERED 
(
	[EventActionTriggerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[EventActionType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[EventActionType](
	[EventActionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_EventActionType] PRIMARY KEY CLUSTERED 
(
	[EventActionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ExternalMessage]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ExternalMessage](
	[ExternalMessageId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[MessageText] [nvarchar](max) NOT NULL,
	[Sent] [bit] NOT NULL,
	[Received] [bit] NOT NULL,
	[ExternalAddress] [nvarchar](150) NOT NULL,
	[ExternalMessageTypeId] [int] NOT NULL,
	[MessageDate] [datetime] NOT NULL,
	[SenderId] [int] NULL,
	[ExternalId] [nvarchar](150) NULL,
	[ThreadId] [nvarchar](150) NULL,
	[isHTML] [bit] NULL,
	[HistoryId] [nvarchar](150) NULL,
 CONSTRAINT [PK_ExternalMessage] PRIMARY KEY CLUSTERED 
(
	[ExternalMessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ExternalMessageAttachment]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ExternalMessageAttachment](
	[ExternalMessageAttachmentId] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](500) NOT NULL,
	[MimeType] [nvarchar](50) NULL,
	[ExternalMessageId] [int] NOT NULL,
	[FileName] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ExternalMessageAttachment] PRIMARY KEY CLUSTERED 
(
	[ExternalMessageAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ExternalMessageMergeField]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ExternalMessageMergeField](
	[ExternalMessageMergeFieldId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[SourceTable] [nvarchar](100) NOT NULL,
	[SourceField] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[Formator] [nvarchar](50) NULL,
	[Computed] [bit] NULL,
	[ComputedFunction] [nvarchar](50) NULL,
 CONSTRAINT [PK_ExternalMessageMergeField] PRIMARY KEY CLUSTERED 
(
	[ExternalMessageMergeFieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ExternalMessageTemplate]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ExternalMessageTemplate](
	[ExternalMessageTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TemplateText] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ExternalMessageTemplate] PRIMARY KEY CLUSTERED 
(
	[ExternalMessageTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ExternalMessageType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ExternalMessageType](
	[ExternalMessageTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_ExternalMessageType] PRIMARY KEY CLUSTERED 
(
	[ExternalMessageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[LeadConnector]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[LeadConnector](
	[LeadConnectorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[AccessKey] [nvarchar](50) NOT NULL,
	[LeadSourceId] [int] NULL,
	[Active] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LeadConnector] PRIMARY KEY CLUSTERED 
(
	[LeadConnectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[LeadSource]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[LeadSource](
	[LeadSourceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[SortOrder] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_LeadSource] PRIMARY KEY CLUSTERED 
(
	[LeadSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[MilitaryService]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[MilitaryService](
	[MilitaryService] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[ServiceBranch] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Rank] [varchar](50) NOT NULL,
	[HeavyMachineOperation] [bit] NOT NULL,
	[HonorableDischarge] [bit] NOT NULL,
	[HonorableDischargeDetail] [varchar](500) NULL,
 CONSTRAINT [PK_MilitaryService] PRIMARY KEY CLUSTERED 
(
	[MilitaryService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[MovingViolation]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[MovingViolation](
	[MovingViolationId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[StateId] [int] NULL,
	[CommercialVehicle] [bit] NULL,
	[Fine] [bit] NULL,
	[Suspension] [bit] NULL,
	[Revocation] [bit] NULL,
	[CommunityService] [bit] NULL,
	[Other] [bit] NULL,
	[OtherDescription] [nvarchar](250) NULL,
	[ChargeId] [int] NOT NULL,
	[ProfileId] [int] NOT NULL,
 CONSTRAINT [PK_MovingViolation] PRIMARY KEY CLUSTERED 
(
	[MovingViolationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[MovingViolationCharge]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[MovingViolationCharge](
	[MovingViolationChargeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_MovingViolationCharge] PRIMARY KEY CLUSTERED 
(
	[MovingViolationChargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[Position]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[Position](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[Profile]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[Profile](
	[ProfileId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Suffix] [varchar](50) NULL,
	[Alias] [varchar](500) NULL,
	[SSN] [varchar](50) NULL,
	[DOB] [datetime] NOT NULL,
	[SMSConsent] [bit] NULL,
	[PositionId] [int] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[TWICExp] [datetime] NULL,
	[USWorkEligible] [bit] NULL,
	[EnglishLanguage] [bit] NULL,
	[DrugAlcoholPositive] [bit] NULL,
	[DOTReturnToDutyProof] [bit] NULL,
	[YearsExperience] [varchar](50) NULL,
	[MVDLicenseRevoked] [bit] NULL,
	[MVDLicenseRevokedDetail] [varchar](500) NULL,
	[MVDDrivingConviction] [bit] NULL,
	[MVDDrivingConvictionDetail] [varchar](500) NULL,
	[MVDDrugAlcConviction] [bit] NULL,
	[MVDDrugAlcConvictionDetail] [varchar](500) NULL,
	[LeadSourceId] [int] NOT NULL,
	[ProfileStageId] [int] NOT NULL,
	[Notes] [text] NULL,
	[Active] [bit] NOT NULL,
	[ProfileGenderId] [int] NULL,
	[Hired] [bit] NOT NULL,
	[Confidence] [int] NOT NULL,
	[ExternalComplete] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[UploadCode] [varchar](50) NULL,
	[PersonId] [int] NULL,
	[ProfileTypeId] [int] NULL,
	[ProfileStatusId] [int] NULL,
	[ExternalId] [nvarchar](100) NULL,
	[PhoneNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileAddress]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileAddress](
	[ProfileAddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NOT NULL,
	[StateId] [int] NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[AddressTypeId] [smallint] NOT NULL,
	[PrimaryAddress] [bit] NOT NULL,
	[ProfileId] [int] NOT NULL,
 CONSTRAINT [PK_ProfileAddress] PRIMARY KEY CLUSTERED 
(
	[ProfileAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileBackgroundCheck]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileBackgroundCheck](
	[ProfileBackgroundCheckId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[ExternalId] [nvarchar](100) NOT NULL,
	[Product] [nvarchar](100) NOT NULL,
	[BackgroundCheckStatusId] [int] NOT NULL,
 CONSTRAINT [PK_ProfileBackgroundCheck] PRIMARY KEY CLUSTERED 
(
	[ProfileBackgroundCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileChecklistItem]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileChecklistItem](
	[ProfileChecklistItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProflleId] [int] NOT NULL,
	[CheckListItemTypeId] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[Complete] [bit] NULL,
 CONSTRAINT [PK_ProfileChecklistItem] PRIMARY KEY CLUSTERED 
(
	[ProfileChecklistItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileCode](
	[ProfileCodeId] [uniqueidentifier] NOT NULL,
	[Expiration] [datetime] NOT NULL,
	[Signature] [bit] NOT NULL,
	[ProfileId] [int] NOT NULL,
 CONSTRAINT [PK_ProfileCode] PRIMARY KEY CLUSTERED 
(
	[ProfileCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileDocument]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileDocument](
	[ProfileDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[DocumentTypeId] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProfileId] [int] NOT NULL,
	[DocumentPath] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ProfileDocument] PRIMARY KEY CLUSTERED 
(
	[ProfileDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileEducation]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileEducation](
	[ProfileEducationId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[HighestGradeCompleted] [smallint] NULL,
	[HighSchoolYears] [smallint] NULL,
	[CollegeYears] [smallint] NULL,
	[LastSchoolAttendedName] [varchar](50) NULL,
	[LastSchoolAttendedCity] [varchar](50) NULL,
	[LastSchoolAttendedState] [varchar](50) NULL,
 CONSTRAINT [PK_ProfileEducation] PRIMARY KEY CLUSTERED 
(
	[ProfileEducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileEvent]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileEvent](
	[ProfileEventId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileEventSourceId] [int] NOT NULL,
	[ProfileEventTypeId] [int] NOT NULL,
	[PersonId] [int] NULL,
	[EventDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProfileEvent] PRIMARY KEY CLUSTERED 
(
	[ProfileEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileEventDetail]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileEventDetail](
	[ProfileEventDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NULL,
	[RecordId] [int] NULL,
	[FieldName] [nvarchar](100) NULL,
	[OldRow] [nvarchar](max) NULL,
	[NewRow] [nvarchar](max) NULL,
	[ProfileEventId] [int] NOT NULL,
	[Delta] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProfileEventDetail] PRIMARY KEY CLUSTERED 
(
	[ProfileEventDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileEventSource]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileEventSource](
	[ProfileEventSourceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProfileEventSource] PRIMARY KEY CLUSTERED 
(
	[ProfileEventSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileEventType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileEventType](
	[ProfileEventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProfileEventType] PRIMARY KEY CLUSTERED 
(
	[ProfileEventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileFile]    Script Date: 12/11/2023 11:09:08 AM ******/
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
GO
/****** Object:  Table [recruiting].[ProfileGender]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileGender](
	[ProfileGenderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProfileGender] PRIMARY KEY CLUSTERED 
(
	[ProfileGenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfilePhoneNumber]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfilePhoneNumber](
	[ProfilePhoneNumberId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumberTypeId] [smallint] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_ProfilePhoneNumber_1] PRIMARY KEY CLUSTERED 
(
	[ProfilePhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ProfilePhoneNumber] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileSignature]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileSignature](
	[ProfileSignatureId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[SignatureTypeId] [smallint] NOT NULL,
	[SignoffDate] [datetime] NOT NULL,
	[IPAddress] [nvarchar](20) NOT NULL,
	[Signature] [nvarchar](100) NOT NULL,
	[SignatureImageId] [int] NULL,
 CONSTRAINT [PK_ProfileSignature] PRIMARY KEY CLUSTERED 
(
	[ProfileSignatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileStage]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileStage](
	[ProfileStageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[SortOrder] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProfileStage] PRIMARY KEY CLUSTERED 
(
	[ProfileStageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileStatus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileStatus](
	[ProfileStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProfileStatus] PRIMARY KEY CLUSTERED 
(
	[ProfileStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[ProfileType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[ProfileType](
	[ProfileTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProfileType] PRIMARY KEY CLUSTERED 
(
	[ProfileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[QuickApp]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[QuickApp](
	[QuickAppId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[YearsOfExperience] [varchar](50) NOT NULL,
	[CDLValid] [bit] NOT NULL,
	[SubmittedDate] [datetime] NOT NULL,
	[LeadSourceId] [int] NOT NULL,
	[ProfileStageId] [int] NOT NULL,
	[Converted] [bit] NOT NULL,
	[ExternalId] [nvarchar](100) NULL,
 CONSTRAINT [PK_QuickApp] PRIMARY KEY CLUSTERED 
(
	[QuickAppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[SignatureImage]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[SignatureImage](
	[SignatureImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageData] [varbinary](max) NOT NULL,
	[MimeType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SignatureImage] PRIMARY KEY CLUSTERED 
(
	[SignatureImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[SignatureType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[SignatureType](
	[SignatureTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[SigDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SignatureType] PRIMARY KEY CLUSTERED 
(
	[SignatureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[Unemployment]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[Unemployment](
	[UnemploymentId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Details] [varchar](max) NOT NULL,
	[CurrentlyUnemployed] [bit] NOT NULL,
 CONSTRAINT [PK_Unemployment] PRIMARY KEY CLUSTERED 
(
	[UnemploymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[VerificationRequest]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[VerificationRequest](
	[VerificationRequestId] [int] IDENTITY(1,1) NOT NULL,
	[VerifiedByName] [nvarchar](100) NULL,
	[VerifiedByTitle] [nvarchar](100) NULL,
	[VerifiedByPhone] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CommercialVehicle] [bit] NULL,
	[DriverType] [nvarchar](100) NULL,
	[Performance] [nvarchar](100) NULL,
	[ReasonForLeaving] [nvarchar](max) NULL,
	[EligibleforRehire] [nvarchar](100) NULL,
	[Accidents] [bit] NULL,
	[ProfileDocumentId] [int] NULL,
	[VerificationDate] [datetime] NULL,
	[VerificationRequestStatusId] [int] NOT NULL,
	[AccessCode] [nvarchar](50) NULL,
	[EmployerId] [int] NOT NULL,
	[ExternalComplete] [bit] NULL,
 CONSTRAINT [PK_VerificationRequest] PRIMARY KEY CLUSTERED 
(
	[VerificationRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[VerificationRequestAccident]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[VerificationRequestAccident](
	[VerificationRequestAccidentId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[City] [nvarchar](100) NULL,
	[StateId] [int] NULL,
	[Injuries] [int] NULL,
	[Fatalities] [int] NULL,
	[DOTRecordable] [bit] NULL,
	[Preventable] [bit] NULL,
	[HazMat] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[VerificationRequestId] [int] NOT NULL,
 CONSTRAINT [PK_VerificationRequestAccident] PRIMARY KEY CLUSTERED 
(
	[VerificationRequestAccidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[VerificationRequestAttempt]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[VerificationRequestAttempt](
	[VerificationRequestAttemptId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[VerificationRequestId] [int] NOT NULL,
	[CreatedByUser] [int] NULL,
 CONSTRAINT [PK_VerificationRequestAttempt] PRIMARY KEY CLUSTERED 
(
	[VerificationRequestAttemptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[VerificationRequestStatus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[VerificationRequestStatus](
	[VerificationRequestStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_VerificationRequestStatus] PRIMARY KEY CLUSTERED 
(
	[VerificationRequestStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [recruiting].[VerificationRequestToCommercialEquipmentType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [recruiting].[VerificationRequestToCommercialEquipmentType](
	[VerificationRequestToCommercialEquipmentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CommercialEquipmentTypeId] [int] NOT NULL,
	[VerificationRequestId] [int] NOT NULL,
 CONSTRAINT [PK_VerificationRequestToCommercialEquipmentType_1] PRIMARY KEY CLUSTERED 
(
	[VerificationRequestToCommercialEquipmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[ItemAssembly]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[ItemAssembly](
	[AssemblyId] [int] IDENTITY(1,1) NOT NULL,
	[LaborItemId] [int] NOT NULL,
 CONSTRAINT [PK_ItemAssembly_1] PRIMARY KEY CLUSTERED 
(
	[AssemblyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[ItemAssemblyDetail]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[ItemAssemblyDetail](
	[AssemblyDetailId] [int] IDENTITY(1,1) NOT NULL,
	[LaborItemId] [int] NOT NULL,
	[PartItemId] [int] NOT NULL,
	[Qty] [float] NOT NULL,
 CONSTRAINT [PK_ItemAssembly] PRIMARY KEY CLUSTERED 
(
	[AssemblyDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[ItemList]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[ItemList](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Item] [varchar](100) NOT NULL,
	[TypeId] [int] NULL,
	[PurchaseDescription] [varchar](250) NULL,
	[Description] [varchar](250) NULL,
	[Cost] [decimal](19, 4) NULL,
	[Price] [decimal](19, 4) NULL,
	[PreferredVendor] [varchar](50) NULL,
	[SalesTaxCode] [varchar](50) NULL,
	[CogsAccount] [varchar](50) NULL,
	[AssetAccount] [varchar](50) NULL,
	[MPN] [varchar](50) NULL,
	[Interfaced_QB] [bit] NOT NULL,
	[LaborHours] [float] NULL,
	[CreatedPersonId] [int] NULL,
 CONSTRAINT [PK_ItemList] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[ItemType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[ItemType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [varchar](50) NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[LaborStory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[LaborStory](
	[LaborId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NULL,
	[LaborStory] [varchar](max) NULL,
 CONSTRAINT [PK_LaborStory] PRIMARY KEY CLUSTERED 
(
	[LaborId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Service].[MileageHistory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[MileageHistory](
	[MileageHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[MileageHistoryTs] [datetime] NULL,
	[PersonId] [int] NULL,
	[EquipId] [int] NULL,
	[Mileage] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_MileageHistory] PRIMARY KEY CLUSTERED 
(
	[MileageHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[OrderClock]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[OrderClock](
	[TimeId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ClockIn] [datetime] NULL,
	[ClockOut] [datetime] NULL,
	[Approved] [bit] NULL,
	[Notes] [varchar](max) NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_OrderClock] PRIMARY KEY CLUSTERED 
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Service].[OrderDetail]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [float] NULL,
	[PriceEach] [float] NULL,
 CONSTRAINT [PK_Service.OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[OrderNotes]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[OrderNotes](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderNote] [nvarchar](max) NULL,
	[NoteTime] [datetime] NOT NULL,
	[NotePersonId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[EditedPersonId] [int] NULL,
	[OrigNoteId] [int] NULL,
 CONSTRAINT [PK_Service.OrderNotes] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Service].[ServiceHistory]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[ServiceHistory](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[EquipId] [int] NOT NULL,
	[Mileage] [int] NULL,
	[Hours] [int] NULL,
	[ServiceDate] [date] NOT NULL,
	[OrderDetailId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceHistory] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[ServiceStatus]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[ServiceStatus](
	[ServiceStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusTs] [datetime] NULL,
	[WorkOrderId] [int] NULL,
	[ServiceStatusTypeId] [int] NULL,
	[UpdatedPersonId] [int] NULL,
 CONSTRAINT [PK_ServiceStatus] PRIMARY KEY CLUSTERED 
(
	[ServiceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[ServiceStatusType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[ServiceStatusType](
	[ServiceStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceStatusTypeNm] [varchar](50) NOT NULL,
	[StatusOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_ServiceStatusType] PRIMARY KEY CLUSTERED 
(
	[ServiceStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Service].[WorkOrder]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service].[WorkOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NULL,
	[CreatedPersonId] [int] NULL,
	[CreatedTs] [datetime] NULL,
	[ClientId] [int] NULL,
	[EquipId] [int] NULL,
	[StatusId] [int] NULL,
	[ServiceWriterId] [int] NULL,
	[PartsApproval] [bit] NULL,
	[LaborCompletionDate] [datetime] NULL,
	[QCRequired] [bit] NOT NULL,
	[OrderDueDate] [date] NULL,
	[OrderPickupDate] [date] NULL,
	[ClientNotified] [bit] NULL,
	[DeliveryReady] [bit] NULL,
 CONSTRAINT [PK_service.WorkOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[Carrier]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[Carrier](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[Vendor_Id] [varchar](20) NOT NULL,
	[VendorName] [varchar](100) NOT NULL,
	[ActiveInd] [bit] NOT NULL,
	[CreatedByPersonId] [int] NULL,
	[CreatedDt] [datetime] NULL,
	[Contact] [varchar](50) NULL,
	[FederalId] [varchar](20) NULL,
	[TIN] [varchar](20) NULL,
	[EmailAddress] [varchar](75) NULL,
	[Notes] [varchar](max) NULL,
	[PayTier] [smallint] NULL,
	[CommAutoExpDt] [datetime] NULL,
	[LeaseContractStartDt] [datetime] NULL,
	[LeaseContractExpireDt] [datetime] NULL,
	[OCCACCWaiverExpDt] [datetime] NULL,
	[WCCWExpDt] [datetime] NULL,
	[VendorTypeId] [smallint] NULL,
	[VendorStatusTypeId] [smallint] NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[CarrierPay]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[CarrierPay](
	[CarrierPayId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[VendorPayCodeId] [smallint] NULL,
	[TripNumber] [varchar](15) NULL,
	[PayDescription] [nvarchar](200) NULL,
	[PayNotes] [nvarchar](max) NULL,
	[PayQuantity] [decimal](18, 2) NOT NULL,
	[PayRate] [decimal](18, 2) NOT NULL,
	[TotalPay] [decimal](18, 2) NULL,
	[PayDate] [datetime] NOT NULL,
	[EnteredByPersonId] [int] NOT NULL,
	[VendorPayTypeId] [smallint] NULL,
	[ApprovedDate] [datetime] NULL,
	[VendorPaymentStateId] [smallint] NULL,
	[InsertDate] [datetime] NULL,
	[QBMap] [nvarchar](255) NULL,
	[InterfacedQBDate] [datetime] NULL,
	[ApprovedByPersonId] [int] NULL,
	[ApprovedInd] [bit] NULL,
	[PayCode] [nvarchar](200) NULL,
	[Driver1PersonId] [int] NULL,
	[ImportErrors] [varchar](max) NULL,
	[ParentCheckGuid] [varchar](100) NULL,
 CONSTRAINT [PK_CarrierPay] PRIMARY KEY CLUSTERED 
(
	[CarrierPayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[CarrierPayQBMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[CarrierPayQBMapping](
	[CarrierPayQBMappingId] [int] IDENTITY(1,1) NOT NULL,
	[AccChargeTypeId] [smallint] NOT NULL,
	[QBAccountName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_CarrierPayQBMapping] PRIMARY KEY CLUSTERED 
(
	[CarrierPayQBMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[CarrierSettings]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[CarrierSettings](
	[VendorId] [int] NOT NULL,
	[AdvanceFeePercent] [decimal](5, 4) NULL,
	[PaymentTermId] [int] NULL,
	[QuickPayFeePercent] [decimal](5, 4) NULL,
	[AutoRatingInd] [bit] NOT NULL,
 CONSTRAINT [PK_CarrierSettings] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[Insurance]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[Insurance](
	[VendorInsuranceId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Amount] [decimal](18, 0) NULL,
	[ExpirationDate] [datetime] NULL,
	[InsuranceTypeId] [smallint] NULL,
	[Attachment] [varchar](200) NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[VendorInsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[InsuranceType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[InsuranceType](
	[InsuranceTypeId] [smallint] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_InsuranceType] PRIMARY KEY CLUSTERED 
(
	[InsuranceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[Settings]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[Settings](
	[MaxAdvancePercent] [decimal](5, 4) NOT NULL,
	[DefaultAdvanceFeePercent] [decimal](5, 4) NOT NULL,
	[DefaultQuickPayFeePercent] [decimal](5, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[Vendor_Staging]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[Vendor_Staging](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[VENDOR_ID] [nvarchar](255) NULL,
	[VENDOR_NAME] [nvarchar](255) NULL,
	[ADDRESS_1] [nvarchar](255) NULL,
	[ADDRESS_2] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[ALT_VENDOR_NAME] [nvarchar](255) NULL,
	[ALT_ADDRESS_1] [nvarchar](255) NULL,
	[ALT_ADDRESS_2] [nvarchar](255) NULL,
	[ALT_CITY] [nvarchar](255) NULL,
	[ALT_STATE] [nvarchar](255) NULL,
	[ALT_ZIP] [nvarchar](255) NULL,
	[BUSINESS_PHONE] [nvarchar](255) NULL,
	[BUSINESS_PHONE_EXT] [nvarchar](255) NULL,
	[CREATED_BY] [nvarchar](255) NULL,
	[CREATED_WHEN] [datetime] NULL,
	[CARGO] [nvarchar](255) NULL,
	[CARGO_AMOUNT] [nvarchar](255) NULL,
	[CARGO_DATE] [nvarchar](255) NULL,
	[CONTACT] [nvarchar](255) NULL,
	[FEDERAL_ID] [nvarchar](255) NULL,
	[SOC_SECURITY] [nvarchar](255) NULL,
	[MC_NUMBER] [nvarchar](255) NULL,
	[LIABILITY] [nvarchar](255) NULL,
	[LIABILITY_AMT] [nvarchar](255) NULL,
	[LIABILITY_DATE] [nvarchar](255) NULL,
	[IS_ACTIVE] [bit] NOT NULL,
	[FAX_PHONE] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[NOTES] [nvarchar](255) NULL,
	[USE_ALT_PAYABLE] [bit] NOT NULL,
	[PAY_TIER] [float] NULL,
 CONSTRAINT [PK_tempVendor] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorAddress]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorAddress](
	[VendorAddressId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](10) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[AddressTypeId] [smallint] NULL,
	[UseForAcctPayableInd] [bit] NULL,
	[AlternateName] [varchar](100) NULL,
 CONSTRAINT [PK_VendorAddress] PRIMARY KEY CLUSTERED 
(
	[VendorAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorContactMapping]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorContactMapping](
	[VendorId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_VendorContactMapping] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorDocType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorDocType](
	[VendorDocTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorDocTypeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_VendorDocType] PRIMARY KEY CLUSTERED 
(
	[VendorDocTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorDocument]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorDocument](
	[VendorDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[VendorDocTypeId] [smallint] NULL,
	[DocBinary] [varbinary](max) NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[ActiveInd] [bit] NOT NULL,
 CONSTRAINT [PK_VendorDocument] PRIMARY KEY CLUSTERED 
(
	[VendorDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorExpirationDate]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorExpirationDate](
	[VendorExpirationDateTypeId] [smallint] NOT NULL,
	[VendorId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorExpirationDateTypes]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorExpirationDateTypes](
	[VendorExpirationDateTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VendorExpirationDateTypes] PRIMARY KEY CLUSTERED 
(
	[VendorExpirationDateTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorFuelSurcharge]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorFuelSurcharge](
	[VendorFuelSurchargeId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[LowerPrice] [decimal](18, 3) NULL,
	[UpperPrice] [decimal](18, 3) NULL,
	[Surcharge] [decimal](18, 3) NULL,
 CONSTRAINT [PK_VendorFuelSurcharge] PRIMARY KEY CLUSTERED 
(
	[VendorFuelSurchargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorFuelSurcharge_WeekEnding]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorFuelSurcharge_WeekEnding](
	[WeekEndingId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[WeekEndingNum] [smallint] NOT NULL,
 CONSTRAINT [PK_VendorFuelSurcharge_WeekEnding] PRIMARY KEY CLUSTERED 
(
	[WeekEndingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorMC]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorMC](
	[VendorMCId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NULL,
	[MCNumber] [int] NULL,
	[FederalId] [varchar](12) NULL,
	[SSN] [varchar](15) NULL,
	[USDOTNumber] [int] NULL,
 CONSTRAINT [PK_VendorMC] PRIMARY KEY CLUSTERED 
(
	[VendorMCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPay]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPay](
	[VendorPayId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[VendorPayCodeId] [smallint] NULL,
	[TripNumber] [varchar](15) NULL,
	[PayDescription] [nvarchar](200) NULL,
	[PayNotes] [nvarchar](max) NULL,
	[PayQuantity] [decimal](18, 2) NOT NULL,
	[PayRate] [decimal](18, 2) NOT NULL,
	[TotalPay] [decimal](18, 2) NULL,
	[PayDate] [datetime] NOT NULL,
	[EnteredByPersonId] [int] NOT NULL,
	[VendorPayTypeId] [smallint] NULL,
	[ApprovedDate] [datetime] NULL,
	[VendorPaymentStateId] [smallint] NULL,
	[InsertDate] [datetime] NULL,
	[QBMap] [nvarchar](255) NULL,
	[InterfacedQBDate] [datetime] NULL,
	[ApprovedByPersonId] [int] NULL,
	[ApprovedInd] [bit] NULL,
	[PayCode] [nvarchar](200) NULL,
	[Driver1PersonId] [int] NULL,
	[ImportErrors] [varchar](max) NULL,
	[ParentCheckGuid] [varchar](100) NULL,
	[AccChargeId] [int] NULL,
 CONSTRAINT [PK_VendorPay] PRIMARY KEY CLUSTERED 
(
	[VendorPayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPayCode]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPayCode](
	[VendorPayCodeId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorPayCode] [varchar](50) NOT NULL,
	[PayCodeDescription] [nvarchar](255) NULL,
	[PayCodeType] [nvarchar](255) NULL,
	[VendorPayTypeId] [smallint] NULL,
	[DriverType] [nvarchar](1) NULL,
	[ExpenseMap] [nvarchar](255) NULL,
	[CreatedByPersonId] [int] NULL,
 CONSTRAINT [PK_VendorPayCode] PRIMARY KEY CLUSTERED 
(
	[VendorPayCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPayMemorized]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPayMemorized](
	[VendorPayMemorizedId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[VendorPayCodeId] [smallint] NOT NULL,
	[PayNotes] [nvarchar](max) NULL,
	[PayQuantity] [decimal](18, 2) NULL,
	[PayRate] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[EnteredByPersonId] [int] NULL,
	[VendorPayTypeId] [smallint] NOT NULL,
	[ActiveInd] [bit] NOT NULL,
 CONSTRAINT [PK_VendorPayMemorized] PRIMARY KEY CLUSTERED 
(
	[VendorPayMemorizedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPayMemorized_Staging]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPayMemorized_Staging](
	[VendorID] [nvarchar](50) NOT NULL,
	[VendorPayCodeID] [int] NOT NULL,
	[PayNotes] [nvarchar](100) NULL,
	[PayQuantity] [nvarchar](50) NULL,
	[PayRate] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[EnteredbyPersonId] [int] NOT NULL,
	[VendorPayTypeID] [int] NOT NULL,
	[ActiveInd] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPayMemorizedInsertFrequencyType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPayMemorizedInsertFrequencyType](
	[InsertFrequencyTypeId] [smallint] NOT NULL,
	[InsertFrequencyType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VendorPayMemorizedInsertFrequencyType] PRIMARY KEY CLUSTERED 
(
	[InsertFrequencyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPaymentState]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPaymentState](
	[VendorPaymentStateId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorPaymentState] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VendorPaymentState] PRIMARY KEY CLUSTERED 
(
	[VendorPaymentStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPaymentTerms]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPaymentTerms](
	[VendorPaymentTermId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorPaymentTerm] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_VendorPaymentTerms] PRIMARY KEY CLUSTERED 
(
	[VendorPaymentTermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPayQBMapType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPayQBMapType](
	[VendorPayQBMapTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorPayQBMap] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_VendorPayQBMapType] PRIMARY KEY CLUSTERED 
(
	[VendorPayQBMapTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPayType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPayType](
	[VendorPayTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorPayType] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_VendorPayType] PRIMARY KEY CLUSTERED 
(
	[VendorPayTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorPhoneNumber]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorPhoneNumber](
	[VendorPhoneNumberId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[PhoneNumberTypeId] [smallint] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VendorPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[VendorPhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorRating]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorRating](
	[VendorRatingId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[VendorRatingTypeId] [smallint] NOT NULL,
	[LowerRange] [int] NOT NULL,
	[UpperRange] [int] NOT NULL,
	[Per_Mile] [decimal](3, 2) NOT NULL,
	[ActiveInd] [bit] NOT NULL,
 CONSTRAINT [PK_VendorRating] PRIMARY KEY CLUSTERED 
(
	[VendorRatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorRating_Staging]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorRating_Staging](
	[VendorId] [float] NULL,
	[VendorRatingTypeId] [float] NULL,
	[LowerRange] [float] NULL,
	[UpperRange] [float] NULL,
	[Per_Mile] [float] NULL,
	[ActiveInd] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorRatingType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorRatingType](
	[VendorRatingTypeId] [smallint] NOT NULL,
	[RatingTypeDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VendorRatingType] PRIMARY KEY CLUSTERED 
(
	[VendorRatingTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorStatusType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorStatusType](
	[VendorStatusTypeId] [smallint] NOT NULL,
	[VendorStatusDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VendorStatusType] PRIMARY KEY CLUSTERED 
(
	[VendorStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vendor].[VendorType]    Script Date: 12/11/2023 11:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorType](
	[VendorTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_VendorType] PRIMARY KEY CLUSTERED 
(
	[VendorTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dispatch].[AccCharge] ADD  CONSTRAINT [DF_AccCharge_MarkedAsCompleted]  DEFAULT ((0)) FOR [MarkedAsCompleted]
GO
ALTER TABLE [dispatch].[AccChargeType] ADD  CONSTRAINT [DF_AccChargeType_AdvanceInd]  DEFAULT ((0)) FOR [AdvanceInd]
GO
ALTER TABLE [dispatch].[DriverPay] ADD  CONSTRAINT [DF_DriverPay_ItemSettled]  DEFAULT ((0)) FOR [ItemSettled]
GO
ALTER TABLE [dispatch].[EquipmentType] ADD  CONSTRAINT [DF_EquipmentType_TemperatureRequired]  DEFAULT ((0)) FOR [TemperatureRequired]
GO
ALTER TABLE [dispatch].[LoadNotes] ADD  CONSTRAINT [DF_LoadNotes_NoteDate]  DEFAULT (getdate()) FOR [NoteDate]
GO
ALTER TABLE [dispatch].[LoadNotes] ADD  CONSTRAINT [DF_LoadNotes_NoteText]  DEFAULT ('') FOR [NoteText]
GO
ALTER TABLE [dispatch].[LoadNotes] ADD  CONSTRAINT [DF_LoadNotes_ArchivedInd]  DEFAULT ((0)) FOR [ArchivedInd]
GO
ALTER TABLE [dispatch].[LoadPlanner] ADD  CONSTRAINT [DF_LoadPlanner_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dispatch].[LoadPlanner] ADD  CONSTRAINT [DF_LoadPlanner_RateWasSent]  DEFAULT ((0)) FOR [RateWasSent]
GO
ALTER TABLE [dispatch].[LoadPlanner_Notes] ADD  CONSTRAINT [DF_LoadPlanner_Notes_NoteDate]  DEFAULT (getdate()) FOR [NoteDate]
GO
ALTER TABLE [dispatch].[LoadPlanner_Notes] ADD  CONSTRAINT [DF_LoadPlanner_Notes_NotePersonId]  DEFAULT ((0)) FOR [NotePersonId]
GO
ALTER TABLE [dispatch].[LoadPlanner_Notes] ADD  CONSTRAINT [DF_LoadPlanner_Notes_NoteText]  DEFAULT ('') FOR [NoteText]
GO
ALTER TABLE [dispatch].[LoadPlanner_Notes] ADD  CONSTRAINT [DF_LoadPlanner_Notes_ArchivedInd]  DEFAULT ((0)) FOR [ArchivedInd]
GO
ALTER TABLE [dispatch].[LoadStatus] ADD  CONSTRAINT [DF_LoadStatus_HeldForApproval]  DEFAULT ((0)) FOR [HeldForApproval]
GO
ALTER TABLE [dispatch].[LoadStatusSubType] ADD  CONSTRAINT [DF_LoadStatusSubType_TruckingInd]  DEFAULT ((1)) FOR [TruckingInd]
GO
ALTER TABLE [dispatch].[LoadStatusSubType] ADD  CONSTRAINT [DF_LoadStatusSubType_LogisticsInd]  DEFAULT ((1)) FOR [LogisticsInd]
GO
ALTER TABLE [dispatch].[LoadStatusType] ADD  CONSTRAINT [DF_LoadStatusType_Notify]  DEFAULT ((0)) FOR [Notify]
GO
ALTER TABLE [dispatch].[LoadStatusUpdate_Pending] ADD  CONSTRAINT [DF_LoadStatusUpdate_Pending_BusinessUnitId]  DEFAULT ((1)) FOR [BusinessUnitId]
GO
ALTER TABLE [dispatch].[LoadStatusUpdate_Pending] ADD  CONSTRAINT [DF_LoadStatusUpdate_Pending_OpenInd]  DEFAULT ((1)) FOR [OpenInd]
GO
ALTER TABLE [dispatch].[LoadStatusUpdate_Pending] ADD  CONSTRAINT [DF_LoadStatusUpdate_Pending_StatusDate]  DEFAULT (getdate()) FOR [StatusDate]
GO
ALTER TABLE [dispatch].[LoadStop] ADD  CONSTRAINT [DF_LoadStop_LoadTypeId]  DEFAULT ((1)) FOR [LoadTypeId]
GO
ALTER TABLE [dispatch].[LoadStopStatusType] ADD  CONSTRAINT [DF_LoadStopStatusType_StatusOrder]  DEFAULT ((99)) FOR [StatusOrder]
GO
ALTER TABLE [dispatch].[Log] ADD  CONSTRAINT [DF_Log_LoadId]  DEFAULT ((0)) FOR [LoadId]
GO
ALTER TABLE [dispatch].[Log] ADD  CONSTRAINT [DF_Log_StopId]  DEFAULT ((0)) FOR [StopId]
GO
ALTER TABLE [dispatch].[Log] ADD  CONSTRAINT [DF_Log_TripNumber]  DEFAULT ((0)) FOR [TripNumber]
GO
ALTER TABLE [dispatch].[Log] ADD  CONSTRAINT [DF_Log_CustomerLoadNumber]  DEFAULT ('') FOR [CustomerLoadNumber]
GO
ALTER TABLE [dispatch].[Log] ADD  CONSTRAINT [DF_Log_PersonId]  DEFAULT ((0)) FOR [PersonId]
GO
ALTER TABLE [dispatch].[Log] ADD  CONSTRAINT [DF_Log_ExtraInformation]  DEFAULT ('') FOR [ExtraInformation]
GO
ALTER TABLE [dispatch].[Log] ADD  CONSTRAINT [DF_Log_TenderId]  DEFAULT ((0)) FOR [TenderId]
GO
ALTER TABLE [edi].[Control] ADD  CONSTRAINT [DF_Control_ControlNumberPrefix]  DEFAULT ((1)) FOR [ControlNumberPrefix]
GO
ALTER TABLE [edi].[Incoming] ADD  CONSTRAINT [DF_Incoming_DateReceived]  DEFAULT (getdate()) FOR [DateReceived]
GO
ALTER TABLE [edi].[Incoming] ADD  CONSTRAINT [DF_Incoming_StatusId]  DEFAULT ('O') FOR [StatusId]
GO
ALTER TABLE [edi].[Incoming] ADD  CONSTRAINT [DF_Incoming_UsageIndicator]  DEFAULT ('P') FOR [UsageIndicator]
GO
ALTER TABLE [edi].[Incoming] ADD  CONSTRAINT [DF_Incoming_Mode]  DEFAULT ('P') FOR [Mode]
GO
ALTER TABLE [edi].[LoadTenders] ADD  CONSTRAINT [DF_LoadTenders_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [edi].[LoadTenders] ADD  CONSTRAINT [DF_LoadTenders_Status]  DEFAULT ('O') FOR [StatusId]
GO
ALTER TABLE [edi].[LoadTenders] ADD  CONSTRAINT [DF_LoadTenders_UsageIndicator]  DEFAULT ('P') FOR [UsageIndicator]
GO
ALTER TABLE [edi].[Outgoing] ADD  CONSTRAINT [DF_Outgoing_DateSent]  DEFAULT (getdate()) FOR [DateSent]
GO
ALTER TABLE [edi].[Outgoing] ADD  CONSTRAINT [DF_Outgoing_Accept]  DEFAULT ((1)) FOR [Accept]
GO
ALTER TABLE [edi].[Outgoing] ADD  CONSTRAINT [DF_Outgoing_StatusId]  DEFAULT ('O') FOR [StatusId]
GO
ALTER TABLE [edi].[Outgoing] ADD  CONSTRAINT [DF_Outgoing_Mode]  DEFAULT ('P') FOR [Mode]
GO
ALTER TABLE [edi].[Outgoing_214] ADD  CONSTRAINT [DF_Outgoing_214_DateSent]  DEFAULT (getdate()) FOR [DateSent]
GO
ALTER TABLE [edi].[Outgoing_214] ADD  CONSTRAINT [DF_Outgoing_214_StatusId]  DEFAULT ('O') FOR [StatusId]
GO
ALTER TABLE [edi].[Outgoing_214] ADD  CONSTRAINT [DF_Outgoing_214_PurposeCode]  DEFAULT ('SU') FOR [PurposeCode]
GO
ALTER TABLE [edi].[Outgoing_990] ADD  CONSTRAINT [DF_Outgoing_990_DateSent]  DEFAULT (getdate()) FOR [DateSent]
GO
ALTER TABLE [edi].[Outgoing_990] ADD  CONSTRAINT [DF_Outgoing_990_Accept]  DEFAULT ((1)) FOR [Accept]
GO
ALTER TABLE [edi].[Outgoing_990] ADD  CONSTRAINT [DF_Outgoing_990_PurposeCode]  DEFAULT ('11') FOR [PurposeCode]
GO
ALTER TABLE [edi].[Outgoing_990] ADD  CONSTRAINT [DF_Outgoing_990_StatusId]  DEFAULT ('O') FOR [StatusId]
GO
ALTER TABLE [edi].[Outgoing_990] ADD  CONSTRAINT [DF_Outgoing_990_Mode]  DEFAULT ('P') FOR [Mode]
GO
ALTER TABLE [edi].[Partners] ADD  CONSTRAINT [DF_Partners_Mode]  DEFAULT ('P') FOR [Mode]
GO
ALTER TABLE [edi].[X12_204] ADD  CONSTRAINT [DF_X12_204_DateReceived]  DEFAULT (getdate()) FOR [DateReceived]
GO
ALTER TABLE [edi].[X12_204] ADD  CONSTRAINT [DF_X12_204_Processed]  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [equipment].[PUnit] ADD  CONSTRAINT [DF_PUnit_PUnitModelId]  DEFAULT ((0)) FOR [PUnitMakeModelId]
GO
ALTER TABLE [equipment].[PUnit] ADD  CONSTRAINT [DF_PUnit_ActiveInd]  DEFAULT ((0)) FOR [ActiveInd]
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping] ADD  CONSTRAINT [DF_RegistrationMapping_ExpirationDate]  DEFAULT ('2099-12-31') FOR [ExpirationDate]
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping] ADD  CONSTRAINT [DF_GetDate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [equipment].[PUnitRegistrationType] ADD  CONSTRAINT [DF_PUnitRegistrationType_AttachReqd]  DEFAULT ((0)) FOR [AttachReqd]
GO
ALTER TABLE [factoring].[PlanDetail] ADD  CONSTRAINT [DF_PlanDetail_PlanFieldNullable]  DEFAULT ((0)) FOR [FeePct]
GO
ALTER TABLE [factoring].[PlanDetail] ADD  CONSTRAINT [DF_PlanDetail_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [factoring].[PlanDetail] ADD  CONSTRAINT [DF_PlanDetail_Active_1]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [factoring].[PlanFields] ADD  CONSTRAINT [DF_PlanFields_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [factoring].[PlanFields] ADD  CONSTRAINT [DF_PlanFields_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [factoring].[Plans] ADD  CONSTRAINT [DF_factoring.Plans_Active]  DEFAULT ((0)) FOR [Locked]
GO
ALTER TABLE [factoring].[Plans] ADD  CONSTRAINT [DF_Plans_InitialARTotal]  DEFAULT ((0)) FOR [InitialARTotal]
GO
ALTER TABLE [factoring].[PlanType] ADD  CONSTRAINT [DF_factoring.PlanType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [factoring].[Settings] ADD  CONSTRAINT [DF_Settings_Id]  DEFAULT ((1)) FOR [PlanTypeId]
GO
ALTER TABLE [factoring].[Settings] ADD  CONSTRAINT [DF_Settings_ACHFee]  DEFAULT ((0)) FOR [ACHFee]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_FactoringDebtorId]  DEFAULT ((0)) FOR [FactoringDebtorId]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_InvoiceNumber]  DEFAULT ('') FOR [InvoiceNumber]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_CurrentFee]  DEFAULT ((0)) FOR [CurrentFee]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_CurrentFeePct]  DEFAULT ((0)) FOR [CurrentFeePct]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_CurrentReserveFee]  DEFAULT ((0)) FOR [CurrentReserveFee]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_ReserveTotal]  DEFAULT ((0)) FOR [ReserveTotal]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_CurrentReservePct]  DEFAULT ((0)) FOR [CurrentReservePct]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_AdvancedAmount]  DEFAULT ((0)) FOR [AdvancedAmount]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_InvoicePaymentBatchNumber]  DEFAULT ('') FOR [AdvancePaymentBatchNumber]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_factoring.Transactions_InvoiceReceiptVerified]  DEFAULT ((0)) FOR [InvoiceReceiptVerified]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_ReceivedPayment]  DEFAULT ((0)) FOR [PaymentReceived]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_PaymentAmount]  DEFAULT ((0)) FOR [PaymentAmount]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_PaymentDifference]  DEFAULT ((0)) FOR [PaymentDifference]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_RebatePercentage]  DEFAULT ((0)) FOR [DisbursedPercentage]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_RebateAmount]  DEFAULT ((0)) FOR [DisbursedAmount]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_Notes]  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_TransactionTypeId]  DEFAULT ((1)) FOR [TransactionTypeId]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_DisbursedPaymentBatchNumber]  DEFAULT ('') FOR [DisbursedPaymentBatchNumber]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_Disburse]  DEFAULT ((0)) FOR [Disburse]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_SentToQB]  DEFAULT ((0)) FOR [SentToQB]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_CheckSentToQB]  DEFAULT ((0)) FOR [AdvanceCheckSentToQB]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_InvoiceSentToQB]  DEFAULT ((0)) FOR [AdvanceInvoiceSentToQB]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_Adjusted]  DEFAULT ((0)) FOR [Reversed]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_DisbursementCheckSentToQB]  DEFAULT ((0)) FOR [DisbursementCheckSentToQB]
GO
ALTER TABLE [factoring].[Transactions] ADD  CONSTRAINT [DF_Transactions_WithdrawalCheckSentToQB]  DEFAULT ((0)) FOR [WithdrawalCheckSentToQB]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_FactoringDebtorId]  DEFAULT ((0)) FOR [FactoringDebtorId]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_InvoiceNumber]  DEFAULT ('') FOR [InvoiceNumber]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_CurrentFee]  DEFAULT ((0)) FOR [CurrentFee]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_CurrentFeePct]  DEFAULT ((0)) FOR [CurrentFeePct]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_CurrentReserveFee]  DEFAULT ((0)) FOR [CurrentReserveFee]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_ReserveTotal]  DEFAULT ((0)) FOR [ReserveTotal]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_CurrentReservePct]  DEFAULT ((0)) FOR [CurrentReservePct]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_AdvancedAmount]  DEFAULT ((0)) FOR [AdvancedAmount]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_InvoicePaymentBatchNumber]  DEFAULT ('') FOR [AdvancePaymentBatchNumber]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_factoring.Transactions2_InvoiceReceiptVerified]  DEFAULT ((0)) FOR [InvoiceReceiptVerified]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_ReceivedPayment]  DEFAULT ((0)) FOR [PaymentReceived]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_PaymentAmount]  DEFAULT ((0)) FOR [PaymentAmount]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_PaymentDifference]  DEFAULT ((0)) FOR [PaymentDifference]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_RebatePercentage]  DEFAULT ((0)) FOR [DisbursedPercentage]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_RebateAmount]  DEFAULT ((0)) FOR [DisbursedAmount]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_Notes]  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_TransactionTypeId]  DEFAULT ((1)) FOR [TransactionTypeId]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_DisbursedPaymentBatchNumber]  DEFAULT ('') FOR [DisbursedPaymentBatchNumber]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_Disburse]  DEFAULT ((0)) FOR [Disburse]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_SentToQB]  DEFAULT ((0)) FOR [SentToQB]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_CheckSentToQB]  DEFAULT ((0)) FOR [CheckSentToQB]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_InvoiceSentToQB]  DEFAULT ((0)) FOR [InvoiceSentToQB]
GO
ALTER TABLE [factoring].[Transactions2] ADD  CONSTRAINT [DF_Transactions2_Adjusted]  DEFAULT ((0)) FOR [Reversed]
GO
ALTER TABLE [feeds].[Omnitracs_Control] ADD  CONSTRAINT [DF_Omnitracs_Control_LastTransactionId]  DEFAULT ((0)) FOR [ESSLastTransactionId]
GO
ALTER TABLE [feeds].[Omnitracs_Control] ADD  CONSTRAINT [DF_Omnitracs_Control_HOSLastLogId]  DEFAULT ((0)) FOR [HOSLastLogId]
GO
ALTER TABLE [logistics].[Load] ADD  CONSTRAINT [DF_Load_QBClientInvoiceSent]  DEFAULT ((0)) FOR [QBClientInvoiceSent]
GO
ALTER TABLE [logistics].[Load] ADD  CONSTRAINT [DF_Load_QBCarrierBillSent]  DEFAULT ((0)) FOR [QBCarrierBillSent]
GO
ALTER TABLE [logistics].[Load] ADD  CONSTRAINT [DF_Load_QBAdvanceCheckSent]  DEFAULT ((0)) FOR [QBAdvanceCheckSent]
GO
ALTER TABLE [logistics].[Load] ADD  CONSTRAINT [DF_Load_CarrierAutoRatingInd]  DEFAULT ((0)) FOR [CarrierAutoRatingInd]
GO
ALTER TABLE [logistics].[LoadNotes] ADD  CONSTRAINT [DF_Logistics_LoadNotes_NoteDate]  DEFAULT (getdate()) FOR [NoteDate]
GO
ALTER TABLE [logistics].[LoadNotes] ADD  CONSTRAINT [DF_Logistics_LoadNotes_NoteText]  DEFAULT ('') FOR [NoteText]
GO
ALTER TABLE [logistics].[LoadNotes] ADD  CONSTRAINT [DF_Logistics_LoadNotes_ArchivedInd]  DEFAULT ((0)) FOR [ArchivedInd]
GO
ALTER TABLE [logistics].[LoadStatus] ADD  CONSTRAINT [DF_LoadStatus_StatusTs]  DEFAULT (getdate()) FOR [StatusTs]
GO
ALTER TABLE [logistics].[LoadStatusUpdate_Pending] ADD  CONSTRAINT [DF_LoadStatusUpdate_Pending_BusinessUnitId]  DEFAULT ((2)) FOR [BusinessUnitId]
GO
ALTER TABLE [logistics].[LoadStatusUpdate_Pending] ADD  CONSTRAINT [DF_Logistics_LoadStatusUpdate_Pending_OpenInd]  DEFAULT ((1)) FOR [OpenInd]
GO
ALTER TABLE [logistics].[LoadStatusUpdate_Pending] ADD  CONSTRAINT [DF_Logistics_LoadStatusUpdate_Pending_StatusDate]  DEFAULT (getdate()) FOR [StatusDate]
GO
ALTER TABLE [logistics].[LoadStop] ADD  CONSTRAINT [DF_LoadStop_LoadTypeId]  DEFAULT ((1)) FOR [LoadTypeId]
GO
ALTER TABLE [main].[AddressType] ADD  CONSTRAINT [DF_AddressType_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [main].[AppNotification] ADD  CONSTRAINT [DF_AppNotification_CallbackAddress]  DEFAULT ('') FOR [CallbackAddress]
GO
ALTER TABLE [main].[AppNotification] ADD  CONSTRAINT [DF_AppNotification_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [main].[Client] ADD  CONSTRAINT [DF_Client_FactoringInd]  DEFAULT ((0)) FOR [FactoringInd]
GO
ALTER TABLE [main].[Client] ADD  CONSTRAINT [DF_Client_FactoringDebtorInd]  DEFAULT ((0)) FOR [FactoringDebtorInd]
GO
ALTER TABLE [main].[Client] ADD  CONSTRAINT [DF_Client_FactoringDebtorEmailAddress]  DEFAULT ('') FOR [FactoringDebtorEmailAddress]
GO
ALTER TABLE [main].[Client] ADD  CONSTRAINT [DF_Client_FactoringemailAddress]  DEFAULT ('') FOR [FactoringEmailAddress]
GO
ALTER TABLE [main].[Client] ADD  CONSTRAINT [DF_Client_DieselClientInd]  DEFAULT ((0)) FOR [DieselClientInd]
GO
ALTER TABLE [main].[Client] ADD  CONSTRAINT [DF_Client_AssignToPunitInd]  DEFAULT ((0)) FOR [AssignToPunitInd]
GO
ALTER TABLE [main].[Client] ADD  CONSTRAINT [DF_Client_EdiInd]  DEFAULT ((0)) FOR [EdiInd]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_PickupArrivalThreshold]  DEFAULT ((0)) FOR [PickupEarlyArrivalThreshold]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_PickupDepartureThreshold]  DEFAULT ((0)) FOR [PickupEarlyDepartureThreshold]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_DropArrivalThreshold]  DEFAULT ((0)) FOR [DropEarlyArrivalThreshold]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_DropDepartureThreshold]  DEFAULT ((0)) FOR [DropEarlyDepartureThreshold]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_PickupLateArrivalThreshold]  DEFAULT ((0)) FOR [PickupLateArrivalThreshold]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_PickupLateDepartureThreshold]  DEFAULT ((0)) FOR [PickupLateDepartureThreshold]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_DropLateArrivalThreshold]  DEFAULT ((0)) FOR [DropLateArrivalThreshold]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] ADD  CONSTRAINT [DF_ClientEdi_StatusSettings_DropLateDepartureThreshold]  DEFAULT ((0)) FOR [DropLateDepartureThreshold]
GO
ALTER TABLE [main].[ClientFuel] ADD  CONSTRAINT [DF_ClientFuel_ReeferAllow]  DEFAULT ((1)) FOR [ReeferAllow]
GO
ALTER TABLE [main].[ClientFuel] ADD  CONSTRAINT [DF_ClientFuel_BillingAllow]  DEFAULT ((1)) FOR [BillingAllow]
GO
ALTER TABLE [main].[EmploymentHistoryRequest] ADD  CONSTRAINT [DF_EmploymentHistoryRequest_Complete]  DEFAULT ((0)) FOR [Complete]
GO
ALTER TABLE [main].[EmploymentHistoryRequest] ADD  CONSTRAINT [DF_EmploymentHistoryRequest_Approved]  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [main].[EmploymentHistoryRequest] ADD  CONSTRAINT [DF_EmploymentHistoryRequest_Denied]  DEFAULT ((0)) FOR [Denied]
GO
ALTER TABLE [main].[EmploymentHistoryRequest] ADD  CONSTRAINT [DF_EmploymentHistoryRequest_AccessCount]  DEFAULT ((0)) FOR [AccessCount]
GO
ALTER TABLE [main].[FundingType] ADD  CONSTRAINT [DF_FundingType_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [main].[PersonEmploymentHistory] ADD  CONSTRAINT [DF_PersonEmploymentHistory_OneTime]  DEFAULT ((0)) FOR [OneTime]
GO
ALTER TABLE [main].[PersonPay] ADD  CONSTRAINT [DF_GetDate]  DEFAULT (getdate()) FOR [EnteredDate]
GO
ALTER TABLE [main].[PersonPay] ADD  CONSTRAINT [DF_PersonPay_DefaultPayId]  DEFAULT ((0)) FOR [DefaultPayId]
GO
ALTER TABLE [main].[PersonPay] ADD  CONSTRAINT [DF_PersonPay_PayRateEndDate]  DEFAULT ('2099-12-31') FOR [PayRateEndDate]
GO
ALTER TABLE [main].[PersonPayMaster] ADD  CONSTRAINT [DF_GetDatePayMaster]  DEFAULT (getdate()) FOR [EnteredDate]
GO
ALTER TABLE [main].[PersonPayMaster] ADD  CONSTRAINT [DF_PersonPayMaster_PayRateEndDate]  DEFAULT ('2099-12-31') FOR [PayRateEndDate]
GO
ALTER TABLE [main].[PersonPreference] ADD  CONSTRAINT [DF_PersonPreference_Settings]  DEFAULT ('') FOR [Setting]
GO
ALTER TABLE [main].[PersonQuitList] ADD  DEFAULT ((0)) FOR [Complete]
GO
ALTER TABLE [main].[PersonQuitListType] ADD  CONSTRAINT [DF_PersonQuitListType_HRType]  DEFAULT ((0)) FOR [HRType]
GO
ALTER TABLE [main].[State] ADD  CONSTRAINT [DF_State_RegionId]  DEFAULT ((1)) FOR [RegionId]
GO
ALTER TABLE [main].[SubmitType] ADD  CONSTRAINT [DF_SubmitType_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [main].[TimeClockEntry] ADD  CONSTRAINT [DF_TimeClockEntry_LunchAdj]  DEFAULT ((0)) FOR [LunchAdj]
GO
ALTER TABLE [recruiting].[BackgroundCheckStatus] ADD  CONSTRAINT [DF_BackgroundCheckStatus_Code]  DEFAULT ((0)) FOR [Code]
GO
ALTER TABLE [recruiting].[ExternalMessageMergeField] ADD  CONSTRAINT [DF_ExternalMessageMergeField_computed]  DEFAULT ((0)) FOR [Computed]
GO
ALTER TABLE [recruiting].[Profile] ADD  CONSTRAINT [DF_Profile_LeadSourceId]  DEFAULT ((1)) FOR [LeadSourceId]
GO
ALTER TABLE [recruiting].[Profile] ADD  CONSTRAINT [DF_Profile_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [recruiting].[Profile] ADD  CONSTRAINT [DF_Profile_Hired]  DEFAULT ((0)) FOR [Hired]
GO
ALTER TABLE [recruiting].[Profile] ADD  CONSTRAINT [DF_Profile_Confidence]  DEFAULT ((0)) FOR [Confidence]
GO
ALTER TABLE [recruiting].[Profile] ADD  CONSTRAINT [DF_Profile_ExternalComplete]  DEFAULT ((0)) FOR [ExternalComplete]
GO
ALTER TABLE [recruiting].[ProfileCode] ADD  CONSTRAINT [DF_ProfileCode_ProfileCodeId]  DEFAULT (newid()) FOR [ProfileCodeId]
GO
ALTER TABLE [recruiting].[ProfileCode] ADD  CONSTRAINT [DF_ProfileCode_Expiration]  DEFAULT (dateadd(month,(6),getdate())) FOR [Expiration]
GO
ALTER TABLE [recruiting].[QuickApp] ADD  CONSTRAINT [DF_QuickApp_Converted]  DEFAULT ((0)) FOR [Converted]
GO
ALTER TABLE [Service].[ItemAssemblyDetail] ADD  CONSTRAINT [DF_ItemAssembly_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [Service].[OrderNotes] ADD  CONSTRAINT [DF_OrderNotes_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [Service].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_QCRequired]  DEFAULT ((1)) FOR [QCRequired]
GO
ALTER TABLE [Vendor].[Carrier] ADD  CONSTRAINT [DF_Carrier_VendorStatusTypeId]  DEFAULT ((1)) FOR [VendorStatusTypeId]
GO
ALTER TABLE [Vendor].[CarrierSettings] ADD  CONSTRAINT [DF_CarrierSettings_AdvanceFeePercent]  DEFAULT ((0)) FOR [AdvanceFeePercent]
GO
ALTER TABLE [Vendor].[CarrierSettings] ADD  CONSTRAINT [DF_CarrierSettings_AutoRatingInd]  DEFAULT ((0)) FOR [AutoRatingInd]
GO
ALTER TABLE [dbo].[LoadStopDriver]  WITH CHECK ADD  CONSTRAINT [FK_LoadStopDriver_Person] FOREIGN KEY([Driver1_PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[LoadStopDriver] CHECK CONSTRAINT [FK_LoadStopDriver_Person]
GO
ALTER TABLE [dbo].[LoadStopDriver]  WITH CHECK ADD  CONSTRAINT [FK_LoadStopDriver_Person1] FOREIGN KEY([Driver2_PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[LoadStopDriver] CHECK CONSTRAINT [FK_LoadStopDriver_Person1]
GO
ALTER TABLE [dbo].[ProfilePhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProfilePhoneNumber_PhoneNumberType] FOREIGN KEY([PhoneNumberTypeId])
REFERENCES [main].[PhoneNumberType] ([PhoneNumberTypeId])
GO
ALTER TABLE [dbo].[ProfilePhoneNumber] CHECK CONSTRAINT [FK_ProfilePhoneNumber_PhoneNumberType]
GO
ALTER TABLE [dbo].[VerificationRequestToCommercialEquipmentType]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_CommercialEquipmentType] FOREIGN KEY([CommercialEquipmentTypeId])
REFERENCES [recruiting].[CommercialEquipmentType] ([CommercialEquipmentTypeId])
GO
ALTER TABLE [dbo].[VerificationRequestToCommercialEquipmentType] CHECK CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_CommercialEquipmentType]
GO
ALTER TABLE [dbo].[VerificationRequestToCommercialEquipmentType]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_VerificationRequest] FOREIGN KEY([VerificationRequestId])
REFERENCES [recruiting].[VerificationRequest] ([VerificationRequestId])
GO
ALTER TABLE [dbo].[VerificationRequestToCommercialEquipmentType] CHECK CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_VerificationRequest]
GO
ALTER TABLE [dispatch].[AccCharge]  WITH CHECK ADD  CONSTRAINT [FK_AccCharge_AccChargeType] FOREIGN KEY([AccChargeTypeId])
REFERENCES [dispatch].[AccChargeType] ([AccChargeTypeId])
GO
ALTER TABLE [dispatch].[AccCharge] CHECK CONSTRAINT [FK_AccCharge_AccChargeType]
GO
ALTER TABLE [dispatch].[AccCharge]  WITH CHECK ADD  CONSTRAINT [FK_AccCharge_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [dispatch].[AccCharge] CHECK CONSTRAINT [FK_AccCharge_Load]
GO
ALTER TABLE [dispatch].[AccChargeTypePayCodeMapping]  WITH CHECK ADD  CONSTRAINT [FK_AccChargeTypePayCodeMapping_AccChargeType] FOREIGN KEY([AccChargeTypeId])
REFERENCES [dispatch].[AccChargeType] ([AccChargeTypeId])
GO
ALTER TABLE [dispatch].[AccChargeTypePayCodeMapping] CHECK CONSTRAINT [FK_AccChargeTypePayCodeMapping_AccChargeType]
GO
ALTER TABLE [dispatch].[AccChargeTypePayCodeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_AccChargeTypePayCodeMapping_PayCode] FOREIGN KEY([PayCodeId])
REFERENCES [dispatch].[PayCode] ([PayCodeId])
GO
ALTER TABLE [dispatch].[AccChargeTypePayCodeMapping] CHECK CONSTRAINT [FK_AccChargeTypePayCodeMapping_PayCode]
GO
ALTER TABLE [dispatch].[AccChargeTypePayCodeMapping]  WITH NOCHECK ADD  CONSTRAINT [FK_AccChargeTypePayCodeMapping_VendorPayCode] FOREIGN KEY([VendorPayCodeId])
REFERENCES [Vendor].[VendorPayCode] ([VendorPayCodeId])
GO
ALTER TABLE [dispatch].[AccChargeTypePayCodeMapping] CHECK CONSTRAINT [FK_AccChargeTypePayCodeMapping_VendorPayCode]
GO
ALTER TABLE [dispatch].[AutoRatingACC]  WITH CHECK ADD  CONSTRAINT [FK_AutoRatingACC_AccChargeType] FOREIGN KEY([AccChargeTypeId])
REFERENCES [dispatch].[AccChargeType] ([AccChargeTypeId])
GO
ALTER TABLE [dispatch].[AutoRatingACC] CHECK CONSTRAINT [FK_AutoRatingACC_AccChargeType]
GO
ALTER TABLE [dispatch].[AutoRatingACC]  WITH CHECK ADD  CONSTRAINT [FK_AutoRatingACC_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [dispatch].[AutoRatingACC] CHECK CONSTRAINT [FK_AutoRatingACC_Client]
GO
ALTER TABLE [dispatch].[AutoRatingDetail]  WITH CHECK ADD  CONSTRAINT [FK_AutoRatingDetail_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [dispatch].[AutoRatingDetail] CHECK CONSTRAINT [FK_AutoRatingDetail_Client]
GO
ALTER TABLE [dispatch].[AutoRatingDetail]  WITH CHECK ADD  CONSTRAINT [FK_AutoRatingDetail_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dispatch].[CommodityType] ([CommodityTypeId])
GO
ALTER TABLE [dispatch].[AutoRatingDetail] CHECK CONSTRAINT [FK_AutoRatingDetail_CommodityType]
GO
ALTER TABLE [dispatch].[DivisionGoal]  WITH CHECK ADD  CONSTRAINT [FK_DivisionGoal_DivisionDescriptionType] FOREIGN KEY([DivisionDescriptionTypeId])
REFERENCES [dispatch].[DivisionDescriptionType] ([DivisionDescriptionTypeId])
GO
ALTER TABLE [dispatch].[DivisionGoal] CHECK CONSTRAINT [FK_DivisionGoal_DivisionDescriptionType]
GO
ALTER TABLE [dispatch].[DriverPay]  WITH CHECK ADD  CONSTRAINT [FK_DriverPay_PayCode] FOREIGN KEY([PayCodeId])
REFERENCES [dispatch].[PayCode] ([PayCodeId])
GO
ALTER TABLE [dispatch].[DriverPay] CHECK CONSTRAINT [FK_DriverPay_PayCode]
GO
ALTER TABLE [dispatch].[DriverPay]  WITH CHECK ADD  CONSTRAINT [FK_DriverPay_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[DriverPay] CHECK CONSTRAINT [FK_DriverPay_Person]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Client]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dispatch].[CommodityType] ([CommodityTypeId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_CommodityType]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_LoadStatusType] FOREIGN KEY([LoadStatusTypeId])
REFERENCES [dispatch].[LoadStatusType] ([LoadStatusTypeId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_LoadStatusType]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Person] FOREIGN KEY([DispatcherPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Person]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Person1] FOREIGN KEY([LoadPlannerPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Person1]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Person2] FOREIGN KEY([LockedPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Person2]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Person3] FOREIGN KEY([LockedPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Person3]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Punit] FOREIGN KEY([TruckPunitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Punit]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_TemperatureType] FOREIGN KEY([TemperatureTypeId])
REFERENCES [dispatch].[TemperatureType] ([TemperatureTypeId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_TemperatureType]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Trailer] FOREIGN KEY([Trailer1_TrailerId])
REFERENCES [dispatch].[Trailer] ([TrailerId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Trailer]
GO
ALTER TABLE [dispatch].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Trailer1] FOREIGN KEY([Trailer2_TrailerId])
REFERENCES [dispatch].[Trailer] ([TrailerId])
GO
ALTER TABLE [dispatch].[Load] CHECK CONSTRAINT [FK_Load_Trailer1]
GO
ALTER TABLE [dispatch].[LoadBilling]  WITH CHECK ADD  CONSTRAINT [FK_LoadBilling_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [dispatch].[LoadBilling] CHECK CONSTRAINT [FK_LoadBilling_Load]
GO
ALTER TABLE [dispatch].[LoadFile]  WITH CHECK ADD  CONSTRAINT [FK_LoadFile_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [dispatch].[LoadFile] CHECK CONSTRAINT [FK_LoadFile_Load]
GO
ALTER TABLE [dispatch].[LoadFile]  WITH CHECK ADD  CONSTRAINT [FK_LoadFile_LoadFileType] FOREIGN KEY([LoadFileTypeId])
REFERENCES [dispatch].[LoadFileType] ([LoadFileTypeId])
GO
ALTER TABLE [dispatch].[LoadFile] CHECK CONSTRAINT [FK_LoadFile_LoadFileType]
GO
ALTER TABLE [dispatch].[LoadFile]  WITH CHECK ADD  CONSTRAINT [FK_LoadFile_Person] FOREIGN KEY([AddedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[LoadFile] CHECK CONSTRAINT [FK_LoadFile_Person]
GO
ALTER TABLE [dispatch].[LoadNotes]  WITH CHECK ADD  CONSTRAINT [FK_LoadNotes_NoteType] FOREIGN KEY([NoteTypeId])
REFERENCES [dispatch].[NoteType] ([NoteTypeId])
GO
ALTER TABLE [dispatch].[LoadNotes] CHECK CONSTRAINT [FK_LoadNotes_NoteType]
GO
ALTER TABLE [dispatch].[LoadPlanner]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_BusinessUnit] FOREIGN KEY([BusinessUnitId])
REFERENCES [dispatch].[BusinessUnit] ([Id])
GO
ALTER TABLE [dispatch].[LoadPlanner] CHECK CONSTRAINT [FK_LoadPlanner_BusinessUnit]
GO
ALTER TABLE [dispatch].[LoadPlanner]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_LoadPlanner] FOREIGN KEY([TenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [dispatch].[LoadPlanner] CHECK CONSTRAINT [FK_LoadPlanner_LoadPlanner]
GO
ALTER TABLE [dispatch].[LoadPlanner]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_Person] FOREIGN KEY([PlannerPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[LoadPlanner] CHECK CONSTRAINT [FK_LoadPlanner_Person]
GO
ALTER TABLE [dispatch].[LoadPlanner_Notes]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_Notes_NoteType] FOREIGN KEY([NoteTypeId])
REFERENCES [dispatch].[NoteType] ([NoteTypeId])
GO
ALTER TABLE [dispatch].[LoadPlanner_Notes] CHECK CONSTRAINT [FK_LoadPlanner_Notes_NoteType]
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_Stops_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops] CHECK CONSTRAINT [FK_LoadPlanner_Stops_Client]
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_Stops_GasStation] FOREIGN KEY([GasStationId])
REFERENCES [dispatch].[GasStation] ([GasStationId])
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops] CHECK CONSTRAINT [FK_LoadPlanner_Stops_GasStation]
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_Stops_LoadPlanner] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[LoadPlanner] ([LoadId])
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops] CHECK CONSTRAINT [FK_LoadPlanner_Stops_LoadPlanner]
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops]  WITH CHECK ADD  CONSTRAINT [FK_LoadPlanner_Stops_LoadStopType] FOREIGN KEY([LoadStopTypeId])
REFERENCES [dispatch].[LoadStopType] ([LoadStopTypeId])
GO
ALTER TABLE [dispatch].[LoadPlanner_Stops] CHECK CONSTRAINT [FK_LoadPlanner_Stops_LoadStopType]
GO
ALTER TABLE [dispatch].[LoadStatus]  WITH CHECK ADD  CONSTRAINT [FK_LoadStatus_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [dispatch].[LoadStatus] CHECK CONSTRAINT [FK_LoadStatus_Load]
GO
ALTER TABLE [dispatch].[LoadStatus]  WITH CHECK ADD  CONSTRAINT [FK_LoadStatus_LoadStatusType] FOREIGN KEY([LoadStatusTypeId])
REFERENCES [dispatch].[LoadStatusType] ([LoadStatusTypeId])
GO
ALTER TABLE [dispatch].[LoadStatus] CHECK CONSTRAINT [FK_LoadStatus_LoadStatusType]
GO
ALTER TABLE [dispatch].[LoadStatusSubType]  WITH CHECK ADD  CONSTRAINT [FK_LoadStatusSubType_LoadStatusType] FOREIGN KEY([LoadStatusTypeId])
REFERENCES [dispatch].[LoadStatusType] ([LoadStatusTypeId])
GO
ALTER TABLE [dispatch].[LoadStatusSubType] CHECK CONSTRAINT [FK_LoadStatusSubType_LoadStatusType]
GO
ALTER TABLE [dispatch].[LoadStatusUpdate_Pending]  WITH CHECK ADD  CONSTRAINT [FK_LoadStatusUpdate_Pending_BusinessUnit] FOREIGN KEY([BusinessUnitId])
REFERENCES [dispatch].[BusinessUnit] ([Id])
GO
ALTER TABLE [dispatch].[LoadStatusUpdate_Pending] CHECK CONSTRAINT [FK_LoadStatusUpdate_Pending_BusinessUnit]
GO
ALTER TABLE [dispatch].[LoadStatusUpdate_Pending]  WITH CHECK ADD  CONSTRAINT [FK_LoadStatusUpdate_Pending_LoadStop] FOREIGN KEY([LoadStopId])
REFERENCES [dispatch].[LoadStop] ([LoadStopId])
GO
ALTER TABLE [dispatch].[LoadStatusUpdate_Pending] CHECK CONSTRAINT [FK_LoadStatusUpdate_Pending_LoadStop]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Client]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_EquipmentType] FOREIGN KEY([EquipmentTypeId])
REFERENCES [dispatch].[EquipmentType] ([EquipmentTypeId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_EquipmentType]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_GasStation] FOREIGN KEY([GasStationId])
REFERENCES [dispatch].[GasStation] ([GasStationId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_GasStation]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Load]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_LoadApptType] FOREIGN KEY([LoadApptTypeId])
REFERENCES [dispatch].[LoadApptType] ([LoadApptTypeId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_LoadApptType]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_LoadStopType] FOREIGN KEY([LoadStopTypeId])
REFERENCES [dispatch].[LoadStopType] ([LoadStopTypeId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_LoadStopType]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Person] FOREIGN KEY([Driver1_PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Person]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Person1] FOREIGN KEY([Driver2_PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Person1]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Punit] FOREIGN KEY([TruckPunitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Punit]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Trailer] FOREIGN KEY([Trailer1_TrailerId])
REFERENCES [dispatch].[Trailer] ([TrailerId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Trailer]
GO
ALTER TABLE [dispatch].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Trailer1] FOREIGN KEY([Trailer2_TrailerId])
REFERENCES [dispatch].[Trailer] ([TrailerId])
GO
ALTER TABLE [dispatch].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Trailer1]
GO
ALTER TABLE [dispatch].[LoadStop_ReferenceNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_ReferenceNumbers_LoadStop_ReferenceNumbers] FOREIGN KEY([LoadId], [LoadStopId], [ReferenceIdentificationQualifierCode])
REFERENCES [dispatch].[LoadStop_ReferenceNumbers] ([LoadId], [LoadStopId], [ReferenceIdentificationQualifierCode])
GO
ALTER TABLE [dispatch].[LoadStop_ReferenceNumbers] CHECK CONSTRAINT [FK_LoadStop_ReferenceNumbers_LoadStop_ReferenceNumbers]
GO
ALTER TABLE [dispatch].[LoadStop_ReferenceNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_ReferenceNumbers_ReferenceIdentificationQualifier] FOREIGN KEY([ReferenceIdentificationQualifierCode])
REFERENCES [edi].[ReferenceIdentificationQualifier] ([ReferenceIdentificationQualifierCode])
GO
ALTER TABLE [dispatch].[LoadStop_ReferenceNumbers] CHECK CONSTRAINT [FK_LoadStop_ReferenceNumbers_ReferenceIdentificationQualifier]
GO
ALTER TABLE [dispatch].[LoadStopStatusType]  WITH CHECK ADD  CONSTRAINT [FK_LoadStopStatusType_ShipmentStatusCode] FOREIGN KEY([EdiShipmentStatusCode])
REFERENCES [edi].[ShipmentStatusCode] ([Id])
GO
ALTER TABLE [dispatch].[LoadStopStatusType] CHECK CONSTRAINT [FK_LoadStopStatusType_ShipmentStatusCode]
GO
ALTER TABLE [dispatch].[LoadToLoadStatusSubType]  WITH CHECK ADD  CONSTRAINT [FK_LoadToLoadStatusSubType_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [dispatch].[LoadToLoadStatusSubType] CHECK CONSTRAINT [FK_LoadToLoadStatusSubType_Load]
GO
ALTER TABLE [dispatch].[LoadToLoadStatusSubType]  WITH CHECK ADD  CONSTRAINT [FK_LoadToLoadStatusSubType_LoadStatusSubType] FOREIGN KEY([LoadStatusSubTypeId])
REFERENCES [dispatch].[LoadStatusSubType] ([LoadStatusSubTypeId])
GO
ALTER TABLE [dispatch].[LoadToLoadStatusSubType] CHECK CONSTRAINT [FK_LoadToLoadStatusSubType_LoadStatusSubType]
GO
ALTER TABLE [dispatch].[LoadTrace]  WITH CHECK ADD  CONSTRAINT [FK_LoadTrace_Load] FOREIGN KEY([LoadId])
REFERENCES [dispatch].[Load] ([LoadId])
GO
ALTER TABLE [dispatch].[LoadTrace] CHECK CONSTRAINT [FK_LoadTrace_Load]
GO
ALTER TABLE [dispatch].[LoadTrace]  WITH CHECK ADD  CONSTRAINT [FK_LoadTrace_LoadTraceType] FOREIGN KEY([LoadTraceTypeId])
REFERENCES [dispatch].[LoadTraceType] ([LoadTraceTypeId])
GO
ALTER TABLE [dispatch].[LoadTrace] CHECK CONSTRAINT [FK_LoadTrace_LoadTraceType]
GO
ALTER TABLE [dispatch].[MileageActual]  WITH CHECK ADD  CONSTRAINT [FK_MileageActual_MileageGoalsDesc] FOREIGN KEY([MileageDivisionDescId])
REFERENCES [dispatch].[MileageDivisionDesc] ([MileageDivisionDescId])
GO
ALTER TABLE [dispatch].[MileageActual] CHECK CONSTRAINT [FK_MileageActual_MileageGoalsDesc]
GO
ALTER TABLE [dispatch].[MileageGoals]  WITH CHECK ADD  CONSTRAINT [FK_MileageGoals_MileageGoalsDesc] FOREIGN KEY([MileageDivisionDescId])
REFERENCES [dispatch].[MileageDivisionDesc] ([MileageDivisionDescId])
GO
ALTER TABLE [dispatch].[MileageGoals] CHECK CONSTRAINT [FK_MileageGoals_MileageGoalsDesc]
GO
ALTER TABLE [dispatch].[PayCode]  WITH CHECK ADD  CONSTRAINT [FK_PayCode_Person] FOREIGN KEY([CreatedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[PayCode] CHECK CONSTRAINT [FK_PayCode_Person]
GO
ALTER TABLE [dispatch].[PayCode]  WITH CHECK ADD  CONSTRAINT [FK_PayCode_VendorPayType] FOREIGN KEY([VendorPayTypeId])
REFERENCES [Vendor].[VendorPayType] ([VendorPayTypeId])
GO
ALTER TABLE [dispatch].[PayCode] CHECK CONSTRAINT [FK_PayCode_VendorPayType]
GO
ALTER TABLE [dispatch].[PR_SettlementStmt_Processing]  WITH CHECK ADD  CONSTRAINT [FK_PR_SettlementStmt_Processing_BusinessEnityType] FOREIGN KEY([BusinessEntityTypeId])
REFERENCES [main].[BusinessEnityType] ([BusinessEntityTypeId])
GO
ALTER TABLE [dispatch].[PR_SettlementStmt_Processing] CHECK CONSTRAINT [FK_PR_SettlementStmt_Processing_BusinessEnityType]
GO
ALTER TABLE [dispatch].[PR_SettlementStmt_Processing]  WITH NOCHECK ADD  CONSTRAINT [FK_PR_SettlementStmt_Processing_LocationType] FOREIGN KEY([LocationTypeId])
REFERENCES [main].[LocationType] ([LocationTypeId])
GO
ALTER TABLE [dispatch].[PR_SettlementStmt_Processing] NOCHECK CONSTRAINT [FK_PR_SettlementStmt_Processing_LocationType]
GO
ALTER TABLE [dispatch].[PR_SettlementStmt_Processing]  WITH CHECK ADD  CONSTRAINT [FK_PR_SettlementStmt_Processing_Punit] FOREIGN KEY([PunitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [dispatch].[PR_SettlementStmt_Processing] CHECK CONSTRAINT [FK_PR_SettlementStmt_Processing_Punit]
GO
ALTER TABLE [dispatch].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_BusinessEnityType] FOREIGN KEY([BusinessEntityTypeId])
REFERENCES [main].[BusinessEnityType] ([BusinessEntityTypeId])
GO
ALTER TABLE [dispatch].[Schedule] CHECK CONSTRAINT [FK_Schedule_BusinessEnityType]
GO
ALTER TABLE [dispatch].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Person] FOREIGN KEY([LastUpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[Schedule] CHECK CONSTRAINT [FK_Schedule_Person]
GO
ALTER TABLE [dispatch].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Punit] FOREIGN KEY([PUnitId])
REFERENCES [dispatch].[Punit] ([PunitId])
GO
ALTER TABLE [dispatch].[Schedule] CHECK CONSTRAINT [FK_Schedule_Punit]
GO
ALTER TABLE [dispatch].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ScheduleOddEven] FOREIGN KEY([ScheduleOddEvenId])
REFERENCES [dispatch].[ScheduleOddEven] ([ScheduleOddEvenId])
GO
ALTER TABLE [dispatch].[Schedule] CHECK CONSTRAINT [FK_Schedule_ScheduleOddEven]
GO
ALTER TABLE [dispatch].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ScheduleShortLong] FOREIGN KEY([ScheduleShortLongId])
REFERENCES [dispatch].[ScheduleShortLong] ([ScheduleShortLongId])
GO
ALTER TABLE [dispatch].[Schedule] CHECK CONSTRAINT [FK_Schedule_ScheduleShortLong]
GO
ALTER TABLE [dispatch].[ScheduleDaysMapping]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleDaysMapping_Schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dispatch].[Schedule] ([ScheduleId])
GO
ALTER TABLE [dispatch].[ScheduleDaysMapping] CHECK CONSTRAINT [FK_ScheduleDaysMapping_Schedule]
GO
ALTER TABLE [dispatch].[ScheduleDaysMapping]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleDaysMapping_ScheduleDays] FOREIGN KEY([ScheduleDaysId])
REFERENCES [dispatch].[ScheduleDays] ([ScheduleDaysId])
GO
ALTER TABLE [dispatch].[ScheduleDaysMapping] CHECK CONSTRAINT [FK_ScheduleDaysMapping_ScheduleDays]
GO
ALTER TABLE [dispatch].[ScheduleDrivers]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleDrivers_Driver1] FOREIGN KEY([ScheduleDriver1])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[ScheduleDrivers] CHECK CONSTRAINT [FK_ScheduleDrivers_Driver1]
GO
ALTER TABLE [dispatch].[ScheduleDrivers]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleDrivers_Driver2] FOREIGN KEY([ScheduleDriver2])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[ScheduleDrivers] CHECK CONSTRAINT [FK_ScheduleDrivers_Driver2]
GO
ALTER TABLE [dispatch].[ScheduleDrivers]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleDrivers_LastUpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [dispatch].[ScheduleDrivers] CHECK CONSTRAINT [FK_ScheduleDrivers_LastUpdatedBy]
GO
ALTER TABLE [dispatch].[ScheduleDrivers]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleDrivers_Schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dispatch].[Schedule] ([ScheduleId])
GO
ALTER TABLE [dispatch].[ScheduleDrivers] CHECK CONSTRAINT [FK_ScheduleDrivers_Schedule]
GO
ALTER TABLE [dispatch].[TargetVsActualMileage]  WITH CHECK ADD  CONSTRAINT [FK_TargetVsActualMileage_TargetOrActualType] FOREIGN KEY([TargetOrActualTypeId])
REFERENCES [dispatch].[TargetOrActualType] ([TargetOrActualTypeId])
GO
ALTER TABLE [dispatch].[TargetVsActualMileage] CHECK CONSTRAINT [FK_TargetVsActualMileage_TargetOrActualType]
GO
ALTER TABLE [dispatch].[TargetVsActualMileage]  WITH CHECK ADD  CONSTRAINT [FK_TargetVsActualMileage_TargetVsActualDesc] FOREIGN KEY([TargetVsActualDescId])
REFERENCES [dispatch].[TargetVsActualDesc] ([TargetVsActualDescId])
GO
ALTER TABLE [dispatch].[TargetVsActualMileage] CHECK CONSTRAINT [FK_TargetVsActualMileage_TargetVsActualDesc]
GO
ALTER TABLE [edi].[Incoming]  WITH CHECK ADD  CONSTRAINT [FK_Incoming_StatusCodes] FOREIGN KEY([StatusId])
REFERENCES [edi].[StatusCodes] ([Id])
GO
ALTER TABLE [edi].[Incoming] CHECK CONSTRAINT [FK_Incoming_StatusCodes]
GO
ALTER TABLE [edi].[LoadTenders]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_TenderStatus] FOREIGN KEY([StatusId])
REFERENCES [edi].[StatusCodes] ([Id])
GO
ALTER TABLE [edi].[LoadTenders] CHECK CONSTRAINT [FK_LoadTenders_TenderStatus]
GO
ALTER TABLE [edi].[LoadTenders_BusinessInstructions]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_BusinessInstructions_LoadTenders] FOREIGN KEY([LoadTenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_BusinessInstructions] CHECK CONSTRAINT [FK_LoadTenders_BusinessInstructions_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_LoadTenders] FOREIGN KEY([LoadTenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops] CHECK CONSTRAINT [FK_LoadTenders_Stops_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops_Contact]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_Contact_LoadTenders] FOREIGN KEY([TenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops_Contact] CHECK CONSTRAINT [FK_LoadTenders_Stops_Contact_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbers_LoadTenders] FOREIGN KEY([LoadTenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbers] CHECK CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbers_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbersContacts]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbersContacts_LoadTenders] FOREIGN KEY([LoadtenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbersContacts] CHECK CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbersContacts_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbersHazards]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbersHazards_LoadTenders] FOREIGN KEY([LoadTenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbersHazards] CHECK CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbersHazards_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbersHazardsNames]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbersHazardsNames_LoadTenders] FOREIGN KEY([LoadtenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops_MarksAndNumbersHazardsNames] CHECK CONSTRAINT [FK_LoadTenders_Stops_MarksAndNumbersHazardsNames_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops_OrderIdDetail]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_OrderIdDetail_LoadTenders] FOREIGN KEY([LoadTenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops_OrderIdDetail] CHECK CONSTRAINT [FK_LoadTenders_Stops_OrderIdDetail_LoadTenders]
GO
ALTER TABLE [edi].[LoadTenders_Stops_ReferenceNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LoadTenders_Stops_ReferenceNumbers_LoadTenders] FOREIGN KEY([LoadTenderTenderId])
REFERENCES [edi].[LoadTenders] ([TenderId])
GO
ALTER TABLE [edi].[LoadTenders_Stops_ReferenceNumbers] CHECK CONSTRAINT [FK_LoadTenders_Stops_ReferenceNumbers_LoadTenders]
GO
ALTER TABLE [edi].[Outgoing]  WITH CHECK ADD  CONSTRAINT [FK_Outgoing_StatusCode] FOREIGN KEY([StatusId])
REFERENCES [edi].[StatusCodes] ([Id])
GO
ALTER TABLE [edi].[Outgoing] CHECK CONSTRAINT [FK_Outgoing_StatusCode]
GO
ALTER TABLE [edi].[Outgoing_990]  WITH CHECK ADD  CONSTRAINT [FK_Outgoing_990_StatusCode] FOREIGN KEY([StatusId])
REFERENCES [edi].[StatusCodes] ([Id])
GO
ALTER TABLE [edi].[Outgoing_990] CHECK CONSTRAINT [FK_Outgoing_990_StatusCode]
GO
ALTER TABLE [equipment].[PUnit]  WITH CHECK ADD  CONSTRAINT [FK_PUnit_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [equipment].[PUnit] CHECK CONSTRAINT [FK_PUnit_Client]
GO
ALTER TABLE [equipment].[PUnit]  WITH CHECK ADD  CONSTRAINT [FK_PUnit_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnit] CHECK CONSTRAINT [FK_PUnit_EquipmentType]
GO
ALTER TABLE [equipment].[PUnit]  WITH CHECK ADD  CONSTRAINT [FK_PUnit_PUnitModel] FOREIGN KEY([PUnitMakeModelId])
REFERENCES [equipment].[PUnitMakeModel] ([PUnitMakeModelId])
GO
ALTER TABLE [equipment].[PUnit] CHECK CONSTRAINT [FK_PUnit_PUnitModel]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMapping_BusinessEnityType] FOREIGN KEY([BusinessEntityTypeId])
REFERENCES [main].[BusinessEnityType] ([BusinessEntityTypeId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMapping_BusinessEnityType]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMapping_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMapping_Client]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMapping_DivisionType] FOREIGN KEY([DivisionTypeId])
REFERENCES [main].[DivisionType] ([DivisionTypeId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMapping_DivisionType]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMapping_GoalUnit] FOREIGN KEY([GoalUnitId])
REFERENCES [equipment].[GoalUnit] ([GoalUnitId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMapping_GoalUnit]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMapping_GroupType] FOREIGN KEY([GroupTypeId])
REFERENCES [main].[GroupType] ([GroupTypeId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMapping_GroupType]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMapping_LocationType] FOREIGN KEY([LocationTypeId])
REFERENCES [main].[LocationType] ([LocationTypeId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMapping_LocationType]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMapping_Person] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMapping_Person]
GO
ALTER TABLE [equipment].[PUnitGoalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitGoalMappingPerson_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PUnitGoalMapping] CHECK CONSTRAINT [FK_PUnitGoalMappingPerson_UpdatedBy]
GO
ALTER TABLE [equipment].[PUnitMake]  WITH CHECK ADD  CONSTRAINT [FK_PUnitMake_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnitMake] CHECK CONSTRAINT [FK_PUnitMake_EquipmentType]
GO
ALTER TABLE [equipment].[PUnitMakeModel]  WITH CHECK ADD  CONSTRAINT [FK_PUnitModel_PUnitMake] FOREIGN KEY([PUnitMakeId])
REFERENCES [equipment].[PUnitMake] ([PUnitMakeId])
GO
ALTER TABLE [equipment].[PUnitMakeModel] CHECK CONSTRAINT [FK_PUnitModel_PUnitMake]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PunitMapping_ActiveType] FOREIGN KEY([PUnitActiveTypeId])
REFERENCES [equipment].[PUnitActiveType] ([PUnitActiveTypeId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PunitMapping_ActiveType]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PunitMapping_BusinessEnityType] FOREIGN KEY([BusinessEntityTypeId])
REFERENCES [main].[BusinessEnityType] ([BusinessEntityTypeId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PunitMapping_BusinessEnityType]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PunitMapping_DivisionType] FOREIGN KEY([DivisionTypeId])
REFERENCES [main].[DivisionType] ([DivisionTypeId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PunitMapping_DivisionType]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PunitMapping_GroupType] FOREIGN KEY([GroupTypeId])
REFERENCES [main].[GroupType] ([GroupTypeId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PunitMapping_GroupType]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PunitMapping_LocationType] FOREIGN KEY([LocationTypeId])
REFERENCES [main].[LocationType] ([LocationTypeId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PunitMapping_LocationType]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitMapping_Person] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PUnitMapping_Person]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitMapping_PUnit] FOREIGN KEY([PunitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PUnitMapping_PUnit]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitMapping_PUnitClient] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PUnitMapping_PUnitClient]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PunitMapping_StatusType] FOREIGN KEY([PUnitStatusTypeId])
REFERENCES [equipment].[PUnitStatusType] ([PUnitStatusTypeId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PunitMapping_StatusType]
GO
ALTER TABLE [equipment].[PunitMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitMappingPerson_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PunitMapping] CHECK CONSTRAINT [FK_PUnitMappingPerson_UpdatedBy]
GO
ALTER TABLE [equipment].[PunitMappingPerson]  WITH CHECK ADD  CONSTRAINT [FK_PUnitMappingPerson_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PunitMappingPerson] CHECK CONSTRAINT [FK_PUnitMappingPerson_Person]
GO
ALTER TABLE [equipment].[PunitMappingPerson]  WITH CHECK ADD  CONSTRAINT [FK_PUnitMappingPerson_PUnit] FOREIGN KEY([PunitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [equipment].[PunitMappingPerson] CHECK CONSTRAINT [FK_PUnitMappingPerson_PUnit]
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitRegistrationMapping_Person] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping] CHECK CONSTRAINT [FK_PUnitRegistrationMapping_Person]
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitRegistrationMapping_PUnit] FOREIGN KEY([PUnitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping] CHECK CONSTRAINT [FK_PUnitRegistrationMapping_PUnit]
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitRegistrationMapping_PUnitRegistrationType] FOREIGN KEY([PUnitRegistrationTypeId])
REFERENCES [equipment].[PUnitRegistrationType] ([PUnitRegistrationTypeId])
GO
ALTER TABLE [equipment].[PUnitRegistrationMapping] CHECK CONSTRAINT [FK_PUnitRegistrationMapping_PUnitRegistrationType]
GO
ALTER TABLE [equipment].[PUnitRegistrationTemplate]  WITH CHECK ADD  CONSTRAINT [FK_PUnitRegistrationTemplate_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnitRegistrationTemplate] CHECK CONSTRAINT [FK_PUnitRegistrationTemplate_EquipmentType]
GO
ALTER TABLE [equipment].[PUnitRegistrationTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitRegistrationTemplateMapping_PUnitRegistrationTemplate] FOREIGN KEY([PUnitRegistrationTemplateId])
REFERENCES [equipment].[PUnitRegistrationTemplate] ([PUnitRegistrationTemplateId])
GO
ALTER TABLE [equipment].[PUnitRegistrationTemplateMapping] CHECK CONSTRAINT [FK_PUnitRegistrationTemplateMapping_PUnitRegistrationTemplate]
GO
ALTER TABLE [equipment].[PUnitRegistrationTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitRegistrationTemplateMapping_RegistrationType] FOREIGN KEY([PUnitRegistrationTypeId])
REFERENCES [equipment].[PUnitRegistrationType] ([PUnitRegistrationTypeId])
GO
ALTER TABLE [equipment].[PUnitRegistrationTemplateMapping] CHECK CONSTRAINT [FK_PUnitRegistrationTemplateMapping_RegistrationType]
GO
ALTER TABLE [equipment].[PUnitRegistrationType]  WITH CHECK ADD  CONSTRAINT [FK_PUnitRegistrationType_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnitRegistrationType] CHECK CONSTRAINT [FK_PUnitRegistrationType_EquipmentType]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalMapping_Person] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping] CHECK CONSTRAINT [FK_PUnitServiceIntervalMapping_Person]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalMapping_PUnit] FOREIGN KEY([PUnitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping] CHECK CONSTRAINT [FK_PUnitServiceIntervalMapping_PUnit]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalMapping_PUnitServiceIntervalType] FOREIGN KEY([PUnitServiceIntervalTypeId])
REFERENCES [equipment].[PUnitServiceIntervalType] ([PUnitServiceIntervalTypeId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping] CHECK CONSTRAINT [FK_PUnitServiceIntervalMapping_PUnitServiceIntervalType]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalMapping_ServiceIntervalUnit] FOREIGN KEY([ServiceIntervalUnitId])
REFERENCES [equipment].[ServiceIntervalUnit] ([ServiceIntervalUnitId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalMapping] CHECK CONSTRAINT [FK_PUnitServiceIntervalMapping_ServiceIntervalUnit]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplate]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalTemplate_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplate] CHECK CONSTRAINT [FK_PUnitServiceIntervalTemplate_EquipmentType]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalTemplateMapping_PUnitServiceIntervalTemplate] FOREIGN KEY([PUnitServiceIntervalTemplateId])
REFERENCES [equipment].[PUnitServiceIntervalTemplate] ([PUnitServiceIntervalTemplateId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplateMapping] CHECK CONSTRAINT [FK_PUnitServiceIntervalTemplateMapping_PUnitServiceIntervalTemplate]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalTemplateMapping_ServiceIntervalType] FOREIGN KEY([PUnitServiceIntervalTypeId])
REFERENCES [equipment].[PUnitServiceIntervalType] ([PUnitServiceIntervalTypeId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplateMapping] CHECK CONSTRAINT [FK_PUnitServiceIntervalTemplateMapping_ServiceIntervalType]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalTemplateMapping_ServiceIntervalUnit] FOREIGN KEY([ServiceIntervalUnitId])
REFERENCES [equipment].[ServiceIntervalUnit] ([ServiceIntervalUnitId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalTemplateMapping] CHECK CONSTRAINT [FK_PUnitServiceIntervalTemplateMapping_ServiceIntervalUnit]
GO
ALTER TABLE [equipment].[PUnitServiceIntervalType]  WITH CHECK ADD  CONSTRAINT [FK_PUnitServiceIntervalType_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnitServiceIntervalType] CHECK CONSTRAINT [FK_PUnitServiceIntervalType_EquipmentType]
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationMapping_Person] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping] CHECK CONSTRAINT [FK_PUnitSpecificationMapping_Person]
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationMapping_PUnit] FOREIGN KEY([PUnitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping] CHECK CONSTRAINT [FK_PUnitSpecificationMapping_PUnit]
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationMapping_PUnitSpecificationType] FOREIGN KEY([PUnitSpecificationTypeId])
REFERENCES [equipment].[PUnitSpecificationType] ([PUnitSpecificationTypeId])
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping] CHECK CONSTRAINT [FK_PUnitSpecificationMapping_PUnitSpecificationType]
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationMapping_SpecificationUnit] FOREIGN KEY([SpecificationUnitId])
REFERENCES [equipment].[SpecificationUnit] ([SpecificationUnitId])
GO
ALTER TABLE [equipment].[PUnitSpecificationMapping] CHECK CONSTRAINT [FK_PUnitSpecificationMapping_SpecificationUnit]
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplate]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationTemplate_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplate] CHECK CONSTRAINT [FK_PUnitSpecificationTemplate_EquipmentType]
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationTemplateMapping_PUnitSpecificationTemplate] FOREIGN KEY([PUnitSpecificationTemplateId])
REFERENCES [equipment].[PUnitSpecificationTemplate] ([PUnitSpecificationTemplateId])
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplateMapping] CHECK CONSTRAINT [FK_PUnitSpecificationTemplateMapping_PUnitSpecificationTemplate]
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationTemplateMapping_SpecificationType] FOREIGN KEY([PUnitSpecificationTypeId])
REFERENCES [equipment].[PUnitSpecificationType] ([PUnitSpecificationTypeId])
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplateMapping] CHECK CONSTRAINT [FK_PUnitSpecificationTemplateMapping_SpecificationType]
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplateMapping]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationTemplateMapping_SpecificationUnit] FOREIGN KEY([SpecificationUnitId])
REFERENCES [equipment].[SpecificationUnit] ([SpecificationUnitId])
GO
ALTER TABLE [equipment].[PUnitSpecificationTemplateMapping] CHECK CONSTRAINT [FK_PUnitSpecificationTemplateMapping_SpecificationUnit]
GO
ALTER TABLE [equipment].[PUnitSpecificationType]  WITH CHECK ADD  CONSTRAINT [FK_PUnitSpecificationType_EquipmentType] FOREIGN KEY([EquipTypeId])
REFERENCES [equipment].[EquipType] ([EquipTypeId])
GO
ALTER TABLE [equipment].[PUnitSpecificationType] CHECK CONSTRAINT [FK_PUnitSpecificationType_EquipmentType]
GO
ALTER TABLE [factoring].[EmailTemplate_SmartFields_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplate_SmartFields_Mapping_EmailTemplate_SmartFields] FOREIGN KEY([SmartFieldId])
REFERENCES [factoring].[EmailTemplate_SmartFields] ([FieldId])
GO
ALTER TABLE [factoring].[EmailTemplate_SmartFields_Mapping] CHECK CONSTRAINT [FK_EmailTemplate_SmartFields_Mapping_EmailTemplate_SmartFields]
GO
ALTER TABLE [factoring].[EmailTemplate_SmartFields_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplate_SmartFields_Mapping_EmailTemplates] FOREIGN KEY([TemplateId])
REFERENCES [factoring].[EmailTemplates] ([TemplateId])
GO
ALTER TABLE [factoring].[EmailTemplate_SmartFields_Mapping] CHECK CONSTRAINT [FK_EmailTemplate_SmartFields_Mapping_EmailTemplates]
GO
ALTER TABLE [factoring].[EmailTemplates]  WITH CHECK ADD  CONSTRAINT [FK_EmailTemplates_PlanType] FOREIGN KEY([PlanTypeId])
REFERENCES [factoring].[PlanType] ([PlanTypeId])
GO
ALTER TABLE [factoring].[EmailTemplates] CHECK CONSTRAINT [FK_EmailTemplates_PlanType]
GO
ALTER TABLE [factoring].[PlanDetail]  WITH CHECK ADD  CONSTRAINT [FK_PlanDetail_Plan] FOREIGN KEY([PlanId])
REFERENCES [factoring].[Plans] ([PlanId])
GO
ALTER TABLE [factoring].[PlanDetail] CHECK CONSTRAINT [FK_PlanDetail_Plan]
GO
ALTER TABLE [factoring].[PlanFields]  WITH CHECK ADD  CONSTRAINT [FK_PlanFields_PlanType] FOREIGN KEY([PlanTypeId])
REFERENCES [factoring].[PlanType] ([PlanTypeId])
GO
ALTER TABLE [factoring].[PlanFields] CHECK CONSTRAINT [FK_PlanFields_PlanType]
GO
ALTER TABLE [factoring].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plans_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [factoring].[Plans] CHECK CONSTRAINT [FK_Plans_Client]
GO
ALTER TABLE [factoring].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plans_PlanType] FOREIGN KEY([PlanTypeId])
REFERENCES [factoring].[PlanType] ([PlanTypeId])
GO
ALTER TABLE [factoring].[Plans] CHECK CONSTRAINT [FK_Plans_PlanType]
GO
ALTER TABLE [factoring].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_PlanType] FOREIGN KEY([PlanTypeId])
REFERENCES [factoring].[PlanType] ([PlanTypeId])
GO
ALTER TABLE [factoring].[Settings] CHECK CONSTRAINT [FK_Settings_PlanType]
GO
ALTER TABLE [feeds].[Omnitracs_T2060_Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Omnitracs_T2060_Equipment_Omnitracs_T2060] FOREIGN KEY([TransactionId])
REFERENCES [feeds].[Omnitracs_T2060] ([TransactionId])
GO
ALTER TABLE [feeds].[Omnitracs_T2060_Equipment] CHECK CONSTRAINT [FK_Omnitracs_T2060_Equipment_Omnitracs_T2060]
GO
ALTER TABLE [feeds].[Omnitracs_T2060_Proximity]  WITH CHECK ADD  CONSTRAINT [FK_Omnitracs_T2060_Proximity_Omnitracs_T2060] FOREIGN KEY([TransactionId])
REFERENCES [feeds].[Omnitracs_T2060] ([TransactionId])
GO
ALTER TABLE [feeds].[Omnitracs_T2060_Proximity] CHECK CONSTRAINT [FK_Omnitracs_T2060_Proximity_Omnitracs_T2060]
GO
ALTER TABLE [feeds].[Omnitracs_T4010_Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Omnitracs_T2060_Equipment_Omnitracs_T4010] FOREIGN KEY([TransactionId])
REFERENCES [feeds].[Omnitracs_T4010] ([TransactionId])
GO
ALTER TABLE [feeds].[Omnitracs_T4010_Equipment] CHECK CONSTRAINT [FK_Omnitracs_T2060_Equipment_Omnitracs_T4010]
GO
ALTER TABLE [feeds].[Omnitracs_T4010_Proximity]  WITH CHECK ADD  CONSTRAINT [FK_Omnitracs_T4010_Proximity_Omnitracs_T4010] FOREIGN KEY([TransactionId])
REFERENCES [feeds].[Omnitracs_T4010] ([TransactionId])
GO
ALTER TABLE [feeds].[Omnitracs_T4010_Proximity] CHECK CONSTRAINT [FK_Omnitracs_T4010_Proximity_Omnitracs_T4010]
GO
ALTER TABLE [logistics].[AccCharge]  WITH CHECK ADD  CONSTRAINT [FK_AccCharge_AccChargeType] FOREIGN KEY([AccChargeTypeId])
REFERENCES [dispatch].[AccChargeType] ([AccChargeTypeId])
GO
ALTER TABLE [logistics].[AccCharge] CHECK CONSTRAINT [FK_AccCharge_AccChargeType]
GO
ALTER TABLE [logistics].[AccCharge]  WITH CHECK ADD  CONSTRAINT [FK_AccCharge_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[AccCharge] CHECK CONSTRAINT [FK_AccCharge_Load]
GO
ALTER TABLE [logistics].[Carrier_AccCharge]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_AccCharge_AccChargeType] FOREIGN KEY([AccChargeTypeId])
REFERENCES [dispatch].[AccChargeType] ([AccChargeTypeId])
GO
ALTER TABLE [logistics].[Carrier_AccCharge] CHECK CONSTRAINT [FK_Carrier_AccCharge_AccChargeType]
GO
ALTER TABLE [logistics].[Carrier_AccCharge]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_AccCharge_Carrier_AccCharge] FOREIGN KEY([AccChargeId])
REFERENCES [logistics].[Carrier_AccCharge] ([AccChargeId])
GO
ALTER TABLE [logistics].[Carrier_AccCharge] CHECK CONSTRAINT [FK_Carrier_AccCharge_Carrier_AccCharge]
GO
ALTER TABLE [logistics].[Carrier_AccCharge]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_AccCharge_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[Carrier_AccCharge] CHECK CONSTRAINT [FK_Carrier_AccCharge_Load]
GO
ALTER TABLE [logistics].[Carrier_AutoRatingACC]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_AutoRatingACC_AccChargeType] FOREIGN KEY([AccChargeTypeId])
REFERENCES [dispatch].[AccChargeType] ([AccChargeTypeId])
GO
ALTER TABLE [logistics].[Carrier_AutoRatingACC] CHECK CONSTRAINT [FK_Carrier_AutoRatingACC_AccChargeType]
GO
ALTER TABLE [logistics].[Carrier_AutoRatingACC]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_AutoRatingACC_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [logistics].[Carrier_AutoRatingACC] CHECK CONSTRAINT [FK_Carrier_AutoRatingACC_Client]
GO
ALTER TABLE [logistics].[Carrier_AutoRatingACC]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_AutoRatingACC_Vendor] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [logistics].[Carrier_AutoRatingACC] CHECK CONSTRAINT [FK_Carrier_AutoRatingACC_Vendor]
GO
ALTER TABLE [logistics].[Carrier_AutoRatingDetail]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_AutoRatingDetail_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [logistics].[Carrier_AutoRatingDetail] CHECK CONSTRAINT [FK_Logistics_AutoRatingDetail_Client]
GO
ALTER TABLE [logistics].[Carrier_AutoRatingDetail]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_AutoRatingDetail_Vendor] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [logistics].[Carrier_AutoRatingDetail] CHECK CONSTRAINT [FK_Logistics_AutoRatingDetail_Vendor]
GO
ALTER TABLE [logistics].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[Load] CHECK CONSTRAINT [FK_Load_Load]
GO
ALTER TABLE [logistics].[LoadBilling]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_LoadBilling_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[LoadBilling] CHECK CONSTRAINT [FK_Logistics_LoadBilling_Load]
GO
ALTER TABLE [logistics].[LoadFile]  WITH CHECK ADD  CONSTRAINT [FK_LoadFile_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[LoadFile] CHECK CONSTRAINT [FK_LoadFile_Load]
GO
ALTER TABLE [logistics].[LoadFile]  WITH CHECK ADD  CONSTRAINT [FK_LoadFile_LoadFileType] FOREIGN KEY([LoadFileTypeId])
REFERENCES [dispatch].[LoadFileType] ([LoadFileTypeId])
GO
ALTER TABLE [logistics].[LoadFile] CHECK CONSTRAINT [FK_LoadFile_LoadFileType]
GO
ALTER TABLE [logistics].[LoadFile]  WITH CHECK ADD  CONSTRAINT [FK_LoadFile_Person] FOREIGN KEY([AddedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [logistics].[LoadFile] CHECK CONSTRAINT [FK_LoadFile_Person]
GO
ALTER TABLE [logistics].[LoadNotes]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_LoadNotes_NoteType] FOREIGN KEY([NoteTypeId])
REFERENCES [dispatch].[NoteType] ([NoteTypeId])
GO
ALTER TABLE [logistics].[LoadNotes] CHECK CONSTRAINT [FK_Logistics_LoadNotes_NoteType]
GO
ALTER TABLE [logistics].[LoadStatus]  WITH CHECK ADD  CONSTRAINT [FK_LoadStatus_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[LoadStatus] CHECK CONSTRAINT [FK_LoadStatus_Load]
GO
ALTER TABLE [logistics].[LoadStatus]  WITH CHECK ADD  CONSTRAINT [FK_LoadStatus_LoadStatusType] FOREIGN KEY([LoadStatusTypeId])
REFERENCES [dispatch].[LoadStatusType] ([LoadStatusTypeId])
GO
ALTER TABLE [logistics].[LoadStatus] CHECK CONSTRAINT [FK_LoadStatus_LoadStatusType]
GO
ALTER TABLE [logistics].[LoadStatusUpdate_Pending]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_LoadStatusUpdate_Pending_BusinessUnit] FOREIGN KEY([BusinessUnitId])
REFERENCES [dispatch].[BusinessUnit] ([Id])
GO
ALTER TABLE [logistics].[LoadStatusUpdate_Pending] CHECK CONSTRAINT [FK_Logistics_LoadStatusUpdate_Pending_BusinessUnit]
GO
ALTER TABLE [logistics].[LoadStatusUpdate_Pending]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_LoadStatusUpdate_Pending_LoadStop] FOREIGN KEY([LoadStopId])
REFERENCES [logistics].[LoadStop] ([LoadStopId])
GO
ALTER TABLE [logistics].[LoadStatusUpdate_Pending] CHECK CONSTRAINT [FK_Logistics_LoadStatusUpdate_Pending_LoadStop]
GO
ALTER TABLE [logistics].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Carrier] FOREIGN KEY([CarrierId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [logistics].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Carrier]
GO
ALTER TABLE [logistics].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [logistics].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Client]
GO
ALTER TABLE [logistics].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_EquipmentType] FOREIGN KEY([EquipmentTypeId])
REFERENCES [dispatch].[EquipmentType] ([EquipmentTypeId])
GO
ALTER TABLE [logistics].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_EquipmentType]
GO
ALTER TABLE [logistics].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_GasStation] FOREIGN KEY([GasStationId])
REFERENCES [dispatch].[GasStation] ([GasStationId])
GO
ALTER TABLE [logistics].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_GasStation]
GO
ALTER TABLE [logistics].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_Load]
GO
ALTER TABLE [logistics].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_LoadApptType] FOREIGN KEY([LoadApptTypeId])
REFERENCES [dispatch].[LoadApptType] ([LoadApptTypeId])
GO
ALTER TABLE [logistics].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_LoadApptType]
GO
ALTER TABLE [logistics].[LoadStop]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_LoadStopType] FOREIGN KEY([LoadStopTypeId])
REFERENCES [dispatch].[LoadStopType] ([LoadStopTypeId])
GO
ALTER TABLE [logistics].[LoadStop] CHECK CONSTRAINT [FK_LoadStop_LoadStopType]
GO
ALTER TABLE [logistics].[LoadStop_ReferenceNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_ReferenceNumbers_LoadStop_ReferenceNumbers] FOREIGN KEY([LoadId], [LoadStopId], [ReferenceIdentificationQualifierCode])
REFERENCES [logistics].[LoadStop_ReferenceNumbers] ([LoadId], [LoadStopId], [ReferenceIdentificationQualifierCode])
GO
ALTER TABLE [logistics].[LoadStop_ReferenceNumbers] CHECK CONSTRAINT [FK_LoadStop_ReferenceNumbers_LoadStop_ReferenceNumbers]
GO
ALTER TABLE [logistics].[LoadStop_ReferenceNumbers]  WITH CHECK ADD  CONSTRAINT [FK_LoadStop_ReferenceNumbers_ReferenceIdentificationQualifier] FOREIGN KEY([ReferenceIdentificationQualifierCode])
REFERENCES [edi].[ReferenceIdentificationQualifier] ([ReferenceIdentificationQualifierCode])
GO
ALTER TABLE [logistics].[LoadStop_ReferenceNumbers] CHECK CONSTRAINT [FK_LoadStop_ReferenceNumbers_ReferenceIdentificationQualifier]
GO
ALTER TABLE [logistics].[LoadToLoadStatusSubType]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_LoadToLoadStatusSubType_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[LoadToLoadStatusSubType] CHECK CONSTRAINT [FK_Logistics_LoadToLoadStatusSubType_Load]
GO
ALTER TABLE [logistics].[LoadToLoadStatusSubType]  WITH CHECK ADD  CONSTRAINT [FK_Logistics_LoadToLoadStatusSubType_LoadStatusSubType] FOREIGN KEY([LoadStatusSubTypeId])
REFERENCES [dispatch].[LoadStatusSubType] ([LoadStatusSubTypeId])
GO
ALTER TABLE [logistics].[LoadToLoadStatusSubType] CHECK CONSTRAINT [FK_Logistics_LoadToLoadStatusSubType_LoadStatusSubType]
GO
ALTER TABLE [logistics].[LoadTrace]  WITH CHECK ADD  CONSTRAINT [FK_LoadTrace_Load] FOREIGN KEY([LoadId])
REFERENCES [logistics].[Load] ([LoadId])
GO
ALTER TABLE [logistics].[LoadTrace] CHECK CONSTRAINT [FK_LoadTrace_Load]
GO
ALTER TABLE [logistics].[LoadTrace]  WITH CHECK ADD  CONSTRAINT [FK_LoadTrace_LoadTraceType] FOREIGN KEY([LoadTraceTypeId])
REFERENCES [dispatch].[LoadTraceType] ([LoadTraceTypeId])
GO
ALTER TABLE [logistics].[LoadTrace] CHECK CONSTRAINT [FK_LoadTrace_LoadTraceType]
GO
ALTER TABLE [main].[AppLayout]  WITH CHECK ADD  CONSTRAINT [FK_AppLayout_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[AppLayout] CHECK CONSTRAINT [FK_AppLayout_Person]
GO
ALTER TABLE [main].[AppLayoutAppPreference]  WITH CHECK ADD  CONSTRAINT [FK_AppLayoutAppPreference_AppDefinition] FOREIGN KEY([AppId])
REFERENCES [main].[AppDefinition] ([AppId])
GO
ALTER TABLE [main].[AppLayoutAppPreference] CHECK CONSTRAINT [FK_AppLayoutAppPreference_AppDefinition]
GO
ALTER TABLE [main].[AppLayoutAppPreference]  WITH CHECK ADD  CONSTRAINT [FK_AppLayoutAppPreference_AppLayout] FOREIGN KEY([AppLayoutId])
REFERENCES [main].[AppLayout] ([AppLayoutId])
GO
ALTER TABLE [main].[AppLayoutAppPreference] CHECK CONSTRAINT [FK_AppLayoutAppPreference_AppLayout]
GO
ALTER TABLE [main].[AppNotification]  WITH CHECK ADD  CONSTRAINT [FK_AppNotification_AppNotification] FOREIGN KEY([AppId])
REFERENCES [main].[AppDefinition] ([AppId])
GO
ALTER TABLE [main].[AppNotification] CHECK CONSTRAINT [FK_AppNotification_AppNotification]
GO
ALTER TABLE [main].[AppNotification]  WITH CHECK ADD  CONSTRAINT [FK_AppNotification_AppNotification1] FOREIGN KEY([AppNotificationTypeId])
REFERENCES [main].[AppNotificationType] ([AppNotificationTypeId])
GO
ALTER TABLE [main].[AppNotification] CHECK CONSTRAINT [FK_AppNotification_AppNotification1]
GO
ALTER TABLE [main].[BusinessEntityPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_BusinessEntityPersonMapping_BusinessEnityType] FOREIGN KEY([BusinessEntityTypeId])
REFERENCES [main].[BusinessEnityType] ([BusinessEntityTypeId])
GO
ALTER TABLE [main].[BusinessEntityPersonMapping] CHECK CONSTRAINT [FK_BusinessEntityPersonMapping_BusinessEnityType]
GO
ALTER TABLE [main].[BusinessEntityPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_BusinessEntityPersonMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[BusinessEntityPersonMapping] CHECK CONSTRAINT [FK_BusinessEntityPersonMapping_Person]
GO
ALTER TABLE [main].[CertificationPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonCertificationMapping_Certification] FOREIGN KEY([CertificationTypeId])
REFERENCES [main].[CertificationType] ([CertificationTypeId])
GO
ALTER TABLE [main].[CertificationPersonMapping] CHECK CONSTRAINT [FK_PersonCertificationMapping_Certification]
GO
ALTER TABLE [main].[CertificationPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonCertificationMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[CertificationPersonMapping] CHECK CONSTRAINT [FK_PersonCertificationMapping_Person]
GO
ALTER TABLE [main].[ClientAddress]  WITH CHECK ADD  CONSTRAINT [FK_ClientAddress_AddressType] FOREIGN KEY([AddressTypeId])
REFERENCES [main].[AddressType] ([AddressTypeId])
GO
ALTER TABLE [main].[ClientAddress] CHECK CONSTRAINT [FK_ClientAddress_AddressType]
GO
ALTER TABLE [main].[ClientAddress]  WITH CHECK ADD  CONSTRAINT [FK_ClientAddress_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientAddress] CHECK CONSTRAINT [FK_ClientAddress_Client]
GO
ALTER TABLE [main].[ClientBillingDefaults]  WITH CHECK ADD  CONSTRAINT [FK_ClientBillingDefaults_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientBillingDefaults] CHECK CONSTRAINT [FK_ClientBillingDefaults_Client]
GO
ALTER TABLE [main].[ClientContactMapping]  WITH CHECK ADD  CONSTRAINT [FK_ClientContactMapping_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientContactMapping] CHECK CONSTRAINT [FK_ClientContactMapping_Client]
GO
ALTER TABLE [main].[ClientContactMapping]  WITH CHECK ADD  CONSTRAINT [FK_ClientContactMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[ClientContactMapping] CHECK CONSTRAINT [FK_ClientContactMapping_Person]
GO
ALTER TABLE [main].[ClientEdi]  WITH CHECK ADD  CONSTRAINT [FK_ClientEdi_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientEdi] CHECK CONSTRAINT [FK_ClientEdi_Client]
GO
ALTER TABLE [main].[ClientEdi_StatusSettings]  WITH CHECK ADD  CONSTRAINT [FK_ClientEdi_StatusSettings_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientEdi_StatusSettings] CHECK CONSTRAINT [FK_ClientEdi_StatusSettings_Client]
GO
ALTER TABLE [main].[ClientFuel]  WITH CHECK ADD  CONSTRAINT [FK_ClientFuel_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientFuel] CHECK CONSTRAINT [FK_ClientFuel_Client]
GO
ALTER TABLE [main].[ClientFuelCard]  WITH CHECK ADD  CONSTRAINT [FK_ClientFuelCard_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientFuelCard] CHECK CONSTRAINT [FK_ClientFuelCard_Client]
GO
ALTER TABLE [main].[ClientFuelSurcharge]  WITH CHECK ADD  CONSTRAINT [FK_ClientFuelSurcharge_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientFuelSurcharge] CHECK CONSTRAINT [FK_ClientFuelSurcharge_Client]
GO
ALTER TABLE [main].[ClientFuelSurcharge_WeekEnding]  WITH CHECK ADD  CONSTRAINT [FK_ClientFuelSurcharge_WeekEnding_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientFuelSurcharge_WeekEnding] CHECK CONSTRAINT [FK_ClientFuelSurcharge_WeekEnding_Client]
GO
ALTER TABLE [main].[ClientNote]  WITH CHECK ADD  CONSTRAINT [FK_ClientNote_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientNote] CHECK CONSTRAINT [FK_ClientNote_Client]
GO
ALTER TABLE [main].[ClientNote]  WITH CHECK ADD  CONSTRAINT [FK_ClientNote_PersonIdUpdatedBy] FOREIGN KEY([PersonIdUpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[ClientNote] CHECK CONSTRAINT [FK_ClientNote_PersonIdUpdatedBy]
GO
ALTER TABLE [main].[ClientPerMileOverride]  WITH CHECK ADD  CONSTRAINT [FK_ClientPerMileOverride_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [main].[ClientPerMileOverride] CHECK CONSTRAINT [FK_ClientPerMileOverride_Client]
GO
ALTER TABLE [main].[DivisionPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_DivisionPersonMapping_DivisionType] FOREIGN KEY([DivisionTypeId])
REFERENCES [main].[DivisionType] ([DivisionTypeId])
GO
ALTER TABLE [main].[DivisionPersonMapping] CHECK CONSTRAINT [FK_DivisionPersonMapping_DivisionType]
GO
ALTER TABLE [main].[DivisionPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_DivisionPersonMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[DivisionPersonMapping] CHECK CONSTRAINT [FK_DivisionPersonMapping_Person]
GO
ALTER TABLE [main].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[Driver] CHECK CONSTRAINT [FK_Driver_Person]
GO
ALTER TABLE [main].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Punit] FOREIGN KEY([PunitId])
REFERENCES [equipment].[PUnit] ([PUnitId])
GO
ALTER TABLE [main].[Driver] CHECK CONSTRAINT [FK_Driver_Punit]
GO
ALTER TABLE [main].[DriverPoint]  WITH CHECK ADD  CONSTRAINT [FK_DriverPoint_DriverPointType] FOREIGN KEY([DriverPointTypeId])
REFERENCES [main].[DriverPointType] ([DriverPointTypeId])
GO
ALTER TABLE [main].[DriverPoint] CHECK CONSTRAINT [FK_DriverPoint_DriverPointType]
GO
ALTER TABLE [main].[DriverPoint]  WITH CHECK ADD  CONSTRAINT [FK_DriverPoint_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[DriverPoint] CHECK CONSTRAINT [FK_DriverPoint_Person]
GO
ALTER TABLE [main].[EmploymentHistoryRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_EmploymentHistoryRequest_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[EmploymentHistoryRequest] CHECK CONSTRAINT [FK_EmploymentHistoryRequest_Person]
GO
ALTER TABLE [main].[EntitlementGroupToEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_EntitlementGroupToEntitlement_EntitlementGroupId] FOREIGN KEY([EntitlementGroupId])
REFERENCES [main].[EntitlementGroup] ([EntitlementGroupId])
GO
ALTER TABLE [main].[EntitlementGroupToEntitlement] CHECK CONSTRAINT [FK_EntitlementGroupToEntitlement_EntitlementGroupId]
GO
ALTER TABLE [main].[EntitlementGroupToEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_EntitlementGroupToEntitlement_EntitlementId] FOREIGN KEY([EntitlementId])
REFERENCES [main].[Entitlement] ([EntitlementId])
GO
ALTER TABLE [main].[EntitlementGroupToEntitlement] CHECK CONSTRAINT [FK_EntitlementGroupToEntitlement_EntitlementId]
GO
ALTER TABLE [main].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_FeatureDevStatusType] FOREIGN KEY([FeatureDevStatusTypeId])
REFERENCES [main].[FeatureDevStatusType] ([FeatureDevStatusTypeId])
GO
ALTER TABLE [main].[Feature] CHECK CONSTRAINT [FK_Feature_FeatureDevStatusType]
GO
ALTER TABLE [main].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_ReleaseNote] FOREIGN KEY([ReleaseNoteId])
REFERENCES [main].[ReleaseNote] ([ReleaseNoteId])
GO
ALTER TABLE [main].[Feature] CHECK CONSTRAINT [FK_Feature_ReleaseNote]
GO
ALTER TABLE [main].[FeatureDevStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_FeatureDevStatusHistory_Feature] FOREIGN KEY([FeatureId])
REFERENCES [main].[Feature] ([FeatureId])
GO
ALTER TABLE [main].[FeatureDevStatusHistory] CHECK CONSTRAINT [FK_FeatureDevStatusHistory_Feature]
GO
ALTER TABLE [main].[FeatureDevStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_FeatureDevStatusHistory_FeatureDevStatusType] FOREIGN KEY([FeatureDevStatusTypeId])
REFERENCES [main].[FeatureDevStatusType] ([FeatureDevStatusTypeId])
GO
ALTER TABLE [main].[FeatureDevStatusHistory] CHECK CONSTRAINT [FK_FeatureDevStatusHistory_FeatureDevStatusType]
GO
ALTER TABLE [main].[FeatureDevStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_FeatureDevStatusHistory_Person] FOREIGN KEY([ChangedPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[FeatureDevStatusHistory] CHECK CONSTRAINT [FK_FeatureDevStatusHistory_Person]
GO
ALTER TABLE [main].[LocationPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_LocationPersonMapping_LocationType] FOREIGN KEY([LocationTypeId])
REFERENCES [main].[LocationType] ([LocationTypeId])
GO
ALTER TABLE [main].[LocationPersonMapping] CHECK CONSTRAINT [FK_LocationPersonMapping_LocationType]
GO
ALTER TABLE [main].[LocationPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_LocationPersonMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[LocationPersonMapping] CHECK CONSTRAINT [FK_LocationPersonMapping_Person]
GO
ALTER TABLE [main].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_AvailabilityType] FOREIGN KEY([AvailabilityTypeId])
REFERENCES [main].[AvailabilityType] ([AvailabilityTypeId])
GO
ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_AvailabilityType]
GO
ALTER TABLE [main].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PersonGender] FOREIGN KEY([PersonGenderId])
REFERENCES [main].[PersonGender] ([PersonGenderId])
GO
ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_PersonGender]
GO
ALTER TABLE [main].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Region] FOREIGN KEY([RegionId])
REFERENCES [main].[Region] ([RegionId])
GO
ALTER TABLE [main].[Person] CHECK CONSTRAINT [FK_Person_Region]
GO
ALTER TABLE [main].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_AddressType] FOREIGN KEY([AddressTypeId])
REFERENCES [main].[AddressType] ([AddressTypeId])
GO
ALTER TABLE [main].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_AddressType]
GO
ALTER TABLE [main].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Person]
GO
ALTER TABLE [main].[PersonEmailAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmailAddress_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonEmailAddress] CHECK CONSTRAINT [FK_EmailAddress_Person]
GO
ALTER TABLE [main].[PersonEmploymentHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonEmploymentHistory_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonEmploymentHistory] CHECK CONSTRAINT [FK_PersonEmploymentHistory_Person]
GO
ALTER TABLE [main].[PersonEmploymentHistoryAccident]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonEmploymentHistoryAccident_PersonEmploymentHistory] FOREIGN KEY([PersonEmploymentHistoryId])
REFERENCES [main].[PersonEmploymentHistory] ([PersonEmploymentHistoryId])
GO
ALTER TABLE [main].[PersonEmploymentHistoryAccident] CHECK CONSTRAINT [FK_PersonEmploymentHistoryAccident_PersonEmploymentHistory]
GO
ALTER TABLE [main].[PersonEmploymentHistoryToCommercialEquipmentType]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonEmploymentHistoryToCommercialEquipmentType_CommercialEquipmentType] FOREIGN KEY([CommercialEquipmentTypeId])
REFERENCES [recruiting].[CommercialEquipmentType] ([CommercialEquipmentTypeId])
GO
ALTER TABLE [main].[PersonEmploymentHistoryToCommercialEquipmentType] CHECK CONSTRAINT [FK_PersonEmploymentHistoryToCommercialEquipmentType_CommercialEquipmentType]
GO
ALTER TABLE [main].[PersonEmploymentHistoryToCommercialEquipmentType]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonEmploymentHistoryToCommercialEquipmentType_PersonEmploymentHistory] FOREIGN KEY([PersonEmploymentHistoryId])
REFERENCES [main].[PersonEmploymentHistory] ([PersonEmploymentHistoryId])
GO
ALTER TABLE [main].[PersonEmploymentHistoryToCommercialEquipmentType] CHECK CONSTRAINT [FK_PersonEmploymentHistoryToCommercialEquipmentType_PersonEmploymentHistory]
GO
ALTER TABLE [main].[PersonEntitlementGroup]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntitlementGroup_EntitlementGroupId] FOREIGN KEY([EntitlementGroupId])
REFERENCES [main].[EntitlementGroup] ([EntitlementGroupId])
GO
ALTER TABLE [main].[PersonEntitlementGroup] CHECK CONSTRAINT [FK_PersonEntitlementGroup_EntitlementGroupId]
GO
ALTER TABLE [main].[PersonEntitlementGroup]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntitlementGroup_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonEntitlementGroup] CHECK CONSTRAINT [FK_PersonEntitlementGroup_Person]
GO
ALTER TABLE [main].[PersonEntitlementGroup]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntitlementGroup_Person1] FOREIGN KEY([PersonIdUpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonEntitlementGroup] CHECK CONSTRAINT [FK_PersonEntitlementGroup_Person1]
GO
ALTER TABLE [main].[PersonEntitlementMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntitlementMapping_Entitlement] FOREIGN KEY([EntitlementId])
REFERENCES [main].[Entitlement] ([EntitlementId])
GO
ALTER TABLE [main].[PersonEntitlementMapping] CHECK CONSTRAINT [FK_PersonEntitlementMapping_Entitlement]
GO
ALTER TABLE [main].[PersonEntitlementMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntitlementMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonEntitlementMapping] CHECK CONSTRAINT [FK_PersonEntitlementMapping_Person]
GO
ALTER TABLE [main].[PersonHiringStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_PersonHiringStatusHistory_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonHiringStatusHistory] CHECK CONSTRAINT [FK_PersonHiringStatusHistory_Person]
GO
ALTER TABLE [main].[PersonHiringStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_PersonHiringStatusHistory_Person1] FOREIGN KEY([PersonIdUpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonHiringStatusHistory] CHECK CONSTRAINT [FK_PersonHiringStatusHistory_Person1]
GO
ALTER TABLE [main].[PersonHiringStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_PersonHiringStatusHistory_PersonHiringStatusType] FOREIGN KEY([PersonHiringStatusTypeId])
REFERENCES [main].[PersonHiringStatusType] ([PersonHiringStatusTypeId])
GO
ALTER TABLE [main].[PersonHiringStatusHistory] CHECK CONSTRAINT [FK_PersonHiringStatusHistory_PersonHiringStatusType]
GO
ALTER TABLE [main].[PersonNote]  WITH CHECK ADD  CONSTRAINT [FK_PersonNote] FOREIGN KEY([PersonNoteTypeId])
REFERENCES [main].[PersonNoteType] ([PersonNoteTypeId])
GO
ALTER TABLE [main].[PersonNote] CHECK CONSTRAINT [FK_PersonNote]
GO
ALTER TABLE [main].[PersonNote]  WITH CHECK ADD  CONSTRAINT [FK_PersonNote_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonNote] CHECK CONSTRAINT [FK_PersonNote_Person]
GO
ALTER TABLE [main].[PersonNote]  WITH CHECK ADD  CONSTRAINT [FK_PersonNote_PersonIdUpdatedBy] FOREIGN KEY([PersonIdUpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonNote] CHECK CONSTRAINT [FK_PersonNote_PersonIdUpdatedBy]
GO
ALTER TABLE [main].[PersonPay]  WITH CHECK ADD  CONSTRAINT [FK_PersonPay_EnteredBy] FOREIGN KEY([EnteredBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPay] CHECK CONSTRAINT [FK_PersonPay_EnteredBy]
GO
ALTER TABLE [main].[PersonPay]  WITH CHECK ADD  CONSTRAINT [FK_PersonPay_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPay] CHECK CONSTRAINT [FK_PersonPay_Person]
GO
ALTER TABLE [main].[PersonPay]  WITH CHECK ADD  CONSTRAINT [FK_PersonPayRate] FOREIGN KEY([PayRateId])
REFERENCES [main].[PersonPayRate] ([PersonPayRateId])
GO
ALTER TABLE [main].[PersonPay] CHECK CONSTRAINT [FK_PersonPayRate]
GO
ALTER TABLE [main].[PersonPay_FedExDriver_Default]  WITH CHECK ADD  CONSTRAINT [FK_PersonPay_FedExDriver_Default] FOREIGN KEY([FedExType])
REFERENCES [main].[PersonPay_FedExDriver_Desc] ([FedExType])
GO
ALTER TABLE [main].[PersonPay_FedExDriver_Default] CHECK CONSTRAINT [FK_PersonPay_FedExDriver_Default]
GO
ALTER TABLE [main].[PersonPay_FedExDriver_Default]  WITH CHECK ADD  CONSTRAINT [FK_PersonPay_FedExDriver_Default_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPay_FedExDriver_Default] CHECK CONSTRAINT [FK_PersonPay_FedExDriver_Default_Person]
GO
ALTER TABLE [main].[PersonPayMaster]  WITH CHECK ADD  CONSTRAINT [FK_PersonPayMaster_EnteredBy] FOREIGN KEY([EnteredBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPayMaster] CHECK CONSTRAINT [FK_PersonPayMaster_EnteredBy]
GO
ALTER TABLE [main].[PersonPayMaster]  WITH CHECK ADD  CONSTRAINT [FK_PersonPayMasterRate] FOREIGN KEY([PayRateId])
REFERENCES [main].[PersonPayRate] ([PersonPayRateId])
GO
ALTER TABLE [main].[PersonPayMaster] CHECK CONSTRAINT [FK_PersonPayMasterRate]
GO
ALTER TABLE [main].[PersonPayRateAttributeMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonPayRateAttributeMapping_Attribute] FOREIGN KEY([PersonPayRateAttributeId])
REFERENCES [main].[PersonPayRateAttribute] ([PersonPayRateAttributeId])
GO
ALTER TABLE [main].[PersonPayRateAttributeMapping] CHECK CONSTRAINT [FK_PersonPayRateAttributeMapping_Attribute]
GO
ALTER TABLE [main].[PersonPayRateAttributeMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonPayRateAttributeMapping_PersonPayRate] FOREIGN KEY([PersonPayRateId])
REFERENCES [main].[PersonPayRate] ([PersonPayRateId])
GO
ALTER TABLE [main].[PersonPayRateAttributeMapping] CHECK CONSTRAINT [FK_PersonPayRateAttributeMapping_PersonPayRate]
GO
ALTER TABLE [main].[PersonPhoneNumber]  WITH NOCHECK ADD  CONSTRAINT [FK_PersonPhoneNumber_CellCarrier] FOREIGN KEY([CellCarrierId])
REFERENCES [main].[CellCarrier] ([CellCarrierId])
GO
ALTER TABLE [main].[PersonPhoneNumber] CHECK CONSTRAINT [FK_PersonPhoneNumber_CellCarrier]
GO
ALTER TABLE [main].[PersonPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumber_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPhoneNumber] CHECK CONSTRAINT [FK_PhoneNumber_Person]
GO
ALTER TABLE [main].[PersonPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumber_PhoneNumberType] FOREIGN KEY([PhoneNumberTypeId])
REFERENCES [main].[PhoneNumberType] ([PhoneNumberTypeId])
GO
ALTER TABLE [main].[PersonPhoneNumber] CHECK CONSTRAINT [FK_PhoneNumber_PhoneNumberType]
GO
ALTER TABLE [main].[PersonPreference]  WITH CHECK ADD  CONSTRAINT [FK_PersonPreference_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPreference] CHECK CONSTRAINT [FK_PersonPreference_Person]
GO
ALTER TABLE [main].[PersonPTO]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTO_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPTO] CHECK CONSTRAINT [FK_PersonPTO_Person]
GO
ALTER TABLE [main].[PersonPTO]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTO_PersonPTOType] FOREIGN KEY([PersonPTOTypeId])
REFERENCES [main].[PersonPTOType] ([PersonPTOTypeId])
GO
ALTER TABLE [main].[PersonPTO] CHECK CONSTRAINT [FK_PersonPTO_PersonPTOType]
GO
ALTER TABLE [main].[PersonPTOGroupMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTOGroupMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPTOGroupMapping] CHECK CONSTRAINT [FK_PersonPTOGroupMapping_Person]
GO
ALTER TABLE [main].[PersonPTOGroupMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTOGroupMapping_PersonPTOGroup] FOREIGN KEY([PersonPTOGroupId])
REFERENCES [main].[PersonPTOGroup] ([PersonPTOGroupId])
GO
ALTER TABLE [main].[PersonPTOGroupMapping] CHECK CONSTRAINT [FK_PersonPTOGroupMapping_PersonPTOGroup]
GO
ALTER TABLE [main].[PersonPTOScheduled]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTOScheduled_LastUpdatePerson] FOREIGN KEY([LastUpdatePersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPTOScheduled] CHECK CONSTRAINT [FK_PersonPTOScheduled_LastUpdatePerson]
GO
ALTER TABLE [main].[PersonPTOScheduled]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTOScheduled_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonPTOScheduled] CHECK CONSTRAINT [FK_PersonPTOScheduled_Person]
GO
ALTER TABLE [main].[PersonPTOType]  WITH CHECK ADD  CONSTRAINT [FK_PersonPTOType_PersonPTOGroup] FOREIGN KEY([PersonPTOGroupTypeId])
REFERENCES [main].[PersonPTOGroup] ([PersonPTOGroupId])
GO
ALTER TABLE [main].[PersonPTOType] CHECK CONSTRAINT [FK_PersonPTOType_PersonPTOGroup]
GO
ALTER TABLE [main].[PersonQuitList]  WITH CHECK ADD  CONSTRAINT [FK_PersonQuitList_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonQuitList] CHECK CONSTRAINT [FK_PersonQuitList_Person]
GO
ALTER TABLE [main].[PersonQuitList]  WITH CHECK ADD  CONSTRAINT [FK_PersonQuitList_Person1] FOREIGN KEY([PersonIdUpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonQuitList] CHECK CONSTRAINT [FK_PersonQuitList_Person1]
GO
ALTER TABLE [main].[PersonQuitList]  WITH CHECK ADD  CONSTRAINT [FK_PersonQuitList_PersonQuitListType] FOREIGN KEY([PersonQuitListTypeId])
REFERENCES [main].[PersonQuitListType] ([PersonQuitListTypeId])
GO
ALTER TABLE [main].[PersonQuitList] CHECK CONSTRAINT [FK_PersonQuitList_PersonQuitListType]
GO
ALTER TABLE [main].[PersonTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[PersonTypeMapping] CHECK CONSTRAINT [FK_PersonTypeMapping_Person]
GO
ALTER TABLE [main].[PersonTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeMapping_PersonTypes] FOREIGN KEY([PersonTypeId])
REFERENCES [main].[PersonTypes] ([PersonTypeId])
GO
ALTER TABLE [main].[PersonTypeMapping] CHECK CONSTRAINT [FK_PersonTypeMapping_PersonTypes]
GO
ALTER TABLE [main].[QuickBooksCompanyFileUpdateHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_QuickBooksCompanyFileUpdateHistory_QuickBooksCompanyFileToSync] FOREIGN KEY([CompanyFileToSyncId])
REFERENCES [main].[QuickBooksCompanyFileToSync] ([CompanyFileToSyncId])
GO
ALTER TABLE [main].[QuickBooksCompanyFileUpdateHistory] CHECK CONSTRAINT [FK_QuickBooksCompanyFileUpdateHistory_QuickBooksCompanyFileToSync]
GO
ALTER TABLE [main].[QuickBooksCompanyFileUpdateHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_QuickBooksCompanyFileUpdateHistory_QuickBooksUpdateNeeded] FOREIGN KEY([QuickBooksUpdateNeededId])
REFERENCES [main].[QuickBooksUpdateNeeded] ([QuickBooksUpdateNeededId])
GO
ALTER TABLE [main].[QuickBooksCompanyFileUpdateHistory] CHECK CONSTRAINT [FK_QuickBooksCompanyFileUpdateHistory_QuickBooksUpdateNeeded]
GO
ALTER TABLE [main].[QuickBooksSyncIssueNotificationHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_QuickBooksSyncIssueNotificationHistory_Person] FOREIGN KEY([PersonIdToNotify])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[QuickBooksSyncIssueNotificationHistory] CHECK CONSTRAINT [FK_QuickBooksSyncIssueNotificationHistory_Person]
GO
ALTER TABLE [main].[QuickBooksSyncIssueNotificationPerson]  WITH NOCHECK ADD  CONSTRAINT [FK_QuickBooksSyncIssueNotification_Person] FOREIGN KEY([PersonIdToNotify])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[QuickBooksSyncIssueNotificationPerson] CHECK CONSTRAINT [FK_QuickBooksSyncIssueNotification_Person]
GO
ALTER TABLE [main].[ReleaseNote]  WITH CHECK ADD  CONSTRAINT [FK_ReleaseNote_Person] FOREIGN KEY([CreatedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[ReleaseNote] CHECK CONSTRAINT [FK_ReleaseNote_Person]
GO
ALTER TABLE [main].[ReleaseNote]  WITH CHECK ADD  CONSTRAINT [FK_ReleaseNote_Person1] FOREIGN KEY([TestCompletedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[ReleaseNote] CHECK CONSTRAINT [FK_ReleaseNote_Person1]
GO
ALTER TABLE [main].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Region] FOREIGN KEY([RegionId])
REFERENCES [main].[Region] ([RegionId])
GO
ALTER TABLE [main].[State] CHECK CONSTRAINT [FK_State_Region]
GO
ALTER TABLE [main].[TimeClockEntry]  WITH CHECK ADD  CONSTRAINT [FK_TimeClockEntry_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[TimeClockEntry] CHECK CONSTRAINT [FK_TimeClockEntry_Person]
GO
ALTER TABLE [main].[UsageStatistic]  WITH CHECK ADD  CONSTRAINT [FK_UsageStatistic_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [main].[UsageStatistic] CHECK CONSTRAINT [FK_UsageStatistic_Person]
GO
ALTER TABLE [main].[UsageStatistic]  WITH CHECK ADD  CONSTRAINT [FK_UsageStatistic_UsageStatisticType] FOREIGN KEY([UsageStatisticTypeId])
REFERENCES [main].[UsageStatisticType] ([UsageStatisticTypeId])
GO
ALTER TABLE [main].[UsageStatistic] CHECK CONSTRAINT [FK_UsageStatistic_UsageStatisticType]
GO
ALTER TABLE [quickApp].[QuickAppKSL]  WITH CHECK ADD  CONSTRAINT [FK_QuickAppKSL_QuickAppTrack] FOREIGN KEY([QuickAppId])
REFERENCES [quickApp].[QuickAppTrack] ([QuickAppId])
GO
ALTER TABLE [quickApp].[QuickAppKSL] CHECK CONSTRAINT [FK_QuickAppKSL_QuickAppTrack]
GO
ALTER TABLE [quickApp].[QuickAppTrack]  WITH CHECK ADD  CONSTRAINT [FK_QuickAppData_QuickAppSourceType] FOREIGN KEY([QuickAppSourceId])
REFERENCES [quickApp].[QuickAppSourceType] ([QuickAppSourceId])
GO
ALTER TABLE [quickApp].[QuickAppTrack] CHECK CONSTRAINT [FK_QuickAppData_QuickAppSourceType]
GO
ALTER TABLE [quickApp].[QuickAppWix]  WITH CHECK ADD  CONSTRAINT [FK_WixQuickApp_QuickAppTrack] FOREIGN KEY([QuickAppId])
REFERENCES [quickApp].[QuickAppTrack] ([QuickAppId])
GO
ALTER TABLE [quickApp].[QuickAppWix] CHECK CONSTRAINT [FK_WixQuickApp_QuickAppTrack]
GO
ALTER TABLE [quickApp].[QuickAppWixContactForm]  WITH CHECK ADD  CONSTRAINT [FK_QuickAppWixContactForm_QuickAppTrack] FOREIGN KEY([QuickAppId])
REFERENCES [quickApp].[QuickAppTrack] ([QuickAppId])
GO
ALTER TABLE [quickApp].[QuickAppWixContactForm] CHECK CONSTRAINT [FK_QuickAppWixContactForm_QuickAppTrack]
GO
ALTER TABLE [recruiting].[Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[Accident] CHECK CONSTRAINT [FK_Accident_Profile]
GO
ALTER TABLE [recruiting].[BackgroundCheckOrder]  WITH CHECK ADD  CONSTRAINT [FK_BackgroundCheckOrder_BackgroundCheckScore] FOREIGN KEY([BackgroundCheckScoreId])
REFERENCES [recruiting].[BackgroundCheckScore] ([BackgroundCheckScoreId])
GO
ALTER TABLE [recruiting].[BackgroundCheckOrder] CHECK CONSTRAINT [FK_BackgroundCheckOrder_BackgroundCheckScore]
GO
ALTER TABLE [recruiting].[BackgroundCheckOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileBackgroundCheck_BackgroundCheckStatus] FOREIGN KEY([BackgroundCheckStatusId])
REFERENCES [recruiting].[BackgroundCheckStatus] ([BackgroundCheckStatusId])
GO
ALTER TABLE [recruiting].[BackgroundCheckOrder] CHECK CONSTRAINT [FK_ProfileBackgroundCheck_BackgroundCheckStatus]
GO
ALTER TABLE [recruiting].[BackgroundCheckOrder]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileBackgroundCheck_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[BackgroundCheckOrder] CHECK CONSTRAINT [FK_ProfileBackgroundCheck_Profile]
GO
ALTER TABLE [recruiting].[CustomQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomQuestion_QuickApp] FOREIGN KEY([QuickAppId])
REFERENCES [recruiting].[QuickApp] ([QuickAppId])
GO
ALTER TABLE [recruiting].[CustomQuestion] CHECK CONSTRAINT [FK_CustomQuestion_QuickApp]
GO
ALTER TABLE [recruiting].[DriversLicense]  WITH CHECK ADD  CONSTRAINT [FK_DriversLicense_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[DriversLicense] CHECK CONSTRAINT [FK_DriversLicense_Profile]
GO
ALTER TABLE [recruiting].[DrivingSchool]  WITH CHECK ADD  CONSTRAINT [FK_DrivingSchool_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[DrivingSchool] CHECK CONSTRAINT [FK_DrivingSchool_Profile]
GO
ALTER TABLE [recruiting].[DrivingSchool]  WITH NOCHECK ADD  CONSTRAINT [FK_DrivingSchool_State] FOREIGN KEY([StateId])
REFERENCES [main].[State] ([StateId])
GO
ALTER TABLE [recruiting].[DrivingSchool] NOCHECK CONSTRAINT [FK_DrivingSchool_State]
GO
ALTER TABLE [recruiting].[Employer]  WITH NOCHECK ADD  CONSTRAINT [FK_Employer_EmployerContact] FOREIGN KEY([EmployerContactId])
REFERENCES [recruiting].[EmployerContact] ([EmployerContactId])
GO
ALTER TABLE [recruiting].[Employer] NOCHECK CONSTRAINT [FK_Employer_EmployerContact]
GO
ALTER TABLE [recruiting].[Employer]  WITH CHECK ADD  CONSTRAINT [FK_Employer_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[Employer] CHECK CONSTRAINT [FK_Employer_Profile]
GO
ALTER TABLE [recruiting].[Employer]  WITH NOCHECK ADD  CONSTRAINT [FK_Employer_State] FOREIGN KEY([StateId])
REFERENCES [main].[State] ([StateId])
GO
ALTER TABLE [recruiting].[Employer] NOCHECK CONSTRAINT [FK_Employer_State]
GO
ALTER TABLE [recruiting].[EmployerContact]  WITH NOCHECK ADD  CONSTRAINT [FK_EmployerContact_State] FOREIGN KEY([StateId])
REFERENCES [main].[State] ([StateId])
GO
ALTER TABLE [recruiting].[EmployerContact] CHECK CONSTRAINT [FK_EmployerContact_State]
GO
ALTER TABLE [recruiting].[EmployerToCommercialEquipmentType]  WITH CHECK ADD  CONSTRAINT [FK_EmployerToCommercialEquipmentType_CommercialEquipmentType] FOREIGN KEY([CommercialEquipmentTypeId])
REFERENCES [recruiting].[CommercialEquipmentType] ([CommercialEquipmentTypeId])
GO
ALTER TABLE [recruiting].[EmployerToCommercialEquipmentType] CHECK CONSTRAINT [FK_EmployerToCommercialEquipmentType_CommercialEquipmentType]
GO
ALTER TABLE [recruiting].[EmployerToCommercialEquipmentType]  WITH CHECK ADD  CONSTRAINT [FK_EmployerToCommercialEquipmentType_Employer] FOREIGN KEY([EmployerId])
REFERENCES [recruiting].[Employer] ([EmployerId])
GO
ALTER TABLE [recruiting].[EmployerToCommercialEquipmentType] CHECK CONSTRAINT [FK_EmployerToCommercialEquipmentType_Employer]
GO
ALTER TABLE [recruiting].[EmployerToCommercialWorkType]  WITH CHECK ADD  CONSTRAINT [FK_EmployerToCommercialWorkType_CommercialWorkType] FOREIGN KEY([CommercialWorkTypeId])
REFERENCES [recruiting].[CommercialWorkType] ([CommercialWorkTypeId])
GO
ALTER TABLE [recruiting].[EmployerToCommercialWorkType] CHECK CONSTRAINT [FK_EmployerToCommercialWorkType_CommercialWorkType]
GO
ALTER TABLE [recruiting].[EmployerToCommercialWorkType]  WITH CHECK ADD  CONSTRAINT [FK_EmployerToCommercialWorkType_Employer] FOREIGN KEY([EmployerId])
REFERENCES [recruiting].[Employer] ([EmployerId])
GO
ALTER TABLE [recruiting].[EmployerToCommercialWorkType] CHECK CONSTRAINT [FK_EmployerToCommercialWorkType_Employer]
GO
ALTER TABLE [recruiting].[EventAction]  WITH NOCHECK ADD  CONSTRAINT [FK_EventAction_EventActionType] FOREIGN KEY([EventActionTypeId])
REFERENCES [recruiting].[EventActionType] ([EventActionTypeId])
GO
ALTER TABLE [recruiting].[EventAction] CHECK CONSTRAINT [FK_EventAction_EventActionType]
GO
ALTER TABLE [recruiting].[EventAction]  WITH NOCHECK ADD  CONSTRAINT [FK_EventAction_LeadSource] FOREIGN KEY([LeadSourceId])
REFERENCES [recruiting].[LeadSource] ([LeadSourceId])
GO
ALTER TABLE [recruiting].[EventAction] CHECK CONSTRAINT [FK_EventAction_LeadSource]
GO
ALTER TABLE [recruiting].[EventAction]  WITH NOCHECK ADD  CONSTRAINT [FK_EventAction_ProfileEventType] FOREIGN KEY([EventActionTriggerId])
REFERENCES [recruiting].[EventActionTrigger] ([EventActionTriggerId])
GO
ALTER TABLE [recruiting].[EventAction] CHECK CONSTRAINT [FK_EventAction_ProfileEventType]
GO
ALTER TABLE [recruiting].[EventAction]  WITH NOCHECK ADD  CONSTRAINT [FK_EventAction_ProfileStage] FOREIGN KEY([ProfileStageId])
REFERENCES [recruiting].[ProfileStage] ([ProfileStageId])
GO
ALTER TABLE [recruiting].[EventAction] CHECK CONSTRAINT [FK_EventAction_ProfileStage]
GO
ALTER TABLE [recruiting].[EventActionDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_EventActionDetail_EventAction] FOREIGN KEY([EventActionId])
REFERENCES [recruiting].[EventAction] ([EventActionId])
GO
ALTER TABLE [recruiting].[EventActionDetail] CHECK CONSTRAINT [FK_EventActionDetail_EventAction]
GO
ALTER TABLE [recruiting].[EventActionDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_EventActionDetail_ExternalMessageType] FOREIGN KEY([ExternalMessageTypeId])
REFERENCES [recruiting].[ExternalMessageType] ([ExternalMessageTypeId])
GO
ALTER TABLE [recruiting].[EventActionDetail] CHECK CONSTRAINT [FK_EventActionDetail_ExternalMessageType]
GO
ALTER TABLE [recruiting].[ExternalMessage]  WITH CHECK ADD  CONSTRAINT [FK_ExternalMessage_ExternalMessageType] FOREIGN KEY([ExternalMessageTypeId])
REFERENCES [recruiting].[ExternalMessageType] ([ExternalMessageTypeId])
GO
ALTER TABLE [recruiting].[ExternalMessage] CHECK CONSTRAINT [FK_ExternalMessage_ExternalMessageType]
GO
ALTER TABLE [recruiting].[ExternalMessage]  WITH CHECK ADD  CONSTRAINT [FK_ExternalMessage_Person] FOREIGN KEY([SenderId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [recruiting].[ExternalMessage] CHECK CONSTRAINT [FK_ExternalMessage_Person]
GO
ALTER TABLE [recruiting].[ExternalMessage]  WITH CHECK ADD  CONSTRAINT [FK_ExternalMessage_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[ExternalMessage] CHECK CONSTRAINT [FK_ExternalMessage_Profile]
GO
ALTER TABLE [recruiting].[ExternalMessageAttachment]  WITH CHECK ADD  CONSTRAINT [FK_ExternalMessageAttachment_ExternalMessage] FOREIGN KEY([ExternalMessageId])
REFERENCES [recruiting].[ExternalMessage] ([ExternalMessageId])
GO
ALTER TABLE [recruiting].[ExternalMessageAttachment] CHECK CONSTRAINT [FK_ExternalMessageAttachment_ExternalMessage]
GO
ALTER TABLE [recruiting].[LeadConnector]  WITH NOCHECK ADD  CONSTRAINT [FK_LeadConnector_LeadSource] FOREIGN KEY([LeadSourceId])
REFERENCES [recruiting].[LeadSource] ([LeadSourceId])
GO
ALTER TABLE [recruiting].[LeadConnector] CHECK CONSTRAINT [FK_LeadConnector_LeadSource]
GO
ALTER TABLE [recruiting].[MilitaryService]  WITH CHECK ADD  CONSTRAINT [FK_MilitaryService_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[MilitaryService] CHECK CONSTRAINT [FK_MilitaryService_Profile]
GO
ALTER TABLE [recruiting].[MovingViolation]  WITH CHECK ADD  CONSTRAINT [FK_MovingViolation_MovingViolationCharge] FOREIGN KEY([ChargeId])
REFERENCES [recruiting].[MovingViolationCharge] ([MovingViolationChargeId])
GO
ALTER TABLE [recruiting].[MovingViolation] CHECK CONSTRAINT [FK_MovingViolation_MovingViolationCharge]
GO
ALTER TABLE [recruiting].[MovingViolation]  WITH CHECK ADD  CONSTRAINT [FK_MovingViolation_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[MovingViolation] CHECK CONSTRAINT [FK_MovingViolation_Profile]
GO
ALTER TABLE [recruiting].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_LeadSource] FOREIGN KEY([LeadSourceId])
REFERENCES [recruiting].[LeadSource] ([LeadSourceId])
GO
ALTER TABLE [recruiting].[Profile] CHECK CONSTRAINT [FK_Profile_LeadSource]
GO
ALTER TABLE [recruiting].[Profile]  WITH NOCHECK ADD  CONSTRAINT [FK_Profile_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [recruiting].[Profile] NOCHECK CONSTRAINT [FK_Profile_Person]
GO
ALTER TABLE [recruiting].[Profile]  WITH NOCHECK ADD  CONSTRAINT [FK_Profile_Position] FOREIGN KEY([PositionId])
REFERENCES [recruiting].[Position] ([PositionId])
GO
ALTER TABLE [recruiting].[Profile] CHECK CONSTRAINT [FK_Profile_Position]
GO
ALTER TABLE [recruiting].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[Profile] CHECK CONSTRAINT [FK_Profile_Profile]
GO
ALTER TABLE [recruiting].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_ProfileGender] FOREIGN KEY([ProfileGenderId])
REFERENCES [recruiting].[ProfileGender] ([ProfileGenderId])
GO
ALTER TABLE [recruiting].[Profile] CHECK CONSTRAINT [FK_Profile_ProfileGender]
GO
ALTER TABLE [recruiting].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_ProfileStage] FOREIGN KEY([ProfileStageId])
REFERENCES [recruiting].[ProfileStage] ([ProfileStageId])
GO
ALTER TABLE [recruiting].[Profile] CHECK CONSTRAINT [FK_Profile_ProfileStage]
GO
ALTER TABLE [recruiting].[Profile]  WITH NOCHECK ADD  CONSTRAINT [FK_Profile_ProfileStatus] FOREIGN KEY([ProfileStatusId])
REFERENCES [recruiting].[ProfileStatus] ([ProfileStatusId])
GO
ALTER TABLE [recruiting].[Profile] NOCHECK CONSTRAINT [FK_Profile_ProfileStatus]
GO
ALTER TABLE [recruiting].[Profile]  WITH NOCHECK ADD  CONSTRAINT [FK_Profile_ProfileType] FOREIGN KEY([ProfileTypeId])
REFERENCES [recruiting].[ProfileType] ([ProfileTypeId])
GO
ALTER TABLE [recruiting].[Profile] NOCHECK CONSTRAINT [FK_Profile_ProfileType]
GO
ALTER TABLE [recruiting].[ProfileAddress]  WITH CHECK ADD  CONSTRAINT [FK_ProfileAddress_AddressType] FOREIGN KEY([AddressTypeId])
REFERENCES [main].[AddressType] ([AddressTypeId])
GO
ALTER TABLE [recruiting].[ProfileAddress] CHECK CONSTRAINT [FK_ProfileAddress_AddressType]
GO
ALTER TABLE [recruiting].[ProfileAddress]  WITH CHECK ADD  CONSTRAINT [FK_ProfileAddress_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[ProfileAddress] CHECK CONSTRAINT [FK_ProfileAddress_Profile]
GO
ALTER TABLE [recruiting].[ProfileBackgroundCheck]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileBackgroundCheck_ProfileBackgroundCheck] FOREIGN KEY([BackgroundCheckStatusId])
REFERENCES [recruiting].[BackgroundCheckStatus] ([BackgroundCheckStatusId])
GO
ALTER TABLE [recruiting].[ProfileBackgroundCheck] CHECK CONSTRAINT [FK_ProfileBackgroundCheck_ProfileBackgroundCheck]
GO
ALTER TABLE [recruiting].[ProfileChecklistItem]  WITH CHECK ADD  CONSTRAINT [FK_ProfileChecklistItem_CheckListItemType] FOREIGN KEY([CheckListItemTypeId])
REFERENCES [recruiting].[CheckListItemType] ([CheckListItemTypeId])
GO
ALTER TABLE [recruiting].[ProfileChecklistItem] CHECK CONSTRAINT [FK_ProfileChecklistItem_CheckListItemType]
GO
ALTER TABLE [recruiting].[ProfileChecklistItem]  WITH CHECK ADD  CONSTRAINT [FK_ProfileChecklistItem_Profile] FOREIGN KEY([ProflleId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[ProfileChecklistItem] CHECK CONSTRAINT [FK_ProfileChecklistItem_Profile]
GO
ALTER TABLE [recruiting].[ProfileChecklistItem]  WITH CHECK ADD  CONSTRAINT [FK_ProfileChecklistItem_Profile1] FOREIGN KEY([UpdatedBy])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [recruiting].[ProfileChecklistItem] CHECK CONSTRAINT [FK_ProfileChecklistItem_Profile1]
GO
ALTER TABLE [recruiting].[ProfileCode]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileCode_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[ProfileCode] CHECK CONSTRAINT [FK_ProfileCode_Profile]
GO
ALTER TABLE [recruiting].[ProfileDocument]  WITH CHECK ADD  CONSTRAINT [FK_ProfileDocument_DocumentType] FOREIGN KEY([DocumentTypeId])
REFERENCES [recruiting].[DocumentType] ([DocumentTypeId])
GO
ALTER TABLE [recruiting].[ProfileDocument] CHECK CONSTRAINT [FK_ProfileDocument_DocumentType]
GO
ALTER TABLE [recruiting].[ProfileDocument]  WITH CHECK ADD  CONSTRAINT [FK_ProfileDocument_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[ProfileDocument] CHECK CONSTRAINT [FK_ProfileDocument_Profile]
GO
ALTER TABLE [recruiting].[ProfileEducation]  WITH CHECK ADD  CONSTRAINT [FK_ProfileEducation_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[ProfileEducation] CHECK CONSTRAINT [FK_ProfileEducation_Profile]
GO
ALTER TABLE [recruiting].[ProfileEvent]  WITH CHECK ADD  CONSTRAINT [FK_ProfileEvent_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [recruiting].[ProfileEvent] CHECK CONSTRAINT [FK_ProfileEvent_Person]
GO
ALTER TABLE [recruiting].[ProfileEvent]  WITH CHECK ADD  CONSTRAINT [FK_ProfileEvent_ProfileEventSource] FOREIGN KEY([ProfileEventSourceId])
REFERENCES [recruiting].[ProfileEventSource] ([ProfileEventSourceId])
GO
ALTER TABLE [recruiting].[ProfileEvent] CHECK CONSTRAINT [FK_ProfileEvent_ProfileEventSource]
GO
ALTER TABLE [recruiting].[ProfileEvent]  WITH CHECK ADD  CONSTRAINT [FK_ProfileEvent_ProfileEventType] FOREIGN KEY([ProfileEventTypeId])
REFERENCES [recruiting].[ProfileEventType] ([ProfileEventTypeId])
GO
ALTER TABLE [recruiting].[ProfileEvent] CHECK CONSTRAINT [FK_ProfileEvent_ProfileEventType]
GO
ALTER TABLE [recruiting].[ProfileEventDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProfileEventDetail_ProfileEvent] FOREIGN KEY([ProfileEventId])
REFERENCES [recruiting].[ProfileEvent] ([ProfileEventId])
GO
ALTER TABLE [recruiting].[ProfileEventDetail] CHECK CONSTRAINT [FK_ProfileEventDetail_ProfileEvent]
GO
ALTER TABLE [recruiting].[ProfilePhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProfilePhoneNumber_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[ProfilePhoneNumber] CHECK CONSTRAINT [FK_ProfilePhoneNumber_Profile]
GO
ALTER TABLE [recruiting].[ProfileSignature]  WITH CHECK ADD  CONSTRAINT [FK_ProfileSignature_ProfileSignature] FOREIGN KEY([ProfileSignatureId])
REFERENCES [recruiting].[ProfileSignature] ([ProfileSignatureId])
GO
ALTER TABLE [recruiting].[ProfileSignature] CHECK CONSTRAINT [FK_ProfileSignature_ProfileSignature]
GO
ALTER TABLE [recruiting].[ProfileSignature]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfileSignature_SignatureImage] FOREIGN KEY([SignatureImageId])
REFERENCES [recruiting].[SignatureImage] ([SignatureImageId])
GO
ALTER TABLE [recruiting].[ProfileSignature] CHECK CONSTRAINT [FK_ProfileSignature_SignatureImage]
GO
ALTER TABLE [recruiting].[ProfileSignature]  WITH CHECK ADD  CONSTRAINT [FK_ProfileSignature_SignatureType] FOREIGN KEY([SignatureTypeId])
REFERENCES [recruiting].[SignatureType] ([SignatureTypeId])
GO
ALTER TABLE [recruiting].[ProfileSignature] CHECK CONSTRAINT [FK_ProfileSignature_SignatureType]
GO
ALTER TABLE [recruiting].[QuickApp]  WITH NOCHECK ADD  CONSTRAINT [FK_QuickApp_LeadSource] FOREIGN KEY([LeadSourceId])
REFERENCES [recruiting].[LeadSource] ([LeadSourceId])
GO
ALTER TABLE [recruiting].[QuickApp] CHECK CONSTRAINT [FK_QuickApp_LeadSource]
GO
ALTER TABLE [recruiting].[QuickApp]  WITH NOCHECK ADD  CONSTRAINT [FK_QuickApp_ProfileStage] FOREIGN KEY([ProfileStageId])
REFERENCES [recruiting].[ProfileStage] ([ProfileStageId])
GO
ALTER TABLE [recruiting].[QuickApp] CHECK CONSTRAINT [FK_QuickApp_ProfileStage]
GO
ALTER TABLE [recruiting].[Unemployment]  WITH CHECK ADD  CONSTRAINT [FK_Unemployment_Profile] FOREIGN KEY([ProfileId])
REFERENCES [recruiting].[Profile] ([ProfileId])
GO
ALTER TABLE [recruiting].[Unemployment] CHECK CONSTRAINT [FK_Unemployment_Profile]
GO
ALTER TABLE [recruiting].[VerificationRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequest_Employer] FOREIGN KEY([EmployerId])
REFERENCES [recruiting].[Employer] ([EmployerId])
GO
ALTER TABLE [recruiting].[VerificationRequest] CHECK CONSTRAINT [FK_VerificationRequest_Employer]
GO
ALTER TABLE [recruiting].[VerificationRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequest_ProfileDocument] FOREIGN KEY([ProfileDocumentId])
REFERENCES [recruiting].[ProfileDocument] ([ProfileDocumentId])
GO
ALTER TABLE [recruiting].[VerificationRequest] CHECK CONSTRAINT [FK_VerificationRequest_ProfileDocument]
GO
ALTER TABLE [recruiting].[VerificationRequest]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequest_VerificationRequestStatus] FOREIGN KEY([VerificationRequestStatusId])
REFERENCES [recruiting].[VerificationRequestStatus] ([VerificationRequestStatusId])
GO
ALTER TABLE [recruiting].[VerificationRequest] CHECK CONSTRAINT [FK_VerificationRequest_VerificationRequestStatus]
GO
ALTER TABLE [recruiting].[VerificationRequestAccident]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestAccident_State] FOREIGN KEY([StateId])
REFERENCES [main].[State] ([StateId])
GO
ALTER TABLE [recruiting].[VerificationRequestAccident] CHECK CONSTRAINT [FK_VerificationRequestAccident_State]
GO
ALTER TABLE [recruiting].[VerificationRequestAccident]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestAccident_VerificationRequest] FOREIGN KEY([VerificationRequestId])
REFERENCES [recruiting].[VerificationRequest] ([VerificationRequestId])
GO
ALTER TABLE [recruiting].[VerificationRequestAccident] CHECK CONSTRAINT [FK_VerificationRequestAccident_VerificationRequest]
GO
ALTER TABLE [recruiting].[VerificationRequestAttempt]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestAttempt_Person] FOREIGN KEY([CreatedByUser])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [recruiting].[VerificationRequestAttempt] CHECK CONSTRAINT [FK_VerificationRequestAttempt_Person]
GO
ALTER TABLE [recruiting].[VerificationRequestAttempt]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestAttempt_VerificationRequest] FOREIGN KEY([VerificationRequestId])
REFERENCES [recruiting].[VerificationRequest] ([VerificationRequestId])
GO
ALTER TABLE [recruiting].[VerificationRequestAttempt] CHECK CONSTRAINT [FK_VerificationRequestAttempt_VerificationRequest]
GO
ALTER TABLE [recruiting].[VerificationRequestToCommercialEquipmentType]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_CommercialEquipmentType] FOREIGN KEY([CommercialEquipmentTypeId])
REFERENCES [recruiting].[CommercialEquipmentType] ([CommercialEquipmentTypeId])
GO
ALTER TABLE [recruiting].[VerificationRequestToCommercialEquipmentType] CHECK CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_CommercialEquipmentType]
GO
ALTER TABLE [recruiting].[VerificationRequestToCommercialEquipmentType]  WITH NOCHECK ADD  CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_VerificationRequest] FOREIGN KEY([VerificationRequestId])
REFERENCES [recruiting].[VerificationRequest] ([VerificationRequestId])
GO
ALTER TABLE [recruiting].[VerificationRequestToCommercialEquipmentType] CHECK CONSTRAINT [FK_VerificationRequestToCommercialEquipmentType_VerificationRequest]
GO
ALTER TABLE [Service].[ItemAssembly]  WITH CHECK ADD  CONSTRAINT [FK_ItemAssembly_ItemAssembly] FOREIGN KEY([AssemblyId])
REFERENCES [Service].[ItemAssembly] ([AssemblyId])
GO
ALTER TABLE [Service].[ItemAssembly] CHECK CONSTRAINT [FK_ItemAssembly_ItemAssembly]
GO
ALTER TABLE [Service].[ItemList]  WITH CHECK ADD  CONSTRAINT [FK_ItemList_ItemType] FOREIGN KEY([TypeId])
REFERENCES [Service].[ItemType] ([TypeId])
GO
ALTER TABLE [Service].[ItemList] CHECK CONSTRAINT [FK_ItemList_ItemType]
GO
ALTER TABLE [Service].[LaborStory]  WITH CHECK ADD  CONSTRAINT [FK_LaborStory_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [Service].[OrderDetail] ([OrderDetailId])
GO
ALTER TABLE [Service].[LaborStory] CHECK CONSTRAINT [FK_LaborStory_OrderDetail]
GO
ALTER TABLE [Service].[OrderClock]  WITH CHECK ADD  CONSTRAINT [FK_OrderClock_OrderDetail1] FOREIGN KEY([OrderDetailId])
REFERENCES [Service].[OrderDetail] ([OrderDetailId])
GO
ALTER TABLE [Service].[OrderClock] CHECK CONSTRAINT [FK_OrderClock_OrderDetail1]
GO
ALTER TABLE [Service].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_Service.OrderDetail_ItemList] FOREIGN KEY([ItemId])
REFERENCES [Service].[ItemList] ([ItemId])
GO
ALTER TABLE [Service].[OrderDetail] CHECK CONSTRAINT [FK_Service.OrderDetail_ItemList]
GO
ALTER TABLE [Service].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_Service.OrderDetail_WorkOrder] FOREIGN KEY([OrderId])
REFERENCES [Service].[WorkOrder] ([OrderId])
GO
ALTER TABLE [Service].[OrderDetail] CHECK CONSTRAINT [FK_Service.OrderDetail_WorkOrder]
GO
ALTER TABLE [Service].[ServiceHistory]  WITH CHECK ADD  CONSTRAINT [FK_ServiceHistory_ServiceHistory] FOREIGN KEY([ServiceId])
REFERENCES [Service].[ServiceHistory] ([ServiceId])
GO
ALTER TABLE [Service].[ServiceHistory] CHECK CONSTRAINT [FK_ServiceHistory_ServiceHistory]
GO
ALTER TABLE [Service].[ServiceStatus]  WITH CHECK ADD  CONSTRAINT [FK_ServiceStatus_ServiceStatusType] FOREIGN KEY([ServiceStatusTypeId])
REFERENCES [Service].[ServiceStatusType] ([ServiceStatusTypeId])
GO
ALTER TABLE [Service].[ServiceStatus] CHECK CONSTRAINT [FK_ServiceStatus_ServiceStatusType]
GO
ALTER TABLE [Service].[ServiceStatus]  WITH CHECK ADD  CONSTRAINT [FK_ServiceStatus_WorkOrder] FOREIGN KEY([WorkOrderId])
REFERENCES [Service].[WorkOrder] ([OrderId])
GO
ALTER TABLE [Service].[ServiceStatus] CHECK CONSTRAINT [FK_ServiceStatus_WorkOrder]
GO
ALTER TABLE [Service].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Client] FOREIGN KEY([ClientId])
REFERENCES [main].[Client] ([ClientId])
GO
ALTER TABLE [Service].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Client]
GO
ALTER TABLE [Service].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Person] FOREIGN KEY([CreatedPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Service].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Person]
GO
ALTER TABLE [Vendor].[Carrier]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[Carrier] CHECK CONSTRAINT [FK_Carrier_Carrier]
GO
ALTER TABLE [Vendor].[Carrier]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_Person] FOREIGN KEY([CreatedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[Carrier] CHECK CONSTRAINT [FK_Carrier_Person]
GO
ALTER TABLE [Vendor].[Carrier]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_StatusType] FOREIGN KEY([VendorStatusTypeId])
REFERENCES [Vendor].[VendorStatusType] ([VendorStatusTypeId])
GO
ALTER TABLE [Vendor].[Carrier] CHECK CONSTRAINT [FK_Carrier_StatusType]
GO
ALTER TABLE [Vendor].[Carrier]  WITH CHECK ADD  CONSTRAINT [FK_Carrier_VendorType] FOREIGN KEY([VendorTypeId])
REFERENCES [Vendor].[VendorType] ([VendorTypeId])
GO
ALTER TABLE [Vendor].[Carrier] CHECK CONSTRAINT [FK_Carrier_VendorType]
GO
ALTER TABLE [Vendor].[CarrierPay]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPay_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[CarrierPay] CHECK CONSTRAINT [FK_CarrierPay_Carrier]
GO
ALTER TABLE [Vendor].[CarrierPay]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPay_Person] FOREIGN KEY([ApprovedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[CarrierPay] CHECK CONSTRAINT [FK_CarrierPay_Person]
GO
ALTER TABLE [Vendor].[CarrierPay]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPay_Person1] FOREIGN KEY([EnteredByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[CarrierPay] CHECK CONSTRAINT [FK_CarrierPay_Person1]
GO
ALTER TABLE [Vendor].[CarrierPay]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPay_VendorPayCode] FOREIGN KEY([VendorPayCodeId])
REFERENCES [Vendor].[VendorPayCode] ([VendorPayCodeId])
GO
ALTER TABLE [Vendor].[CarrierPay] CHECK CONSTRAINT [FK_CarrierPay_VendorPayCode]
GO
ALTER TABLE [Vendor].[CarrierPay]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPay_VendorPaymentState] FOREIGN KEY([VendorPaymentStateId])
REFERENCES [Vendor].[VendorPaymentState] ([VendorPaymentStateId])
GO
ALTER TABLE [Vendor].[CarrierPay] CHECK CONSTRAINT [FK_CarrierPay_VendorPaymentState]
GO
ALTER TABLE [Vendor].[CarrierPay]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPay_VendorPayType] FOREIGN KEY([VendorPayTypeId])
REFERENCES [Vendor].[VendorPayType] ([VendorPayTypeId])
GO
ALTER TABLE [Vendor].[CarrierPay] CHECK CONSTRAINT [FK_CarrierPay_VendorPayType]
GO
ALTER TABLE [Vendor].[CarrierPayQBMapping]  WITH CHECK ADD  CONSTRAINT [FK_CarrierPayQBMapping_AccChargeType] FOREIGN KEY([AccChargeTypeId])
REFERENCES [dispatch].[AccChargeType] ([AccChargeTypeId])
GO
ALTER TABLE [Vendor].[CarrierPayQBMapping] CHECK CONSTRAINT [FK_CarrierPayQBMapping_AccChargeType]
GO
ALTER TABLE [Vendor].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[Insurance] CHECK CONSTRAINT [FK_Insurance_Carrier]
GO
ALTER TABLE [Vendor].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_InsuranceType] FOREIGN KEY([InsuranceTypeId])
REFERENCES [Vendor].[InsuranceType] ([InsuranceTypeId])
GO
ALTER TABLE [Vendor].[Insurance] CHECK CONSTRAINT [FK_Insurance_InsuranceType]
GO
ALTER TABLE [Vendor].[VendorAddress]  WITH CHECK ADD  CONSTRAINT [FK_VendorAddress_AddressType] FOREIGN KEY([AddressTypeId])
REFERENCES [main].[AddressType] ([AddressTypeId])
GO
ALTER TABLE [Vendor].[VendorAddress] CHECK CONSTRAINT [FK_VendorAddress_AddressType]
GO
ALTER TABLE [Vendor].[VendorAddress]  WITH CHECK ADD  CONSTRAINT [FK_VendorAddress_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorAddress] CHECK CONSTRAINT [FK_VendorAddress_Carrier]
GO
ALTER TABLE [Vendor].[VendorContactMapping]  WITH CHECK ADD  CONSTRAINT [FK_VendorContactMapping_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorContactMapping] CHECK CONSTRAINT [FK_VendorContactMapping_Carrier]
GO
ALTER TABLE [Vendor].[VendorContactMapping]  WITH CHECK ADD  CONSTRAINT [FK_VendorContactMapping_Person] FOREIGN KEY([PersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[VendorContactMapping] CHECK CONSTRAINT [FK_VendorContactMapping_Person]
GO
ALTER TABLE [Vendor].[VendorDocument]  WITH CHECK ADD  CONSTRAINT [FK_VendorDocument_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorDocument] CHECK CONSTRAINT [FK_VendorDocument_Carrier]
GO
ALTER TABLE [Vendor].[VendorDocument]  WITH CHECK ADD  CONSTRAINT [FK_VendorDocument_VendorDocType] FOREIGN KEY([VendorDocTypeId])
REFERENCES [Vendor].[VendorDocType] ([VendorDocTypeId])
GO
ALTER TABLE [Vendor].[VendorDocument] CHECK CONSTRAINT [FK_VendorDocument_VendorDocType]
GO
ALTER TABLE [Vendor].[VendorExpirationDate]  WITH CHECK ADD  CONSTRAINT [FK_VendorExpirationDate_VendorExpirationDateTypes] FOREIGN KEY([VendorExpirationDateTypeId])
REFERENCES [Vendor].[VendorExpirationDateTypes] ([VendorExpirationDateTypeId])
GO
ALTER TABLE [Vendor].[VendorExpirationDate] CHECK CONSTRAINT [FK_VendorExpirationDate_VendorExpirationDateTypes]
GO
ALTER TABLE [Vendor].[VendorFuelSurcharge]  WITH CHECK ADD  CONSTRAINT [FK_VendorFuelSurcharge_Client] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorFuelSurcharge] CHECK CONSTRAINT [FK_VendorFuelSurcharge_Client]
GO
ALTER TABLE [Vendor].[VendorFuelSurcharge]  WITH CHECK ADD  CONSTRAINT [FK_VendorFuelSurcharge_Vendor] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorFuelSurcharge] CHECK CONSTRAINT [FK_VendorFuelSurcharge_Vendor]
GO
ALTER TABLE [Vendor].[VendorFuelSurcharge_WeekEnding]  WITH CHECK ADD  CONSTRAINT [FK_VendorFuelSurcharge_WeekEnding_Vendor] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorFuelSurcharge_WeekEnding] CHECK CONSTRAINT [FK_VendorFuelSurcharge_WeekEnding_Vendor]
GO
ALTER TABLE [Vendor].[VendorMC]  WITH CHECK ADD  CONSTRAINT [FK_VendorMC_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorMC] CHECK CONSTRAINT [FK_VendorMC_Carrier]
GO
ALTER TABLE [Vendor].[VendorPay]  WITH CHECK ADD  CONSTRAINT [FK_VendorPay_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorPay] CHECK CONSTRAINT [FK_VendorPay_Carrier]
GO
ALTER TABLE [Vendor].[VendorPay]  WITH CHECK ADD  CONSTRAINT [FK_VendorPay_Person] FOREIGN KEY([ApprovedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[VendorPay] CHECK CONSTRAINT [FK_VendorPay_Person]
GO
ALTER TABLE [Vendor].[VendorPay]  WITH CHECK ADD  CONSTRAINT [FK_VendorPay_Person1] FOREIGN KEY([EnteredByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[VendorPay] CHECK CONSTRAINT [FK_VendorPay_Person1]
GO
ALTER TABLE [Vendor].[VendorPay]  WITH CHECK ADD  CONSTRAINT [FK_VendorPay_VendorPayCode] FOREIGN KEY([VendorPayCodeId])
REFERENCES [Vendor].[VendorPayCode] ([VendorPayCodeId])
GO
ALTER TABLE [Vendor].[VendorPay] CHECK CONSTRAINT [FK_VendorPay_VendorPayCode]
GO
ALTER TABLE [Vendor].[VendorPay]  WITH CHECK ADD  CONSTRAINT [FK_VendorPay_VendorPaymentState] FOREIGN KEY([VendorPaymentStateId])
REFERENCES [Vendor].[VendorPaymentState] ([VendorPaymentStateId])
GO
ALTER TABLE [Vendor].[VendorPay] CHECK CONSTRAINT [FK_VendorPay_VendorPaymentState]
GO
ALTER TABLE [Vendor].[VendorPay]  WITH CHECK ADD  CONSTRAINT [FK_VendorPay_VendorPayType] FOREIGN KEY([VendorPayTypeId])
REFERENCES [Vendor].[VendorPayType] ([VendorPayTypeId])
GO
ALTER TABLE [Vendor].[VendorPay] CHECK CONSTRAINT [FK_VendorPay_VendorPayType]
GO
ALTER TABLE [Vendor].[VendorPayCode]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayCode_Person] FOREIGN KEY([CreatedByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[VendorPayCode] CHECK CONSTRAINT [FK_VendorPayCode_Person]
GO
ALTER TABLE [Vendor].[VendorPayCode]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayCode_VendorPayType] FOREIGN KEY([VendorPayTypeId])
REFERENCES [Vendor].[VendorPayType] ([VendorPayTypeId])
GO
ALTER TABLE [Vendor].[VendorPayCode] CHECK CONSTRAINT [FK_VendorPayCode_VendorPayType]
GO
ALTER TABLE [Vendor].[VendorPayMemorized]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayMemorized_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorPayMemorized] CHECK CONSTRAINT [FK_VendorPayMemorized_Carrier]
GO
ALTER TABLE [Vendor].[VendorPayMemorized]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayMemorized_Person] FOREIGN KEY([EnteredByPersonId])
REFERENCES [main].[Person] ([PersonId])
GO
ALTER TABLE [Vendor].[VendorPayMemorized] CHECK CONSTRAINT [FK_VendorPayMemorized_Person]
GO
ALTER TABLE [Vendor].[VendorPayMemorized]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayMemorized_VendorPayCode] FOREIGN KEY([VendorPayCodeId])
REFERENCES [Vendor].[VendorPayCode] ([VendorPayCodeId])
GO
ALTER TABLE [Vendor].[VendorPayMemorized] CHECK CONSTRAINT [FK_VendorPayMemorized_VendorPayCode]
GO
ALTER TABLE [Vendor].[VendorPayMemorized]  WITH CHECK ADD  CONSTRAINT [FK_VendorPayMemorized_VendorPayType] FOREIGN KEY([VendorPayTypeId])
REFERENCES [Vendor].[VendorPayType] ([VendorPayTypeId])
GO
ALTER TABLE [Vendor].[VendorPayMemorized] CHECK CONSTRAINT [FK_VendorPayMemorized_VendorPayType]
GO
ALTER TABLE [Vendor].[VendorPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_VendorPhoneNumber_PhoneNumberType] FOREIGN KEY([PhoneNumberTypeId])
REFERENCES [main].[PhoneNumberType] ([PhoneNumberTypeId])
GO
ALTER TABLE [Vendor].[VendorPhoneNumber] CHECK CONSTRAINT [FK_VendorPhoneNumber_PhoneNumberType]
GO
ALTER TABLE [Vendor].[VendorPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_VendorPhoneNumber_Vendor] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorPhoneNumber] CHECK CONSTRAINT [FK_VendorPhoneNumber_Vendor]
GO
ALTER TABLE [Vendor].[VendorRating]  WITH CHECK ADD  CONSTRAINT [FK_VendorRating_Carrier] FOREIGN KEY([VendorId])
REFERENCES [Vendor].[Carrier] ([VendorId])
GO
ALTER TABLE [Vendor].[VendorRating] CHECK CONSTRAINT [FK_VendorRating_Carrier]
GO
ALTER TABLE [Vendor].[VendorRating]  WITH CHECK ADD  CONSTRAINT [FK_VendorRating_VendorRatingType] FOREIGN KEY([VendorRatingTypeId])
REFERENCES [Vendor].[VendorRatingType] ([VendorRatingTypeId])
GO
ALTER TABLE [Vendor].[VendorRating] CHECK CONSTRAINT [FK_VendorRating_VendorRatingType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Textbox, Checkbox, DropdownList, RadioButton, Checkbox' , @level0type=N'SCHEMA',@level0name=N'factoring', @level1type=N'TABLE',@level1name=N'PlanFields', @level2type=N'COLUMN',@level2name=N'PlanFieldId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ensure FeatureName field is Unique' , @level0type=N'SCHEMA',@level0name=N'main', @level1type=N'TABLE',@level1name=N'Feature', @level2type=N'CONSTRAINT',@level2name=N'UC_FeatureName'
GO
