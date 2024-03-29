USE [Hospital_App]
GO
/****** Object:  UserDefinedFunction [dbo].[AutoNumber]    Script Date: 1/25/2023 1:04:03 PM ******/
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
/****** Object:  Table [dbo].[ddl_Status]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ddl_Status](
	[ID] [varchar](50) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_ddl_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dynamic_menu]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dynamic_menu](
	[FormID] [varchar](50) NOT NULL,
	[Formname] [varchar](50) NULL,
	[PageUrl] [varchar](50) NULL,
	[ParentID] [varchar](50) NULL,
	[Icon] [varchar](50) NULL,
 CONSTRAINT [PK_dynamic_menu] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 1/25/2023 1:04:03 PM ******/
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
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 1/25/2023 1:04:03 PM ******/
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
/****** Object:  Table [dbo].[tbl_displayDetail]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_displayDetail](
	[form_id] [nvarchar](50) NULL,
	[sp_paraname] [nvarchar](50) NULL,
	[isoutput] [nvarchar](50) NULL,
	[column_order] [nvarchar](50) NULL,
	[default_value] [nvarchar](50) NULL,
	[row_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_displayDetail] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DisplayMaster]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DisplayMaster](
	[form_id] [nvarchar](50) NULL,
	[procedure_name] [nvarchar](50) NULL,
	[grid_header] [nvarchar](50) NULL,
	[grid_bindcolumn] [nvarchar](50) NULL,
	[dml_formlink] [nvarchar](50) NULL,
	[exportquery] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_patientRegistration]    Script Date: 1/25/2023 1:04:03 PM ******/
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
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 1/25/2023 1:04:03 PM ******/
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
/****** Object:  Table [dbo].[tbl_RoleDetail]    Script Date: 1/25/2023 1:04:03 PM ******/
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
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[User_Code] [varchar](50) NOT NULL,
	[User_ID] [varchar](50) NULL,
	[User_Email] [varchar](50) NULL,
	[User_Contact] [varchar](50) NULL,
	[User_Password] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Maker] [varchar](50) NULL,
	[Mak_Date] [datetime] NULL,
	[Edited_By] [varchar](50) NULL,
	[Edited_Date] [datetime] NULL,
	[Full_Name] [varchar](50) NULL,
	[Depart_Name] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[Role_Code] [varchar](50) NULL,
 CONSTRAINT [PK_USER_LOGIN] PRIMARY KEY CLUSTERED 
(
	[User_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ddl_Status] ([ID], [Status]) VALUES (N'1', N'Log Out')
INSERT [dbo].[ddl_Status] ([ID], [Status]) VALUES (N'2', N'Lock')
GO
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1001', N'User Management', N'', N'0', N'bi bi-people')
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1002', N'User Setup', N'\DataSetup/frmDataList.aspx', N'1001', NULL)
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1003', N'Role Setup', N'\DataSetup/frmDataList.aspx', N'1001', NULL)
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1004', N'Geo Setup', N'', N'0', NULL)
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1005', N'City Setup', N'\DataSetup/frmDataList.aspx', N'1004', NULL)
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1006', N'Area Setup', N'', N'1004', NULL)
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1007', N'Application Setup', N'', N'0', NULL)
INSERT [dbo].[dynamic_menu] ([FormID], [Formname], [PageUrl], [ParentID], [Icon]) VALUES (N'1008', N'Base Location Setup', N'', N'1007', NULL)
GO
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'ISL', N'Islamabad')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'KAR', N'Kararchi')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'LHR', N'Lahore')
INSERT [dbo].[tbl_City] ([City_code], [City_Description]) VALUES (N'MUL', N'Multan')
GO
INSERT [dbo].[tbl_Country] ([Country_Code], [Country_Description]) VALUES (N'PAK', N'Pakistan')
GO
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1002', N'@P_User', NULL, N'1', N'user', N'1')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1003', N'@P_XMLR', NULL, N'6', N'XMLRole', N'10')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1003', N'@P_XMLD', NULL, N'7', N'XMLDetail', N'11')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1002', N'@P_Action', NULL, N'2', N'ACT', N'2')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1002', N'@P_FormID', NULL, N'3', N'1002', N'3')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1002', N'@P_XMLData', NULL, N'4', NULL, N'4')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1003', N'@P_Action', NULL, N'1', N'ACT', N'5')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1003', N'@P_User', NULL, N'2', N'user', N'6')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1003', N'@P_FormID', NULL, N'3', N'1003', N'7')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1003', N'@P_RoleCode', NULL, N'4', N'rolecode', N'8')
INSERT [dbo].[tbl_displayDetail] ([form_id], [sp_paraname], [isoutput], [column_order], [default_value], [row_id]) VALUES (N'1003', N'@P_RoleName', NULL, N'5', N'rolename', N'9')
GO
INSERT [dbo].[tbl_DisplayMaster] ([form_id], [procedure_name], [grid_header], [grid_bindcolumn], [dml_formlink], [exportquery]) VALUES (N'1002', N'sp_Users', N'User Code,User Name', N'User_Code,User_ID', N'\Admin/frmUserSetup.aspx', NULL)
INSERT [dbo].[tbl_DisplayMaster] ([form_id], [procedure_name], [grid_header], [grid_bindcolumn], [dml_formlink], [exportquery]) VALUES (N'1003', N'sp_Rolesetup', N'Role_Name,RoleCode', N'Role_Code,Role_Name', N'\Admin/frmRoleSetup.aspx', NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_patientRegistration] ON 

