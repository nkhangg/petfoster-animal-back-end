USE [master]
GO
/****** Object:  Database [PetFoster]    Script Date: 10/16/2023 1:02:41 AM ******/
CREATE DATABASE [PetFoster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetFoster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PetFoster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetFoster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PetFoster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PetFoster] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetFoster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetFoster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetFoster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetFoster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetFoster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetFoster] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetFoster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetFoster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetFoster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetFoster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetFoster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetFoster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetFoster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetFoster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetFoster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetFoster] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PetFoster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetFoster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetFoster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetFoster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetFoster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetFoster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetFoster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetFoster] SET RECOVERY FULL 
GO
ALTER DATABASE [PetFoster] SET  MULTI_USER 
GO
ALTER DATABASE [PetFoster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetFoster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetFoster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetFoster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetFoster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetFoster] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetFoster', N'ON'
GO
ALTER DATABASE [PetFoster] SET QUERY_STORE = OFF
GO
USE [PetFoster]
GO
/****** Object:  Table [dbo].[adopt]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adopt](
	[adopt_id] [int] IDENTITY(1,1) NOT NULL,
	[adopt_at] [datetime2](7) NULL,
	[register_at] [datetime2](7) NULL,
	[status] [varchar](255) NULL,
	[pet_id] [varchar](255) NULL,
	[user_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[adopt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[cart_id] [int] NULL,
	[product_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[card_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[daily_report]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[daily_report](
	[orderstotal] [int] NOT NULL,
	[revenuetotal] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderstotal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donate]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descriptions] [varchar](255) NULL,
	[donate_amount] [float] NULL,
	[donate_at] [datetime2](7) NULL,
	[donater] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pet_id] [varchar](255) NULL,
	[user_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imgs]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imgs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_img] [varchar](255) NULL,
	[pet_pet_id] [varchar](255) NULL,
	[product_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[size] [varchar](255) NULL,
	[total] [float] NULL,
	[order_id] [int] NULL,
	[product_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime2](7) NULL,
	[descriptions] [varchar](255) NULL,
	[total] [float] NULL,
	[shipping_info_id] [int] NULL,
	[status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pet]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pet](
	[pet_id] [varchar](255) NOT NULL,
	[adopt_status] [varchar](255) NULL,
	[age] [varchar](255) NULL,
	[create_at] [datetime2](7) NULL,
	[descriptions] [varchar](255) NULL,
	[foster_at] [datetime2](7) NULL,
	[is_spay] [bit] NULL,
	[pet_color] [varchar](255) NULL,
	[pet_name] [varchar](255) NULL,
	[sex] [bit] NULL,
	[breed_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[pet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pet_breed]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pet_breed](
	[breed_id] [varchar](255) NOT NULL,
	[breed_name] [varchar](255) NULL,
	[type_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[breed_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pet_type]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pet_type](
	[type_id] [varchar](255) NOT NULL,
	[type_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](255) NOT NULL,
	[brand] [varchar](255) NULL,
	[create_at] [datetime2](7) NULL,
	[product_desc] [varchar](255) NULL,
	[is_active] [bit] NULL,
	[product_name] [varchar](255) NULL,
	[type_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_repo]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_repo](
	[product_repo_id] [int] IDENTITY(1,1) NOT NULL,
	[in_price] [float] NULL,
	[in_stock] [bit] NULL,
	[out_price] [float] NULL,
	[quantity] [int] NULL,
	[size] [int] NULL,
	[product_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_repo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_revenue]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_revenue](
	[id] [varchar](255) NOT NULL,
	[brand] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[quantity] [int] NULL,
	[size] [int] NULL,
	[total] [bigint] NULL,
	[namep] [varchar](255) NULL,
	[productid] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_type]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type](
	[product_type_id] [varchar](255) NOT NULL,
	[product_type_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue](
	[product_type_name] [varchar](255) NOT NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping_info]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[full_name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[user_id] [varchar](255) NULL,
	[ship_fee] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_profile]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_profile](
	[id] [varchar](255) NOT NULL,
	[birthday] [datetime2](7) NULL,
	[email] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/16/2023 1:02:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [varchar](255) NOT NULL,
	[address] [varchar](255) NULL,
	[avatar] [varchar](255) NULL,
	[birthday] [datetime2](7) NULL,
	[create_at] [datetime2](7) NULL,
	[email] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
	[gender] [bit] NULL,
	[is_active] [bit] NULL,
	[password] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[role] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cart_item] ON 

INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (2, 1, 1, N'PD0010')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (3, 2, 1, N'PD0011')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (4, 2, 1, N'PD0012')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (5, 4, 1, N'PD0013')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (6, 2, 1, N'PD0014')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (7, 4, 1, N'PD0015')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (8, 1, 1, N'PD0016')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (9, 2, 1, N'PD0017')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (10, 4, 1, N'PD0018')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (11, 2, 1, N'PD0019')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (12, 4, 2, N'PD0010')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (13, 2, 2, N'PD0011')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (14, 9, 2, N'PD0012')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (15, 2, 2, N'PD0013')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (16, 4, 2, N'PD0014')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (17, 1, 2, N'PD0015')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (18, 2, 2, N'PD0016')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (19, 4, 2, N'PD0017')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (20, 2, 2, N'PD0018')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (21, 2, 2, N'PD0019')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (22, 4, 2, N'PD0020')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (23, 1, 2, N'PD0021')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (24, 2, 2, N'PD0022')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (25, 2, 2, N'PD0023')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (26, 2, 2, N'PD0024')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (27, 2, 2, N'PD0025')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (28, 9, 3, N'PD0001')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (29, 2, 3, N'PD0030')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (30, 9, 3, N'PD0029')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (31, 9, 3, N'PD0028')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (32, 2, 3, N'PD0027')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (33, 9, 3, N'PD0026')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (34, 2, 3, N'PD0025')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (35, 2, 3, N'PD0024')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (36, 2, 3, N'PD0023')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (37, 1, 3, N'PD0022')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (38, 2, 3, N'PD0021')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (39, 5, 4, N'PD0020')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (40, 1, 4, N'PD0019')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (41, 1, 4, N'PD0018')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (42, 4, 4, N'PD0017')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (43, 2, 4, N'PD0016')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (44, 9, 4, N'PD0015')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (45, 2, 4, N'PD0014')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (46, 1, 4, N'PD0013')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (47, 9, 4, N'PD0012')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (48, 2, 4, N'PD0011')
INSERT [dbo].[cart_item] ([id], [quantity], [cart_id], [product_id]) VALUES (49, 2, 4, N'PD0009')
SET IDENTITY_INSERT [dbo].[cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[carts] ON 

INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (1, N'user0001')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (2, N'user0002')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (3, N'user0003')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (4, N'user0004')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (5, N'user0005')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (6, N'user0006')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (7, N'user0007')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (8, N'user0008')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (9, N'user0009')
INSERT [dbo].[carts] ([card_id], [user_id]) VALUES (10, N'user0010')
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[donate] ON 

INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (1, N'Donate for Mimi', 2000000, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), N'Tran Anh Huy')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (2, N'Donate for Susu', 1000000, CAST(N'2023-12-06T00:00:00.0000000' AS DateTime2), N'Thai Kim Tung')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (3, N'Donate for Vang', 250000, CAST(N'2021-11-06T00:00:00.0000000' AS DateTime2), N'Nguyen Anh Nghia')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (4, N'Donate for Xam', 1500000, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), N'Ngo Thai Khanh')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (5, N'Donate for My Dieu', 1300000, CAST(N'2022-02-06T00:00:00.0000000' AS DateTime2), N'Huynh Tran Thanh')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (6, N'Donate for Mau', 1250000, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), N'Vo Vu Truong Giang')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (7, N'Donate for Nau', 10000000, CAST(N'2023-09-06T00:00:00.0000000' AS DateTime2), N'Ngo Kien Huy')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (8, N'Donate for Den', 20000, CAST(N'2013-10-06T00:00:00.0000000' AS DateTime2), N'Huynh Lap')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (9, N'Donate for My Linh', 10000, CAST(N'2020-08-06T00:00:00.0000000' AS DateTime2), N'Toc Tien')
INSERT [dbo].[donate] ([id], [descriptions], [donate_amount], [donate_at], [donater]) VALUES (10, N'Donate for Cacao', 50000, CAST(N'2023-07-06T00:00:00.0000000' AS DateTime2), N'Vo Tan Phat')
SET IDENTITY_INSERT [dbo].[donate] OFF
GO
SET IDENTITY_INSERT [dbo].[imgs] ON 

INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (41, N'imgproduct0001.jpg', NULL, N'PD0001')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (42, N'imgproduct0002.jpg', NULL, N'PD0002')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (43, N'imgproduct0003.jpg', NULL, N'PD0003')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (44, N'imgproduct0004.jpg', NULL, N'PD0004')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (45, N'imgproduct0005.jpg', NULL, N'PD0005')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (46, N'imgproduct0006.jpg', NULL, N'PD0006')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (47, N'imgproduct0007.jpg', NULL, N'PD0007')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (48, N'imgproduct0008.jpg', NULL, N'PD0008')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (49, N'imgproduct0009.jpg', NULL, N'PD0009')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (50, N'imgproduct0010.jpg', NULL, N'PD0010')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (51, N'imgproduct0011.jpg', NULL, N'PD0011')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (52, N'imgproduct0012.jpg', NULL, N'PD0012')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (53, N'imgproduct0013.jpg', NULL, N'PD0013')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (54, N'imgproduct0014.jpg', NULL, N'PD0014')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (55, N'imgproduct0015.jpg', NULL, N'PD0015')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (56, N'imgproduct0016.jpg', NULL, N'PD0016')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (57, N'imgproduct0017.jpg', NULL, N'PD0017')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (58, N'imgproduct0018.jpg', NULL, N'PD0018')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (59, N'imgproduct0019.jpg', NULL, N'PD0019')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (60, N'imgproduct0020.jpg', NULL, N'PD0020')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (61, N'imgproduct0021.jpg', NULL, N'PD0021')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (62, N'imgproduct00022.jpg', NULL, N'PD0022')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (63, N'imgproduct0023.jpg', NULL, N'PD0023')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (64, N'imgproduct0024.jpg', NULL, N'PD0024')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (65, N'imgproduct0025.jpg', NULL, N'PD0025')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (66, N'imgproduct0026.jpg', NULL, N'PD0026')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (67, N'imgproduct0027.jpg', NULL, N'PD0027')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (68, N'imgproduct0028.jpg', NULL, N'PD0028')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (69, N'imgproduct0029.jpg', NULL, N'PD0029')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (70, N'imgproduct0030.jpg', NULL, N'PD0030')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (71, N'imgproduct0031.jpg', NULL, N'PD0031')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (72, N'imgproduct0032.jpg', NULL, N'PD0032')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (73, N'imgproduct0033.jpg', NULL, N'PD0033')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (74, N'imgproduct0034.jpg', NULL, N'PD0034')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (75, N'imgproduct0035.jpg', NULL, NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (76, N'imgproduct0036.jpg', NULL, N'PD0036')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (77, N'imgproduct0037.jpg', NULL, N'PD0037')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (78, N'imgproduct0038.jpg', NULL, N'PD0038')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (79, N'imgproduct0039.jpg', NULL, N'PD0039')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (80, N'imgproduct0040.jpg', NULL, N'PD0040')
SET IDENTITY_INSERT [dbo].[imgs] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (1, 1, N'1000', 200000, 1, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (3, 2, N'500', 200000, 121, N'PD0002')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (4, 2, N'70', 40000, 121, N'PD0003')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (5, 2, N'100', 90000, 122, N'PD0004')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (6, 2, N'400', 160000, 122, N'PD0005')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (7, 2, N'400', 160000, 123, N'PD0005')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (8, 2, N'100', 70000, 123, N'PD0006')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (9, 2, N'300', 140000, 123, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (10, 2, N'300', 140000, 124, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (11, 1, N'1000', 200000, 124, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (12, 1, N'1000', 200000, 125, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (13, 1, N'1000', 200000, 126, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (14, 2, N'300', 140000, 126, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (15, 1, N'1000', 200000, 127, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (16, 2, N'300', 140000, 127, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (17, 2, N'1000', 400000, 128, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (18, 1, N'1000', 200000, 129, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (19, 2, N'500', 200000, 130, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (20, 1, N'1000', 200000, 131, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (21, 2, N'300', 140000, 131, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (22, 2, N'1000', 400000, 132, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (23, 2, N'200', 140000, 133, N'PD0033')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (24, 1, N'1000', 170000, 133, N'PD0013')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (25, 1, N'1000', 250000, 133, N'PD0016')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (26, 2, N'250', 100000, 137, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (27, 1, N'500', 100000, 137, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (28, 1, N'500', 100000, 137, N'PD0002')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (30, 2, N'250', 100000, 138, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (31, 1, N'500', 100000, 138, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (32, 1, N'500', 100000, 138, N'PD0002')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (33, 2, N'200', 140000, 133, N'PD0033')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (34, 1, N'1000', 170000, 133, N'PD0013')
INSERT [dbo].[order_detail] ([id], [quantity], [size], [total], [order_id], [product_id]) VALUES (35, 1, N'1000', 250000, 133, N'PD0016')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (1, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, 200000, 1, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (121, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), NULL, 240000, 2, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (122, CAST(N'2023-10-05T00:00:00.0000000' AS DateTime2), NULL, 250000, 3, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (123, CAST(N'2023-10-04T00:00:00.0000000' AS DateTime2), NULL, 370000, 4, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (124, CAST(N'2023-10-03T00:00:00.0000000' AS DateTime2), NULL, 340000, 5, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (125, CAST(N'2023-10-02T00:00:00.0000000' AS DateTime2), NULL, 200000, 6, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (126, CAST(N'2023-10-01T00:00:00.0000000' AS DateTime2), NULL, 340000, 7, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (127, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 340000, 8, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (128, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 400000, 9, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (129, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 200000, 10, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (130, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 200000, 11, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (131, CAST(N'2023-08-07T00:00:00.0000000' AS DateTime2), NULL, 340000, 13, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (132, CAST(N'2021-07-07T00:00:00.0000000' AS DateTime2), NULL, 400000, 14, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (133, CAST(N'2022-10-08T15:09:22.4366667' AS DateTime2), NULL, 1120000, 10, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (137, CAST(N'2023-04-01T00:00:00.0000000' AS DateTime2), NULL, 300000, 15, N'Delivered')
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id], [status]) VALUES (138, CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), NULL, 300000, 17, N'Delivered')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'AC001', N'Abyssinian cat', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'BC001', N'Bengal cat ', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'BL001', N'British longhair', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'BS001', N'British shorthair ', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'C001', N'Chihuahua', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'CCD001', N'Chinese Chongqing Dog', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'EM001', N'Egyptian mau ', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'GS001', N'German Shepherd', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'JC001', N'Japanese Chin', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'KD001', N'Kangal Dog', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'MC001', N'Maine Coon', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'ND001', N'Native dog', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'PQR001', N'Phu Quoc Ridgeback', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'SC001', N'Siamese cat ', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'SC002', N'Siberian cat', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'SF001', N'Scottish Fold ', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'SI001', N'Shiba inu', N'D001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'TB001', N'Tabby cat', N'C001')
INSERT [dbo].[pet_breed] ([breed_id], [breed_name], [type_id]) VALUES (N'TV001', N'Turkish Van', N'C001')
GO
INSERT [dbo].[pet_type] ([type_id], [type_name]) VALUES (N'B001', N'Bird')
INSERT [dbo].[pet_type] ([type_id], [type_name]) VALUES (N'C001', N'Cat')
INSERT [dbo].[pet_type] ([type_id], [type_name]) VALUES (N'D001', N'Dog')
INSERT [dbo].[pet_type] ([type_id], [type_name]) VALUES (N'M001', N'Mouse')
GO
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0001', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'ME-O Tuna In Jelly', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0002', N'The Pet', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'The Pet FRESH Pate For Cats With Loss Of Appetite', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0003', N'Nekko', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Nekko Jelly Cat Pate', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0004', N'Whiskas', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Pate Whiskas Junior For Kittens', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0005', N'Snappy Tom', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Snappy Cat Tom Real Fish Pate', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0006', N'Snappy Tom', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Snappy Tom Premium Pate', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0007', N'Zenith', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Zenith Adult Soft Pellets For Adult Dogs', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0008', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Royal Canin X-Small Adult Dog', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0009', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Salmon Flavor', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0010', N'Natural Core', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Natural Organic Dog Food For All Ages', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0011', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Kitten Ocean Fish', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0012', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Cat Mackerel Flavor', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0013', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Creamy Treat Chicken Flavor', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0014', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Creamy Treat Crab Flavor', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0015', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Creamy Treat Tuna Flavor', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0016', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Creamy Treat Bonito Flavor', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0017', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Gold Fit & Firm', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0018', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Cat Litter Lemon Scent', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0019', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Me-o Delite Tuna In Jelly', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0020', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N' Made from real fish.', 1, N'Royal Canin Indoor Adult Dry Cat Food', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0021', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Apro I.Q Formula', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0022', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Zoi Dog', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0023', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Creamy Chicken & Spinach', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0024', N'Whiskat', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Nutri Pate For Poodles Of All Ages', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0025', N'Whiskat', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Chicken Pate For Large Dogs', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0026', N'Whiskat', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Fish Pate For All Dogs', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0027', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Smartheart Puppy Power Pack', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0028', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Smartheart Adult Roast Beef Flavour
', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0029', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Smartheart Small Breeds Roast Beef Flavor', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0030', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Nutrition for dogs.', 1, N'Smartheart Puppy Chicken Flavor Chunk In Gravy', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0031', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Royal Canin Hypoallergenic Dog Pate 400g', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0032', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Feedy', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0033', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Altair', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0034', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Royal Canin Poodle Adult Dog Food', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0035', N'Royal Canin', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Royal Canin Maxi Adult Large Dog Food', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0036', N'Whiskas', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Fresh Meat New Model - CAT', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0037', N'Snappy Tom', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Snappy Cat Tom Tuna Mixed Fruit Pate', N'CF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0038', N'Pedigree', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Pedigree Adult Mini Small Breed Adult Dog Food', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0039', N'Natural Core', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Natural Organic Brown Rice, Sweet Potatoes', N'DF')
INSERT [dbo].[product] ([product_id], [brand], [create_at], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0040', N'Natural Core', CAST(N'2023-10-09T15:31:34.4333333' AS DateTime2), N'Enjoy for pet', 1, N'Natural Salmon Organic', N'DF')
GO
SET IDENTITY_INSERT [dbo].[product_repo] ON 

INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (2, 140000, 1, 200000, 20, 1000, N'PD0001')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (3, 70000, 1, 100000, 50, 500, N'PD0002')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (4, 10000, 1, 20000, 100, 70, N'PD0003')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (5, 30000, 1, 45000, 70, 100, N'PD0004')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (6, 50000, 1, 80000, 50, 400, N'PD0005')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (7, 20000, 1, 35000, 100, 100, N'PD0006')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (8, 45000, 1, 70000, 20, 300, N'PD0007')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (9, 14000, 1, 160000, 50, 500, N'PD0008')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (10, 130000, 1, 170000, 100, 200, N'PD0009')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (11, 500000, 1, 600000, 20, 5000, N'PD0010')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (12, 200000, 1, 250000, 70, 1000, N'PD0011')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (13, 500000, 1, 600000, 20, 200, N'PD0012')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (14, 130000, 1, 170000, 20, 1000, N'PD0013')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (15, 500000, 1, 600000, 50, 1000, N'PD0014')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (16, 130000, 1, 170000, 20, 400, N'PD0015')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (17, 200000, 1, 250000, 20, 1000, N'PD0016')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (18, 45000, 1, 75000, 70, 1000, N'PD0017')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (19, 200000, 1, 250000, 50, 400, N'PD0018')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (20, 25000, 1, 50000, 100, 200, N'PD0019')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (21, 130000, 1, 150000, 20, 1000, N'PD0020')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (22, 45000, 1, 75000, 20, 300, N'PD0021')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (23, 25000, 1, 50000, 100, 200, N'PD0022')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (24, 200000, 1, 250000, 20, 1000, N'PD0023')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (25, 25000, 1, 50000, 100, 200, N'PD0024')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (26, 45000, 1, 90000, 100, 1000, N'PD0025')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (27, 200000, 1, 250000, 20, 200, N'PD0026')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (28, 130000, 1, 150000, 70, 1000, N'PD0027')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (29, 200000, 1, 250000, 100, 200, N'PD0028')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (30, 45000, 1, 90000, 20, 1000, N'PD0029')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (31, 25000, 1, 50000, 100, 1000, N'PD0030')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (32, 120000, 1, 140000, 50, 400, N'PD0031')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (33, 130000, 1, 200000, 100, 200, N'PD0032')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (34, 45000, 1, 70000, 100, 200, N'PD0033')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (35, 190000, 1, 230000, 70, 200, N'PD0034')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (38, 35000, 1, 50000, 180, 250, N'PD0001')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (39, 70000, 1, 100000, 100, 500, N'PD0001')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (45, 160000, 1, 200000, 34, 500, N'PD0035')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (46, 320000, 1, 400000, 73, 1000, N'PD0035')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (47, 390000, 1, 560000, 72, 1200, N'PD0035')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (48, 70000, 1, 90000, 83, 500, N'PD0036')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (49, 105000, 1, 135000, 17, 750, N'PD0036')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (50, 15000, 1, 25000, 90, 70, N'PD0037')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (51, 40000, 1, 60000, 100, 400, N'PD0038')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (52, 230000, 1, 280000, 35, 1000, N'PD0039')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (53, 60000, 1, 75000, 40, 250, N'PD0040')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (54, 120000, 1, 150000, 50, 500, N'PD0040')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (55, 240000, 1, 300000, 67, 1000, N'PD0040')
SET IDENTITY_INSERT [dbo].[product_repo] OFF
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'BF', N'Bird food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'CF', N'Cat food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'DF', N'Dog food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'MF', N'Mouse food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'RF', N'Rabbit Food')
GO
SET IDENTITY_INSERT [dbo].[shipping_info] ON 

INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (1, N'Can Tho', N'Pham Nhu Khang', N'0123456789', N'dc9d7109-6c0b-486f-b9e9-31266c2f8534', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (2, N'Can Tho', N'Pham Nhu Khang', N'0123456789', N'dc9d7109-6c0b-486f-b9e9-31266c2f8534', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (3, N'Can Tho', N'Pham Nhu Khang', N'0123456789', N'dc9d7109-6c0b-486f-b9e9-31266c2f8534', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (4, N'Can Tho', N'Le Van Hoang', N'0123456789', N'6cbcd89f-de6c-4246-b3ae-48fd1bd991b9', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (5, N'Can Tho', N'Le Van Hoang', N'0123456789', N'6cbcd89f-de6c-4246-b3ae-48fd1bd991b9', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (6, N'Can Tho', N'Le Van Hoang', N'0123456789', N'6cbcd89f-de6c-4246-b3ae-48fd1bd991b9', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (7, N'Can Tho', N'Le Van Hoang', N'0123456789', N'6cbcd89f-de6c-4246-b3ae-48fd1bd991b9', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (8, N'Can Tho', N'Nguyen Tuan Anh', N'0123456789', N'46d609ed-298c-44cc-ba3f-84193848924c', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (9, N'Can Tho', N'Nguyen Tuan Anh', N'0123456789', N'46d609ed-298c-44cc-ba3f-84193848924c', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (10, N'Can Tho', N'Nguyen Tuan Anh', N'0123456789', N'46d609ed-298c-44cc-ba3f-84193848924c', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (11, N'Can Tho', N'Nguyen Tuan Anh', N'0123456789', N'46d609ed-298c-44cc-ba3f-84193848924c', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (13, N'Can Tho', N'Pham Nhut Khang', N'0123456789', N'30d0914d-a936-4745-9d2e-3bebeba7eb93', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (14, N'Can Tho', N'Le Minh Thu', N'0123456789', N'30d0914d-a936-4745-9d2e-3bebeba7eb93', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (15, N'Can Tho', N'Nguyen Thi Lam Ha', N'0123456789', N'7030addc-96c4-49b2-ac81-4e8c038eafa2', 30000)
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id], [ship_fee]) VALUES (17, N'Can Tho', N'Nguyen Thi Lam Ha', N'0123456789', N'7030addc-96c4-49b2-ac81-4e8c038eafa2', 30000)
SET IDENTITY_INSERT [dbo].[shipping_info] OFF
GO
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'30d0914d-a936-4745-9d2e-3bebeba7eb93', NULL, N'avatar0002.jpg', NULL, NULL, N'leminhthu456@gmail.com', N'Le Minh Thu', 1, 1, N'$2a$10$gsn5HBja.LJYGhfEOz69oORfuqNoR4rRSKlRUAg9k6b8aTlP122tK', NULL, N'ROLE_USER', N'thulm')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'46d609ed-298c-44cc-ba3f-84193848924c', NULL, N'avatar0003.jpg', NULL, NULL, N'tuananh@gmail.com', N'Nguyen Tuan Anh', 1, 1, N'$2a$10$Txgw6j.6zzfW6g5vkmOYVOkbqLGGqHPumhyPj2B70Ni.JPUX5T08y', NULL, N'ROLE_USER', N'anhnt')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'6cbcd89f-de6c-4246-b3ae-48fd1bd991b9', NULL, N'avatar0004.jpg', NULL, NULL, N'levanhoang111@gmail.com', N'Le Van Hoang', 1, 1, N'$2a$10$/jXVtHmPRoS8.sxCr9pEguSF7ySkJIEN6jT2wM8s7ak3AdhqC76qS', NULL, N'ROLE_USER', N'hoangvl')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'6d929633-04bd-4fc4-8f1a-b75d20d9c10a', NULL, NULL, NULL, NULL, N'duynq@gmail.com', N'Nguyen Quoc Duy', 1, 1, N'$2a$10$axludcYJ3QHQ7YUbBR7E7uEVg5uGbViQbNyWKDzCJOyDFn9/AGA62', NULL, N'ROLE_USER', N'duynq')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'7030addc-96c4-49b2-ac81-4e8c038eafa2', N'Can Tho', N'avataradmin001.jpg', NULL, NULL, N'ha1@gmail.com', N'Nguyen Thi Lam Ha', 0, 1, N'$2a$10$7ZSptDsYJXvlvMcV4hAeCeBN4vO00GoTxNbP3UzWWcOYAzS1X1pty', N'0964909321', N'ROLE_ADMIN', N'hantl1')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'dc9d7109-6c0b-486f-b9e9-31266c2f8534', NULL, N'avatar0005.jpg', NULL, NULL, N'khang@gmail.com', N'Pham Nhut Khang', 1, 1, N'$2a$10$MWNfb/EPaQmrBDr1mzjuTeK0d3IeBXNTARwFTcBpG2ILyKBJdwvHe', NULL, N'ROLE_ADMIN', N'khangpn1')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0001', N'Can Tho', N'avatar0001.jpg', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), N'user001@gmail.com', N'Tran Anh Huy', 1, 1, N'123', N'0123456789', N'0', N'Huyta001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0002', N'Can Tho', N'avatar0002.jpg', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-05T00:00:00.0000000' AS DateTime2), N'user002@gmail.com', N'Vo Vu Truong Giang', 1, 1, N'123', N'0123456789', N'0', N'Giangvvt001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0003', N'Can Tho', N'avatar0003.jpg', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), N'user003@gmail.com', N'Thai Kim Tung', 1, 1, N'123', N'0123456789', N'0', N'Tungtk001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0004', N'Can Tho', N'avatar0004.jpg', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-07T00:00:00.0000000' AS DateTime2), N'user004@gmail.com', N'Huynh Tran Thanh', 1, 1, N'123', N'0123456789', N'0', N'Thanhht001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0005', N'Can Tho', N'avatar0005.jpg', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), N'user005@gmail.com', N'Toc Tiên', 1, 1, N'123', N'0123456789', N'0', N'Tient001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0006', N'Can Tho', N'avatar0006.jpg', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), N'user006@gmail.com', N'Tran Anh Huy', 1, 1, N'123', N'0123456789', N'0', N'Huyta002')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0007', N'Can Tho', N'avatar0007.jpg', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-05T00:00:00.0000000' AS DateTime2), N'user007@gmail.com', N'Ngo Kien Huy', 1, 1, N'123', N'0123456789', N'0', N'Huynk001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0008', N'Can Tho', N'avatar0008.jpg', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), N'user008@gmail.com', N'Nguyen Quoc Duy', 1, 1, N'123', N'0123456789', N'0', N'Duynq001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0009', N'Can Tho', N'avatar0009.jpg', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-07T00:00:00.0000000' AS DateTime2), N'user009@gmail.com', N'Pham Nhut Khang', 1, 1, N'123', N'0123456789', N'0', N'Khangpn001')
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'user0010', N'Can Tho', N'avatar0010.jpg', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), N'user0010@gmail.com', N'Pham Trung Duc', 1, 1, N'123', N'0123456789', N'0', N'Ducpt001')
GO
ALTER TABLE [dbo].[adopt]  WITH CHECK ADD  CONSTRAINT [FKfxjyhqtn4y0x8j5cvoojv8xgn] FOREIGN KEY([pet_id])
REFERENCES [dbo].[pet] ([pet_id])
GO
ALTER TABLE [dbo].[adopt] CHECK CONSTRAINT [FKfxjyhqtn4y0x8j5cvoojv8xgn]
GO
ALTER TABLE [dbo].[adopt]  WITH CHECK ADD  CONSTRAINT [FKnux0ry9kbu4uq290t1pbd64sx] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[adopt] CHECK CONSTRAINT [FKnux0ry9kbu4uq290t1pbd64sx]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FKjcyd5wv4igqnw413rgxbfu4nv] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FKjcyd5wv4igqnw413rgxbfu4nv]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FKlqwuo55w1gm4779xcu3t4wnrd] FOREIGN KEY([cart_id])
REFERENCES [dbo].[carts] ([card_id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FKlqwuo55w1gm4779xcu3t4wnrd]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FKb5o626f86h46m4s7ms6ginnop] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FKb5o626f86h46m4s7ms6ginnop]
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD  CONSTRAINT [FKa2lwa7bjrnbti5v12mga2et1y] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[favorite] CHECK CONSTRAINT [FKa2lwa7bjrnbti5v12mga2et1y]
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD  CONSTRAINT [FKfcbqhey8aaypcl38aumjxoo1r] FOREIGN KEY([pet_id])
REFERENCES [dbo].[pet] ([pet_id])
GO
ALTER TABLE [dbo].[favorite] CHECK CONSTRAINT [FKfcbqhey8aaypcl38aumjxoo1r]
GO
ALTER TABLE [dbo].[imgs]  WITH CHECK ADD  CONSTRAINT [FKdgcqx3ob7knxb8bk07gjq3liq] FOREIGN KEY([pet_pet_id])
REFERENCES [dbo].[pet] ([pet_id])
GO
ALTER TABLE [dbo].[imgs] CHECK CONSTRAINT [FKdgcqx3ob7knxb8bk07gjq3liq]
GO
ALTER TABLE [dbo].[imgs]  WITH CHECK ADD  CONSTRAINT [FKrfp4668jvev5qivrkn5wukarp] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[imgs] CHECK CONSTRAINT [FKrfp4668jvev5qivrkn5wukarp]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FKb8bg2bkty0oksa3wiq5mp5qnc] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FKb8bg2bkty0oksa3wiq5mp5qnc]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FKrws2q0si6oyd6il8gqe2aennc]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKrvd32bftxff2tuj4ka0mt6m86] FOREIGN KEY([shipping_info_id])
REFERENCES [dbo].[shipping_info] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKrvd32bftxff2tuj4ka0mt6m86]
GO
ALTER TABLE [dbo].[pet]  WITH CHECK ADD  CONSTRAINT [FK9u4gps42602t8n0xelpsjq3j7] FOREIGN KEY([breed_id])
REFERENCES [dbo].[pet_breed] ([breed_id])
GO
ALTER TABLE [dbo].[pet] CHECK CONSTRAINT [FK9u4gps42602t8n0xelpsjq3j7]
GO
ALTER TABLE [dbo].[pet_breed]  WITH CHECK ADD  CONSTRAINT [FK3mxu9mx8i6mu6h5goj1oe6fnx] FOREIGN KEY([type_id])
REFERENCES [dbo].[pet_type] ([type_id])
GO
ALTER TABLE [dbo].[pet_breed] CHECK CONSTRAINT [FK3mxu9mx8i6mu6h5goj1oe6fnx]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FKajjopj7ffr42w11bav8gut0cp] FOREIGN KEY([type_id])
REFERENCES [dbo].[product_type] ([product_type_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FKajjopj7ffr42w11bav8gut0cp]
GO
ALTER TABLE [dbo].[product_repo]  WITH CHECK ADD  CONSTRAINT [FKfjicl5fnhwa8ji0d7cbxaxefb] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_repo] CHECK CONSTRAINT [FKfjicl5fnhwa8ji0d7cbxaxefb]
GO
ALTER TABLE [dbo].[shipping_info]  WITH CHECK ADD  CONSTRAINT [FKokw6bplftwitsoh1utl05eyk8] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[shipping_info] CHECK CONSTRAINT [FKokw6bplftwitsoh1utl05eyk8]
GO
/****** Object:  StoredProcedure [dbo].[GetProductTypeRevenueByYear]    Script Date: 10/16/2023 1:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductTypeRevenueByYear](@year int)
AS
BEGIN
SELECT COALESCE(SUM(od.total), 0)
FROM product_type pt
LEFT JOIN product p ON pt.product_type_id = p.[type_id]
LEFT JOIN order_detail od ON p.product_id = od.product_id
LEFT JOIN (
    SELECT o.id, YEAR(o.create_at) AS order_year
    FROM orders o
) AS order_year ON od.order_id = order_year.id
WHERE order_year.order_year = @year OR order_year.order_year IS NULL
GROUP BY pt.product_type_name
END
GO
/****** Object:  StoredProcedure [dbo].[GetRevenueByYear]    Script Date: 10/16/2023 1:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRevenueByYear](@year INT)
AS
BEGIN
WITH AllMonths AS (
    SELECT 1 AS Month
    UNION ALL
    SELECT 2
    UNION ALL
    SELECT 3
    UNION ALL
    SELECT 4
    UNION ALL
    SELECT 5
    UNION ALL
    SELECT 6
    UNION ALL
    SELECT 7
    UNION ALL
    SELECT 8
    UNION ALL
    SELECT 9
    UNION ALL
    SELECT 10
    UNION ALL
    SELECT 11
    UNION ALL
    SELECT 12
)
SELECT COALESCE(SUM(o.total), 0)
FROM AllMonths am
LEFT JOIN orders o ON am.Month = MONTH(o.create_at) AND YEAR(o.create_at) = @year
GROUP BY am.Month
END
GO
/****** Object:  StoredProcedure [dbo].[RevenueByDate]    Script Date: 10/16/2023 1:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RevenueByDate]
as
begin

--set @minDate = isnull(@minDate, (select min(create_at) from orders));
--set @maxDate = isnull(@maxDate, (select max(create_at) from orders));

select p.product_id as productid, product_name as namep, brand, size, sum(quantity) as quantity, sum(od.total) as total
from product p
inner join order_detail od on od.product_id = p.product_id
inner join orders o on o.id = od.order_id
where convert(date, o.create_at) between '2023-10-01' and '2023-10-10'
--@minDate and @maxDate
--'2023-10-01' and '2023-10-10'
--@minDate and @maxDate
group by p.product_id, product_name, brand, size
end
GO
USE [master]
GO
ALTER DATABASE [PetFoster] SET  READ_WRITE 
GO
