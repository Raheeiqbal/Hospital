USE [Hospital_App]
GO
/****** Object:  Table [dbo].[dynamic_menu]    Script Date: 12/12/2022 6:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dynamic_menu](
	[FormID] [varchar](50) NOT NULL,
	[Formname] [varchar](50) NULL,
	[PageUrl] [varchar](50) NULL,
	[ParentID] [varchar](50) NULL,
 CONSTRAINT [PK_dynamic_menu] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 12/12/2022 6:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[City_code] [varchar](50) NOT NULL,
	[City_Description] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[City_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 12/12/2022 6:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[Country_Code] [varchar](50) NOT NULL,
	[Country_Description] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Country] PRIMARY KEY CLUSTERED 
(
	[Country_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_patientRegistration]    Script Date: 12/12/2022 6:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_patientRegistration](
	[FIRST_NAME] [varchar](50) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[ADDRESS] [varchar](50) NULL,
	[ZIP_CODE] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NULL,
	[PHONE_NUMBER] [varchar](50) NULL,
	[CNIC] [varchar](50) NULL,
	[GENDER] [varchar](50) NULL,
	[EMAIL] [varchar](50) NULL,
	[DATE_OF_BIRTH] [datetime] NULL,
	[MAK_DATE] [datetime] NULL,
	[REGID] [int] IDENTITY(1,1) NOT NULL,
	[AutoIncID]  AS ('XS'+right('000000'+CONVERT([varchar](6),[REGID],0),(6))) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[REGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_LOGIN]    Script Date: 12/12/2022 6:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_LOGIN](
	[USER_CODE] [varchar](50) NOT NULL,
	[USER_ID] [varchar](50) NULL,
	[USER_EMAIL] [varchar](50) NULL,
	[USER_CONTACT] [varchar](50) NULL,
	[USER_PASSWORD] [varchar](50) NULL,
	[STATUS] [varchar](50) NULL,
	[MAKER] [varchar](50) NULL,
	[MAK_DATE] [datetime] NULL,
	[EDITED_BY] [varchar](50) NULL,
	[EDITED_DATE] [datetime] NULL,
	[AUTHORIZER] [varchar](50) NULL,
	[AUTH_DATE] [datetime] NULL,
 CONSTRAINT [PK_USER_LOGIN] PRIMARY KEY CLUSTERED 
(
	[USER_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1001', N'User Management', N'', N'0')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1002', N'User Setup', N'Admin/frmUserSetup.aspx', N'1001')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1003', N'Role Setup', N'', N'1001')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1004', N'Geo Setup', N'', N'0')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1005', N'City Setup', N'', N'1004')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1006', N'Area Setup', N'', N'1004')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1007', N'Application Setup', N'', N'0')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1008', N'Base Location Setup', N'', N'1007')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1009', N'Dashboard', N'pages/frmDashboard.aspx', N'0')
GO
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'ISL', N'Islamabad')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'KAR', N'Kararchi')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'LHR', N'Lahore')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'MUL', N'Multan')
GO
INSERT [dbo].[tbl_Country] ([Country_Code], [Country_Description]) VALUES (N'PAK', N'Pakistan')
GO
SET IDENTITY_INSERT [dbo].[tbl_patientRegistration] ON 

INSERT [dbo].[tbl_patientRegistration] ([FIRST_NAME], [LAST_NAME], [ADDRESS], [ZIP_CODE], [CITY], [COUNTRY], [PHONE_NUMBER], [CNIC], [GENDER], [EMAIL], [DATE_OF_BIRTH], [MAK_DATE], [REGID]) VALUES (N'Raheel', N'ali', N'karachi', N'5646', N'karachi', N'pakistan', N'0300000000', N'4545615486486', N'Male', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_patientRegistration] OFF
GO
INSERT [dbo].[USER_LOGIN] ([USER_CODE], [USER_ID], [USER_EMAIL], [USER_CONTACT], [USER_PASSWORD], [STATUS], [MAKER], [MAK_DATE], [EDITED_BY], [EDITED_DATE], [AUTHORIZER], [AUTH_DATE]) VALUES (N'USR-0001', N'ADMIN', NULL, NULL, N'RAH', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
/****** Object:  StoredProcedure [dbo].[sp_Registration]    Script Date: 12/12/2022 6:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registration](@P_Action varchar(10))

	
	
AS
BEGIN
	if @P_Action = 'city'
	begin
	select City_code,City_Description from tbl_City;
	end


	else if @P_Action = 'Con'
	begin
	select Country_code,Country_Description from tbl_Country;
	end 


	else if @P_Action = 'autogen'
	begin
	 alter table tbl_patientRegistration add REGID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
   REGID AS 'XS' + RIGHT('000000' + CAST(REGID AS VARCHAR(6)), 6) PERSISTED
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_userlogin]    Script Date: 12/12/2022 6:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_userlogin](@P_Userid varchar(50) = null,
										 @P_Password varchar(50) = null,
										 @P_ValidUser varchar(50) = null,
										 @P_UserSession varchar(50) = null)AS
BEGIN

	if exists(select * from user_login where [USER_ID] = @P_Userid and USER_PASSWORD = @P_Password)
	   begin
		 select * from user_login where [USER_ID] = @P_Userid and USER_PASSWORD = @P_Password
		  
	   end
	
	
END
GO
