USE [master]
GO
/****** Object:  Database [SWD392Project_2]    Script Date: 3/16/2025 1:11:18 AM ******/
CREATE DATABASE [SWD392Project_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWD392Project_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRANVANTHAO\MSSQL\DATA\SWD392Project_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWD392Project_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRANVANTHAO\MSSQL\DATA\SWD392Project_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWD392Project_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWD392Project_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWD392Project_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWD392Project_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWD392Project_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWD392Project_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWD392Project_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWD392Project_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWD392Project_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWD392Project_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWD392Project_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWD392Project_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWD392Project_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWD392Project_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWD392Project_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWD392Project_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWD392Project_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWD392Project_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWD392Project_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWD392Project_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWD392Project_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWD392Project_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWD392Project_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWD392Project_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWD392Project_2] SET RECOVERY FULL 
GO
ALTER DATABASE [SWD392Project_2] SET  MULTI_USER 
GO
ALTER DATABASE [SWD392Project_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWD392Project_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWD392Project_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWD392Project_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWD392Project_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWD392Project_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWD392Project_2', N'ON'
GO
ALTER DATABASE [SWD392Project_2] SET QUERY_STORE = OFF
GO
USE [SWD392Project_2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] NOT NULL,
	[userId] [int] NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phoneNumber] [varchar](20) NULL,
	[status] [varchar](50) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdministratorInformation]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorInformation](
	[userId] [int] NOT NULL,
	[totalArticles] [int] NULL,
	[lastModify] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdministratorProcedure]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorProcedure](
	[adminProcedureId] [int] NOT NULL,
	[procedureCount] [int] NULL,
	[lastUpdated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[adminProcedureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdministratorSystem]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorSystem](
	[userId] [int] NOT NULL,
	[totalUsers] [int] NULL,
	[bannedUsers] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankingHistory]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankingHistory](
	[bankingHistoryId] [int] NOT NULL,
	[customerId] [int] NULL,
	[accountId] [int] NULL,
	[action] [varchar](255) NULL,
	[description] [text] NULL,
	[orderId] [varchar](100) NULL,
	[detail] [text] NULL,
	[amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[bankingHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] NOT NULL,
	[customerId] [int] NULL,
	[createdDate] [datetime] NULL,
	[title] [varchar](255) NULL,
	[description] [text] NULL,
	[filedId] [int] NULL,
	[answeredBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[contentId] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[createdDate] [datetime] NULL,
	[status] [varchar](50) NULL,
	[adminId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[contentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[userId] [int] NOT NULL,
	[membershipLevel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_News_View]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_News_View](
	[customerId] [int] NOT NULL,
	[newsId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerId] ASC,
	[newsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Procedure]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Procedure](
	[userId] [int] NOT NULL,
	[procedureId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[procedureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Procedure_Template]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Procedure_Template](
	[customerId] [int] NOT NULL,
	[templateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerId] ASC,
	[templateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSearchHistory]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSearchHistory](
	[searchHistoryId] [int] NOT NULL,
	[customerId] [int] NULL,
	[accountId] [int] NULL,
	[action] [varchar](255) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[searchHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[fileId] [int] NOT NULL,
	[fileName] [varchar](255) NULL,
	[fileType] [varchar](50) NULL,
	[fileSize] [int] NULL,
	[uploadTime] [datetime] NULL,
	[filePath] [varchar](255) NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[fileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InitiatePayment]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InitiatePayment](
	[paymentId] [int] NOT NULL,
	[customerId] [int] NULL,
	[procedureId] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[status] [varchar](50) NULL,
	[transactionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[newsId] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[createDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[newsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procedures]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedures](
	[procedureId] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[categoryId] [int] NULL,
	[createdDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[status] [varchar](50) NULL,
	[processingTime] [int] NULL,
	[fee] [decimal](10, 2) NULL,
	[paymentRequired] [text] NULL,
	[submissionMethod] [varchar](255) NULL,
	[approvalAuthority] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[procedureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProceduresHistory]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProceduresHistory](
	[procedureHistoryId] [int] NOT NULL,
	[customerId] [int] NULL,
	[accountId] [int] NULL,
	[action] [varchar](255) NULL,
	[description] [text] NULL,
	[detail] [text] NULL,
	[dateAccept] [datetime] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[procedureHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcedureSubmission]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureSubmission](
	[submissionId] [int] NOT NULL,
	[customerId] [int] NULL,
	[templateId] [int] NULL,
	[title] [varchar](255) NULL,
	[description] [text] NULL,
	[submissionDate] [datetime] NULL,
	[status] [varchar](50) NULL,
	[adminProcedureId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[submissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcedureTemplate]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureTemplate](
	[templateId] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[data] [text] NULL,
	[description] [text] NULL,
	[status] [varchar](50) NULL,
	[adminId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[templateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[userId] [int] NOT NULL,
	[position] [varchar](100) NULL,
	[status] [varchar](50) NULL,
	[department] [varchar](100) NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/16/2025 1:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] NOT NULL,
	[fullName] [varchar](255) NOT NULL,
	[address] [text] NULL,
	[dob] [date] NULL,
	[gender] [varchar](10) NULL,
	[role] [varchar](50) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[AdministratorInformation] ADD  DEFAULT (getdate()) FOR [lastModify]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Content] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Files] ADD  DEFAULT (getdate()) FOR [uploadTime]
GO
ALTER TABLE [dbo].[InitiatePayment] ADD  DEFAULT (getdate()) FOR [transactionDate]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Procedures] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[ProcedureSubmission] ADD  DEFAULT (getdate()) FOR [submissionDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdministratorInformation]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Staff] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdministratorSystem]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BankingHistory]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[BankingHistory]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([answeredBy])
REFERENCES [dbo].[AdministratorInformation] ([userId])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([filedId])
REFERENCES [dbo].[Files] ([fileId])
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD FOREIGN KEY([adminId])
REFERENCES [dbo].[AdministratorInformation] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_News_View]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_News_View]  WITH CHECK ADD FOREIGN KEY([newsId])
REFERENCES [dbo].[News] ([newsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_Procedure]  WITH CHECK ADD FOREIGN KEY([procedureId])
REFERENCES [dbo].[Procedures] ([procedureId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_Procedure]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_Procedure_Template]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_Procedure_Template]  WITH CHECK ADD FOREIGN KEY([templateId])
REFERENCES [dbo].[ProcedureTemplate] ([templateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerSearchHistory]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InitiatePayment]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InitiatePayment]  WITH CHECK ADD FOREIGN KEY([procedureId])
REFERENCES [dbo].[Procedures] ([procedureId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Procedures]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ProceduresHistory]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[ProceduresHistory]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProcedureSubmission]  WITH CHECK ADD FOREIGN KEY([adminProcedureId])
REFERENCES [dbo].[AdministratorProcedure] ([adminProcedureId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProcedureSubmission]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([userId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProcedureTemplate]  WITH CHECK ADD FOREIGN KEY([adminId])
REFERENCES [dbo].[AdministratorProcedure] ([adminProcedureId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [SWD392Project_2] SET  READ_WRITE 
GO