INSERT [dbo].[tbl_patientRegistration] ([FIRST_NAME], [LAST_NAME], [ADDRESS], [ZIP_CODE], [CITY], [COUNTRY], [PHONE_NUMBER], [CNIC], [GENDER], [EMAIL], [DATE_OF_BIRTH], [MAK_DATE], [REGID]) VALUES (N'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tbl_patientRegistration] ([FIRST_NAME], [LAST_NAME], [ADDRESS], [ZIP_CODE], [CITY], [COUNTRY], [PHONE_NUMBER], [CNIC], [GENDER], [EMAIL], [DATE_OF_BIRTH], [MAK_DATE], [REGID]) VALUES (N'b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[tbl_patientRegistration] OFF
GO
INSERT [dbo].[tbl_Role] ([Role_Name], [Role_Code], [Maker], [Mak_Date], [Edit], [Edit_Date]) VALUES (N'ADMIN', N'ROL-1001', N'', CAST(N'2023-01-04T17:29:07.417' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Role] ([Role_Name], [Role_Code], [Maker], [Mak_Date], [Edit], [Edit_Date]) VALUES (N'Test1', N'ROL-1002', N'', CAST(N'2023-01-04T17:29:32.913' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_Role] ([Role_Name], [Role_Code], [Maker], [Mak_Date], [Edit], [Edit_Date]) VALUES (N'Test2', N'ROL-1003', N'', CAST(N'2023-01-04T17:29:54.203' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1002', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:07.417' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1003', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:07.417' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1005', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:07.417' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1006', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:07.417' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1001', N'1008', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:07.417' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1002', N'1002', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:32.927' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1002', N'1003', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:32.927' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1002', N'1005', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:32.927' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1002', N'1006', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:32.927' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1002', N'1008', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:32.927' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1003', N'1002', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:54.203' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1003', N'1003', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:54.203' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1003', N'1005', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:54.203' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1003', N'1006', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:54.203' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_RoleDetail] ([Role_Code], [Form_ID], [Insert_Chk], [Update_Chk], [View_Chk], [Maker], [Mak_Date], [Edit], [Edit_date]) VALUES (N'ROL-1003', N'1008', CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), N'', CAST(N'2023-01-04T17:29:54.203' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_Users] ([User_Code], [User_ID], [User_Email], [User_Contact], [User_Password], [Status], [Maker], [Mak_Date], [Edited_By], [Edited_Date], [Full_Name], [Depart_Name], [Designation], [Role_Code]) VALUES (N'USR-1001', N'ADMIN', N'raheel123@gmail.com', N'03493478620', N'RAH', NULL, N'', CAST(N'2022-12-23T16:18:51.743' AS DateTime), NULL, NULL, N'RICAAZ', NULL, N'Web Designer & Developer', N'ROL-1001')
INSERT [dbo].[tbl_Users] ([User_Code], [User_ID], [User_Email], [User_Contact], [User_Password], [Status], [Maker], [Mak_Date], [Edited_By], [Edited_Date], [Full_Name], [Depart_Name], [Designation], [Role_Code]) VALUES (N'USR-1002', N'Test1', N'Test', N'Test', N'Test', N'1', N'', CAST(N'2022-12-30T17:35:27.440' AS DateTime), NULL, NULL, N'Test', NULL, NULL, N'ROL-1002')
INSERT [dbo].[tbl_Users] ([User_Code], [User_ID], [User_Email], [User_Contact], [User_Password], [Status], [Maker], [Mak_Date], [Edited_By], [Edited_Date], [Full_Name], [Depart_Name], [Designation], [Role_Code]) VALUES (N'USR-1003', N'Test2', N'Test', N'Test', N'Test', NULL, NULL, CAST(N'2022-12-30T17:35:27.440' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'ROL-1003')
INSERT [dbo].[tbl_Users] ([User_Code], [User_ID], [User_Email], [User_Contact], [User_Password], [Status], [Maker], [Mak_Date], [Edited_By], [Edited_Date], [Full_Name], [Depart_Name], [Designation], [Role_Code]) VALUES (N'USR-1004', N'chk validation', N'raheel123@gmail.com', N'03493478620', N'1234', N'1', N'ADMIN', CAST(N'2023-01-05T12:39:36.403' AS DateTime), NULL, NULL, N'Raheel ', NULL, NULL, N'ROL-1001')
INSERT [dbo].[tbl_Users] ([User_Code], [User_ID], [User_Email], [User_Contact], [User_Password], [Status], [Maker], [Mak_Date], [Edited_By], [Edited_Date], [Full_Name], [Depart_Name], [Designation], [Role_Code]) VALUES (N'USR-1005', N'ADMIN1', N'abcd1234@gmail.com ', N'03493478620', N'1234', N'1', N'ADMIN', CAST(N'2023-01-12T10:41:52.620' AS DateTime), NULL, NULL, N'Raheel ', N'test1', N'aaa', N'ROL-1001')
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetListData]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetListData](@P_FormID	varchar(4000)
								)AS
BEGIN
SET NOCOUNT ON;
	SELECT a.form_id,
		   a.procedure_name,
		   a.grid_header,
		   a.grid_bindcolumn,
		   a.dml_formlink,
		   b.Formname,
		   a.exportquery
	from tbl_DisplayMaster a , dynamic_menu b
	where a.form_id = b.FormID
	and a.form_id = @P_FormID;
	select * from tbl_displaydetail 
	where form_id = @P_FormID
	order by column_order;
END




















































GO
/****** Object:  StoredProcedure [dbo].[sp_Permission]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Permission](@P_Action nvarchar(50) = null,
									  @P_RoleCode nvarchar(50) = null,
									  @P_Parent nvarchar(50) = null)
									  AS
BEGIN
	if @P_Action = 'node'
		begin
			select *  from  dynamic_menu where formid in (
			select f.parentid from tbl_role m, tbl_roledetail  d , dynamic_menu f
			where m.role_code = d.role_code and d.form_id = f.formid
			and m.role_code =  @P_RoleCode
			and d.View_Chk = 1)
		end

	else if @P_Action = 'child'
		begin
			select  f.formid ,  f.Formname , f.PageUrl , d.Insert_Chk,d.Update_Chk,d.View_Chk from tbl_role m, tbl_roledetail  d , dynamic_menu f
			where m.role_code = d.role_code and d.form_id = f.formid
			and m.role_code = @P_RoleCode
			and d.View_Chk = 1
			and parentid = @P_Parent
		end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Registration]    Script Date: 1/25/2023 1:04:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Rolesetup]    Script Date: 1/25/2023 1:04:03 PM ******/
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

	else IF @P_Action = 'SG'
	begin
	select Role_Code,Role_Name from tbl_Role
	end

	else if @P_Action = 'SO'
	begin
	select * from tbl_role
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
/****** Object:  StoredProcedure [dbo].[sp_Userlogin]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Userlogin](@P_Userid nvarchar(50) = null,
									 @P_Password nvarchar(50) = null)
									 AS
BEGIN
DECLARE @role varchar(50)
	if exists(select * from tbl_Users where [user_id] = @P_Userid and USER_PASSWORD = @P_Password)
	   begin
	   select * from tbl_users where [user_id] = @p_userid and  user_password = @p_password
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Users]    Script Date: 1/25/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[sp_Users] (@P_User nvarchar(1000) = null,
							@P_Action nvarchar(1000),
							@P_FormID nvarchar(1000) = null,
							@P_XMLData varchar(max) = null)AS
Declare @return_value int;
BEGIN
	if @P_Action = 'IN'
	begin
	insert into tbl_Users
	(
	User_Code,
	User_ID,
	User_Email,
	User_Contact,
	User_Password,
	Status,
	Maker,
	Mak_Date,
	Full_Name,
	Depart_Name,
	Designation,
	Role_Code
	)
	select 
	cast(@P_XMLData as xml).value('(//UserCode/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//LoginID/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//UserEmail/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//UserContact/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//UserPassword/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//Status/node())[1]','varchar(max)'),
	@P_User,
	getdate(),
	cast(@P_XMLData as xml).value('(//FullName/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//DepartName/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//Designation/node())[1]','varchar(max)'),
	cast(@P_XMLData as xml).value('(//RoleCode/node())[1]','varchar(max)')
	end

	else if @P_Action = 'GT'
	begin
	select  isnull((select ('USR-') + Cast( Cast(right(Max(User_Code),4) as int) + 1 as varchar) from tbl_Users), 'USR-1001')
	end

	else if @P_Action = 'ddlS'
	begin
	select * from ddl_Status
	end 

	else if @P_Action = 'SO'
	begin
	select user_code,user_id,role_code,status from tbl_users
	end
END

GO
