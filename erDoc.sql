USE [POC]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 23-01-2022 23:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First name] [nvarchar](20) NULL,
	[Last Name] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Dob] [datetime] NULL,
	[HospitalName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Specialist] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedByID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 23-01-2022 23:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First name] [nvarchar](20) NULL,
	[Last Name] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Dob] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedByID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientAppointment]    Script Date: 23-01-2022 23:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAppointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First name] [nvarchar](20) NULL,
	[Last Name] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[AppointmentDate] [datetime] NULL,
	[Specialist] [nvarchar](50) NULL,
	[DoctorId] [int] NULL,
	[Patientid] [int] NULL,
	[MorningSession] [datetime] NULL,
	[Morningid] [int] NULL,
	[NoonSession] [datetime] NULL,
	[Noonid] [int] NULL,
	[EveningSession] [datetime] NULL,
	[Eveningid] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[Comment] [nvarchar](500) NULL,
	[Status] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedByID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_PatientAppointment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23-01-2022 23:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[LoginName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IsDisabled] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedByID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 23-01-2022 23:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[Rolename] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedByID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedByID] [int] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([ID], [First name], [Last Name], [Email], [Mobile], [Dob], [HospitalName], [Address], [Specialist], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID], [IsDeleted]) VALUES (2, N'Doctor1', N'test', N'shan@test.com', N'09994438772', CAST(N'1987-09-08T00:00:00.000' AS DateTime), N'test', N'test', N'Neroolistu', CAST(N'2022-01-22T23:10:13.333' AS DateTime), 1, NULL, NULL, 0)
INSERT [dbo].[Doctor] ([ID], [First name], [Last Name], [Email], [Mobile], [Dob], [HospitalName], [Address], [Specialist], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID], [IsDeleted]) VALUES (3, N'Doctor3', N'test', N'shan@test.com', N'09994438772', CAST(N'1987-09-08T00:00:00.000' AS DateTime), N'test', N'test', N'tsr', CAST(N'2022-01-22T23:45:19.123' AS DateTime), 1, NULL, NULL, 0)
INSERT [dbo].[Doctor] ([ID], [First name], [Last Name], [Email], [Mobile], [Dob], [HospitalName], [Address], [Specialist], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID], [IsDeleted]) VALUES (4, N'Doctor2', N'test', N'shan@test.com', N'09994438772', CAST(N'1987-09-08T00:00:00.000' AS DateTime), N'test', N'test', N'Neroolistu1', CAST(N'2022-01-22T23:46:53.220' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[Doctor] ([ID], [First name], [Last Name], [Email], [Mobile], [Dob], [HospitalName], [Address], [Specialist], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID], [IsDeleted]) VALUES (5, N'shan', N'test', N'shan@test.com', N'09994438772', CAST(N'2000-07-09T00:00:00.000' AS DateTime), N'test', N'test', N'test', CAST(N'2022-01-23T22:55:55.873' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([ID], [First name], [Last Name], [Email], [Mobile], [Dob], [Address], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID], [IsDeleted]) VALUES (1, N'Patient', N'test', N'shan@test.com', N'09994438772', CAST(N'1987-09-08T00:00:00.000' AS DateTime), N'test', CAST(N'2022-01-23T00:01:23.353' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientAppointment] ON 

INSERT [dbo].[PatientAppointment] ([ID], [First name], [Last Name], [Email], [Mobile], [AppointmentDate], [Specialist], [DoctorId], [Patientid], [MorningSession], [Morningid], [NoonSession], [Noonid], [EveningSession], [Eveningid], [Note], [Comment], [Status], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID], [IsDeleted]) VALUES (1, N'shan', N'test', N'shan@test.com', N'09994438772', CAST(N'2022-10-10T00:00:00.000' AS DateTime), N'Neroolistu', 2, 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, N'test', N'test', N'NEW', CAST(N'2022-01-23T16:22:11.543' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[PatientAppointment] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Name], [LoginName], [Password], [Email], [IsDisabled], [IsDeleted], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID]) VALUES (1, N'shan', N'Test', N'shanAdmin', N'admin@erdoc.com', N'1234', N'admin@erdoc.com', 0, 0, CAST(N'2022-01-23T10:24:36.940' AS DateTime), 1, CAST(N'2022-01-23T10:24:36.940' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Name], [LoginName], [Password], [Email], [IsDisabled], [IsDeleted], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID]) VALUES (2, N'shan', N'Test', N'shanPatient', N'Patient@erdoc.com', N'1234', N'Patient@erdoc.com', 0, 0, CAST(N'2022-01-23T10:24:36.940' AS DateTime), 1, CAST(N'2022-01-23T10:24:36.940' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [Name], [LoginName], [Password], [Email], [IsDisabled], [IsDeleted], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID]) VALUES (3, N'shan', N'Test', N'shanDoctor', N'Doctor@erdoc.com', N'1234', N'Doctor@erdoc.com', 0, 0, CAST(N'2022-01-23T10:24:36.940' AS DateTime), 1, CAST(N'2022-01-23T10:24:36.940' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([UserRoleID], [Rolename], [UserID], [IsDeleted], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID]) VALUES (1, N'Admin', 1, 0, CAST(N'2022-01-23T10:30:51.390' AS DateTime), 1, CAST(N'2022-01-23T10:30:51.390' AS DateTime), 1)
INSERT [dbo].[UserRole] ([UserRoleID], [Rolename], [UserID], [IsDeleted], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID]) VALUES (2, N'Patient', 2, 0, CAST(N'2022-01-23T10:30:51.393' AS DateTime), 1, CAST(N'2022-01-23T10:30:51.393' AS DateTime), 1)
INSERT [dbo].[UserRole] ([UserRoleID], [Rolename], [UserID], [IsDeleted], [CreatedDate], [CreatedByID], [ModifiedDate], [ModifiedByID]) VALUES (3, N'Doctor', 3, 0, CAST(N'2022-01-23T10:30:51.393' AS DateTime), 1, CAST(N'2022-01-23T10:30:51.393' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
ALTER TABLE [dbo].[PatientAppointment]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointment_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[PatientAppointment] CHECK CONSTRAINT [FK_PatientAppointment_Doctor]
GO
ALTER TABLE [dbo].[PatientAppointment]  WITH CHECK ADD  CONSTRAINT [FK_PatientAppointment_Patient] FOREIGN KEY([Patientid])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[PatientAppointment] CHECK CONSTRAINT [FK_PatientAppointment_Patient]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_UserRole] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_UserRole]
GO
