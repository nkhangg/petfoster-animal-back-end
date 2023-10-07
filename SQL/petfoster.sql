USE [master]
GO
/****** Object:  Database [petfoster]    Script Date: 10/7/2023 5:02:53 PM ******/
CREATE DATABASE [petfoster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'petfoster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\petfoster.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'petfoster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\petfoster_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [petfoster] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [petfoster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [petfoster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [petfoster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [petfoster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [petfoster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [petfoster] SET ARITHABORT OFF 
GO
ALTER DATABASE [petfoster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [petfoster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [petfoster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [petfoster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [petfoster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [petfoster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [petfoster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [petfoster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [petfoster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [petfoster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [petfoster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [petfoster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [petfoster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [petfoster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [petfoster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [petfoster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [petfoster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [petfoster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [petfoster] SET  MULTI_USER 
GO
ALTER DATABASE [petfoster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [petfoster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [petfoster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [petfoster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [petfoster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [petfoster] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [petfoster] SET QUERY_STORE = OFF
GO
USE [petfoster]
GO
/****** Object:  Table [dbo].[adopt]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[cart_item]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[carts]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[donate]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[favorite]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[imgs]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[order_detail]    Script Date: 10/7/2023 5:02:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[total] [float] NULL,
	[order_id] [int] NULL,
	[product_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/7/2023 5:02:54 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pet]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[pet_breed]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[pet_type]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[product]    Script Date: 10/7/2023 5:02:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](255) NOT NULL,
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
/****** Object:  Table [dbo].[product_repo]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[product_type]    Script Date: 10/7/2023 5:02:54 PM ******/
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
/****** Object:  Table [dbo].[shipping_info]    Script Date: 10/7/2023 5:02:54 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/7/2023 5:02:54 PM ******/
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
SET IDENTITY_INSERT [dbo].[adopt] ON 

INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (1, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Adopted', N'P0031', N'user0001')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (2, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Adopted', N'P0032', N'user0002')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (3, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Adopted', N'P0033', N'user0003')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (4, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Adopted', N'P0034', N'user0004')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (5, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Adopted', N'P0035', N'user0005')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (6, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Awaiting adoption', N'P0026', N'user0006')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (7, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Awaiting adoption', N'P0027', N'user0007')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (8, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Awaiting adoption', N'P0028', N'user0008')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (9, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Awaiting adoption', N'P0029', N'user0009')
INSERT [dbo].[adopt] ([adopt_id], [adopt_at], [register_at], [status], [pet_id], [user_id]) VALUES (10, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), N'Awaiting adoption', N'P0030', N'user0010')
SET IDENTITY_INSERT [dbo].[adopt] OFF
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
SET IDENTITY_INSERT [dbo].[favorite] ON 

INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (2, N'P0001', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (3, N'P0001', N'user0002')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (4, N'P0001', N'user0003')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (5, N'P0001', N'user0004')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (6, N'P0001', N'user0005')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (7, N'P0001', N'user0006')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (8, N'P0001', N'user0007')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (9, N'P0001', N'user0008')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (10, N'P0001', N'user0009')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (11, N'P0001', N'user0010')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (12, N'P0001', N'user0010')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (13, N'P0002', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (14, N'P0003', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (15, N'P0004', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (16, N'P0005', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (17, N'P0006', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (18, N'P0007', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (19, N'P0008', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (20, N'P0009', N'user0001')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (21, N'P0002', N'user0002')
INSERT [dbo].[favorite] ([id], [pet_id], [user_id]) VALUES (22, N'P0001', N'user0003')
SET IDENTITY_INSERT [dbo].[favorite] OFF
GO
SET IDENTITY_INSERT [dbo].[imgs] ON 

INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (6, N'imgpet0001.jpg', N'P0001', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (7, N'imgpet0002.jpg', N'P0002', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (8, N'imgpet0003.jpg', N'P0003', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (9, N'imgpet0004.jpg', N'P0004', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (10, N'imgpet0005.jpg', N'P0005', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (11, N'imgpet0006.jpg', N'P0006', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (12, N'imgpet0007.jpg', N'P0007', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (13, N'imgpet0008.png', N'P0008', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (14, N'imgpet0009.jpg', N'P0009', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (15, N'imgpet0010.jpg', N'P0010', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (16, N'imgpet0011.jpg', N'P0011', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (17, N'imgpet0012.jpg', N'P0012', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (18, N'imgpet0013.jpg', N'P0013', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (19, N'imgpet0014.jpg', N'P0014', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (20, N'imgpet0015.jpg', N'P0015', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (21, N'imgpet0016.jpg', N'P0016', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (22, N'imgpet0017.jpg', N'P0017', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (23, N'imgpet0018.jpg', N'P0018', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (24, N'imgpet0019.jpg', N'P0019', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (25, N'imgpet0020.jpg', N'P0020', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (26, N'imgpet0021.jpg', N'P0021', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (27, N'imgpet0022.jpg', N'P0022', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (28, N'imgpet0023.jpg', N'P0023', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (29, N'imgpet0024.jpg', N'P0024', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (30, N'imgpet0025.jpg', N'P0025', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (31, N'imgpet0026.jpg', N'P0026', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (32, N'imgpet0027.jpg', N'P0027', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (33, N'imgpet0028.jpg', N'P0028', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (34, N'imgpet0029.jpg', N'P0029', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (35, N'imgpet0030.jpg', N'P0030', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (36, N'imgpet0031.jpg', N'P0031', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (37, N'imgpet0032.jpg', N'P0032', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (38, N'imgpet0033.jpg', N'P0033', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (39, N'imgpet0034.jpg', N'P0034', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (40, N'imgpet0035.jpg', N'P0035', NULL)
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (41, N'imgproduct0001.png', NULL, N'PD0001')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (42, N'imgproduct0002.png', NULL, N'PD0002')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (43, N'imgproduct0003.png', NULL, N'PD0003')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (44, N'imgproduct0004.png', NULL, N'PD0004')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (45, N'imgproduct0005.png', NULL, N'PD0005')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (46, N'imgproduct0006.png', NULL, N'PD0006')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (47, N'imgproduct0007.png', NULL, N'PD0007')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (48, N'imgproduct0008.png', NULL, N'PD0008')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (49, N'imgproduct0009.png', NULL, N'PD0009')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (50, N'imgproduct0010.png', NULL, N'PD0010')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (51, N'imgproduct0011.png', NULL, N'PD0011')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (52, N'imgproduct0012.png', NULL, N'PD0012')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (53, N'imgproduct0013.png', NULL, N'PD0013')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (54, N'imgproduct0014.jpg', NULL, N'PD0014')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (55, N'imgproduct0015.jpg', NULL, N'PD0015')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (56, N'imgproduct0016.jpg', NULL, N'PD0016')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (57, N'imgproduct0017.jpg', NULL, N'PD0017')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (58, N'imgproduct0018.png', NULL, N'PD0018')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (59, N'imgproduct0019.png', NULL, N'PD0019')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (60, N'imgproduct0020.jpg', NULL, N'PD0020')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (61, N'imgproduct0021.png', NULL, N'PD0021')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (62, N'imgproduct00022.png', NULL, N'PD0022')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (63, N'imgproduct0023.png', NULL, N'PD0023')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (64, N'imgproduct0024.png', NULL, N'PD0024')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (65, N'imgproduct0025.png', NULL, N'PD0025')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (66, N'imgproduct0026.png', NULL, N'PD0026')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (67, N'imgproduct0027.png', NULL, N'PD0027')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (68, N'imgproduct0028.png', NULL, N'PD0028')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (69, N'imgproduct0029.png', NULL, N'PD0029')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (70, N'imgproduct0030.png', NULL, N'PD0030')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (71, N'imgproduct0031.png', NULL, N'PD0031')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (72, N'imgproduct0032.jpg', NULL, N'PD0032')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (73, N'imgproduct0033.jpg', NULL, N'PD0033')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (74, N'imgproduct0034.jpg', NULL, N'PD0034')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (75, N'imgproduct0035.jpg', NULL, N'PD0035')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (76, N'imgproduct0036.jpg', NULL, N'PD0036')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (77, N'imgproduct0037.jpg', NULL, N'PD0037')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (78, N'imgproduct0038.jpg', NULL, N'PD0038')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (79, N'imgproduct0039.jpg', NULL, N'PD0039')
INSERT [dbo].[imgs] ([id], [name_img], [pet_pet_id], [product_id]) VALUES (80, N'imgproduct0040.jpg', NULL, N'PD0040')
SET IDENTITY_INSERT [dbo].[imgs] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (1, 1, 250000, 1, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (3, 2, 200000, 121, N'PD0002')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (4, 2, 200000, 121, N'PD0003')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (5, 2, 300000, 122, N'PD0004')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (6, 2, 50000, 122, N'PD0005')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (7, 2, 50000, 123, N'PD0005')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (8, 2, 100000, 123, N'PD0006')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (9, 2, 100000, 123, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (10, 2, 100000, 124, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (11, 1, 250000, 124, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (12, 1, 250000, 125, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (13, 1, 250000, 126, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (14, 2, 100000, 126, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (15, 1, 250000, 127, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (16, 2, 100000, 127, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (17, 2, 500000, 128, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (18, 1, 250000, 129, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (19, 2, 250000, 130, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (20, 1, 250000, 131, N'PD0001')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (21, 2, 100000, 131, N'PD0007')
INSERT [dbo].[order_detail] ([id], [quantity], [total], [order_id], [product_id]) VALUES (22, 2, 500000, 132, N'PD0001')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (1, CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, 250000, 1)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (121, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), NULL, 400000, 2)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (122, CAST(N'2023-10-05T00:00:00.0000000' AS DateTime2), NULL, 350000, 3)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (123, CAST(N'2023-10-04T00:00:00.0000000' AS DateTime2), NULL, 250000, 4)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (124, CAST(N'2023-10-03T00:00:00.0000000' AS DateTime2), NULL, 350000, 5)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (125, CAST(N'2023-10-02T00:00:00.0000000' AS DateTime2), NULL, 250000, 6)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (126, CAST(N'2023-10-01T00:00:00.0000000' AS DateTime2), NULL, 350000, 7)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (127, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 350000, 8)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (128, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 500000, 9)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (129, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 250000, 10)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (130, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, 500000, 11)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (131, CAST(N'2023-08-07T00:00:00.0000000' AS DateTime2), NULL, 350000, 13)
INSERT [dbo].[orders] ([id], [create_at], [descriptions], [total], [shipping_info_id]) VALUES (132, CAST(N'2023-07-07T00:00:00.0000000' AS DateTime2), NULL, 500000, 14)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0001', N'Haven''t adopted yet.', N'Adult ', CAST(N'2022-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 0, N'Brown', N'Mimi', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0002', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-09-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Dodo', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0003', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-08-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-08-06T00:00:00.0000000' AS DateTime2), 0, N'Yellow', N'Baba', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0004', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-07-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-07-06T00:00:00.0000000' AS DateTime2), 1, N'White', N'Xu', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0005', N'Haven''t adopted yet', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Cam', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0006', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-06-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-06-06T00:00:00.0000000' AS DateTime2), 1, N'Black', N'Bin', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0007', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-05-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-05-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Bi', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0008', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-04-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-04-06T00:00:00.0000000' AS DateTime2), 1, N'Black', N'Su', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0009', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-03-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-03-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Gau', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0010', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-02-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-02-06T00:00:00.0000000' AS DateTime2), 1, N'White', N'Ca', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0011', N'Haven''t adopted yet', N'Adult ', CAST(N'2020-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2020-10-06T00:00:00.0000000' AS DateTime2), 0, N'Orange', N'Sau', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0012', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-05T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Co', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0013', N'Haven''t adopted yet', N'Adult ', CAST(N'2023-10-05T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-04T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Mama', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0014', N'Haven''t adopted yet', N'Baby', CAST(N'2023-10-04T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-03T00:00:00.0000000' AS DateTime2), 1, N'Orange', N'Momo', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0015', N'Haven''t adopted yet', N'Baby', CAST(N'2023-10-05T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-04T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Meme', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0016', N'Haven''t adopted yet', N'Baby', CAST(N'2023-10-03T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-02T00:00:00.0000000' AS DateTime2), 1, N'Orange', N'Bin Bin', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0017', N'Haven''t adopted yet', N'Baby', CAST(N'2023-10-02T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-01T00:00:00.0000000' AS DateTime2), 0, N'Yellow', N'Lu', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0018', N'Haven''t adopted yet', N'Baby', CAST(N'2023-10-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-09-30T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Lin', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0019', N'Haven''t adopted yet', N'Baby', CAST(N'2023-06-30T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-06-29T00:00:00.0000000' AS DateTime2), 0, N'Orange', N'Lun', 0, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0020', N'Haven''t adopted yet', N'Baby', CAST(N'2023-06-29T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-06-28T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Map', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0021', N'Haven''t adopted yet', N'Baby', CAST(N'2023-06-28T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-06-27T00:00:00.0000000' AS DateTime2), 0, N'Yellow', N'My Dieu', 0, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0022', N'Haven''t adopted yet', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Xam', 1, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0023', N'Haven''t adopted yet', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Brown', N'Mau', 0, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0024', N'Haven''t adopted yet', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Den', 1, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0025', N'Haven''t adopted yet', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Black', N'Nau', 0, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0026', N'Awaiting adoption', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'My Linh', 1, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0027', N'Awaiting adoption', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 0, N'Brown', N'Dau', 1, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0028', N'Awaiting adoption', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Xe xe', 0, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0029', N'Awaiting adoption', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Orange', N'Son', 1, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0030', N'Awaiting adoption', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 0, N'Yellow', N'Co', 1, N'ND001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0031', N'Adopted', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'White', N'Beo', 0, N'TV001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0032', N'Adopted', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Ga', 1, N'BS001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0033', N'Adopted', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Vit', 0, N'BL001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0034', N'Adopted', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Black', N'Hong', 0, N'AC001')
INSERT [dbo].[pet] ([pet_id], [adopt_status], [age], [create_at], [descriptions], [foster_at], [is_spay], [pet_color], [pet_name], [sex], [breed_id]) VALUES (N'P0035', N'Adopted', N'Adult', CAST(N'2023-10-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-10-06T00:00:00.0000000' AS DateTime2), 1, N'Yellow', N'Vang', 1, N'AC001')
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
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0001', N' Made from real fish.', 1, N'ME-O Tuna In Jelly', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0002', N' Made from real fish.', 1, N'ME-O DELITE TUNA IN JELLY', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0003', N' Made from real fish.', 1, N'ME-O GOLD PERSIAN', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0004', N' Made from real fish.', 1, N'ME-O GOLD INDOOR', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0005', N' Made from real fish.', 1, N'ME-O GOLD FIT & FIRM', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0006', N' Made from real fish.', 1, N'ME-O DELITE TUNA WITH CRAB STICK IN JELLY', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0007', N' Made from real fish.', 1, N'ME-O Tuna In Jelly', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0008', N' Made from real fish.', 1, N'ME-O DELITE TUNA WITH CHICKEN FLAKE IN JELLY', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0009', N' Made from real fish.', 1, N'SALMON FLAVOUR', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0010', N' Made from real fish.', 1, N'ME-O Cat Tuna', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0011', N' Made from real fish.', 1, N'ME-O Kitten Ocean Fish', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0012', N' Made from real fish.', 1, N'ME-O Cat Mackerel Flavor', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0013', N' Made from real fish.', 1, N'APRO I.Q. FORMULA', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0014', N' Made from real fish.', 1, N'ME-O Creamy Treat Crab Flavor', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0015', N' Made from real fish.', 1, N'ME-O Creamy Treat Bonito Flavor', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0016', N' Made from real fish.', 1, N'ME-O Creamy Treat Bonito Flavor', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0017', N' Made from real fish.', 1, N'ME-O GOLD FIT & FIRM', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0018', N' Made from real fish.', 1, N'ME-O Cat Litter Lemon Scent', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0019', N' Made from real fish.', 1, N'ME-O DELITE TUNA IN JELLY', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0020', N' Made from real fish.', 1, N'Royal Canin Indoor Adult Dry Cat Food', N'CF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0021', N'Nutrition for dogs.', 1, N'APRO I.Q. FORMULA', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0022', N'Nutrition for dogs.', 1, N'ZOI DOG', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0023', N'Nutrition for dogs.', 1, N'SMARTHEART CREAMY DOG TREATS CHICKEN & SPINACH', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0024', N'Nutrition for dogs.', 1, N'SMARTHEART CREAMY DOG TREATS STRAWBERRY FLAVOR', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0025', N'Nutrition for dogs.', 1, N'SMARTHEART CREAMY DOG TREATS CHICKEN & CARROT', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0026', N'Nutrition for dogs.', 1, N'SMARTHEART CREAMY DOG TREATS CHICKEN & PUMPKIN', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0027', N'Nutrition for dogs.', 1, N'Smartheart Puppy Power Pack', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0028', N'Nutrition for dogs.', 1, N'Smartheart Adult Roast Beef Flavour
', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0029', N'Nutrition for dogs.', 1, N'Smartheart Small Breeds Roast Beef Flavor', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0030', N'Nutrition for dogs.', 1, N'Smartheart Puppy Chicken Flavor Chunk In Gravy', N'DF001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0031', N'Enjoy for pet', 1, N'SWING MICROCHIP LARGE', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0032', N'Enjoy for pet', 1, N'FEEDY', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0033', N'Enjoy for pet', 1, N'ALTAIR', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0034', N'Enjoy for pet', 1, N'CLIP 5708 SMALL', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0035', N'Enjoy for pet', 1, N'SOFA'' TWEED', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0036', N'Enjoy for pet', 1, N'GRO 5955', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0037', N'Enjoy for pet', 1, N'CHAMPION P', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0038', N'Enjoy for pet', 1, N'KONYA', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0039', N'Enjoy for pet', 1, N'ATLAS PADDED CUSHION', N'PA001')
INSERT [dbo].[product] ([product_id], [product_desc], [is_active], [product_name], [type_id]) VALUES (N'PD0040', N'Enjoy for pet', 1, N'PETVILLA 60', N'PA001')
GO
SET IDENTITY_INSERT [dbo].[product_repo] ON 

INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (2, 130000, 1, 250000, 20, 1, N'PD0001')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (3, 100000, 1, 125000, 50, 2, N'PD0002')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (4, 90000, 1, 120000, 100, 1, N'PD0003')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (5, 300000, 1, 350000, 70, 2, N'PD0004')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (6, 50000, 1, 75000, 50, 1, N'PD0005')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (7, 500000, 1, 600000, 100, 2, N'PD0006')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (8, 200000, 1, 250000, 20, 1, N'PD0007')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (9, 500000, 1, 600000, 50, 1, N'PD0008')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (10, 130000, 1, 170000, 100, 2, N'PD0009')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (11, 500000, 1, 600000, 20, 1, N'PD0010')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (12, 200000, 1, 250000, 70, 1, N'PD0011')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (13, 500000, 1, 600000, 20, 2, N'PD0012')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (14, 130000, 1, 170000, 20, 1, N'PD0013')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (15, 500000, 1, 600000, 50, 1, N'PD0014')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (16, 130000, 1, 170000, 20, 4, N'PD0015')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (17, 200000, 1, 250000, 20, 1, N'PD0016')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (18, 45000, 1, 75000, 70, 1, N'PD0017')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (19, 200000, 1, 250000, 50, 4, N'PD0018')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (20, 25000, 1, 50000, 100, 2, N'PD0019')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (21, 130000, 1, 150000, 20, 1, N'PD0020')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (22, 45000, 1, 75000, 20, 3, N'PD0021')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (23, 25000, 1, 50000, 100, 2, N'PD0022')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (24, 200000, 1, 250000, 20, 1, N'PD0023')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (25, 25000, 1, 50000, 100, 2, N'PD0024')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (26, 45000, 1, 90000, 100, 1, N'PD0025')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (27, 200000, 1, 250000, 20, 2, N'PD0026')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (28, 130000, 1, 15000, 70, 1, N'PD0027')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (29, 200000, 1, 250000, 100, 2, N'PD0028')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (30, 45000, 1, 90000, 20, 1, N'PD0029')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (31, 25000, 1, 50000, 100, 1, N'PD0030')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (32, 200000, 1, 250000, 50, 2, N'PD0031')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (33, 130000, 1, 200000, 100, 2, N'PD0032')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (34, 45000, 1, 70000, 100, 2, N'PD0033')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (35, 190000, 1, 230000, 70, 2, N'PD0034')
INSERT [dbo].[product_repo] ([product_repo_id], [in_price], [in_stock], [out_price], [quantity], [size], [product_id]) VALUES (36, 20000, 1, 30000, 50, 1, N'PD0035')
SET IDENTITY_INSERT [dbo].[product_repo] OFF
GO
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'BF001', N'Bird food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'CF001', N'Cat food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'DF001', N'Dog food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'MF001', N'Mouse food')
INSERT [dbo].[product_type] ([product_type_id], [product_type_name]) VALUES (N'PA001', N'Pet accessories')
GO
SET IDENTITY_INSERT [dbo].[shipping_info] ON 

INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (1, N'Can Tho', N'Tran Anh Huy', N'0123456789', N'user0001')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (2, N'Can Tho', N'Tran Anh Huy', N'0123456789', N'user0001')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (3, N'Can Tho', N'Tran Anh Huy', N'0123456789', N'user0001')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (4, N'Can Tho', N'Tran Anh Huy', N'0123456789', N'user0001')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (5, N'Can Tho', N'Tran Anh Huy', N'0123456789', N'user0001')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (6, N'Can Tho', N'Vo Vu Truong Giang', N'0123456789', N'user0002')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (7, N'Can Tho', N'Thai Kim Tung', N'0123456789', N'user0003')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (8, N'Can Tho', N'Huynh Tran Thanh', N'0123456789', N'user0004')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (9, N'Can Tho', N'Toc Tien', N'0123456789', N'user0005')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (10, N'Can Tho', N'Tran Anh Huy', N'0123456789', N'user0006')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (11, N'Can Tho', N'Ngo Kien Huy', N'0123456789', N'user0007')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (12, N'Can Tho', N' Nguyen Quoc Duy', N'0123456789', N'user0008')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (13, N'Can Tho', N'Pham Nhut Khang', N'0123456789', N'user0009')
INSERT [dbo].[shipping_info] ([id], [address], [full_name], [phone], [user_id]) VALUES (14, N'Can Tho', N'Pham Trung Duc', N'0123456789', N'user0010')
SET IDENTITY_INSERT [dbo].[shipping_info] OFF
GO
INSERT [dbo].[users] ([user_id], [address], [avatar], [birthday], [create_at], [email], [fullname], [gender], [is_active], [password], [phone], [role], [username]) VALUES (N'admin001', N'Can Tho', N'avataradmin001.png', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), N'admin001@gmail.com', N'Nguyen Thi Lam Ha', 1, 1, N'123', N'0123456789', N'1', N'Hantl001')
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
USE [master]
GO
ALTER DATABASE [petfoster] SET  READ_WRITE 
GO
