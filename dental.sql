USE [master]
GO
/****** Object:  Database [dental_db]    Script Date: 20.12.2021 16:27:11 ******/
CREATE DATABASE [dental_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dental_db', FILENAME = N'D:\MSSQL\dental_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'dental_db_log', FILENAME = N'D:\MSSQL\dental_db_log.ldf' , SIZE = 13632KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dental_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dental_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dental_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dental_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dental_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dental_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dental_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [dental_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dental_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dental_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dental_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dental_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dental_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dental_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dental_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dental_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dental_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dental_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dental_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dental_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dental_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dental_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dental_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dental_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dental_db] SET RECOVERY FULL 
GO
ALTER DATABASE [dental_db] SET  MULTI_USER 
GO
ALTER DATABASE [dental_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dental_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dental_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dental_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dental_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dental_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dental_db] SET QUERY_STORE = OFF
GO
USE [dental_db]
GO
/****** Object:  Table [dbo].[day]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[day](
	[day_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
 CONSTRAINT [PK_day] PRIMARY KEY CLUSTERED 
(
	[day_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[surname] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[patronymic] [varchar](50) NULL,
	[dob] [date] NULL,
	[phone] [nvarchar](20) NULL,
	[mail] [nvarchar](50) NULL,
	[reg_date] [date] NULL,
	[pos_id] [int] NULL,
 CONSTRAINT [PK_doctor] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[pat_id] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[patronymic] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[snills] [nvarchar](50) NULL,
	[oms] [nvarchar](50) NULL,
	[passport] [nvarchar](50) NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[pat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[position]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[pos_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
 CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED 
(
	[pos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[ser_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[price] [money] NULL,
	[description] [nvarchar](500) NULL,
	[time] [time](7) NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[ser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talon]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talon](
	[tal_id] [int] IDENTITY(1,1) NOT NULL,
	[pat_id] [int] NULL,
	[ser_id] [int] NULL,
	[tal_date] [date] NULL,
	[tal_time] [time](7) NULL,
	[doc_id] [int] NULL,
 CONSTRAINT [PK_Talon] PRIMARY KEY CLUSTERED 
(
	[tal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[timetable]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timetable](
	[tim_id] [int] IDENTITY(1,1) NOT NULL,
	[day_id] [int] NULL,
	[doc_id] [int] NULL,
	[beg_time] [time](7) NULL,
	[end_time] [time](7) NULL,
 CONSTRAINT [PK_timetable] PRIMARY KEY CLUSTERED 
(
	[tim_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 20.12.2021 16:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[day] ON 

INSERT [dbo].[day] ([day_id], [title]) VALUES (1, N'Sunday')
INSERT [dbo].[day] ([day_id], [title]) VALUES (2, N'Monday')
INSERT [dbo].[day] ([day_id], [title]) VALUES (3, N'Tuesday')
INSERT [dbo].[day] ([day_id], [title]) VALUES (4, N'Wednesday')
INSERT [dbo].[day] ([day_id], [title]) VALUES (5, N'Thursday')
INSERT [dbo].[day] ([day_id], [title]) VALUES (6, N'Friday')
INSERT [dbo].[day] ([day_id], [title]) VALUES (7, N'Saturday')
SET IDENTITY_INSERT [dbo].[day] OFF
GO
SET IDENTITY_INSERT [dbo].[doctor] ON 

INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (1, N'Плотников', N'Илья', N'Алексеевич', CAST(N'2002-04-11' AS Date), N'7(653)657-18-79', N'aojv@mail.ru', CAST(N'2021-01-01' AS Date), 1)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (2, N'Бормоткин', N'Антон', N'Сергеевич', CAST(N'2002-07-21' AS Date), N'7(410)975-81-42', N'kggfpxw@yandex.ru', CAST(N'2021-01-01' AS Date), 2)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (3, N'Лысанов', N'Владислав', N'Анатольевич', CAST(N'2003-01-06' AS Date), N'7(434)782-34-53', N'oxxv@yandex.ru', CAST(N'2021-01-01' AS Date), 3)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (10, N'Иванов', N'Владимир', N'Сергеевич', CAST(N'1991-08-31' AS Date), N'7(01)881-23-23', N'f9jxjd14@gmail.com', CAST(N'2020-07-06' AS Date), 5)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (16, N'Васильев', N'Евгений', N'Эдуардович', CAST(N'1966-10-17' AS Date), N'7(78)814-15-53', N'p24a@mail.ru', CAST(N'2020-07-06' AS Date), 6)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (32, N'Прусикин', N'Илья', N'Геннадьевич', CAST(N'1977-09-11' AS Date), N'7(148)849-66-11', N'q4aptu@mail.ru', CAST(N'2020-07-06' AS Date), 8)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (33, N'Арсеньева', N'Алина', N'Викторовна', CAST(N'1968-08-23' AS Date), N'7(690)156-43-55', N'n4zc9kz@yandex.ru', CAST(N'2019-03-02' AS Date), 10)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (34, N'Астафьева', N'Екатерина', N'Дмитриевна', CAST(N'1981-01-06' AS Date), N'7(70)257-77-15', N'copaa6@gmail.com', CAST(N'2019-03-02' AS Date), 11)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (35, N'Николаева', N'Эвелина', N'Егоровна', CAST(N'1980-01-11' AS Date), N'7(2553)423-53-42', N'myrfqpb@mail.ru', CAST(N'2019-03-02' AS Date), 13)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (36, N'Круц', N'Артем', N'Николаевич', CAST(N'1964-02-18' AS Date), N'7(4241)515-55-16', N'kc29hc0e@yandex.ru', CAST(N'2019-03-02' AS Date), 14)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (37, N'Левандовски', N'Анна', N'', CAST(N'1974-11-28' AS Date), N'7(605)980-41-29', N'pvvxl@gmail.com', CAST(N'2019-03-02' AS Date), 15)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (38, N'Дауни ', N'Роберт', N'', CAST(N'1992-05-21' AS Date), N'7(30)706-22-34', N'5ybwi@mail.ru', CAST(N'2018-04-05' AS Date), 13)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (40, N'Рогов', N'Алексей', N'Иванович', CAST(N'1974-12-21' AS Date), N'7(37)386-69-89', N'93@outlook.com', CAST(N'2018-04-05' AS Date), 5)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (41, N'Максименко', N'Ярослав', N'Алексеевич', CAST(N'1962-12-28' AS Date), N'7(3699)223-48-76', N'er@gmail.com', CAST(N'2018-04-05' AS Date), 7)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (42, N'Плюшкина', N'Анастасия', N'Сергеевна', CAST(N'1973-10-25' AS Date), N'7(7712)531-25-51', N'o0my@gmail.com', CAST(N'2018-04-05' AS Date), 9)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (43, N'Алексеенко', N'Алефтина', N'Афанасьевна', CAST(N'1965-08-16' AS Date), N'7(10)193-79-37', N'715qy08@gmail.com', CAST(N'2017-02-03' AS Date), 13)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (44, N'Смирнова', N'Надежда', N'Александровна', CAST(N'1986-06-06' AS Date), N'7(61)493-37-05', N'vubx0t@mail.ru', CAST(N'2017-02-03' AS Date), 4)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (46, N'Крылов', N'Денис', N'Валерьевич', CAST(N'1992-10-30' AS Date), N'7(4363)352-51-74', N'gq@yandex.ru', CAST(N'2017-02-03' AS Date), 14)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (47, N'Курова', N'Кристина', N'Леонидовна', CAST(N'1995-12-26' AS Date), N'7(65)834-08-58', N'ic0pu@outlook.com', CAST(N'2016-07-07' AS Date), 2)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (48, N'Брыкин', N'Валерий', N'Петрович', CAST(N'1988-11-23' AS Date), N'7(357)266-79-53', N'o7khr@yandex.ru', CAST(N'2016-07-07' AS Date), 7)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (49, N'Новиков', N'Артем', N'Сергеевич', CAST(N'1986-02-09' AS Date), N'7(995)233-49-87', N'2shlaq@outlook.com', CAST(N'2016-07-07' AS Date), 5)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (50, N'Вейзе', N'Ангелина', N'Семеновна', CAST(N'1982-11-12' AS Date), N'7(2280)741-31-15', N'cdbw@yandex.ru', CAST(N'2016-07-07' AS Date), 1)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (51, N'Ниленко', N'Адольф', N'Игоревич', CAST(N'1989-10-09' AS Date), N'7(8373)326-91-92', N'dwej@yandex.ru', CAST(N'2015-04-09' AS Date), 3)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (52, N'Базар', N'Гопа', N'Кукич', CAST(N'1994-01-30' AS Date), N'7(313)954-86-25', N'zyue8brv@outlook.com', CAST(N'2015-04-09' AS Date), 12)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (53, N'Морев', N'Филипп', N'Адольфович', CAST(N'2001-10-03' AS Date), N'7(38)540-38-77', N'0a5437@mail.ru', CAST(N'2015-04-09' AS Date), 6)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (54, N'Калмыкина', N'Екатерина', N'Алексеевна', CAST(N'1990-09-22' AS Date), N'7(002)112-65-39', N'fovtju3q2@yandex.ru', CAST(N'2015-04-09' AS Date), 8)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (55, N'Фостер', N'Николай', N'Тасманович', CAST(N'1993-02-21' AS Date), N'7(3511)471-86-33', N'5ntglejc9@outlook.com', CAST(N'2014-12-03' AS Date), 5)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (56, N'Алексеев', N'Иван', N'Петрович', CAST(N'1992-02-17' AS Date), N'8(999)945-32-41', N'nonoag@outlook.com', CAST(N'2014-12-03' AS Date), NULL)
INSERT [dbo].[doctor] ([doc_id], [surname], [name], [patronymic], [dob], [phone], [mail], [reg_date], [pos_id]) VALUES (57, N'Иванов', N'Егор', N'Михайлович', CAST(N'2013-07-04' AS Date), N'8(231)243-56-78', N'egor.micha@gmail.com', CAST(N'2014-12-03' AS Date), 13)
SET IDENTITY_INSERT [dbo].[doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (2, N'Иванов', N'Сергей', N'Алексеевич', CAST(N'1968-11-20' AS Date), N'46043269268', N'3945241853594780', N'4274 814080')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (3, N'Масмех', N'Марфа', N'Антоновна', CAST(N'1969-10-10' AS Date), N'22625758172', N'9870631803758444', N'4569 184268')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (4, N'Экономов', N'Аркадий', N'Юрьевич', CAST(N'1974-12-07' AS Date), N'53949203316', N'1293457139749080', N'4785 200721')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (5, N'Кирхенштейн', N'Роман', N'Романович', CAST(N'1962-05-10' AS Date), N'81785866264', N'5590777851175517', N'4070 983619')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (6, N'Висенина', N'Настасья', N'Семеновна', CAST(N'1961-04-11' AS Date), N'73781535329', N'3869832867290825', N'4243 262257')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (7, N'Якимычев', N'Аркадий', N'Тимофеевич', CAST(N'1982-08-23' AS Date), N'41802301730', N'5606128640472889', N'4026 216962')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (10, N'Ячменев', N'Тимофей', N'Феликсович', CAST(N'1971-06-24' AS Date), N'55943938551', N'6533255384303630', N'4791 590566')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (11, N'Бялик', N'Юрий', N'Феоктистович', CAST(N'1994-06-22' AS Date), N'15358182475', N'4193470549769700', N'4487 258694')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (12, N'Негуторова', N'Мария', N'Яковна', CAST(N'1992-09-15' AS Date), N'58272704211', N'2708471546880901', N'4223 539252')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (13, N'Сухарникова', N'Ксения', N'Ефимовна', CAST(N'1992-01-27' AS Date), N'20766786400', N'9077357280999424', N'4929 666026')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (14, N'Юдачёв', N'Юрий', N'Ираклиевич', CAST(N'1987-10-26' AS Date), N'15394698918', N'4442782439291477', N'4976 923592')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (15, N'Давыдов', N'Максим', N'Федотович', CAST(N'1974-05-03' AS Date), N'40033190201', N'6060725852847100', N'4196 123741')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (16, N'Лавлинская', N'Алена', N'Марковна', CAST(N'1982-12-19' AS Date), N'51564033563', N'2842628898564726', N'4188 817849')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (17, N'Завражная', N'Тамара', N'Иннокентьевна', CAST(N'1988-07-12' AS Date), N'66953502032', N'9190625685267152', N'4482 354955')
INSERT [dbo].[patient] ([pat_id], [surname], [name], [patronymic], [dob], [snills], [oms], [passport]) VALUES (18, N'Толбаева', N'Дарья', N'Константиновна', CAST(N'1996-09-10' AS Date), N'41776824615', N'6782347005791963', N'4753 390322')
SET IDENTITY_INSERT [dbo].[patient] OFF
GO
SET IDENTITY_INSERT [dbo].[position] ON 

INSERT [dbo].[position] ([pos_id], [title]) VALUES (8, N'Вырыватель зубов')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (12, N'Главный стоматолог')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (9, N'Киллер')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (14, N'Клоун')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (7, N'Кондитер')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (3, N'Охранник')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (6, N'Повар')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (2, N'Помошник стоматолога')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (13, N'Приколист')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (4, N'Программист')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (15, N'Работник')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (10, N'Спасатель')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (1, N'Стоматолог')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (11, N'Торговец')
INSERT [dbo].[position] ([pos_id], [title]) VALUES (5, N'Уборщик')
SET IDENTITY_INSERT [dbo].[position] OFF
GO
SET IDENTITY_INSERT [dbo].[service] ON 

INSERT [dbo].[service] ([ser_id], [title], [price], [description], [time]) VALUES (1, N'Вырвать зуб', 1490.0000, N'Вырывание зуба с корнем', CAST(N'02:00:00' AS Time))
INSERT [dbo].[service] ([ser_id], [title], [price], [description], [time]) VALUES (2, N'Установить брекеты', 1200.0000, N'Профессиональная установка брекетов', CAST(N'03:00:00' AS Time))
INSERT [dbo].[service] ([ser_id], [title], [price], [description], [time]) VALUES (3, N'Подтянуть брекеты', 50.0000, N'Подтягивание брекетов', CAST(N'00:15:00' AS Time))
SET IDENTITY_INSERT [dbo].[service] OFF
GO
SET IDENTITY_INSERT [dbo].[talon] ON 

INSERT [dbo].[talon] ([tal_id], [pat_id], [ser_id], [tal_date], [tal_time], [doc_id]) VALUES (1, 2, 1, CAST(N'2021-12-26' AS Date), CAST(N'08:00:00' AS Time), 1)
INSERT [dbo].[talon] ([tal_id], [pat_id], [ser_id], [tal_date], [tal_time], [doc_id]) VALUES (2, 2, 1, CAST(N'2021-12-26' AS Date), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[talon] ([tal_id], [pat_id], [ser_id], [tal_date], [tal_time], [doc_id]) VALUES (3, 2, 2, CAST(N'2021-12-26' AS Date), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[talon] ([tal_id], [pat_id], [ser_id], [tal_date], [tal_time], [doc_id]) VALUES (4, 3, 3, CAST(N'2021-12-26' AS Date), CAST(N'08:00:00' AS Time), 2)
INSERT [dbo].[talon] ([tal_id], [pat_id], [ser_id], [tal_date], [tal_time], [doc_id]) VALUES (5, 3, 3, CAST(N'2021-12-26' AS Date), CAST(N'08:15:00' AS Time), 2)
INSERT [dbo].[talon] ([tal_id], [pat_id], [ser_id], [tal_date], [tal_time], [doc_id]) VALUES (6, 3, 3, CAST(N'2021-12-26' AS Date), CAST(N'08:30:00' AS Time), 2)
SET IDENTITY_INSERT [dbo].[talon] OFF
GO
SET IDENTITY_INSERT [dbo].[timetable] ON 

INSERT [dbo].[timetable] ([tim_id], [day_id], [doc_id], [beg_time], [end_time]) VALUES (1, 1, 1, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[timetable] ([tim_id], [day_id], [doc_id], [beg_time], [end_time]) VALUES (2, 2, 1, CAST(N'17:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[timetable] ([tim_id], [day_id], [doc_id], [beg_time], [end_time]) VALUES (3, 3, 1, CAST(N'13:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[timetable] ([tim_id], [day_id], [doc_id], [beg_time], [end_time]) VALUES (4, 1, 2, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[timetable] ([tim_id], [day_id], [doc_id], [beg_time], [end_time]) VALUES (5, 2, 2, CAST(N'17:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[timetable] ([tim_id], [day_id], [doc_id], [beg_time], [end_time]) VALUES (6, 3, 2, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[timetable] ([tim_id], [day_id], [doc_id], [beg_time], [end_time]) VALUES (7, 5, 3, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[timetable] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [login], [password]) VALUES (1, N'sysdba', N'masterkey')
INSERT [dbo].[user] ([user_id], [login], [password]) VALUES (5, N'Iluxa76rus', N'qwerty')
INSERT [dbo].[user] ([user_id], [login], [password]) VALUES (6, N'Artem', N'qwerty')
INSERT [dbo].[user] ([user_id], [login], [password]) VALUES (14, N'Artem1', N'qwerty')
INSERT [dbo].[user] ([user_id], [login], [password]) VALUES (15, N'Artem2', N'')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_doctor_mail]    Script Date: 20.12.2021 16:27:12 ******/
ALTER TABLE [dbo].[doctor] ADD  CONSTRAINT [UK_doctor_mail] UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_doctor_phone]    Script Date: 20.12.2021 16:27:12 ******/
ALTER TABLE [dbo].[doctor] ADD  CONSTRAINT [UK_doctor_phone] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_patient_oms]    Script Date: 20.12.2021 16:27:12 ******/
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [UK_patient_oms] UNIQUE NONCLUSTERED 
(
	[oms] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_patient_passport]    Script Date: 20.12.2021 16:27:12 ******/
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [UK_patient_passport] UNIQUE NONCLUSTERED 
(
	[passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_patient_snills]    Script Date: 20.12.2021 16:27:12 ******/
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [UK_patient_snills] UNIQUE NONCLUSTERED 
(
	[snills] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_position_title]    Script Date: 20.12.2021 16:27:12 ******/
ALTER TABLE [dbo].[position] ADD  CONSTRAINT [UK_position_title] UNIQUE NONCLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [login]    Script Date: 20.12.2021 16:27:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [login] ON [dbo].[user]
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD  CONSTRAINT [FK_doctor_position] FOREIGN KEY([pos_id])
REFERENCES [dbo].[position] ([pos_id])
GO
ALTER TABLE [dbo].[doctor] CHECK CONSTRAINT [FK_doctor_position]
GO
ALTER TABLE [dbo].[talon]  WITH CHECK ADD  CONSTRAINT [FK_talon_doctor] FOREIGN KEY([doc_id])
REFERENCES [dbo].[doctor] ([doc_id])
GO
ALTER TABLE [dbo].[talon] CHECK CONSTRAINT [FK_talon_doctor]
GO
ALTER TABLE [dbo].[talon]  WITH CHECK ADD  CONSTRAINT [FK_talon_patient] FOREIGN KEY([pat_id])
REFERENCES [dbo].[patient] ([pat_id])
GO
ALTER TABLE [dbo].[talon] CHECK CONSTRAINT [FK_talon_patient]
GO
ALTER TABLE [dbo].[talon]  WITH CHECK ADD  CONSTRAINT [FK_talon_service] FOREIGN KEY([ser_id])
REFERENCES [dbo].[service] ([ser_id])
GO
ALTER TABLE [dbo].[talon] CHECK CONSTRAINT [FK_talon_service]
GO
ALTER TABLE [dbo].[timetable]  WITH CHECK ADD  CONSTRAINT [FK_timetable_day] FOREIGN KEY([day_id])
REFERENCES [dbo].[day] ([day_id])
GO
ALTER TABLE [dbo].[timetable] CHECK CONSTRAINT [FK_timetable_day]
GO
ALTER TABLE [dbo].[timetable]  WITH CHECK ADD  CONSTRAINT [FK_timetable_doctor] FOREIGN KEY([doc_id])
REFERENCES [dbo].[doctor] ([doc_id])
GO
ALTER TABLE [dbo].[timetable] CHECK CONSTRAINT [FK_timetable_doctor]
GO
USE [master]
GO
ALTER DATABASE [dental_db] SET  READ_WRITE 
GO
