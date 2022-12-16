USE [Hospital_App]
GO
/****** Object:  UserDefinedFunction [dbo].[AutoNumber]    Script Date: 12/16/2022 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[AutoNumber](@tableName nvarchar(100)) 
returns char(5)
as 
begin 
	declare @lastval nvarchar(5)
	declare @S nvarchar(max) 
	set @S ='SELECT max(RoleCode) FROM ' + @tableName
	exec sp_executesql @S, @lastval out
	if @lastval is null set @lastval = '0001' 
	declare @i int 
	set @i = right(@lastval,4) + 1 
	return  right('000' + convert(varchar(10),@i),4) 
end

GO
/****** Object:  Table [dbo].[dynamic_menu]    Script Date: 12/16/2022 6:02:52 PM ******/
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
/****** Object:  Table [dbo].[tbl_City]    Script Date: 12/16/2022 6:02:52 PM ******/
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
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 12/16/2022 6:02:52 PM ******/
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
/****** Object:  Table [dbo].[tbl_patientRegistration]    Script Date: 12/16/2022 6:02:52 PM ******/
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
	[AutoIncID]  AS ('REG-'+right('0000'+CONVERT([varchar](6),[REGID],(0)),(6))) PERSISTED,
 CONSTRAINT [PK__tbl_patientRegis__1FCDBCEB] PRIMARY KEY CLUSTERED 
(
	[REGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 12/16/2022 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[Role_Name] [varchar](50) NULL,
	[Role_Code] [varchar](50) NULL,
	[Maker] [varchar](50) NULL,
	[Mak_Date] [datetime] NULL,
	[Edit] [varchar](50) NULL,
	[Edit_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RoleDetail]    Script Date: 12/16/2022 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RoleDetail](
	[Role_Code] [varchar](10) NULL,
	[Form_ID] [varchar](50) NULL,
	[Insert_Chk] [numeric](18, 0) NULL,
	[Update_Chk] [numeric](18, 0) NULL,
	[View_Chk] [numeric](18, 0) NULL,
	[Maker] [varchar](50) NULL,
	[Mak_Date] [datetime] NULL,
	[Edit] [varchar](50) NULL,
	[Edit_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_LOGIN]    Script Date: 12/16/2022 6:02:52 PM ******/
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
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1002', N'User Setup', N'\Admin/frmUserSetup.aspx', N'1001')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1003', N'Role Setup', N'\Admin/frmRoleSetup.aspx', N'1001')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1004', N'Geo Setup', N'', N'0')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1005', N'City Setup', N'', N'1004')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1006', N'Area Setup', N'', N'1004')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1007', N'Application Setup', N'', N'0')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1008', N'Base Location Setup', N'', N'1007')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID]) VALUES (N'1009', N'Dashboard', N'\pages/frmDashboard.aspx', N'1')
GO
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'ISL', N'Islamabad')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'KAR', N'Kararchi')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'LHR', N'Lahore')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'MUL', N'Multan')
GO
INSERT [dbo].[tbl_Country] ([Country_Code], [Country_Description]) VALUES (N'PAK', N'Pakistan')
GO
SET IDENTITY_INSERT [dbo].[tbl_patientRegistration] ON 

