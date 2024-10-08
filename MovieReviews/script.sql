USE [master]
GO
/****** Object:  Database [MovieReview]    Script Date: 9/29/2024 2:56:29 PM ******/
CREATE DATABASE [MovieReview]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieReview', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MovieReview.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieReview_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MovieReview_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieReview] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieReview].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieReview] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieReview] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieReview] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieReview] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieReview] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieReview] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieReview] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieReview] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieReview] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieReview] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieReview] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieReview] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieReview] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieReview] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieReview] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieReview] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieReview] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieReview] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieReview] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieReview] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieReview] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieReview] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieReview] SET RECOVERY FULL 
GO
ALTER DATABASE [MovieReview] SET  MULTI_USER 
GO
ALTER DATABASE [MovieReview] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieReview] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieReview] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieReview] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieReview] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieReview] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MovieReview', N'ON'
GO
ALTER DATABASE [MovieReview] SET QUERY_STORE = OFF
GO
USE [MovieReview]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 9/29/2024 2:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Movie_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Genre] [nvarchar](50) NULL,
	[Runtime] [time](7) NOT NULL,
	[StreamingService] [nvarchar](50) NULL,
	[CriticRating] [float] NULL,
	[LocalRating] [float] NULL,
	[Reviews] [int] NOT NULL,
	[Rating] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Movie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 9/29/2024 2:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Review_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Movie_ID] [int] NULL,
	[Show_ID] [int] NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Review_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TvShow]    Script Date: 9/29/2024 2:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TvShow](
	[Show_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Genre] [nvarchar](50) NULL,
	[NumOfSeasons] [int] NOT NULL,
	[StreamingService] [nvarchar](50) NULL,
	[EpisodeLength] [time](7) NOT NULL,
	[CriticRating] [float] NULL,
	[LocalRating] [float] NULL,
	[Reviews] [int] NULL,
	[Rating] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TvShow] PRIMARY KEY CLUSTERED 
(
	[Show_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/29/2024 2:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Preferences] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([Movie_ID], [Title], [Genre], [Runtime], [StreamingService], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (1, N'The Godfather', N'Drama', CAST(N'02:56:00' AS Time), N'AppleTV', 8.7, 9, 10, N'R         ')
INSERT [dbo].[Movie] ([Movie_ID], [Title], [Genre], [Runtime], [StreamingService], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (2, N'Schindler''s List', N'Drama', CAST(N'03:15:00' AS Time), N'AppleTV', 8.6, 9.2, 8, N'R         ')
INSERT [dbo].[Movie] ([Movie_ID], [Title], [Genre], [Runtime], [StreamingService], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (3, N'Spirited Away', N'Animation', CAST(N'02:05:00' AS Time), N'HBOMax', 8.6, 9.4, 12, N'PG        ')
INSERT [dbo].[Movie] ([Movie_ID], [Title], [Genre], [Runtime], [StreamingService], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (4, N'Interstellar', N'Adventure', CAST(N'02:49:00' AS Time), N'ParamountPlus', 8.7, 9.8, 9, N'PG-13     ')
INSERT [dbo].[Movie] ([Movie_ID], [Title], [Genre], [Runtime], [StreamingService], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (5, N'Young Frankenstein', N'Comedy', CAST(N'01:45:00' AS Time), N'AppleTV', 8, 9.2, 6, N'PG        ')
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Review_ID], [User_ID], [Rating], [Movie_ID], [Show_ID], [Date]) VALUES (1, 2, 9, 1, NULL, CAST(N'2024-09-24' AS Date))
INSERT [dbo].[Review] ([Review_ID], [User_ID], [Rating], [Movie_ID], [Show_ID], [Date]) VALUES (2, 1, 6, 3, NULL, CAST(N'2024-09-08' AS Date))
INSERT [dbo].[Review] ([Review_ID], [User_ID], [Rating], [Movie_ID], [Show_ID], [Date]) VALUES (3, 6, 8, NULL, 2, CAST(N'2024-09-26' AS Date))
INSERT [dbo].[Review] ([Review_ID], [User_ID], [Rating], [Movie_ID], [Show_ID], [Date]) VALUES (4, 4, 7, 2, NULL, CAST(N'2024-08-10' AS Date))
INSERT [dbo].[Review] ([Review_ID], [User_ID], [Rating], [Movie_ID], [Show_ID], [Date]) VALUES (5, 3, 10, NULL, 1, CAST(N'2024-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[TvShow] ON 

INSERT [dbo].[TvShow] ([Show_ID], [Title], [Genre], [NumOfSeasons], [StreamingService], [EpisodeLength], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (1, N'Breaking Bad', N'Drama', 5, N'Netflix', CAST(N'01:00:00' AS Time), 9.5, 9.8, 12, N'TV-MA     ')
INSERT [dbo].[TvShow] ([Show_ID], [Title], [Genre], [NumOfSeasons], [StreamingService], [EpisodeLength], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (2, N'Family Guy', N'Comedy', 23, N'Hulu', CAST(N'00:23:00' AS Time), 8.1, 8, 6, N'TV-MA     ')
INSERT [dbo].[TvShow] ([Show_ID], [Title], [Genre], [NumOfSeasons], [StreamingService], [EpisodeLength], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (3, N'Bluey', N'Family', 3, N'DisneyPlus', CAST(N'00:09:00' AS Time), 9.3, 9.1, 4, N'TV-Y      ')
INSERT [dbo].[TvShow] ([Show_ID], [Title], [Genre], [NumOfSeasons], [StreamingService], [EpisodeLength], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (4, N'Yellowstone', N'Drama', 5, N'Peacock', CAST(N'00:50:00' AS Time), 8.7, 8.4, 8, N'TV-MA     ')
INSERT [dbo].[TvShow] ([Show_ID], [Title], [Genre], [NumOfSeasons], [StreamingService], [EpisodeLength], [CriticRating], [LocalRating], [Reviews], [Rating]) VALUES (5, N'Ancient Aliens', N'Science-Fiction', 20, N'Hulu', CAST(N'00:45:00' AS Time), 7.1, 5.4, 5, N'TV-PG     ')
SET IDENTITY_INSERT [dbo].[TvShow] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [Username], [Preferences]) VALUES (1, N'johnheim14', N'Drama, Comedy, Animation')
INSERT [dbo].[User] ([User_ID], [Username], [Preferences]) VALUES (2, N'tessheim16', N'Animation, Romance')
INSERT [dbo].[User] ([User_ID], [Username], [Preferences]) VALUES (3, N'joesmith23', N'Action, Adventure')
INSERT [dbo].[User] ([User_ID], [Username], [Preferences]) VALUES (4, N'reesesursley01', N'Comedy, Animation, Drama')
INSERT [dbo].[User] ([User_ID], [Username], [Preferences]) VALUES (5, N'lukeheim24', N'Action, Adventure, Comedy')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [MovieReview] SET  READ_WRITE 
GO
