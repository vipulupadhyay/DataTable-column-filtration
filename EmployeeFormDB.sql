USE [master]
GO
/****** Object:  Database [EmployeeFormDB]    Script Date: 17-01-2018 AM 09:19:53 ******/
CREATE DATABASE [EmployeeFormDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeFormDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EmployeeFormDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeFormDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EmployeeFormDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeFormDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeFormDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeFormDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeFormDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeFormDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeFormDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeFormDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeFormDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeFormDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeFormDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeFormDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeFormDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EmployeeFormDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EmployeeFormDB]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[BankName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Degree]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[DegreeId] [int] IDENTITY(1,1) NOT NULL,
	[DegreeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[DegreeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Education]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[EducationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[DegreeId] [int] NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sport]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sport](
	[SportId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[SportName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sport] PRIMARY KEY CLUSTERED 
(
	[SportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[ProfileImage] [nvarchar](50) NULL,
	[Passward] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IsDelete] [bit] NULL CONSTRAINT [DF_Users_IsDelete]  DEFAULT ((0)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([BankId], [UserId], [BankName]) VALUES (1, 1, N'yes')
INSERT [dbo].[Bank] ([BankId], [UserId], [BankName]) VALUES (2, 2, N'test')
SET IDENTITY_INSERT [dbo].[Bank] OFF
SET IDENTITY_INSERT [dbo].[Education] ON 

INSERT [dbo].[Education] ([EducationId], [UserId], [DegreeId]) VALUES (1, 1, 1)
INSERT [dbo].[Education] ([EducationId], [UserId], [DegreeId]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[Education] OFF
SET IDENTITY_INSERT [dbo].[Sport] ON 

INSERT [dbo].[Sport] ([SportId], [UserId], [SportName]) VALUES (1, 1, N'cricket')
INSERT [dbo].[Sport] ([SportId], [UserId], [SportName]) VALUES (2, 2, N'test')
SET IDENTITY_INSERT [dbo].[Sport] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FullName], [Gender], [ProfileImage], [Passward], [Email], [IsDelete]) VALUES (1, N'Vipul Upadhyay', N'Male', N'Hydrangeas.jpg', N'b2tYb7CkCT8=', N'imvipul@yahoo.com', 0)
INSERT [dbo].[Users] ([UserId], [FullName], [Gender], [ProfileImage], [Passward], [Email], [IsDelete]) VALUES (2, N'Kapil1', N'Female', N'Desert.jpg', N'UYblxj1RPhWn2Jp+wTl9Vg==', N'kapil@yahoo.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[deleteUserById]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteUserById]
(
@UserID int
)
AS
BEGIN
	update Users set IsDelete=1 where UserId=@UserID
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetAllUsers]
(
   /*– Pagination Parameters */
   @PageNo INT = 1,
   @RecordPerPage INT = 10,
   /*– Sorting Parameters */
   @SortField NVARCHAR(20) = 'FullName',
   @SortOrder NVARCHAR(4)='ASC',
   @Filter AS VARCHAR(100) = NULL,-- '||',

   --@UserId INT = NULL,
   @FullName NVARCHAR(50) = NULL,
   @Email NVARCHAR(50) = NULL
)
AS
BEGIN
    /*–Declaring Local Variables corresponding to parameters for modification */
    DECLARE 
    --@lUserId INT,
    @lFullName NVARCHAR(50),
    @lLastName NVARCHAR(50),
    @lEmail NVARCHAR(50),
    @lEmailPromotion INT,
    @lPhone NVARCHAR(25),

    @lPageNbr INT,
    @lPageSize INT,
    @lSortCol NVARCHAR(20),
    @lFirstRec INT,
    @lLastRec INT,
    @lTotalRows INT

    /*Setting Local Variables*/
    --SET @lUserId = @UserId
    SET @lFullName = LTRIM(RTRIM(@FullName))
    
    SET @lEmail = LTRIM(RTRIM(@Email))

    SET @lPageNbr = @PageNo
    SET @lPageSize = @RecordPerPage
    SET @lSortCol = LTRIM(RTRIM(@SortField))

    SET @lFirstRec = ( @lPageNbr - 1 ) * @lPageSize
    SET @lLastRec = ( @lPageNbr * @lPageSize + 1 )
    SET @lTotalRows = @lFirstRec - @lLastRec + 1


	SELECT COUNT(1) FROM dbo.Users WHERE IsDelete = 0

	SELECT COUNT(1) FROM dbo.Users WHERE IsDelete = 0 AND
	(@lFullName IS NULL OR FullName LIKE '%' + @lFullName + '%')
    AND (@lEmail IS NULL OR Email LIKE '%' + @lEmail + '%')

	



    ; WITH CTE_Results
    AS (
    SELECT ROW_NUMBER() OVER (ORDER BY
        CASE WHEN (@lSortCol = 'UserId' AND @SortOrder='ASC')
                    THEN UserId
        END ASC,
        CASE WHEN (@lSortCol = 'UserId' AND @SortOrder='DESC')
                   THEN UserId
        END DESC,

        

        CASE WHEN @lSortCol = 'FullName' AND @SortOrder='ASC'
                THEN FullName
        END ASC,
        CASE WHEN @lSortCol = 'FullName' AND @SortOrder='DESC'
                THEN FullName
        END DESC,

      

       

        

        CASE WHEN @lSortCol = 'Email' AND @SortOrder='ASC'
              THEN Email
        END ASC,
        CASE WHEN @lSortCol = 'Email' AND @SortOrder='DESC'
              THEN Email
        END DESC

        

        

   ) AS ROWNUM,
   Count(*) over () AS TotalCount,
   UserId,
	FullName,
	ProfileImage,
	Email,
	Gender
 FROM Users
 WHERE IsDelete = 0 and
    --(@lUserId IS NULL OR UserId = @lUserId) AND
	(@lFullName IS NULL OR FullName LIKE '%' + @lFullName + '%')
    AND (@lEmail IS NULL OR Email LIKE '%' + @lEmail + '%')
	and (@Filter IS NULL OR FullName LIKE '%' + @Filter + '%' OR Email LIKE '%' + @Filter+ '%')
)
SELECT
    TotalCount,
    ROWNUM,
    UserId,
	FullName,
	ProfileImage,
	Email,
	Gender
FROM CTE_Results AS CPC
WHERE
         ROWNUM > @lFirstRec
               AND ROWNUM < @lLastRec
 ORDER BY ROWNUM ASC

END

GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserById]
(
	@UserId int
)
AS
BEGIN
	select * from Users u
	left join Sport s on s.UserId=u.UserId
	left join Education e on e.UserId=u.UserId
	left join Bank b on b.BankId=u.UserId
	where u.UserId=@UserId
END

GO
/****** Object:  StoredProcedure [dbo].[InsertEmployeeData]    Script Date: 17-01-2018 AM 09:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEmployeeData]
(
@UserId int=null ,
@FullName nvarchar(50) ,
@Gender nvarchar(50) ,
@ProfileImage nvarchar(50),
@Passward nvarchar(50) ,
@Email nvarchar(50) ,
@BankName nvarchar(50) ,
@DegreeId int ,
@SportName nvarchar(50) 
 
)
AS
BEGIN
	
	if @UserId is null
	Begin

	Declare @id int;
	Insert into Users(FullName,Gender,ProfileImage,Passward,Email) values(@FullName,@Gender,@ProfileImage,@Passward,@Email)
	set @id=@@IDENTITY;

	insert into Sport(UserId,SportName) values(@id,@SportName)

	Insert into Education(UserId,DegreeId) values(@id,@DegreeId)

	Insert into Bank(UserId,BankName) values(@id,@BankName)

	End
	Else
	Begin
			update Users set 
			FullName=@FullName,Gender=@Gender,ProfileImage=@ProfileImage,Passward=@Passward,Email=@Email
			where UserId=@UserId

			update Education set 
			DegreeId=@DegreeId where UserId=@UserId

			update Bank set 
			BankName=@BankName  where UserId=@UserId

			update Sport set
			SportName=@SportName where UserId=@UserId;

	End

END

GO
USE [master]
GO
ALTER DATABASE [EmployeeFormDB] SET  READ_WRITE 
GO