INSERT [dbo].[tbl_patientRegistration] ([FIRST_NAME], [LAST_NAME], [ADDRESS], [ZIP_CODE], [CITY], [COUNTRY], [PHONE_NUMBER], [CNIC], [GENDER], [EMAIL], [DATE_OF_BIRTH], [MAK_DATE], [REGID]) VALUES (N'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tbl_patientRegistration] ([FIRST_NAME], [LAST_NAME], [ADDRESS], [ZIP_CODE], [CITY], [COUNTRY], [PHONE_NUMBER], [CNIC], [GENDER], [EMAIL], [DATE_OF_BIRTH], [MAK_DATE], [REGID]) VALUES (N'b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[tbl_patientRegistration] OFF
GO
INSERT [dbo].[tbl_Role] ([Role_Name], [Role_Code], [Maker], [Mak_Date], [Edit], [Edit_Date]) VALUES (NULL, N'ROL-1001', N'', CAST(N'2022-12-16T17:14:20.477' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Role] ([Role_Name], [Role_Code], [Maker], [Mak_Date], [Edit], [Edit_Date]) VALUES (NULL, N'ROL-1002', N'', CAST(N'2022-12-16T17:15:11.413' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Role] ([Role_Name], [Role_Code], [Maker], [Mak_Date], [Edit], [Edit_Date]) VALUES (NULL, N'ROL-1003', N'', CAST(N'2022-12-16T17:33:59.590' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Role] ([Role_Name], [Role_Code], [Maker], [Mak_Date], [Edit], [Edit_Date]) VALUES (NULL, N'ROL-1004', N'', CAST(N'2022-12-16T17:44:00.840' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1002', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, N'', CAST(N'2022-12-16T17:14:20.477' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1002', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), NULL, N'', CAST(N'2022-12-16T17:14:20.477' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1002', CAST(1 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), NULL, N'', CAST(N'2022-12-16T17:14:20.477' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1002', CAST(0 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, N'', CAST(N'2022-12-16T17:14:20.477' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1002', N'1002', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), NULL, N'', CAST(N'2022-12-16T17:15:11.413' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1003', N'1002', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), NULL, N'', CAST(N'2022-12-16T17:33:59.590' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1004', N'1002', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, N'', CAST(N'2022-12-16T17:44:00.840' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[USER_LOGIN] ([USER_CODE], [USER_ID], [USER_EMAIL], [USER_CONTACT], [USER_PASSWORD], [STATUS], [MAKER], [MAK_DATE], [EDITED_BY], [EDITED_DATE], [AUTHORIZER], [AUTH_DATE]) VALUES (N'USR-0001', N'ADMIN', NULL, NULL, N'RAH', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
/****** Object:  StoredProcedure [dbo].[sp_Registration]    Script Date: 12/16/2022 6:02:52 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Rolesetup]    Script Date: 12/16/2022 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Rolesetup] (@P_Action	  varchar(1000),
							   @P_User		  varchar(1000),
							   @P_FormID	  varchar(1000) = null,
							   @P_RoleCode	  varchar(1000),
							   @P_RoleName	  varchar(1000) = null,
							   @P_XMLR		  varchar(max) = null,
							   @P_XMLD		  varchar(max) = null
							   )AS
Declare @XMLR_Data   xml;
Declare @XMLD_Data   xml;
Declare @return_value int;


BEGIN
set @XMLR_Data = @P_XMLR
set @XMLD_Data = @P_XMLD

	IF @P_Action = 'F'
	begin
	select * from dynamic_menu where ParentID > 0;

	end

	else IF @P_Action = 'Code'
	begin
	select  isnull((select ('ROL-') + Cast( Cast(right(Max(Role_Code),4) as int) + 1 as varchar) from tbl_Role), 'ROL-1001')
	end

	else IF @P_Action = 'INS'
	begin
	insert into tbl_Role 
	(Role_Code,
	 Role_Name,
	 Maker,
	 Mak_Date) 
	 Select 
	 @XMLR_Data.value('(/Role//RoleCode/node())[1]', 'varchar(max)'),
	 @XMLR_Data.value('(/Role//RoleName/node())[1]', 'varchar(max)'),
	 @P_User,
	 getdate()

	 insert into tbl_RoleDetail
	 (Role_Code,
	  Form_ID,
	  Insert_Chk,
	  Update_Chk,
	  View_Chk,
	  Maker,
	  Mak_Date)
	  Select
	  xData.value('RoleCode[1]', 'varchar(10)') RoleCode,
	  xData.value('FormID[1]', 'varchar(10)') Form_ID,
	  xData.value('Insert[1]', 'varchar(10)') 'Insert',
	  xData.value('Update[1]', 'varchar(10)') 'Update',
	  xData.value('View[1]', 'varchar(10)') 'View',
	  @P_User,
	  getdate()
	  From @XMLD_Data.nodes('/RoleDetail/Row') AS x (xData)
	  select 'Successfully Inserted' = @return_value
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_userlogin]    Script Date: 12/16/2022 6:02:52 PM ******/
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
