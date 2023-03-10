USE [master]
GO
/****** Object:  Database [Sklad]    Script Date: 02.02.2023 16:54:48 ******/
CREATE DATABASE [Sklad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sklad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sklad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sklad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sklad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sklad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sklad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sklad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sklad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sklad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sklad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sklad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sklad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sklad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sklad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sklad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sklad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sklad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sklad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sklad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sklad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sklad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sklad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sklad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sklad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sklad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sklad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sklad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sklad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sklad] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sklad] SET  MULTI_USER 
GO
ALTER DATABASE [Sklad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sklad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sklad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sklad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sklad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sklad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sklad', N'ON'
GO
ALTER DATABASE [Sklad] SET QUERY_STORE = OFF
GO
USE [Sklad]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 02.02.2023 16:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[IDapplication] [int] IDENTITY(1,1) NOT NULL,
	[DateApplication] [nvarchar](50) NOT NULL,
	[IDpharmacy] [int] NULL,
	[DateCompletion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[IDapplication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 02.02.2023 16:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[IDmanufacturer] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[IDmanufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicament]    Script Date: 02.02.2023 16:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicament](
	[IDmedicament] [int] IDENTITY(1,1) NOT NULL,
	[NazvanieMedicament] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[IDmanufacturer] [int] NULL,
	[IDtype] [int] NULL,
 CONSTRAINT [PK_Medicament] PRIMARY KEY CLUSTERED 
(
	[IDmedicament] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phaemacy]    Script Date: 02.02.2023 16:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phaemacy](
	[IDpharmacy] [int] IDENTITY(1,1) NOT NULL,
	[NazvaniePharmacy] [nvarchar](max) NOT NULL,
	[PharmacyAddress] [nvarchar](max) NOT NULL,
	[PhonePharmacy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Phaemacy] PRIMARY KEY CLUSTERED 
(
	[IDpharmacy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 02.02.2023 16:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[IDpurchase] [int] IDENTITY(1,1) NOT NULL,
	[IDapplication] [int] NULL,
	[IDmedicament] [int] NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[IDpurchase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 02.02.2023 16:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[IDtype] [int] IDENTITY(1,1) NOT NULL,
	[NazvanieType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[IDtype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (65, N'18.10.2022', 1, N'19.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (66, N'08.10.2022', 2, N'07.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (67, N'15.10.2022', 3, N'05.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (68, N'01.10.2022', 4, N'11.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (69, N'13.10.2022', 5, N'15.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (70, N'12.10.2022', 6, N'21.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (71, N'21.10.2022', 7, N'14.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (72, N'03.10.2022', 8, N'04.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (73, N'07.10.2022', 9, N'10.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (74, N'17.10.2022', 10, N'01.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (75, N'08.10.2022', 11, N'17.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (76, N'20.10.2022', 12, N'10.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (77, N'08.10.2022', 13, N'21.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (78, N'08.10.2022', 14, N'23.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (79, N'07.10.2022', 15, N'11.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (80, N'03.10.2022', 16, N'29.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (81, N'20.10.2022', 17, N'23.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (82, N'02.10.2022', 18, N'12.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (83, N'08.10.2022', 19, N'26.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (84, N'14.10.2022', 20, N'17.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (85, N'03.10.2022', 21, N'15.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (86, N'21.10.2022', 22, N'17.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (87, N'19.10.2022', 23, N'18.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (88, N'04.10.2022', 24, N'25.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (89, N'06.10.2022', 25, N'29.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (90, N'11.10.2022', 26, N'27.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (91, N'01.10.2022', 27, N'04.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (92, N'12.10.2022', 28, N'03.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (93, N'19.10.2022', 29, N'27.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (94, N'22.10.2022', 30, N'12.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (95, N'21.10.2022', 31, N'12.11.2022')
INSERT [dbo].[Application] ([IDapplication], [DateApplication], [IDpharmacy], [DateCompletion]) VALUES (96, N'09.10.2022', 32, N'22.11.2022')
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (1, N'Анохин Даниил Ильич', N'+7(3519)92-74-47 ', N'г. Красноярск, ул. Ленина, 5, оф. 100')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (2, N'Иванова Ксения Львовна', N'+7(3519)21-29-72 ', N' г. Краснодар, ул. Красноармейская, 46, оф. 84')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (3, N'Смирнов Евгений Максимович', N'+7(499)281-95-48 ', N' г. Пермь, ул. Набережная, 45, оф. 82')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (4, N'Лебедев Тимофей Павлович', N'+7(347)147-03-83 ', N' г. Краснодар, ул. Первомайская, 9, оф. 81')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (5, N'Островский Руслан Тимурович', N'+7(846)652-95-46 ', N' г. Москва, ул. Майская, 10, оф. 60')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (6, N'Поликарпов Михаил Константинович', N'+7(863)894-60-48 ', N' г. Челябинск, ул. Калинина, 18, оф. 78')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (7, N'Борисов Никита Михайлович', N'+7(4862)59-74-77 ', N' г. Тольятти, ул. Садовая, 35, оф. 86')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (8, N'Овсянникова Диана Макаровна', N'+7(3952)89-84-08 ', N' г. Москва, ул. Пионерская, 2, оф. 21')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (9, N'Козлов Марк Денисович', N'+7(495)687-99-33 ', N' г. Санкт-Петербург, ул. Труда, 12, оф. 49')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (10, N'Жилин Юрий Эмирович', N'+7(4212)25-76-91 ', N' г. Самара, ул. Рабочая, 25, оф. 7')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (11, N'Прокофьева Валерия Максимовна', N'+7(8652)82-55-88 ', N' г. Нижний Новгород, ул. Совхозная, 18, оф. 93')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (12, N'Белоусов Матвей Семёнович', N'+7(843)338-94-00 ', N' г. Саратов, ул. Дзержинского, 18, оф. 38')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (13, N'Поляков Дамир Максимович', N'+7(8652)78-62-68 ', N' г. Новосибирск, ул. Матросова, 24, оф. 88')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (14, N'Игнатов Елисей Васильевич', N'+7(3513)59-49-69 ', N' г. Саратов, ул. Гоголя, 34, оф. 46')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (15, N'Соколов Марк Даниилович', N'+7(351)692-22-01 ', N' г. Пермь, ул. Чапаева, 46, оф. 64')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (16, N'Орлов Роман Матвеевич', N'+7(4212)61-83-10 ', N' г. Тюмень, ул. Озерная, 29, оф. 41')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (17, N'Зайцев Артём Маркович', N'+7(846)462-70-71 ', N' г. Воронеж, ул. Куйбышева, 20, оф. 97')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (18, N'Журавлев Святослав Тимурович', N'+7(861)391-16-11 ', N' г. Екатеринбург, ул. Красноармейская, 11, оф. 29')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (19, N'Семенова Виктория Мироновна', N'+7(3519)77-55-23 ', N' г. Волгоград, ул. Горького, 42, оф. 17')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (20, N'Макаров Даниил Алиевич', N'+7(4212)67-87-50 ', N' г. Краснодар, ул. Некрасова, 41, оф. 25')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (21, N'Дементьева Анастасия Филипповна', N'+7(383)338-91-00 ', N' г. Казань, ул. Береговая, 7, оф. 34')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (22, N'Горячев Роман Григорьевич', N'+7(861)889-47-93 ', N' г. Тюмень, ул. Кирова, 18, оф. 87')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (23, N'Волков Данила Елисеевич', N'+7(3452)79-86-18 ', N' г. Москва, ул. Гоголя, 28, оф. 81')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (24, N'Крылова Дарья Олеговна', N'+7(3452)73-35-36 ', N' г. Челябинск, ул. Куйбышева, 45, оф. 10')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (25, N'Пономарева Дарья Степановна', N'+7(8452)93-43-45 ', N' г. Новосибирск, ул. Шоссейная, 49, оф. 22')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (26, N'Попова Вера Артёмовна', N'+7(495)875-18-14 ', N' г. Нижний Новгород, ул. Мира, 38, оф. 91')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (27, N'Мартынов Михаил Михайлович', N'+7(4942)59-53-76 ', N' г. Ижевск, ул. Кооперативная, 29, оф. 19')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (28, N'Тимофеев Владислав Михайлович', N'+7(4862)49-46-01 ', N'г. Воронеж, ул. Пушкина, 40, оф. 57')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (29, N'Крючкова Алина Станиславовна', N'+7(3952)15-47-24 ', N' г. Уфа, ул. Солнечная, 44, оф. 73')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (30, N'Елизарова Зоя Глебовна', N'+7(3452)33-04-24 ', N' г. Омск, ул. Южная, 14, оф. 2')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (31, N'Алексеев Александр Романович', N'+7(351)331-58-78 ', N' г. Уфа, ул. Светлая, 39, оф. 24')
INSERT [dbo].[Manufacturer] ([IDmanufacturer], [FIO], [Phone], [Address]) VALUES (32, N'Федорова Анастасия Ивановна', N'+7(343)228-03-36 ', N' г. Екатеринбург, ул. Центральная, 16, оф. 60')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicament] ON 

INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (65, N'А-церумен', 308, 1, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (66, N'АЛДАРА', 163, 2, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (67, N'АРТРА', 299, 3, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (68, N'АРТРА Хондроитин', 105, 4, 4)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (69, N'АРТРАДОЛ', 227, 5, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (70, N'АСК-кардио', 136, 6, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (71, N'АЦЦ', 157, 7, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (72, N'АЦЦ 100', 57, 8, 4)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (73, N'ГЕССЕДИЛ', 88, 9, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (74, N'ГЕТА-СОРБ', 297, 10, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (75, N'ГИЗААР Форте', 235, 11, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (76, N'Габагамма', 75, 12, 4)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (77, N'Габапентин', 282, 13, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (78, N'Габриглобин-IgG', 150, 14, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (79, N'Гадовист', 330, 15, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (80, N'Гайномакс', 79, 16, 4)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (81, N'Гайро', 194, 17, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (82, N'Галавит', 138, 18, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (83, N'Жавельон', 131, 19, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (84, N'Жанин', 57, 20, 4)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (85, N'ЖеКаТон', 168, 21, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (86, N'Желатиноль', 232, 22, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (87, N'МЕТОПРОЛОЛ ОРГАНИКА', 244, 23, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (88, N'МИГ 400', 322, 24, 4)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (89, N'МИКАНИСАЛ', 263, 25, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (90, N'МИЛДРОНАТ', 147, 26, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (91, N'МИНУС АПЕЛЬСИНОВАЯ КОРКА ЧАЙ', 248, 27, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (92, N'Маалокс', 240, 28, 4)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (93, N'Маалокс мини', 65, 29, 1)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (94, N'Мабтера', 135, 30, 2)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (95, N'Магневист', 157, 31, 3)
INSERT [dbo].[Medicament] ([IDmedicament], [NazvanieMedicament], [Price], [IDmanufacturer], [IDtype]) VALUES (96, N'Магнелис В6', 63, 32, 4)
SET IDENTITY_INSERT [dbo].[Medicament] OFF
GO
SET IDENTITY_INSERT [dbo].[Phaemacy] ON 

INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (1, N'Vip-Аптека №1', N' г. Воронеж, ул. Заводская, 50, оф. 82', N'+7(4742)25-14-13 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (2, N'Аптека 24 Часа', N' г. Краснодар, ул. Мира, 21, оф. 57', N'+7(4862)44-81-80 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (3, N'Аптека Dmg', N' г. Пермь, ул. Майская, 13, оф. 77', N'+7(863)266-39-87 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (4, N'Аптека № 207 Филиал', N' г. Екатеринбург, ул. Трактовая, 31, оф. 68', N'+7(843)111-98-67 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (5, N'Аптека №68', N' г. Новосибирск, ул. Заречная, 3, оф. 15', N'+7(4212)34-41-44 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (6, N'Аптека А5', N' г. Воронеж, ул. Молодежная, 3, оф. 5', N'+7(861)851-27-55 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (7, N'Аптека Бмх', N' г. Екатеринбург, ул. Молодежная, 16, оф. 15', N'+7(4812)61-09-39 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (8, N'Аптека Всенародная', N' г. Нижний Новгород, ул. Интернациональная, 19, оф. 36', N'+7(8142)66-35-68 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (9, N'Аптека Герца № 4', N' г. Новосибирск, ул. Вокзальная, 49, оф. 19', N'+7(8442)81-59-35 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (10, N'Аптека Гомеопатическая Фармация', N' г. Казань, ул. Мира, 40, оф. 74', N'+7(8442)22-36-03 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (11, N'Аптека Для Бережливых', N' г. Тольятти, ул. Парковая, 25, оф. 50', N'+7(846)396-39-93 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (12, N'Аптека Для Вас', N' г. Уфа, ул. Шоссейная, 32, оф. 51', N'+7(4922)36-93-52 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (13, N'Аптека Для Всех', N' г. Санкт-Петербург, ул. Карла Маркса, 12, оф. 61', N'+7(4812)41-65-29 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (14, N'Аптека Доктор', N' г. Казань, ул. Фрунзе, 43, оф. 32', N'+7(8452)53-66-75 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (15, N'Аптека Доктора Живило', N' г. Нижний Новгород, ул. Горького, 28, оф. 97', N'+7(495)455-69-01 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (16, N'Аптека Доктора Пеля', N' г. Тюмень, ул. Колхозная, 8, оф. 13', N'+7(3452)72-15-73 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (17, N'Аптека И Оптика', N' г. Воронеж, ул. Новая, 23, оф. 84', N'+7(4922)79-18-62 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (18, N'Аптека Ип Калинина И.Е', N' г. Санкт-Петербург, ул. Почтовая, 40, оф. 15', N'+7(843)395-16-89 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (19, N'Аптека Ип Мамедов Н.Т.', N' г. Красноярск, ул. Горная, 6, оф. 41', N'+7(863)927-39-06 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (20, N'Аптека Континент', N' г. Воронеж, ул. Красная, 10, оф. 97', N'+7(4812)33-15-41 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (21, N'Аптека Красоты', N' г. Ижевск, ул. Чкалова, 38, оф. 69', N'+7(39543)2-99-30 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (22, N'Аптека Кубил', N' г. Воронеж, ул. Дружбы, 37, оф. 1', N'+7(8552)77-20-95 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (23, N'Аптека Любимая', N' г. Уфа, ул. Пионерская, 8, оф. 73', N'+7(343)143-68-43 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (24, N'Аптека На Боровой', N' г. Красноярск, ул. Западная, 11, оф. 15', N'+7(831)475-69-10 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (25, N'Аптека На Кондратьевском', N' г. Тюмень, ул. Цветочная, 27, оф. 50', N'+7(863)662-06-58 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (26, N'Аптека На Марата 41', N' г. Краснодар, ул. Мичурина, 10, оф. 75', N'+7(863)311-50-65 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (27, N'Аптека Невис', N' г. Красноярск, ул. Дорожная, 2, оф. 44', N'+7(3452)41-98-90 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (28, N'Аптека Немецкой Семейной Клиники', N' г. Самара, ул. Московская, 22, оф. 38', N'+7(812)268-52-17 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (29, N'Аптека Оз', N' г. Екатеринбург, ул. Лесная, 44, оф. 65', N'+7(351)215-01-71 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (30, N'Аптека Олтафарм', N' г. Санкт-Петербург, ул. Озерная, 1, оф. 76', N'+7(35130)2-75-24 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (31, N'Аптека Пастера', N' г. Саратов, ул. Механизаторов, 25, оф. 35', N'+7(351)883-31-17 ')
INSERT [dbo].[Phaemacy] ([IDpharmacy], [NazvaniePharmacy], [PharmacyAddress], [PhonePharmacy]) VALUES (32, N'Аптека Поликлинического Комплекса', N' г. Пермь, ул. Строительная, 16, оф. 38', N'+7(3952)22-15-27')
SET IDENTITY_INSERT [dbo].[Phaemacy] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (65, 65, 65, 281)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (66, 66, 66, 308)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (67, 67, 67, 273)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (68, 68, 68, 215)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (69, 69, 69, 216)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (70, 70, 70, 101)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (71, 71, 71, 194)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (72, 72, 72, 170)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (73, 73, 73, 295)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (74, 74, 74, 325)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (75, 75, 75, 93)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (76, 76, 76, 224)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (77, 77, 77, 126)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (78, 78, 78, 129)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (79, 79, 79, 89)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (80, 80, 80, 226)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (81, 81, 81, 112)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (82, 82, 82, 106)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (83, 83, 83, 162)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (84, 84, 84, 245)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (85, 85, 85, 181)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (86, 86, 86, 274)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (87, 87, 87, 154)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (88, 88, 88, 318)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (89, 89, 89, 330)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (90, 90, 90, 248)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (91, 91, 91, 226)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (92, 92, 92, 191)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (93, 93, 93, 89)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (94, 94, 94, 188)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (95, 95, 95, 78)
INSERT [dbo].[Purchase] ([IDpurchase], [IDapplication], [IDmedicament], [Quantity]) VALUES (96, 96, 96, 275)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([IDtype], [NazvanieType]) VALUES (1, N'Твердые')
INSERT [dbo].[Type] ([IDtype], [NazvanieType]) VALUES (2, N'Жидкие')
INSERT [dbo].[Type] ([IDtype], [NazvanieType]) VALUES (3, N'Мягкие')
INSERT [dbo].[Type] ([IDtype], [NazvanieType]) VALUES (4, N'Газообразные')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Phaemacy] FOREIGN KEY([IDpharmacy])
REFERENCES [dbo].[Phaemacy] ([IDpharmacy])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Phaemacy]
GO
ALTER TABLE [dbo].[Medicament]  WITH CHECK ADD  CONSTRAINT [FK_Medicament_Manufacturer] FOREIGN KEY([IDmanufacturer])
REFERENCES [dbo].[Manufacturer] ([IDmanufacturer])
GO
ALTER TABLE [dbo].[Medicament] CHECK CONSTRAINT [FK_Medicament_Manufacturer]
GO
ALTER TABLE [dbo].[Medicament]  WITH CHECK ADD  CONSTRAINT [FK_Medicament_Type] FOREIGN KEY([IDtype])
REFERENCES [dbo].[Type] ([IDtype])
GO
ALTER TABLE [dbo].[Medicament] CHECK CONSTRAINT [FK_Medicament_Type]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Application] FOREIGN KEY([IDapplication])
REFERENCES [dbo].[Application] ([IDapplication])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Application]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Medicament] FOREIGN KEY([IDmedicament])
REFERENCES [dbo].[Medicament] ([IDmedicament])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Medicament]
GO
USE [master]
GO
ALTER DATABASE [Sklad] SET  READ_WRITE 
GO
