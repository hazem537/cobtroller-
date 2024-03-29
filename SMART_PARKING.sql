USE [SMRT_PARKING]
GO
/****** Object:  Table [dbo].[FSB_Apps]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Apps](
	[App_ID] [int] IDENTITY(1,1) NOT NULL,
	[App_Nam] [nvarchar](150) NULL,
	[App_Desc] [nvarchar](150) NULL,
	[InterfaceID] [int] NULL,
	[Form_Name] [nvarchar](50) NULL,
	[App_Nam_EN] [nvarchar](150) NULL,
	[ButtonName] [nvarchar](150) NULL,
	[SWID] [int] NULL,
 CONSTRAINT [PK_FSB_Apps] PRIMARY KEY CLUSTERED 
(
	[App_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Apps_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Apps_Details](
	[App_Details_ID] [int] IDENTITY(1,1) NOT NULL,
	[App_ID] [int] NULL,
	[ControlName] [nvarchar](50) NULL,
	[ArabicDesc] [nvarchar](150) NULL,
	[EnglishDesc] [nvarchar](150) NULL,
 CONSTRAINT [PK_FSB_Apps_Details] PRIMARY KEY CLUSTERED 
(
	[App_Details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Company]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [numeric](8, 0) NULL,
	[Name] [nvarchar](150) NULL,
	[TradeMark] [nvarchar](20) NULL,
	[Logo] [ntext] NULL,
	[CompanyLogo] [image] NULL,
	[OwnerName] [nvarchar](150) NULL,
	[CompanyType] [int] NULL,
	[Phone1] [nvarchar](10) NULL,
	[Phone2] [nvarchar](10) NULL,
	[Phone3] [nvarchar](10) NULL,
	[Mobile1] [nvarchar](15) NULL,
	[Mobile2] [nvarchar](15) NULL,
	[Mobile3] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Website] [nvarchar](100) NULL,
	[Address] [ntext] NULL,
	[PostCode] [nvarchar](10) NULL,
	[TaxNumber] [nvarchar](20) NULL,
	[TradeNumber] [nvarchar](20) NULL,
	[MainCompany] [bit] NULL,
	[OwnCompanyID] [int] NULL,
	[Usr_Id] [int] NULL,
	[Usr_Shift] [int] NULL,
	[Usr_Time] [nvarchar](20) NULL,
	[Usr_Date] [nvarchar](20) NULL,
	[Mach_Name] [nvarchar](20) NULL,
	[Mach_Ip] [nvarchar](20) NULL,
	[Usr_Operation] [nvarchar](50) NULL,
	[DatabaseName] [nvarchar](50) NULL,
	[ServerIP] [nvarchar](50) NULL,
	[RightImage] [image] NULL,
 CONSTRAINT [PK_FSB_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Groups]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Grp_Name] [nvarchar](50) NULL,
	[Grp_Description] [ntext] NULL,
	[Grp_Code] [nvarchar](50) NULL,
	[SWID] [int] NULL,
 CONSTRAINT [PK_FSB_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Grp_APP]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Grp_APP](
	[Grp_Apps_ID] [int] IDENTITY(1,1) NOT NULL,
	[Grp_ID] [int] NULL,
	[App_ID] [int] NULL,
	[App_Add] [bit] NULL,
	[App_Edit] [bit] NULL,
	[App_Delete] [bit] NULL,
	[App_View] [bit] NULL,
	[App_Print] [bit] NULL,
	[APP_Return] [bit] NULL,
	[APP_ViewPrice] [bit] NULL,
	[APP_CloseInvoice] [bit] NULL,
	[App_CloseShift] [bit] NULL,
	[App_LoginScreen] [int] NULL,
 CONSTRAINT [PK_FSB_Grp_APP] PRIMARY KEY CLUSTERED 
(
	[Grp_Apps_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Grp_APP_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Grp_APP_Details](
	[Grp_App_DetailsID] [int] IDENTITY(1,1) NOT NULL,
	[Grp_Apps_ID] [int] NULL,
	[App_Details_ID] [int] NULL,
	[Control_Status] [int] NULL,
 CONSTRAINT [PK_FSB_Grp_APP_Details] PRIMARY KEY CLUSTERED 
(
	[Grp_App_DetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Users]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirsName] [nvarchar](100) NULL,
	[SurName] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[LastLogout] [datetime] NULL,
	[CompanyID] [int] NULL,
	[Language] [int] NULL,
	[DisplaySetting] [int] NULL,
	[GroupID] [int] NULL,
	[CurrentStatus] [int] NULL,
	[MasterAdmin] [bit] NULL,
	[UserLoginID] [int] NULL,
	[EmployeeID] [int] NULL,
	[bAllowMobile] [bit] NULL,
	[bAllowWeb] [bit] NULL,
	[iAccessType] [int] NULL,
	[iLocID] [int] NULL,
	[iDepID] [int] NULL,
	[MobileToken] [nvarchar](max) NULL,
	[bAllowActiveDB] [bit] NULL,
	[bAllowDemoDB] [bit] NULL,
	[bSingleScreen] [bit] NULL,
	[SingleScreenID] [int] NULL,
	[isHRAdmin] [bit] NULL,
	[Confirmed] [nvarchar](max) NULL,
	[SWID] [int] NULL,
 CONSTRAINT [PK_FSB_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Users_Screen]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Users_Screen](
	[UserScreenID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ScreenID] [int] NULL,
 CONSTRAINT [PK_FSB_Users_Screen] PRIMARY KEY CLUSTERED 
(
	[UserScreenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FSB_Users_Settings]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FSB_Users_Settings](
	[UsrSettingID] [int] IDENTITY(1,1) NOT NULL,
	[Usr_ID] [int] NULL,
	[ShiftID] [int] NULL,
	[PriceListID] [int] NULL,
	[InventoryID] [int] NULL,
	[CashierID] [int] NULL,
	[CurrencyID] [int] NULL,
	[DirectKind] [bit] NULL,
 CONSTRAINT [PK_FSB_Users_Settings] PRIMARY KEY CLUSTERED 
(
	[UsrSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PictureTable]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureTable](
	[PkId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Description] [nvarchar](64) NOT NULL,
	[FileSummary] [varbinary](max) NULL,
	[FileData] [varbinary](max) FILESTREAM  NULL,
	[FileType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY] FILESTREAM_ON [FILESTREAM],
UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] FILESTREAM_ON [FILESTREAM]
GO
/****** Object:  Table [dbo].[SMRT_Archive]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Archive](
	[ArchiveID] [int] IDENTITY(1,1) NOT NULL,
	[ArchiveDate] [date] NULL,
	[ArchiveTime] [nvarchar](50) NULL,
	[SavingDate] [date] NULL,
	[SavingTime] [nvarchar](50) NULL,
	[DocumentType] [int] NULL,
	[DocumentCode] [nvarchar](50) NULL,
	[DocumentName] [nvarchar](150) NULL,
	[DocFromID] [int] NULL,
	[DocFromName] [nvarchar](150) NULL,
	[FromLocationID] [int] NULL,
	[FromDepartmentID] [int] NULL,
	[FromContactPersonID] [int] NULL,
	[FromEmployeeID] [int] NULL,
	[DocToID] [int] NULL,
	[DocToName] [nvarchar](150) NULL,
	[DocAttentionID] [int] NULL,
	[DocAttention] [nvarchar](150) NULL,
	[LocationID] [int] NULL,
	[DepartmentID] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[JASAAD] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Archive] PRIMARY KEY CLUSTERED 
(
	[ArchiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Archive_CatSpecs]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Archive_CatSpecs](
	[ArchiveCatSpecsID] [int] IDENTITY(1,1) NOT NULL,
	[ArchiveID] [int] NULL,
	[CatSpecsID] [int] NULL,
	[CatSpecsDetailsID] [int] NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Archive_CatSpecs] PRIMARY KEY CLUSTERED 
(
	[ArchiveCatSpecsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Archive_Documents]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Archive_Documents](
	[PkId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ArchiveID] [int] NOT NULL,
	[FileLocation] [nvarchar](max) NULL,
	[FileType] [nvarchar](50) NULL,
	[FileExtension] [nvarchar](50) NULL,
	[FileData] [varbinary](max) NULL,
 CONSTRAINT [PK__SMRT_Arc__A7C03FF8B0541C9C] PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__SMRT_Arc__3214EC06108C8F95] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Archive_Documents1]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Archive_Documents1](
	[PkId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ArchiveID] [int] NOT NULL,
	[FileLocation] [varbinary](max) NULL,
	[FileType] [varbinary](50) NULL,
	[FileExtension] [varbinary](max) NULL,
	[FileData] [varbinary](max) FILESTREAM  NULL,
PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY] FILESTREAM_ON [FILESTREAM],
UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] FILESTREAM_ON [FILESTREAM]
GO
/****** Object:  Table [dbo].[SMRT_Buildings]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Buildings](
	[BuildingID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[BuildingCode] [nvarchar](50) NULL,
	[BuildingName] [nvarchar](150) NULL,
	[BuildingFloors] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[GarageID] [int] NULL,
	[GarageFloors] [int] NULL,
 CONSTRAINT [PK_SMRT_Buildings] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Cameras]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Cameras](
	[CameraID] [int] IDENTITY(1,1) NOT NULL,
	[CameraCode] [nvarchar](50) NULL,
	[CameraName] [nvarchar](50) NULL,
	[CameraType] [int] NULL,
	[CameraIP] [nvarchar](50) NULL,
	[CameraPort] [int] NULL,
	[CameraURL] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[isFaceDetection] [bit] NULL,
	[SnapshotFolder] [nvarchar](max) NULL,
	[LocationID] [int] NULL,
	[BuildingID] [int] NULL,
	[FloorID] [int] NULL,
	[DoorID] [int] NULL,
	[CameraUserName] [nvarchar](50) NULL,
	[CameraPassword] [nvarchar](50) NULL,
	[CameraURL_rtsp] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Cameras] PRIMARY KEY CLUSTERED 
(
	[CameraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_CarType]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_CarType](
	[CarTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CarTypeName] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_CarType] PRIMARY KEY CLUSTERED 
(
	[CarTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_CAT_SPECS]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_CAT_SPECS](
	[CatSpecsID] [int] IDENTITY(1,1) NOT NULL,
	[CatSpecsTitle] [nvarchar](50) NULL,
	[CatSpecsDesc] [nvarchar](150) NULL,
	[CatSpecsType] [int] NULL,
	[CatSpecsNotes] [nvarchar](max) NULL,
	[LoopupIndex] [int] NULL,
 CONSTRAINT [PK_SMRT_CAT_SPECS] PRIMARY KEY CLUSTERED 
(
	[CatSpecsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Cat_Specs_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Cat_Specs_Details](
	[CatSpecsDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[CatSpecsID] [int] NULL,
	[CatSpecsValue] [nvarchar](50) NULL,
	[CatSpecsDesc] [nvarchar](150) NULL,
 CONSTRAINT [PK_SMRT_Cat_Specs_Details] PRIMARY KEY CLUSTERED 
(
	[CatSpecsDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Companies]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](150) NULL,
	[CompanyAddress] [nvarchar](150) NULL,
	[Notes] [nvarchar](max) NULL,
	[ContactType] [int] NULL,
	[ZipCode] [int] NULL,
	[Phone] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[WebSite] [nvarchar](150) NULL,
	[isCustomer] [bit] NULL,
	[isSupplier] [bit] NULL,
 CONSTRAINT [PK_SMRT_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Companies_Contacts]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Companies_Contacts](
	[CompanyContactID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[ContactName] [nvarchar](150) NULL,
	[ContactPosition] [nvarchar](150) NULL,
	[ContactMobile] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Companies_Contacts] PRIMARY KEY CLUSTERED 
(
	[CompanyContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_CRED]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_CRED](
	[CloudOCRID] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [nvarchar](50) NULL,
	[AppID] [nvarchar](50) NULL,
	[AppLimit] [int] NULL,
 CONSTRAINT [PK_SMRT_CRED] PRIMARY KEY CLUSTERED 
(
	[CloudOCRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Def_Dim]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Def_Dim](
	[DimID] [int] IDENTITY(1,1) NOT NULL,
	[DimTag] [int] NULL,
	[DimName] [nvarchar](50) NULL,
	[DimDocType] [int] NULL,
	[DimField] [int] NULL,
	[StartX_Def] [int] NULL,
	[StartY_Def] [int] NULL,
	[Width_Def] [int] NULL,
	[Height_Def] [int] NULL,
	[StartX] [int] NULL,
	[StartY] [int] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[TemplateImage] [image] NULL,
 CONSTRAINT [PK_SMRT_Def_Dim] PRIMARY KEY CLUSTERED 
(
	[DimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Department]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](150) NULL,
	[DepartmentManager] [nvarchar](50) NULL,
	[DepartmentManagerMob] [nvarchar](50) NULL,
	[DepartmentManagerEMail] [nvarchar](50) NULL,
	[DateStart] [date] NULL,
	[DepIsParent] [bit] NULL,
	[DepMainParent] [int] NULL,
	[DepParent] [int] NULL,
	[DepCode] [nvarchar](50) NULL,
	[WorkPlace] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Department_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Department_Details](
	[DepartmentDetID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[LocationID] [int] NULL,
	[DepartmentManager] [nvarchar](50) NULL,
	[DepartmentManagerMob] [nvarchar](50) NULL,
	[DepartmentManagerEMail] [nvarchar](50) NULL,
	[ReportType] [int] NULL,
	[ReportPlan] [int] NULL,
	[ReportDay] [int] NULL,
	[ReportTime] [nvarchar](50) NULL,
	[ReportFolder] [nvarchar](150) NULL,
	[CC] [nvarchar](150) NULL,
	[BCC] [nvarchar](150) NULL,
	[ReportActive] [int] NULL,
	[WorkPlace] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Department_Details] PRIMARY KEY CLUSTERED 
(
	[DepartmentDetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Destinations]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Destinations](
	[DestinationID] [int] IDENTITY(1,1) NOT NULL,
	[DestinationCode] [nvarchar](50) NULL,
	[DestinationName] [nvarchar](150) NULL,
	[LocationID] [int] NULL,
	[BuildingID] [int] NULL,
	[Floor] [int] NULL,
	[NumberOfDoors] [int] NULL,
	[PremisesID] [int] NULL,
 CONSTRAINT [PK_SMRT_Destinations] PRIMARY KEY CLUSTERED 
(
	[DestinationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Destinations_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Destinations_Details](
	[DestinationDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[DestinationID] [int] NULL,
	[DoorID] [int] NULL,
 CONSTRAINT [PK_SMRT_Destinations_Details] PRIMARY KEY CLUSTERED 
(
	[DestinationDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Direct_OCR]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Direct_OCR](
	[DirectOCRID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](50) NULL,
	[OCRLanguage] [int] NULL,
	[OCRDate] [date] NULL,
	[OCRTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Direct_OCR] PRIMARY KEY CLUSTERED 
(
	[DirectOCRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Direct_OCR_Pages]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Direct_OCR_Pages](
	[PkId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DirectOCRID] [int] NOT NULL,
	[DocumentIndex] [int] NULL,
	[DocumentLocation] [nvarchar](max) NULL,
	[FileExt] [nvarchar](50) NULL,
	[PageNumber] [int] NULL,
	[FileData] [varbinary](max) FILESTREAM  NULL,
 CONSTRAINT [PK__SMRT_Dir__A7C03FF8BC8D397E] PRIMARY KEY CLUSTERED 
(
	[PkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY] FILESTREAM_ON [FILESTREAM],
 CONSTRAINT [UQ__SMRT_Dir__3214EC06CC6BC6E3] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] FILESTREAM_ON [FILESTREAM]
GO
/****** Object:  Table [dbo].[SMRT_Doors]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Doors](
	[DoorID] [int] IDENTITY(1,1) NOT NULL,
	[DoorCode] [nvarchar](50) NULL,
	[DoorName] [nvarchar](150) NULL,
	[DoorIP] [nvarchar](50) NULL,
	[DoorPort] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[LocationID] [int] NULL,
	[BuildingID] [int] NULL,
	[Floor] [int] NULL,
	[MachineID] [int] NULL,
	[isStandAlone] [bit] NULL,
	[isPanel] [bit] NULL,
	[Door_Number] [int] NULL,
	[Door_Count] [int] NULL,
 CONSTRAINT [PK_SMRT_Doors] PRIMARY KEY CLUSTERED 
(
	[DoorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Equipment]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Equipment](
	[EquipmentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentName] [nvarchar](150) NULL,
	[EquipmentDesc] [nvarchar](150) NULL,
 CONSTRAINT [PK_SMRT_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Face]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Face](
	[FaceID] [int] IDENTITY(1,1) NOT NULL,
	[FaceSDKID] [int] NULL,
	[Face_Name] [nvarchar](150) NULL,
	[Face_Gender] [nvarchar](50) NULL,
	[Face_Age] [int] NULL,
	[Face_Level] [int] NULL,
	[NationalID] [decimal](18, 0) NULL,
	[Notes] [nvarchar](max) NULL,
	[Face_Image] [image] NULL,
	[Face_Mobile] [nvarchar](50) NULL,
	[Face_Email] [nvarchar](50) NULL,
	[bUseForDetect] [bit] NULL,
	[CameraID] [int] NULL,
	[PC_IP] [nvarchar](50) NULL,
	[USERID] [int] NULL,
	[VisitorRefID] [int] NULL,
 CONSTRAINT [PK_SMRT_Face] PRIMARY KEY CLUSTERED 
(
	[FaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Face_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Face_Details](
	[Face_DetailsID] [int] IDENTITY(1,1) NOT NULL,
	[FaceID] [int] NULL,
	[RegDate] [date] NULL,
	[VisitDateTime] [nvarchar](50) NULL,
	[CameraID] [int] NULL,
	[PC_IP] [nvarchar](50) NULL,
	[USERID] [int] NULL,
 CONSTRAINT [PK_SMRT_Face_Details] PRIMARY KEY CLUSTERED 
(
	[Face_DetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Location]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationCode] [nvarchar](50) NULL,
	[LocationName] [nvarchar](150) NULL,
	[Country] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_LogSettings]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_LogSettings](
	[LogSettingID] [int] IDENTITY(1,1) NOT NULL,
	[OpenWindow] [bit] NULL,
	[CloseWindow] [bit] NULL,
	[SoftwareLogin] [bit] NULL,
	[SoftwareLogout] [bit] NULL,
	[Adding] [bit] NULL,
	[Editing] [bit] NULL,
	[Deleting] [bit] NULL,
	[Printing] [bit] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_SMRT_LogSettings] PRIMARY KEY CLUSTERED 
(
	[LogSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_MACHINES]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_MACHINES](
	[MachineID] [int] IDENTITY(1,1) NOT NULL,
	[MachineCode] [nvarchar](50) NULL,
	[MachineName] [nvarchar](150) NULL,
	[MachineIP] [nvarchar](50) NULL,
	[MachinePort] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[LastUsedPCIP] [nvarchar](50) NULL,
	[AutoConnect] [bit] NULL,
	[MachineType] [int] NULL,
	[DoorID] [int] NULL,
	[bDefineCards] [bit] NULL,
	[Parking_GateID] [int] NULL,
	[isStandAlone] [bit] NULL,
	[isPanel] [bit] NULL,
	[Door_Number] [int] NULL,
	[Door_Count] [int] NULL,
 CONSTRAINT [PK_SMRT_MACHINES] PRIMARY KEY CLUSTERED 
(
	[MachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Meeting]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Meeting](
	[PlanDayID] [int] IDENTITY(1,1) NOT NULL,
	[PlanDateFrom] [date] NULL,
	[PlanDateTo] [date] NULL,
	[TimeFrom] [nvarchar](50) NULL,
	[TimeTo] [nvarchar](50) NULL,
	[PremisesID] [int] NULL,
	[MeetingSubject] [nvarchar](50) NULL,
	[MeetingNote] [nvarchar](max) NULL,
	[MeetingPriority] [int] NULL,
	[MeetingStatus] [int] NULL,
	[ReservationDate] [date] NULL,
	[ReservationTime] [nvarchar](50) NULL,
	[ReservationFrom] [int] NULL,
	[ReservationPersonelID] [int] NULL,
	[ReservationPersonelName] [nvarchar](150) NULL,
	[MeetingValue] [decimal](18, 3) NULL,
	[PaidValue] [decimal](18, 3) NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_SMRT_Meeting] PRIMARY KEY CLUSTERED 
(
	[PlanDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Meeting_Visitor]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Meeting_Visitor](
	[MeetingVisitorID] [int] IDENTITY(1,1) NOT NULL,
	[PlanDayID] [int] NULL,
	[VisitorID] [int] NULL,
 CONSTRAINT [PK_SMRT_Meeting_Visitor] PRIMARY KEY CLUSTERED 
(
	[MeetingVisitorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Notification]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationDate] [date] NULL,
	[NotificationTime] [nvarchar](50) NULL,
	[NotificationMethod] [int] NULL,
	[NotificationSubject] [nvarchar](150) NULL,
	[NotificationMessage] [nvarchar](max) NULL,
	[NotificationAttachment] [nvarchar](150) NULL,
	[NotificationTarget] [int] NULL,
 CONSTRAINT [PK_SMRT_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Notification_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Notification_Details](
	[NotificationDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NULL,
	[RefID] [int] NULL,
	[RefMobile] [nvarchar](50) NULL,
	[RefMail] [nvarchar](50) NULL,
	[RefType] [int] NULL,
 CONSTRAINT [PK_SMRT_Notification_Details] PRIMARY KEY CLUSTERED 
(
	[NotificationDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Card]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Card](
	[Parking_CardID] [int] IDENTITY(1,1) NOT NULL,
	[ValidFromDate] [date] NULL,
	[ValidFromTime] [nvarchar](50) NULL,
	[ValidToDate] [date] NULL,
	[ValidToTime] [nvarchar](50) NULL,
	[CardType] [int] NULL,
	[CardNumber] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[Parking_CategoryID] [int] NULL,
	[GracePeriod] [int] NULL,
	[isEmergency] [bit] NULL,
 CONSTRAINT [PK_SMRT_Parking_Card] PRIMARY KEY CLUSTERED 
(
	[Parking_CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CardGate]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CardGate](
	[Parking_CardGateID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_GateID] [int] NULL,
	[Parking_CardID] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_CardGate] PRIMARY KEY CLUSTERED 
(
	[Parking_CardGateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CardMembership]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CardMembership](
	[Parking_CardMemberShipID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_MemberShipID] [int] NULL,
	[Parking_CardID] [int] NULL,
 CONSTRAINT [PK_SMRT_CardMembership] PRIMARY KEY CLUSTERED 
(
	[Parking_CardMemberShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Cashier]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Cashier](
	[Parking_CashierID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_GateID] [int] NULL,
	[Parking_LocationDetailsID] [int] NULL,
	[Parking_LocationID] [int] NULL,
	[CashierName] [nvarchar](150) NULL,
	[bPrintReceipt] [bit] NULL,
	[bIssueCard] [bit] NULL,
	[bFullCapacity] [bit] NULL,
	[bFloorCapacity] [bit] NULL,
	[bVat] [bit] NULL,
	[rVatValue] [decimal](18, 3) NULL,
	[Parking_GateID_Out] [int] NULL,
	[PrintPreview_In] [bit] NULL,
	[PrintPreview_Out] [bit] NULL,
	[Count_Print_In] [int] NULL,
	[Count_Print_Out] [int] NULL,
	[In_Screen] [bit] NULL,
	[In_Printer] [bit] NULL,
 CONSTRAINT [PK_SMRT_Parking_Cashier] PRIMARY KEY CLUSTERED 
(
	[Parking_CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Cashier_Operation]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Cashier_Operation](
	[Parking_CashierOperationID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_CashirShiftDateID] [int] NULL,
	[bLogin] [bit] NULL,
	[bSignOut] [bit] NULL,
	[sTime] [nvarchar](50) NULL,
	[sDate] [date] NULL,
	[PC_MAC] [nvarchar](150) NULL,
	[PC_IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Parking_Cashier_Operation] PRIMARY KEY CLUSTERED 
(
	[Parking_CashierOperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CashierShift]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CashierShift](
	[Parking_CashierShiftID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_CashierID] [int] NULL,
	[ShiftID] [int] NULL,
	[ShiftName] [nvarchar](50) NULL,
	[ShiftFrom] [nvarchar](50) NULL,
	[ShiftTo] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Parking_CashierShift] PRIMARY KEY CLUSTERED 
(
	[Parking_CashierShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Category]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Category](
	[Parking_CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_CategoryCode] [nvarchar](50) NULL,
	[Parking_CategoryName] [nvarchar](150) NULL,
	[Type] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[bMembership] [bit] NULL,
	[bFixedValue] [bit] NULL,
	[bVariableValue] [bit] NULL,
	[GracePeriod] [int] NULL,
	[iSort] [int] NULL,
	[bSelect] [bit] NULL,
	[bDefault] [bit] NULL,
	[bCost_Fixed] [bit] NULL,
	[bCost_Grade] [bit] NULL,
	[iGradeCount] [int] NULL,
	[CarTypeID] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Category] PRIMARY KEY CLUSTERED 
(
	[Parking_CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Cost]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Cost](
	[ParkingCostID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingName] [nvarchar](50) NULL,
	[bSaturdayFrom] [nvarchar](50) NULL,
	[bSaturdayTo] [nvarchar](50) NULL,
	[bSundayFrom] [nvarchar](50) NULL,
	[bSundayTo] [nvarchar](50) NULL,
	[bMondayFrom] [nvarchar](50) NULL,
	[bMondayTo] [nvarchar](50) NULL,
	[bTuesdayFrom] [nvarchar](50) NULL,
	[bTuesdayTo] [nvarchar](50) NULL,
	[bWedFrom] [nvarchar](50) NULL,
	[bWedTo] [nvarchar](50) NULL,
	[bThursdayFrom] [nvarchar](50) NULL,
	[bThursdayTo] [nvarchar](50) NULL,
	[bFriFrom] [nvarchar](50) NULL,
	[bFriTo] [nvarchar](50) NULL,
	[bDayFromHour] [bit] NULL,
	[bFixedDayValue] [bit] NULL,
	[rFixedDayValue] [decimal](18, 3) NULL,
	[bApplyPenalty] [bit] NULL,
	[rPenaltyValue] [decimal](18, 3) NULL,
	[bHoursRate] [bit] NULL,
	[bDayRate] [bit] NULL,
	[bDayFromCategory] [bit] NULL,
	[bCar] [bit] NULL,
	[bPassengers] [bit] NULL,
	[bVarDayValue] [bit] NULL,
	[bMinute_Break] [bit] NULL,
	[iMinute_Break] [int] NULL,
	[bFreeMinute] [bit] NULL,
	[iFreeMinute] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Cost] PRIMARY KEY CLUSTERED 
(
	[ParkingCostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Cost_Category]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Cost_Category](
	[ParkingCost_CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostID] [int] NULL,
	[ParkingCategoryID] [int] NULL,
	[ParkingCategoryDayCost] [decimal](18, 3) NULL,
	[SaturdayCost] [decimal](18, 3) NULL,
	[SundayCost] [decimal](18, 3) NULL,
	[MondayCost] [decimal](18, 3) NULL,
	[TuesdayCost] [decimal](18, 3) NULL,
	[WedCost] [decimal](18, 3) NULL,
	[ThursdayCost] [decimal](18, 3) NULL,
	[FriCost] [decimal](18, 3) NULL,
 CONSTRAINT [PK_SMRT_Parking_Cost_Category] PRIMARY KEY CLUSTERED 
(
	[ParkingCost_CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Cost_DayValue]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Cost_DayValue](
	[ParkingCostDayID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostID] [int] NULL,
	[DayNumber] [nvarchar](50) NULL,
	[DayValue] [int] NULL,
	[DayPrice] [decimal](18, 3) NULL,
 CONSTRAINT [PK_SMRT_Parking_Cost_DayValue] PRIMARY KEY CLUSTERED 
(
	[ParkingCostDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Cost_Def]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Cost_Def](
	[Parking_Cost_GroupID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostID] [int] NULL,
	[ParkingCostGradeID] [int] NULL,
	[ParkingName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Parking_Cost_Def] PRIMARY KEY CLUSTERED 
(
	[Parking_Cost_GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Cost_Location]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Cost_Location](
	[ParkingCost_LocationID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostID] [int] NULL,
	[ParkingLocationID] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Cost_Location] PRIMARY KEY CLUSTERED 
(
	[ParkingCost_LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CostGrade]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CostGrade](
	[ParkingCostGradeID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingName] [nvarchar](50) NULL,
	[bSaturdayFrom] [nvarchar](50) NULL,
	[bSaturdayTo] [nvarchar](50) NULL,
	[bSundayFrom] [nvarchar](50) NULL,
	[bSundayTo] [nvarchar](50) NULL,
	[bMondayFrom] [nvarchar](50) NULL,
	[bMondayTo] [nvarchar](50) NULL,
	[bTuesdayFrom] [nvarchar](50) NULL,
	[bTuesdayTo] [nvarchar](50) NULL,
	[bWedFrom] [nvarchar](50) NULL,
	[bWedTo] [nvarchar](50) NULL,
	[bThursdayFrom] [nvarchar](50) NULL,
	[bThursdayTo] [nvarchar](50) NULL,
	[bFriFrom] [nvarchar](50) NULL,
	[bFriTo] [nvarchar](50) NULL,
	[bDayFromHour] [bit] NULL,
	[bFixedDayValue] [bit] NULL,
	[rFixedDayValue] [decimal](18, 3) NULL,
	[bCalcAccum] [bit] NULL,
	[bCalcNet] [bit] NULL,
	[bHoursRate] [bit] NULL,
	[bDayRate] [bit] NULL,
	[Parking_CategoryID] [int] NULL,
	[bCar] [bit] NULL,
	[bPassengers] [bit] NULL,
	[bVarDayValue] [bit] NULL,
	[bMinute_Break] [bit] NULL,
	[iMinute_Break] [int] NULL,
	[bApplyPenalty] [bit] NULL,
	[rPenaltyValue] [decimal](18, 3) NULL,
	[bFreeMinute] [bit] NULL,
	[iFreeMinute] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_CostGrade] PRIMARY KEY CLUSTERED 
(
	[ParkingCostGradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CostGrade_Category]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CostGrade_Category](
	[ParkingCostGrade_CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostGradeID] [int] NULL,
	[ParkingCategoryID] [int] NULL,
	[ParkingCostGrade_GradeID] [int] NULL,
	[SaturdayCost] [decimal](18, 3) NULL,
	[SundayCost] [decimal](18, 3) NULL,
	[MondayCost] [decimal](18, 3) NULL,
	[TuesdayCost] [decimal](18, 3) NULL,
	[WedCost] [decimal](18, 3) NULL,
	[ThursdayCost] [decimal](18, 3) NULL,
	[FriCost] [decimal](18, 3) NULL,
 CONSTRAINT [PK_SMRT_Parking_CostGrade_Category] PRIMARY KEY CLUSTERED 
(
	[ParkingCostGrade_CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CostGrade_DayValue]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CostGrade_DayValue](
	[ParkingCostGradeDayID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostGradeID] [int] NULL,
	[DayNumber] [nvarchar](50) NULL,
	[DayValue] [int] NULL,
	[DayPrice] [decimal](18, 3) NULL,
 CONSTRAINT [PK_SMRT_Parking_CostGrade_DayValue] PRIMARY KEY CLUSTERED 
(
	[ParkingCostGradeDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CostGrade_Grade]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CostGrade_Grade](
	[ParkingCostGrade_GradeID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostGradeID] [int] NULL,
	[GradeName] [nvarchar](50) NULL,
	[bSaturdayFrom] [nvarchar](50) NULL,
	[bSaturdayTo] [nvarchar](50) NULL,
	[bSundayFrom] [nvarchar](50) NULL,
	[bSundayTo] [nvarchar](50) NULL,
	[bMondayFrom] [nvarchar](50) NULL,
	[bMondayTo] [nvarchar](50) NULL,
	[bTuesdayFrom] [nvarchar](50) NULL,
	[bTuesdayTo] [nvarchar](50) NULL,
	[bWedFrom] [nvarchar](50) NULL,
	[bWedTo] [nvarchar](50) NULL,
	[bThursdayFrom] [nvarchar](50) NULL,
	[bThursdayTo] [nvarchar](50) NULL,
	[bFriFrom] [nvarchar](50) NULL,
	[bFriTo] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Parking_CostGrade_Grade] PRIMARY KEY CLUSTERED 
(
	[ParkingCostGrade_GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_CostGrade_Location]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_CostGrade_Location](
	[ParkingCostGrade_LocationID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingCostGradeID] [int] NULL,
	[ParkingLocationID] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_CostGrade_Location] PRIMARY KEY CLUSTERED 
(
	[ParkingCostGrade_LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Daily]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Daily](
	[Parking_DailyID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingDate] [date] NULL,
	[InTime] [nvarchar](50) NULL,
	[InDate] [date] NULL,
	[OutTime] [nvarchar](50) NULL,
	[OutDate] [date] NULL,
	[bCard] [bit] NULL,
	[bPrinter] [bit] NULL,
	[CardNumber] [nvarchar](50) NULL,
	[GeneratedBarcode] [nvarchar](50) NULL,
	[Parking_CashirShiftDateID_IN] [int] NULL,
	[Parking_CashirShiftDateID_OUT] [int] NULL,
	[rValue_Gross] [decimal](18, 3) NULL,
	[rVAT] [decimal](18, 3) NULL,
	[rValue_Net] [decimal](18, 3) NULL,
	[rDiscPerc] [decimal](18, 3) NULL,
	[rDisValue] [decimal](18, 3) NULL,
	[rCashPayment] [bit] NULL,
	[rCardVisa] [bit] NULL,
	[CardRef] [int] NULL,
	[CardText] [nvarchar](150) NULL,
	[bTransactionAccepted] [bit] NULL,
	[Parking_CategoryID] [int] NULL,
	[VisitorName] [nvarchar](50) NULL,
	[Char1] [nchar](1) NULL,
	[Char2] [nchar](1) NULL,
	[char3] [nchar](1) NULL,
	[iLicenseNumber] [nvarchar](50) NULL,
	[LicenseGov] [nvarchar](50) NULL,
	[bOldLicense] [bit] NULL,
	[bNewLicense] [bit] NULL,
	[Parking_LocationDetailsID] [int] NULL,
	[NumberOfVisitors] [int] NULL,
	[VisitDesc] [nvarchar](50) NULL,
	[CarModel] [nvarchar](50) NULL,
	[CarColor] [nvarchar](50) NULL,
	[bEntertain] [bit] NULL,
	[EntertainID] [int] NULL,
	[EmployeeID] [int] NULL,
	[bLostCard] [bit] NULL,
 CONSTRAINT [PK_SMRT_Parking_Daily] PRIMARY KEY CLUSTERED 
(
	[Parking_DailyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Daily_Cashier]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Daily_Cashier](
	[DailyCashierID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_CashirShiftDateID] [int] NULL,
	[DailyDate] [date] NULL,
	[rTotalValue] [decimal](18, 3) NULL,
	[rTotalVat] [decimal](18, 3) NULL,
	[rTotalAccepted] [decimal](18, 3) NULL,
	[rTotalRejected] [decimal](18, 3) NULL,
 CONSTRAINT [PK_SMRT_Parking_Daily_Cashier] PRIMARY KEY CLUSTERED 
(
	[DailyCashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Employee]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Employee](
	[Parking_EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](50) NULL,
	[EmployeeName] [nvarchar](150) NULL,
	[EmployeeMobile] [nvarchar](150) NULL,
	[EmployeeEmail] [nvarchar](150) NULL,
	[NationalID] [decimal](18, 0) NULL,
	[NationalImage] [nvarchar](max) NULL,
	[PersonalImage] [nvarchar](max) NULL,
	[EmployeeAddress] [nvarchar](150) NULL,
	[StartDate] [date] NULL,
	[bEnd] [bit] NULL,
	[EndDate] [date] NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CardNumber] [nvarchar](50) NULL,
	[bAllowDiscount] [bit] NULL,
	[MaxDiscPerc] [decimal](18, 3) NULL,
	[MaxDiscValue] [decimal](18, 3) NULL,
	[bAllow_Logout] [bit] NULL,
 CONSTRAINT [PK_SMRT_Parking_Employee] PRIMARY KEY CLUSTERED 
(
	[Parking_EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Gate]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Gate](
	[Parking_GateID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_GateCode] [nvarchar](50) NULL,
	[Parking_gATEName] [nvarchar](150) NULL,
	[Type] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[bHasAccess] [bit] NULL,
	[strAccessIP] [nvarchar](50) NULL,
	[iPort] [int] NULL,
	[bHasBarcodePrinter] [bit] NULL,
	[Parking_LocationID] [int] NULL,
	[Parking_LocationDetailsID] [int] NULL,
	[bHasCamera] [bit] NULL,
	[CameraID] [int] NULL,
	[isStandAlone] [bit] NULL,
	[isPanel] [bit] NULL,
	[Door_Number] [int] NULL,
	[Door_Count] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Gate] PRIMARY KEY CLUSTERED 
(
	[Parking_GateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Hospitality]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Hospitality](
	[HospitalityID] [int] IDENTITY(1,1) NOT NULL,
	[Hospitality] [nvarchar](50) NULL,
	[Desc] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Parking_Hospitality] PRIMARY KEY CLUSTERED 
(
	[HospitalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Location]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Location](
	[Parking_LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_LocationCode] [nvarchar](50) NULL,
	[Parking_LocationName] [nvarchar](150) NULL,
	[ParkingFloors] [int] NULL,
	[BuildingID] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Parking_Location] PRIMARY KEY CLUSTERED 
(
	[Parking_LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Location_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Location_Details](
	[Parking_LocationDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_LocationID] [int] NULL,
	[FloorName] [nvarchar](50) NULL,
	[Capacity] [int] NULL,
	[Capacity_Members] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Location_Details] PRIMARY KEY CLUSTERED 
(
	[Parking_LocationDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Membership]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Membership](
	[Parking_MembershipID] [int] IDENTITY(1,1) NOT NULL,
	[ValidFromDate] [date] NULL,
	[ValidFromTime] [nvarchar](50) NULL,
	[ValidToDate] [date] NULL,
	[ValidToTime] [nvarchar](50) NULL,
	[Parking_CategoryID] [int] NULL,
	[CardType] [int] NULL,
	[CardNumber] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[MemberShipValue] [decimal](18, 3) NULL,
	[MemberShipPayment] [int] NULL,
	[MemberShipRefID] [int] NULL,
	[Name] [nvarchar](150) NULL,
	[Mobile] [nvarchar](150) NULL,
	[NationalID] [decimal](18, 0) NULL,
	[Address] [nvarchar](max) NULL,
	[NationalIDImage] [nvarchar](max) NULL,
	[CarTypeID] [int] NULL,
	[CarTypeName] [nvarchar](50) NULL,
	[CarModel] [int] NULL,
	[CarColorIndex] [int] NULL,
	[char1] [char](10) NULL,
	[char2] [char](10) NULL,
	[char3] [char](10) NULL,
	[LicenseNumber] [decimal](18, 0) NULL,
	[ExpieryDate] [date] NULL,
	[GracePeriod] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Membership] PRIMARY KEY CLUSTERED 
(
	[Parking_MembershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_MemberShip_Cars]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_MemberShip_Cars](
	[Parking_MemberShipCarID] [int] IDENTITY(1,1) NOT NULL,
	[Parking_MemberShipID] [int] NULL,
	[CarImage] [nvarchar](max) NULL,
	[ImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_Parking_MemberShip_Cars] PRIMARY KEY CLUSTERED 
(
	[Parking_MemberShipCarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Membership_Location]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Membership_Location](
	[ParkingMembership_LocationID] [int] IDENTITY(1,1) NOT NULL,
	[ParkingMembershipID] [int] NULL,
	[ParkingLocationID] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Membership_Location] PRIMARY KEY CLUSTERED 
(
	[ParkingMembership_LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Shift]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Shift](
	[Parking_ShiftID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](150) NULL,
	[ShiftFrom] [nvarchar](50) NULL,
	[ShiftTo] [nvarchar](50) NULL,
	[ShiftOrder] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Shift] PRIMARY KEY CLUSTERED 
(
	[Parking_ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Parking_Shift_Operations]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Parking_Shift_Operations](
	[Parking_CashirShiftDateID] [int] IDENTITY(1,1) NOT NULL,
	[DayFrom] [date] NULL,
	[DayTo] [date] NULL,
	[ExpectedTimeFrom] [nvarchar](50) NULL,
	[ExpectedTimeTo] [nvarchar](50) NULL,
	[Parking_EmployeeID] [int] NULL,
	[Parking_CashierID] [int] NULL,
	[Parking_CashierShiftID] [int] NULL,
	[Parking_ShiftID] [int] NULL,
	[bStatus] [bit] NULL,
	[RealTimeFrom] [nvarchar](50) NULL,
	[RealTimeTo] [nvarchar](50) NULL,
	[ReadDateFrom] [date] NULL,
	[ReadDateTo] [date] NULL,
	[ShiftWorkingHours] [nvarchar](50) NULL,
	[iActiveShiftOperationID] [int] NULL,
	[iPrevShiftOperationID] [int] NULL,
 CONSTRAINT [PK_SMRT_Parking_Shift_Operations] PRIMARY KEY CLUSTERED 
(
	[Parking_CashirShiftDateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Premises]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Premises](
	[PremisesID] [int] IDENTITY(1,1) NOT NULL,
	[PremisesCode] [nvarchar](50) NULL,
	[PremisesName] [nvarchar](150) NULL,
	[LocationID] [int] NULL,
	[LocationName] [nvarchar](150) NULL,
	[BuildingID] [int] NULL,
	[Floor] [int] NULL,
	[Notes] [nvarchar](150) NULL,
	[MaxOcc] [int] NULL,
	[PSaturday] [bit] NULL,
	[PSunday] [bit] NULL,
	[PMonday] [bit] NULL,
	[PTuesday] [bit] NULL,
	[PWednesday] [bit] NULL,
	[PThursday] [bit] NULL,
	[PFriday] [bit] NULL,
	[PSatFrom] [nchar](10) NULL,
	[PSatTo] [nchar](10) NULL,
	[PSunFrom] [nchar](10) NULL,
	[PSunTo] [nchar](10) NULL,
	[PMonFrom] [nchar](10) NULL,
	[PMonTo] [nchar](10) NULL,
	[PTuesFrom] [nchar](10) NULL,
	[PTuesTo] [nchar](10) NULL,
	[PWedFrom] [nchar](10) NULL,
	[PWedTo] [nchar](10) NULL,
	[PThursFrom] [nchar](10) NULL,
	[PThursTo] [nchar](10) NULL,
	[PFriFrom] [nchar](10) NULL,
	[PFriTo] [nchar](10) NULL,
	[PImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Premises] PRIMARY KEY CLUSTERED 
(
	[PremisesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_ProximityReaders]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_ProximityReaders](
	[ProximityReaderID] [int] IDENTITY(1,1) NOT NULL,
	[ProximityReaderCode] [nvarchar](50) NULL,
	[ProximityReaderName] [nvarchar](150) NULL,
	[ProximityReaderIP] [nvarchar](50) NULL,
	[ProximityReaderPort] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[LastUsedPCIP] [nvarchar](50) NULL,
	[AutoConnect] [bit] NULL,
	[MachineType] [int] NULL,
	[ACLock] [bit] NULL,
 CONSTRAINT [PK_SMRT_ProximityReaders] PRIMARY KEY CLUSTERED 
(
	[ProximityReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Scanner]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Scanner](
	[ScannerID] [int] IDENTITY(1,1) NOT NULL,
	[ScannerCode] [nvarchar](50) NULL,
	[ScannerName] [nvarchar](150) NULL,
	[TempFolder] [nvarchar](150) NULL,
	[SaveFolder] [nvarchar](150) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Scanner] PRIMARY KEY CLUSTERED 
(
	[ScannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Security_Level]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Security_Level](
	[SecurityLevelID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityLevel] [nvarchar](150) NULL,
	[SecurityType] [int] NULL,
 CONSTRAINT [PK_SMRT_Security_Level] PRIMARY KEY CLUSTERED 
(
	[SecurityLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_SETTINGS_GLB]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_SETTINGS_GLB](
	[TableSettingsID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](150) NULL,
	[TableDesc] [nvarchar](150) NULL,
 CONSTRAINT [PK_SMRT_SETTINGS_GLB] PRIMARY KEY CLUSTERED 
(
	[TableSettingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_TeamWork]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_TeamWork](
	[TeamWorkID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[DepartmentID] [int] NULL,
	[TeamWorkName] [nvarchar](150) NULL,
	[TeamWorkManagerID] [int] NULL,
	[TeamWorkManagerName] [nvarchar](150) NULL,
	[TeamWorkManagerCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMRT_TeamWork] PRIMARY KEY CLUSTERED 
(
	[TeamWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_TimeZone]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_TimeZone](
	[TimeZoneID] [int] IDENTITY(1,1) NOT NULL,
	[TimeZoneName] [nvarchar](50) NULL,
	[TimeZouneCounter] [int] NULL,
	[iApplyIndex] [int] NULL,
	[Sun1From] [nvarchar](50) NULL,
	[Sun1To] [nvarchar](50) NULL,
	[Sun2From] [nvarchar](50) NULL,
	[Sun2To] [nvarchar](50) NULL,
	[Sun3From] [nvarchar](50) NULL,
	[Sun3To] [nvarchar](50) NULL,
	[Mon1From] [nvarchar](50) NULL,
	[Mon1To] [nvarchar](50) NULL,
	[Mon2From] [nvarchar](50) NULL,
	[Mon2To] [nvarchar](50) NULL,
	[Mon3From] [nvarchar](50) NULL,
	[Mon3To] [nvarchar](50) NULL,
	[Tus1From] [nvarchar](50) NULL,
	[Tus1To] [nvarchar](50) NULL,
	[Tus2From] [nvarchar](50) NULL,
	[Tus2To] [nvarchar](50) NULL,
	[Tus3From] [nvarchar](50) NULL,
	[Tus3To] [nvarchar](50) NULL,
	[Wed1From] [nvarchar](50) NULL,
	[Wed1To] [nvarchar](50) NULL,
	[Wed2From] [nvarchar](50) NULL,
	[Wed2To] [nvarchar](50) NULL,
	[Wed3From] [nvarchar](50) NULL,
	[Wed3To] [nvarchar](50) NULL,
	[Thr1From] [nvarchar](50) NULL,
	[Thr1To] [nvarchar](50) NULL,
	[Thr2From] [nvarchar](50) NULL,
	[Thr2To] [nvarchar](50) NULL,
	[Thr3From] [nvarchar](50) NULL,
	[Thr3To] [nvarchar](50) NULL,
	[Fri1From] [nvarchar](50) NULL,
	[Fri1To] [nvarchar](50) NULL,
	[Fri2From] [nvarchar](50) NULL,
	[Fri2To] [nvarchar](50) NULL,
	[Fri3From] [nvarchar](50) NULL,
	[Fri3To] [nvarchar](50) NULL,
	[Sat1From] [nvarchar](50) NULL,
	[Sat1To] [nvarchar](50) NULL,
	[Sat2From] [nvarchar](50) NULL,
	[Sat2To] [nvarchar](50) NULL,
	[Sat3From] [nvarchar](50) NULL,
	[Sat3To] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_TimeZone] PRIMARY KEY CLUSTERED 
(
	[TimeZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_TimeZone_Machine]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_TimeZone_Machine](
	[TimeZone_MachineID] [int] IDENTITY(1,1) NOT NULL,
	[TimeZoneIndex1] [int] NULL,
	[TimeZoneIndex2] [int] NULL,
	[TimeZoneIndex3] [int] NULL,
	[TimeZoneIndex4] [int] NULL,
	[TimeZoneIndex5] [int] NULL,
	[TimeZoneIndex6] [int] NULL,
	[TimeZoneIndex7] [int] NULL,
	[TimeZoneID] [int] NULL,
	[MachineID] [int] NULL,
 CONSTRAINT [PK_SMRT_TimeZone_Machine] PRIMARY KEY CLUSTERED 
(
	[TimeZone_MachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_User_Settings]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_User_Settings](
	[UserSettingsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[bTwain] [bit] NULL,
	[bScanSnap] [bit] NULL,
	[bVisitData] [bit] NULL,
	[bSimpleID] [bit] NULL,
	[bComplexID] [bit] NULL,
	[MeasDimID] [int] NULL,
	[bAutoSaveData] [bit] NULL,
	[bMFCardFirst] [bit] NULL,
	[bFace] [bit] NULL,
	[bPercentage] [bit] NULL,
	[iPercentage] [decimal](18, 2) NULL,
	[CameraID] [int] NULL,
	[bAllowDateTime] [bit] NULL,
	[bAllowVisitorCategory] [bit] NULL,
	[bAllowVisitorCar] [bit] NULL,
	[bSilentFace] [bit] NULL,
	[bOCRFirst] [bit] NULL,
	[bFaceFirst] [bit] NULL,
	[bAccessControl] [bit] NULL,
	[AccessControlID] [int] NULL,
	[DL_Name] [nvarchar](150) NULL,
	[DL_NationalID] [decimal](18, 0) NULL,
	[DL_Address] [nvarchar](150) NULL,
	[DL_Job] [nvarchar](50) NULL,
	[DL_Issue] [nvarchar](50) NULL,
	[DL_Expiery] [nvarchar](50) NULL,
	[bAllow_Logout] [bit] NULL,
 CONSTRAINT [PK_SMRT_User_Settings] PRIMARY KEY CLUSTERED 
(
	[UserSettingsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Visitor]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Visitor](
	[VisitorID] [int] IDENTITY(1,1) NOT NULL,
	[RegType] [int] NULL,
	[RegDate] [date] NULL,
	[RegTime] [nvarchar](50) NULL,
	[DestinationID] [int] NULL,
	[EmployeeID] [int] NULL,
	[VisitNoteID] [int] NULL,
	[VisitNoteText] [nvarchar](150) NULL,
	[VisitorName] [nvarchar](150) NULL,
	[VisitorMobile] [nvarchar](50) NULL,
	[VisitorNationalID] [decimal](18, 0) NULL,
	[VisitorBDate] [date] NULL,
	[VisitorGender] [int] NULL,
	[VisitorAddress] [nvarchar](max) NULL,
	[VisitorCompanyID] [int] NULL,
	[VisitorCardNumber] [nvarchar](50) NULL,
	[bSentMail] [bit] NULL,
	[bSentSMS] [bit] NULL,
	[bMeetingSchedule] [bit] NULL,
	[VisitorReligion] [int] NULL,
	[VisitorJob] [nvarchar](50) NULL,
	[VisitorMarital] [int] NULL,
	[VisitorIssue] [date] NULL,
	[VisitorExpiry] [date] NULL,
	[VisitorEmail] [nvarchar](50) NULL,
	[PrintedNumber] [nvarchar](50) NULL,
	[Visitor_Level] [int] NULL,
	[oUTdATE] [date] NULL,
	[OutTime] [nvarchar](50) NULL,
	[VisitTime] [nvarchar](50) NULL,
	[iCarLicenseType] [int] NULL,
	[sChar1] [nvarchar](1) NULL,
	[sChar2] [nvarchar](1) NULL,
	[sChar3] [nvarchar](1) NULL,
	[iLicenseNumber] [decimal](18, 0) NULL,
	[iCatType] [int] NULL,
	[strCatValue] [nvarchar](50) NULL,
	[iCatID] [int] NULL,
	[CarTypeID] [int] NULL,
	[CarNote] [nvarchar](max) NULL,
	[iCarOutIndex] [int] NULL,
	[iCarLicenseType_Out] [int] NULL,
	[sChar1_Out] [nvarchar](50) NULL,
	[sChar2_Out] [nvarchar](50) NULL,
	[sChar3_Out] [nvarchar](50) NULL,
	[iLicenseNumber_Out] [decimal](18, 0) NULL,
	[CarTypeID_Out] [int] NULL,
	[CarNote_Out] [nvarchar](max) NULL,
	[VisitorRefID] [int] NULL,
	[MeetingPriority] [int] NULL,
	[OCRID] [nvarchar](100) NULL,
 CONSTRAINT [PK_SMRT_Visitor] PRIMARY KEY CLUSTERED 
(
	[VisitorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Visitor_Alarm]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Visitor_Alarm](
	[VisitorAlarmID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorRefID] [int] NULL,
	[AlarmDate] [date] NULL,
	[AlarmTime] [nvarchar](50) NULL,
	[VisitorID] [int] NULL,
	[AlarmType] [int] NULL,
 CONSTRAINT [PK_SMRT_Visitor_Alarm] PRIMARY KEY CLUSTERED 
(
	[VisitorAlarmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Visitor_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Visitor_Details](
	[VisitorDocID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorID] [int] NULL,
	[DocImage] [nvarchar](max) NULL,
	[DocType] [int] NULL,
	[DocTypeID] [int] NULL,
	[DocTypeDesc] [nvarchar](50) NULL,
	[VisitorRefID] [int] NULL,
 CONSTRAINT [PK_SMRT_Visitor_Details] PRIMARY KEY CLUSTERED 
(
	[VisitorDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Visitor_DocType]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Visitor_DocType](
	[Visitor_DocTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Visitor_DocTypeName] [nvarchar](50) NULL,
	[DocTypeIndex] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Visitor_DocType] PRIMARY KEY CLUSTERED 
(
	[Visitor_DocTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Visitor_Equipment]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Visitor_Equipment](
	[VisitorEquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorID] [int] NULL,
	[VisitDate] [date] NULL,
	[EquipmentID] [int] NULL,
	[EquipmentName] [nvarchar](150) NULL,
	[EquipmentDesc] [nvarchar](150) NULL,
	[Qty_In] [int] NULL,
	[Qty_Out] [int] NULL,
	[EquipmentSerial] [nvarchar](50) NULL,
	[EquipmentColor] [nvarchar](max) NULL,
 CONSTRAINT [PK_SMRT_Visitor_Equipment] PRIMARY KEY CLUSTERED 
(
	[VisitorEquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Visitor_Ref]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Visitor_Ref](
	[VisitorRefID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorNationalID] [decimal](18, 0) NULL,
	[iLicenseNumber] [decimal](18, 0) NULL,
	[sChar1] [nvarchar](1) NULL,
	[sChar2] [nvarchar](1) NULL,
	[sChar3] [nvarchar](1) NULL,
 CONSTRAINT [PK_SMRT_Visitor_Ref] PRIMARY KEY CLUSTERED 
(
	[VisitorRefID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_Visitor_Sec]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_Visitor_Sec](
	[VisitorSecurityID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorRefID] [int] NULL,
	[SecurityLevelType] [int] NULL,
	[SecurityLevelID] [int] NULL,
	[dFrom] [date] NULL,
	[dTo] [date] NULL,
	[TimeFrom] [nvarchar](50) NULL,
	[TimeTo] [nvarchar](50) NULL,
	[SecurityDesc] [nvarchar](max) NULL,
	[EmployeeRef] [int] NULL,
 CONSTRAINT [PK_SMRT_Visitor_Sec] PRIMARY KEY CLUSTERED 
(
	[VisitorSecurityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_VisitorCard]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_VisitorCard](
	[VisitorCardID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorCardNumber] [decimal](18, 0) NULL,
	[DestinationID] [int] NULL,
 CONSTRAINT [PK_SMRT_VisitorCard] PRIMARY KEY CLUSTERED 
(
	[VisitorCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_VIST_CAT_SPECS]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_VIST_CAT_SPECS](
	[CatSpecsID] [int] IDENTITY(1,1) NOT NULL,
	[CatSpecsTitle] [nvarchar](50) NULL,
	[CatSpecsDesc] [nvarchar](150) NULL,
	[CatSpecsType] [int] NULL,
	[CatSpecsNotes] [nvarchar](max) NULL,
	[LoopupIndex] [int] NULL,
	[isDefault] [bit] NULL,
	[isAutoLogin] [bit] NULL,
 CONSTRAINT [PK_SMRT_VIST_CAT_SPECS] PRIMARY KEY CLUSTERED 
(
	[CatSpecsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMRT_VIST_CAT_Specs_Details]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMRT_VIST_CAT_Specs_Details](
	[CatSpecsDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[CatSpecsID] [int] NULL,
	[CatSpecsValue] [nvarchar](50) NULL,
	[CatSpecsDesc] [nvarchar](150) NULL,
 CONSTRAINT [PK_SMRT_VIST_CAT_Specs_Details] PRIMARY KEY CLUSTERED 
(
	[CatSpecsDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TESTING]    Script Date: 2/3/2024 4:25:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TESTING](
	[id] [int] NOT NULL,
	[myCompressedFile] [nvarchar](max) NULL,
	[myFileNamw] [nvarchar](50) NULL,
 CONSTRAINT [PK_TESTING] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FSB_Company] ADD  CONSTRAINT [DF_Table_1_ID]  DEFAULT ((0)) FOR [Code]
GO
ALTER TABLE [dbo].[FSB_Users_Settings] ADD  CONSTRAINT [DF_FSB_Users_Settings_DirectKind]  DEFAULT ((0)) FOR [DirectKind]
GO
ALTER TABLE [dbo].[PictureTable] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SMRT_Archive_Documents] ADD  CONSTRAINT [DF__SMRT_Archive__Id__30C33EC3]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SMRT_Archive_Documents1] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[SMRT_Direct_OCR_Pages] ADD  CONSTRAINT [DF__SMRT_Direct___Id__671F4F74]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[FSB_Company]  WITH CHECK ADD  CONSTRAINT [FK_FSB_Company_FSB_Company] FOREIGN KEY([OwnCompanyID])
REFERENCES [dbo].[FSB_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[FSB_Company] CHECK CONSTRAINT [FK_FSB_Company_FSB_Company]
GO
ALTER TABLE [dbo].[FSB_Users_Settings]  WITH CHECK ADD  CONSTRAINT [FK_FSB_Users_Settings_FSB_Users] FOREIGN KEY([Usr_ID])
REFERENCES [dbo].[FSB_Users] ([UserID])
GO
ALTER TABLE [dbo].[FSB_Users_Settings] CHECK CONSTRAINT [FK_FSB_Users_Settings_FSB_Users]
GO
