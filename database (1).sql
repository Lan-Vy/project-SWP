USE [Project_Group1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[passWord] [nvarchar](255) NOT NULL,
	[role] [int] NOT NULL,
	[email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cID] [int] IDENTITY(1,1) NOT NULL,
	[cName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[productId] [int] NULL,
	[rating] [int] NULL,
	[feedbackContent] [nvarchar](max) NULL,
	[feedbackDate] [datetime] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NOT NULL,
	[accountID] [int] NOT NULL,
	[addressReceive] [nvarchar](max) NULL,
	[sdt] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[totalPrice] [money] NULL,
	[status] [int] NULL,
	[shipperID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pID] [int] IDENTITY(1,1) NOT NULL,
	[pName] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cID] [int] NULL,
	[pAmount] [int] NULL,
	[isDeleted] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubImage]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubImage](
	[subImageID] [int] IDENTITY(1,1) NOT NULL,
	[pID] [int] NULL,
	[SImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubImage] PRIMARY KEY CLUSTERED 
(
	[subImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View]    Script Date: 2/20/2025 10:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[viewed] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (1, N'Adam', N'123456', 1, N'Adam@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (3, N'Anjolie', N'SNZ6HE', 2, N'Ạnolie@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (4, N'Ferris', N'RXH3XJ', 2, N'Ferris@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (5, N'Katell', N'HWV8ZN', 2, N'Katell@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (6, N'Zahir', N'NPX7OF', 1, N'Zahir@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (7, N'Conan', N'WIZ5VZ', 1, N'Conan@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (8, N'Cade', N'ZSW2LU', 1, N'Cade@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (9, N'Micah', N'RVV5SR', 2, N'Micah@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (10, N'Rowan', N'VAI6XR', 1, N'Rowan@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (11, N'admin', N'123', 2, N'admin@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (12, N'kim', N'1234', 1, N'kim@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (13, N'phuong', N'567', 1, N'phuong@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (14, N'hihi', N'123', 1, N'hihi@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (15, N'123', N'123', 1, N'123@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (1015, N'minh', N'ohvegnPe', 1, N'minh@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2015, N'dang', N'123', 3, N'shipper2@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2016, N'lanvy', N'123', 3, N'vy@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2017, N'thanh', N'123', 3, N'shipper@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2018, N'fsdfdsrtest', N'Abc@123', 3, N'kimanh3082@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cID], [cName]) VALUES (1, N'Giày Nike')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (8, N'Giày Adidas')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (9, N'Giày Jordan')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (10, N'Giày Vans')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (11, N'Giày Converse')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (12, N'Áo Nike ')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (13, N'Áo Adidas')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (14, N'None')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (15, N'Quần Nike')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (16, N'Quần Adidas')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (17, N'Quần Puma')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [userId], [productId], [rating], [feedbackContent], [feedbackDate]) VALUES (1, 1015, 63, 4, N'oki', CAST(N'2024-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Feedback] ([Id], [userId], [productId], [rating], [feedbackContent], [feedbackDate]) VALUES (2, 1015, 64, 4, N'okila123', CAST(N'2024-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Feedback] ([Id], [userId], [productId], [rating], [feedbackContent], [feedbackDate]) VALUES (3, 1015, 64, 3, N'okila lm mn oi', CAST(N'2024-10-26T16:02:57.773' AS DateTime))
INSERT [dbo].[Feedback] ([Id], [userId], [productId], [rating], [feedbackContent], [feedbackDate]) VALUES (4, 12, 71, 5, N'qua mac', CAST(N'2024-11-04T14:00:44.450' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2019, CAST(N'2024-02-25' AS Date), 11, N'Äan phÆ°á»£ng', N'0869381823', N'Kim Anh', 3980.0000, 3, 2017)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2020, CAST(N'2024-03-16' AS Date), 11, N'Äan phÆ°á»£ng', N'0869381823', N'Kim Anh', 1990.0000, 3, 2017)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2021, CAST(N'2024-05-12' AS Date), 11, N'Đan phượng', N'0869381823', N'Kim Anh', 6480.0000, 3, 2016)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2022, CAST(N'2024-05-13' AS Date), 12, N'Đan phượng', N'0869381823', N'Kim Anh', 400.0000, 3, 2017)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2023, CAST(N'2024-10-05' AS Date), 1015, N'Đan phượng', N'0869381823', N'Kim Anh', 6990.0000, 3, 2017)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2024, CAST(N'2024-11-04' AS Date), 2016, N'1223', N'0987675112', N'vinh tran', 1540.0000, 3, 2017)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2025, CAST(N'2024-11-04' AS Date), 2016, N'dsds', N'65646544', N'ds dssd', 1000.0000, 3, 2017)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2026, CAST(N'2024-11-04' AS Date), 12, N'cantho', N'0987654321', N'kim kim', 1000.0000, 3, 2017)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2027, CAST(N'2024-11-04' AS Date), 2017, N'cantho', N'0123456789', N'thanh thanh', 1000.0000, 3, 2015)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2028, CAST(N'2024-11-04' AS Date), 2017, N'cantho', N'0123456789', N'thanh thanh', 30000.0000, 3, 2016)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2029, CAST(N'2025-02-20' AS Date), 11, N'hn', N'0123456789', N'minh hai', 12000.0000, 0, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2019, 64, 1990.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2020, 64, 1990.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2021, 63, 2500.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2021, 64, 1990.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2022, 25, 200.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2023, 63, 2500.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2023, 64, 1990.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2024, 68, 1540.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2025, 71, 1000.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2026, 71, 1000.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2027, 122, 1000.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2028, 121, 1000.0000, 30)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2029, 69, 2000.0000, 6)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1, N'Jordan 1 Retro High Dark Mocha', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/89b0414dbb05499782be24efffcf29c3_9366/Adifom_Climacool_Shoes_Green_IF3937_01_standard.jpg', 320.0000, N'', N'', 9, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (2, N'Jordan 5 Retro Alternate Bel-Air', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c05f80341d640ba9c0594c7479455db_9366/D.O.N._Issue_5_Shoes_White_IE7799_01_standard.jpg', 630.0000, N'', N'', 9, 19, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (3, N'Jordan 4 Retro SE 95 Neon', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b65606c1962f4d88a2f06f14de9c5b35_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_01_standard.jpg', 455.0000, N'', N'', 9, 13, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (25, N'Adidas Yeezy Boost 350 V2 Black Red', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/910be30b9d004bdaaee80d58bcf24d8d_9366/Campus_00s_Shoes_Brown_ID2077_01_standard.jpg', 200.0000, N'', N'', 8, 14, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (44, N'Vans Sk8-Hi Re-Issue Flags', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b9a626b41f7c41efa29d3ebc98b113e7_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_01_standard.jpg', 60.0000, N'', N'', 10, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (45, N'Vans Authentic Comme des Garcons White', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/99ac2fdea36e4714bdbaaf4200bcc5ff_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_01_standard.jpg', 220.0000, N'', N'', 10, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (46, N'Vans Style 36 C2H4 50/50 Enlighten Trailblazer', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b00a682997bd40d3bdfaaed70181d5b6_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_01_standard.jpg', 360.0000, N'', N'', 10, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (57, N'Converse Ox Archival Flame Print', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bfff95f0750341bf939daed70141260e_9366/NMD_V3_Shoes_White_GX9468_01_standard.jpg', 66.0000, N'', N'', 11, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (58, N'Converse Thunderbolt Ox Vince Staples', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/236d087cb25740908bf5c6deb683a3ba_9366/Predator_League_Firm_Ground_Football_Boots_Black_IG7763_22_model.jpg', 68.0000, N'', N'', 11, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (59, N'Converse Hi Miley Cyrus White Black Stars (W)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fb1edca9a23e4c99b63f92dabffd1ad2_9366/Harden_Volume_8_Shoes_Orange_IE2694_01_standard.jpg', 45.0000, N'', N'', 11, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (62, N'Nike Air Force 1 Low White ''07', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3bbecbdf584e40398446a8bf0117cf62_9366/Samba_OG_Shoes_White_B75806_01_standard.jpg', 2700.0000, N'', N'', 1, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (63, N'Nike Air Max 97 Triple White Wolf Grey', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/73a000b08a1d4cbca81b6a1a434f9bee_9366/AE_1_Best_Of_Adi_Basketball_Shoes_White_IF1857_01_standard.jpg', 2500.0000, N'', N'', 1, 7, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (64, N'Nike Air Force 1 Low Off-White', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b810b829e9b742378b88c42047781ef4_9366/Stan_Smith_CS_Shoes_White_IG1296_01_standard.jpg', 1990.0000, N'', N'', 1, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (67, N'Adidas XPLR White Black', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/cb99a0d8acf548e583b32671ff2f3003_9366/Gazelle_Indoor_Shoes_White_IG1896_01_standard.jpg', 2830.0000, N'', N'', 8, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (68, N'Adidas Prophere Triple White (W)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/15efd399b216463e9392af5700c52792_9366/Adifom_Superstar_Shoes_White_HQ8750_01_standard.jpg', 1540.0000, N'sdf', N'ds', 8, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (69, N'Nike Dunk Low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/50577739-15d9-4141-bbd5-794b36bfbf7e/NIKE+DUNK+LOW+GS.png', 2000.0000, N'nike', N'The Nike Dunk Low is an easy score for your wardrobe. Thoughtfully made from durable synthetic leather for classic comfort and style, these kicks honour a hardwood icon with a design you can easily rock from PE to the park and everywhere in between.

', 1, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (70, N'Nike Air Force 1 Shadow', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/35a5a344-38fa-4eac-9e85-850665f567c8/W+AF1+SHADOW.png', 3000.0000, N'nike', N'Everything you love about the AF-1—but doubled! The Air Force 1 Shadow puts a playful twist on a hoops icon to highlight the best of AF-1 DNA. With 2 eyestays, 2 mudguards, 2 backtabs and 2 Swoosh logos, you get a layered look with double the branding.

', 1, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (71, N'Nike Air Force 1 Shadow', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/odhlk8ksqmstmdcjjyn0/W+AF1+SHADOW.png', 1000.0000, N'nike', N'The Nike Air Force 1 Shadow puts a playful twist on a classic b-ball design.Using a layered approach, doubling the branding and exaggerating the midsole, it highlights AF-1 DNA with a bold, new look.', 1, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (72, N'Nike Dunk High Retro', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5e7687f1-c13e-4bac-8ffa-a6f863ae9157/NIKE+DUNK+HI+RETRO.png', 3500.0000, N'nike', N'Created for the hardwood but taken to the streets, the ''80s basketball icon returns with perfectly sheened overlays and original university colours. With its classic hoops design, the Nike Dunk High Retro channels ''80s vintage back onto the streets while its padded, high-top collar adds an old-school look rooted in comfort.', 1, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (73, N'Nike Dunk Low Unlocked By You', N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0ab04620-a75f-4ea5-bce7-3e26a6dec829/custom-dunk-low-unlocked-by-you.png', 5000.0000, N'nike', N'Cheetah and tiger and croc—oh my! It''s time to design the Dunk of your dreams. The left and right shoes can be customised independently (excluding character personalisation), so let your imagination go wild. Velvet cheetah and tiger prints in a ''90s-inspired colour palette mix with a textural croc suede for the ultimate maximalist look. Don''t forget your shoelery for the finishing touch.', 1, 1, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (74, N'Yeezy Boost 700 ''Wave Runner'' 2023', N'https://image.goat.com/transform/v1/attachments/product_template_additional_pictures/images/092/494/732/original/1268737_01.jpg.jpeg?action=crop&width=600', 10000.0000, N'adidas', N'The 2023 edition of the Yeezy Boost 700 brings back the original ''Wave Runner'' colorway, first released in 2017. The upper utilizes mixed materials, including leather, mesh, suede and 3M, while the sculpted midsole houses Boost for lightweight cushioning. The shoe is mostly grey and black, save for a splash of blue and teal on the forefoot, two orange hits on the midsole and yellow laces.', 8, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (75, N'Giày adidas Yeezy Foam RNNR ‘Sand’ FY4567', N'https://sneakerdaily.vn/wp-content/uploads/2022/06/Giay-adidas-Yeezy-Foam-RNNR-Sand-FY4567.jpg.webp', 8000.0000, N'adidas', N'Thông tin phát hành Dép adidas Yeezy Foam RNNR ‘Sand’
Thời gian ra mắt :  26/03/2021

Thương hiệu: adidas

Thiết kế: Yeezy Foam

Xuất xứ: Đức

Mã sản phẩm: FY4567', 8, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (76, N'Giày nam Yeezy Boost 350 V2 Black Non-Reflective FU9006', N'https://sneakerdaily.vn/wp-content/uploads/2020/12/Giay-nam-Yeezy-Boost-350-V2-Black-Non-Reflective-FU9006.png.webp', 20000.0000, N'adidas', N'Thông tin phát hành Yeezy Boost 350 V2 Black Non-Reflective
Ngày ra mắt: Ngày 17 tháng 2 năm 2019

Thương hiệu: adidas

Thiết kế: Yeezy 350

Mã sản phẩm: FU9006

Xuất xứ: Đức', 8, 1, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (77, N'Tatum 2 ''Vortex'' PF', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c005f0ca-249c-4fec-b60e-96f98c8b7c61/JORDAN+TATUM+2+PF.png', 2000.0000, N'jordan', N'Bright colours and big energy come together in the Tatum 2 ''Vortex''. The lightweight, flexible design was created with energy return in mind and this colourway is all about how Jayson helps energise his team. When you''re wearing them on the court, your opponents won''t be able to ignore all the moves you make—but that doesn''t mean they can stop you from scoring.', 9, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (78, N'Tatum 2 PF ''Lemonade''', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cbfca82b-128b-4169-80ee-bfe94db3daaf/JORDAN+TATUM+2+PF.png', 2000.0000, N'jordan', N'On those days when the sun just won''t let up and your brow''s wet with sweat, what''s more refreshing than a glass of ice-cold lemonade? Nothing! Capture those summertime vibes with kicks that put a classic twist on a fan favourite. Bright, season-right colours will make you get your sunglasses out, and condensation drops on the tongue are paired with a lemon patch on the heel to clinch the theme and satisfy your thirst.', 9, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (79, N'LeBron Witness 8 EP', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c50955c9-0891-41b2-afb1-371f64a23218/LEBRON+WITNESS+VIII+EP.png', 1700.0000, N'jordan', N'When you step on the floor, what kind of performance do you want to put on? Stop the show in these LeBron Witness 8s and let them know there are no limits to your flair and full-scale skills. This sleek and boldly sculpted shoe offers stability when exploding and soft landings when you come back to the ground, allowing kingpins like you and LeBron to bound, brake and bolt from baseline to baseline. With its extra-durable rubber outsole, this version gives you traction for outdoor courts.', 9, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (80, N'Vans AUTHENTIC CLASSIC BLACK/WHITE', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/vans-authentic-classic-black-vn000ee3blk-1.png', 1500.0000, N'vans', N'Khi thế giới ngày càng phát triển hơn về mọi mặt, thời trang cũng vì thế mà không ngừng tiến bước về phía trước. Nhưng! Tất cả những cái mới đều được xây dựng dựa trên một thứ gọi là NỀN TẢNG. Và dĩ nhiên, VANS được cộng đồng thể thao biết đến như một thương hiệu thời trang chuyên về giày dành cho các bộ môn nghệ thuật đường phố, nổi bật là trượt ván. Với chiều dài hoạt động chuyên môn hơn 50 năm trong ngành thời trang may mặc, thương hiệu được sáng lập bởi một nghệ nhân giày - ông Paul Van Doren vào năm 1966. VANS được đặt trụ sở đầu tiên tại Anaheim, California, Mỹ và hoạt động cho đến ngày nay. VANS AUTHENTIC là một trong những sản phẩm xung phong đầu tiên, mở đầu cho một con đường tiếp nối đam mê của một thương hiệu giày vươn tầm thế giới. Và khi mà cái cũng cùng cái mới giao thoa kết hợp cùng với sự tinh tế và sự cố gắng không ngừng phá bỏ giới hạn của nhà OFF THE WALL, một tinh hoa đã của làng Sneaker đã ra đời được ra mắt sớm nhất từ năm 1966 với tên gọi VANS #44, được trang bị đế cao su độ bám tốt cho những môn thể thao mạo hiểm như trượt ván, BMX v.v..., upper vải canvas cao cấp, phong cách cổ điển hợp với cả nam lẫn nữ.', 10, 9, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (81, N'Vans SKATE SK8-HI BLACK/WHITE', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-skate-sk8-hi-black-white-vn0a5fccy28-1.jpg?v=1726804493523', 2000.0000, N'vans', N'Dòng sản phẩm:	Sk8-hi
Mã SKU:	VN0A5FCCY28
Chất liệu:	Suede, Canvas
Màu sắc:	Black/White
Giới tính:	Unisex', 10, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (82, N'Vans SK8-HI TAPERED COLOR THEORY DUSTY BLUE', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-sk8-hi-tapered-color-theory-dusty-blue-vn0009qpdsb-1.jpg?v=1726802922103', 1200.0000, N'Vans', N'Dòng sản phẩm:	Sk8-hi
Mã SKU:	VN0009QPDSB
Chất liệu:	Suede, Canvas
Màu sắc:	Color Theory Dusty Blue
Giới tính:	Unisex', 10, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (83, N'Run Star Hike Seasonal Colors Bege', N'https://converse.com.br/media/catalog/product/c/o/co03800010_a_107x1_2.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:', 2030.0000, N'converse', N'Eleve o seu guarda-roupa com um par novo de plataformas. Uma elevação leve e sola de borracha tratorada dão um toque inesperado aos seus Chucks do dia a dia. Detalhes como a estrutura de lona, biqueira de borracha e o patch do tornozelo Chuck Taylor permanecem fiéis ao original, enquanto uma plataforma moldada, sola bicolor e salto arredondado emitem uma vibração futurista.', 11, 7, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (84, N'Run Star Hike Vintage Remastered Azul', N'https://converse.com.br/media/catalog/product/c/o/co04550001_a_107x1_7.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:', 2500.0000, N'converse', N'O Run Star Hike retorna com um estilo ousado e trabalhado. Projetado para conforto e elevação premium sem sacrificar o estilo, um solado tratorado robusto e uma palmilha mantêm você leve nos pés. Detalhes contrastantes destacam elementos de design de Chuck Taylor, enquanto detalhes contrastantes te ajudam a se diferenciar da multidão para que nada possa te atrasar.', 11, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (85, N'Chuck 70 At-cx Monochrome Preto', N'https://converse.com.br/media/catalog/product/a/0/a04582c_a_107x1_11.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:', 3000.0000, N'converse', N'Nesta estação, o Chuck 70 AT-CX mantém a simplicidade. As cores podem estar mais discretas, mas o estilo aventureiro é mais ousado do que nunca. Com conforto CX e estrutura pronta para atividades como caminhadas e trilhas com inspiração retrô, o Chuck 70 AT-CX foi criado para você que tem a mente exploradora e sempre curiosa.
', 11, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (86, N'Tatum Chicago', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/6a4a20da-4dde-4b88-900e-80ff454f8680/M+J+CHICAGO+JACKET+JT.png', 3000.0000, N'ao nike', N'Jayson Tatum has made a name for himself as one of the smoothest players in the game. So, it''s only fitting that his signature collection is just as smooth. Crafted from durable canvas, this workwear-inspired jacket features an all-over wash for that perfectly worn-in look.

', 12, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (87, N'Nike ACG Therma-FIT', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/edc37952-0f6f-4584-a714-a693450db5b4/AS+U+ACG+TF+TUFF+FLC+PO+HOODIE.png', 2000.0000, N'ao nike', N'After walking through the glacial wonders of Iceland, our design team was inspired to make a fleece-lined hoodie to help keep you warm and repel water for cool hikes and wintry walks. Plus, we made it with at least 75% sustainable materials, using a blend of organic cotton and recycled polyester fibres.', 12, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (88, N'Zion', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/e9cb9ce4-4eb4-4708-86e8-d7f22454eb4c/M+J+ZION+GFX+FLC+PO.png', 3000.0000, N'ao nike', N'Bring the heat. This relaxed hoodie is made from soft fleece that''s smooth on the outside and plush on the inside, so you know you''ll be staying cosy. And those graphics? Absolute fire.', 12, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (89, N'Nike Running Division', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b5aeb40c-011e-4094-9c24-2cf00fc32b1b/AS+M+NK+DFADV+RUN+DIV+SS.png', 1800.0000, N'ao nike', N'Day or night, rain or shine, Nike Running Division offers the features you need to navigate the concrete, cars and crossings of the paved landscape. This lightweight, sweat-wicking top features a perforated graphic on the back to help vent sweat and keep you feeling fresh with every mile. The butterfly graphic is inspired by the transformation we go through in exercise and life.', 12, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (90, N'Kevin Durant', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/bee09d2e-d527-4354-9da2-2e0353181beb/AS++KD+M+NK+DF+SS+TOP.png', 2000.0000, N'ao nike', N'From his picture-perfect jumper to his savvy business mind, Kevin Durant is a master of his craft on and off the court. Our KD signature apparel collection celebrates the next generation of do-it-all athletes with pieces you can wear anywhere. This relaxed-fit button-up top is breathable and helps keep the sweat away while you work on your game.', 12, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (91, N'Nike Sportswear Tech Fleece Re-Imagined', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dad9ada9-3812-471b-859e-cc857ae42698/AS+M+NK+TCH+FLC+SS+TOP.png', 2000.0000, N'ao nike', N'This oversized short-sleeve top is everything you love about our smooth, comfy Tech Fleece in a spacious, inspired design. Exaggerated proportions, like extra-wide and long sleeves, a mock-neck collar and a loose drape through the body, make a statement look. Our premium, smooth-on-both-sides fleece feels warmer and softer than ever while keeping the same lightweight build you love. Wear it with our Tech Fleece Shorts for a look that''s all about clean lines and soft comfort.', 12, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (92, N'Essentials Big Logo Regular Fleece Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0a06ddc2f5b14f2d87e10e3e52ad1023_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_White_JH3706_21_model.jpg', 1000.0000, N'ao adidas', N'A cozy hoodie that''s easy to throw on anytime.
No hoodie collection feels complete without this classic adidas number. Made from a cotton-blend fleece, it''s weighty and warm. Tighten up the hood for a bracing morning walk. Cocoon your phone inside the pouch pocket as you lounge around the house.
', 13, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (93, N'adidas Basketball Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b1f1d284867c4e2089e9d0cde90bbf85_9366/adidas_Basketball_Hoodie_Black_IZ4907_21_model.jpg', 2000.0000, N'ao adidas', N'A hoodie built with versatility in mind.
The next chapter of adidas Basketball is an exploration in form, function and color. A curated collection, built to fit the needs of the modern athlete. This fleece hoodie features ribbing on the cuffs and hem. It''s made of a blend of cotton and polyester fabric.Our cotton products support more sustainable cotton farming.', 13, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (94, N'adidas Basketball Spacer Hoodie (Gender Neutral)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5be02bcded1946ada051c82a0be45e42_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Grey_JD7466_21_model.jpg', 2000.0000, N'ao adidas', N'A hooded sweatshirt made for comfort and style on and off the court.
Get in the zone before the game. This adidas basketball hooded sweatshirt keeps you comfortable and focused. Made for easy movement on and off the court, its cotton and polyester doubleknit fabric has added stretch so you can move free and easy in every direction. Pull up the hood to block out distractions and get your mind in the game. This sweatshirt was made using UNITEFIT — an all-gender fit system that was created with a spectrum of sizes, genders and forms in mind.', 13, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (95, N'Essentials Big Logo Regular Fleece Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f7ccf84aace245698dcc8d8c95aae3f5_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_Grey_JH3707_21_model.jpg', 1000.0000, N'ao adidas', N'A cozy hoodie that''s easy to throw on anytime.
No hoodie collection feels complete without this classic adidas number. Made from a cotton-blend fleece, it''s weighty and warm. Tighten up the hood for a bracing morning walk. Cocoon your phone inside the pouch pocket as you lounge around the house.

We partner with Better Cotton to improve cotton farming globally. Better Cotton makes global cotton production better for the people who produce it, better for the environment it grows in, and better for the sector''s future.

Better Cotton is sourced via a chain-of-custody model called mass balance. This means that Better Cotton is not physically traceable to end products. However, Better Cotton Farmers benefit from the demand for Better Cotton in equivalent volumes to those we "source."

Find out more here:bettercotton.org/learnmore', 13, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (96, N'adidas Z.N.E. Full-Zip Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ebe549c2988f4f1ca1905485fba207b7_9366/adidas_Z.N.E._Full-Zip_Hoodie_White_JE7849_21_model.jpg', 1000.0000, N'ao adidas', N'A sporty hoodie made in part with a blend of recycled and renewable materials.
This adidas hoodie celebrates the community we find through sport. The soft three-layer adidas PRIMEKNIT fabric lends lightweight warmth and a soft feel, while the roomy hood adds extra coverage. Matte rubber-print graphics represent the lines that bring us together on the field of play. Zip it all the way up to block the breeze on cool days, or leave it open to show off your favorite team shirt beneath. When the game is about to start, stash your small essentials in the hidden zip pocket inside the kangaroo pocket and head out.

By choosing recycled, we are able to reuse materials that have already been created, which helps to reduce waste. Renewable materials choices will help us to remove our reliance on finite resources. Our products made with a blend of recycled and renewable materials feature at least 70% total of these materials.', 13, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (97, N'Dugout Short Sleeve Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/257c5b9989764f90a52ca3ef21156069_9366/Dugout_Short_Sleeve_Hoodie_Blue_IS9769_01_laydown.jpg', 1000.0000, N'ao adidas', N'A short sleeve hoodie made in part with a blend of recycled and renewable materials.
Whether you''re heading to the outfield to shag flies or working on your swing in the batting cage, this short sleeve adidas baseball hoodie delivers comfort that lasts. Premium doubleknit fabric provides softness while the loose fit gives you a full range of motion. A classic kangaroo pocket can keep your hands warm between reps. This sweatshirt was made using UNITEFIT — an all-gender fit system that was created with a spectrum of sizes, genders and forms in mind.

By choosing recycled, we are able to reuse materials that have already been created, which helps to reduce waste. Renewable materials choices will help us to remove our reliance on finite resources. Our products made with a blend of recycled and renewable materials feature at least 70% total of these materials.', 13, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (98, N'adidas Basketball Spacer Hoodie (Gender Neutral)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/aaff563fc60d4bad9a76c003c769d1a2_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Black_IW5653_21_model.jpg', 2000.0000, N'ao adidas', N'A hooded sweatshirt made for comfort and style on and off the court.
Get in the zone before the game. This adidas basketball hooded sweatshirt keeps you comfortable and focused. Made for easy movement on and off the court, its cotton and polyester doubleknit fabric has added stretch so you can move free and easy in every direction. Pull up the hood to block out distractions and get your mind in the game. This sweatshirt was made using UNITEFIT — an all-gender fit system that was created with a spectrum of sizes, genders and forms in mind.', 13, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (99, N'RELAX TEE', N'https://www.stussy.com/cdn/shop/files/1905055_WHIT_1.jpg?v=1728313824&width=1920', 3000.0000, N'stussy', N'Oversized tee in midweight 6.5oz cotton jersey. Features screenprinted graphics.

- Shortsleeve
- Ribbed collar
- Runs large
- Unisex
- Material: 100% cotton
- Imported', 14, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (100, N'FADED GRAPHIC ZIP HOODIE', N'https://www.stussy.com/cdn/shop/files/118565_PURP_3.jpg?v=1729274714&width=1920', 1000.0000, N'stussy', N'Relaxed fit hooded sweatshirt in a heavy 15.8oz cotton blend fleece. Stüssy logo screenprinted across the front.

- Round drawcord in hood
- #5 YKK metal zip closure
- Ribbed cuffs and hem
- Patch pocket
- Relaxed fit
- Unisex
- Material: 66% cotton / 34% polyester
- Imported', 14, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (101, N'BEAT SOUNDS TEE PIGMENT DYED', N'https://www.stussy.com/cdn/shop/files/1905060_BLAC_1.jpg?v=1728313848&width=1920', 2000.0000, N'stussy', N'Oversized pigment dyed tee in midweight 6.5oz cotton jersey. Features screenprinted graphics.

- Longsleeve
- Ribbed collar
- Runs large
- Unisex
- Material: 100% cotton
- Imported

*This garment has been individually dyed, producing a one-of-a-kind result. Color may fade or bleed after wash.', 14, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (102, N'WORKGEAR JACKET', N'https://www.stussy.com/cdn/shop/files/115785_BLUE_3.jpg?v=1728980414&width=1920', 2000.0000, N'stussy', N'Work jacket in cotton canvas lined with quilted quilting. Boxy fit featuring a corduroy collar, concealed zip closure, patch pockets, and a garment dye with stonewash treatment. Stüssy workgear label stitched at the side.

- #8 YKK metal zip closure
- Exterior placket with concealed snaps
- Reinforced elbow patches
- Snap closure at cuffs
- Front patch pockets
- Locker loop
- Interior patch pocket
- Interior welt pocket
- Fully lined with quilted padding
- Boxy fit
- Unisex
- Shell: 100% cotton
- Body lining: 65% polyester / 35% cotton
- Sleeve lining: 100% polyester
- Fill: 100% polyester
- Imported', 14, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (103, N'WORK JACKET CONTRAST STITCH', N'https://www.stussy.com/cdn/shop/files/115790_BLAC_3.jpg?v=1728491202&width=1920', 3000.0000, N'stussy', N'Hooded work jacket in cotton canvas with quilted satin lining. Boxy fit featuring a zip front closure, welt pockets, and contrast stitching. Stüssy workgear embroidery at the back and chest.

- #8 YKK metal zip closure
- Vertical quilted lining
- Cotton drawcord in hood
- Locker loop at back neck seam
- Exterior welt pockets
- Interior welt pocket
- Elastic cuffs and hem
- Boxy fit
- Unisex
- Material: 100% cotton
- Lining: 100% polyester
- Insulation: 100% polyester
- Imported', 14, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (104, N'CODES TEE', N'https://www.stussy.com/cdn/shop/files/1905057_BLAC_1.jpg?v=1728313829&width=1920', 2000.0000, N'stussy', N'Oversized tee in midweight 6.5oz cotton jersey. Features screenprinted graphics with a gloss finish.

- Shortsleeve
- Ribbed collar
- Runs large
- Unisex
- Material: 100% cotton
- Imported', 14, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (105, N'Nike Club', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9f936cde-a784-4652-ae40-9320550de439/AS+M+NK+CLUB+FLOW+SHORT.png', 2000.0000, N'quan nike', N'Sporty and versatile, these woven shorts are made for easy-going daily comfort. The fit is designed to fall above the knee and feel relaxed through the seat and thighs to keep them from feeling restrictive, especially in warmer weather. Mesh lining helps you stay cool and comfy around town. Pair them up with a tee and your favourite Nike sneakers for a look that gets you out there looking and feeling great.


Colour Shown: Black/White
Style: FN3308-010
Country/Region of Origin: China, Philippines, Vietnam', 15, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (106, N'Jordan Dri-FIT Sport', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/bc876e65-a5b1-4d76-aef5-269a8047f7ea/M+J+DF+SPRT+DMND+SHORT.png', 2000.0000, N'quan nike', N'You ready to ball? Made from light, breathable mesh with sweat-wicking technology, these shorts set you up with versatile wearability for your whole day, on or off the court.


Colour Shown: Gym Red/Black/Gym Red/Gym Red
Style: DX1487-687
Country/Region of Origin: China, Cambodia, Thailand, Vietnam
', 15, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (107, N'Jordan Sport', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/5c922d4e-b761-4c3c-b2f5-91cd73692c9e/M+J+DF+SPRT+AOP2+DMND+SHORT.png', 1000.0000, N'quan nike', N'Your wardrobe must-have is back. Ready to ball and down to chill, our Diamond shorts pair lightweight mesh with sweat-wicking technology to help you stay cool and comfortable. Designed to fall above the knee, they have a classic fit that lets you move freely on and off the court.


Colour Shown: Black/Black
Style: FV8616-010
Country/Region of Origin: Thailand', 15, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (108, N'Nike Sportswear Club', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ab7771d9-d859-43ac-848c-7cacaa120878/AS+M+NK+CLUB+FT+SHORT+APLQ+ARC.png', 1000.0000, N'quan nike', N'Made with a roomy fit through the seat and thighs, these fleece shorts give you the familiar feel you love, with a little extra space to lounge. The satin "NIKE" lettering is stitched down for a varsity-inspired finish. For a comfortable, uniform look, pull them on with the matching hoodie and your favourite Nike sneakers.


Colour Shown: Midnight Navy/White
Style: FQ4093-410
Country/Region of Origin: Pakistan', 15, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (109, N'Team 31 DNA', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d0b0c2bf-a817-450b-b6c9-7b2907e17f8a/N31+MNK+DF+DNA+SHORT+8IN.png', 1000.0000, N'quan nike', N'Show your love for the league in these Team 31 DNA shorts. They''re made from lightweight, yet durable material that wicks sweat to help keep you feeling dry and focused.


Colour Shown: Neutral Olive/Hyper Crimson
Style: FQ3690-276
Country/Region of Origin: Thailand', 15, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (110, N'Nike Form', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29e082fc-2fa5-4fd1-a543-2c20c7a61cca/AS+M+NK+DF+FORM+5IN+UL+SHORT.png', 1000.0000, N'quan nike', N'Designed for running, training and yoga, the versatile Form shorts are built to handle those days when you need to shake up your exercise routine. With a 13cm (approx.) inseam and smooth, sweat-wicking fabric, these shorts are designed to keep up with your moves—from PR deadlifts to hot yoga classes.


Colour Shown: Ashen Slate/Black
Style: FN4348-493
Country/Region of Origin: Vietnam', 15, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (111, N'Entrada 22 Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2f98f51dc01d46e88cdaadd7004c9ecb_9366/Entrada_22_Shorts_Black_H57508_01_laydown.jpg', 100.0000, N'quan adidas', N'Moisture-wicking soccer shorts made in part with recycled materials.
Wherever your day takes you, you''re set in these adidas soccer Entrada 22 Shorts. They have a clean, classic design and AEROREADY to keep you dry and fresh. The drawcord-adjustable elastic waist ensures a snug fit.

Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 16, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (112, N'Team Issue Knit Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a96efa65f63d48b1a369adab0155f95f_9366/Team_Issue_Knit_Shorts_Red_HS7734_01_laydown.jpg', 100.0000, N'quan adidas', N'Loose-fit knit shorts with a notched hem, made with recycled materials.
When leg day''s a scorcher in and out of the gym, the mesh inserts on these adidas shorts add a kick of cooling air, so you stay pumping with power. When you finally hit your stride and the sweat starts to pour, AEROREADY manages moisture, so you stay dry and finish strong.

Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (113, N'Firebird Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/431b3805a8da4b8caa8287718491baac_9366/Firebird_Shorts_Black_IU2425_21_model.jpg', 100.0000, N'quan adidas', N'These relaxed shorts are made in part with recycled materials.
Express your active spirit in these lightweight adidas shorts. Inspired by the iconic Firebird track suit, they''re built with zip pockets and a loose silhouette for freedom of movement. The soft tricot material keeps you comfortable whether you''re cozying up at home or going out for a spin.This product is made with at least 70% recycled materials. By reusing materials that have already been created, we help to reduce waste and our reliance on finite resources and reduce the footprint of the products we make.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (114, N'Stadium 4-Inch Training Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/557df5a1ffbc4f04b009af040108aa4b_9366/Stadium_4-Inch_Training_Shorts_White_HG2614_01_laydown.jpg', 1000.0000, N'quan adidas', N'Lightweight shorts made in part with recycled materials.
Weights rack to running track, these adidas shorts let your legs breathe. Light and stretchy, with AEROREADY to wick away moisture, they keep you dry through all types of workouts. Adjust the drawcord waistband for a stay-put fit as you train. Pockets add a practical touch.

Made with a series of recycled materials, and at least 70% recycled content, this product represents just one of our solutions to help end plastic waste.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (115, N'Essentials Linear French Terry Shorts (Plus Size)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0db2f3f3460248cd828aaf1500bcf6df_9366/Essentials_Linear_French_Terry_Shorts_Plus_Size_Black_IB8758_01_laydown.jpg', 1000.0000, N'quan adidas', N'Lightweight adidas shorts for laid-back weekends.
These adidas shorts are comfortable enough to live in. Made from cotton French terry fabric, they have a super-soft feel. With slits at the sides, they sit close against your legs while still allowing for plenty of movement.

Our cotton products support more sustainable cotton farming.', 16, 7, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (116, N'Team Issue Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3faa1608606e4d4390c9ade1017d4310_9366/Team_Issue_Shorts_Grey_HS7725_01_laydown.jpg', 1000.0000, N'quan adidas', N'Loose-fit shorts with airy mesh inserts, made with recycled materials.
With pockets on the sides and another on the back, these adidas shorts make it easy to get out the door before distractions put an end to your impromptu workout plan. AEROREADY keeps you dry while you decide between planks at the park or a run by the river. Can''t make up your mind? Do both.

Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 16, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (117, N'PUMA x LAMELO BALL 1Love', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627785/01/mod01/fnd/PNA/fmt/png/PUMA-x-LAMELO-BALL-1Love-Basketball-Shorts-Men', 1000.0000, N'quan puma', N'Description
To be Melo is to be yourself. This 1Love collection includes basketball and streetwear pieces transformed with bold colors and gradients. Intergalactic vibes and Melo’s NOT FROM HERE graphics round off this collection by LaMelo Ball. 
Made with 100% recycled material excluding trims & decorations
Relaxed fit
245 gsm
Zip pockets
Above knee length
PUMA branding details
Style: 627785_01
Color: Pink Alert', 17, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (118, N'Media Day', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627161/01/mod01/fnd/PNA/fmt/png/Media-Day-Classics-Men''s-Basketball-Shorts', 1000.0000, N'quan puma', N'Show you mean business on the basketball court in these Media Day Basketball shorts. They have a relaxed fit and PUMA Hoops jaws graphics that will strike fear into any opponent.

dryCELL: Performance technology designed to wick moisture from the body and keep you free of sweat during exercise
Made with 100% recycled material excluding trims & decorations.
Relaxed fit
140 gsm, mesh material
Mid-rise
Above-knee length
PUMA branding details
Style: 627161_01
Color: PUMA Black', 17, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (119, N'Scoot All Jaws', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/629215/01/mod01/fnd/PNA/fmt/png/Scoot-All-Jaws-All-Over-Print-Men''s-Basketball-Shorts', 1000.0000, N'quan puma', N'Game-ready shorts for hardwood heroes. Scoot Henderson branding and a relaxed fit let you dominate without distraction. Knitted for breathability so you''re fresh for the 4th quarter. Take your game to the next level in PUMA style.
Style: 629215_01
Color: PUMA Black-AOP', 17, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (120, N'BMW M Motorsport Life', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627539/07/mod01/fnd/PNA/fmt/png/BMW-M-Motorsport-Men''s-Life-PUMATECH-Shorts', 1000.0000, N'quan puma', N'In a world of motorsport and sportswear, where performance is paramount, the BMW M Motorsport LIFE PACK emerges as your ultimate companion. These regular fit shorts feature our dryCELL tech to wick moisture and keep you feeling at your best.

dryCELL: Performance technology designed to wick moisture from the body and keep you free of sweat during exercise
Made with at least 70% recycled materials
Regular fit
225 gsm, dobby
Mid-rise
BMW M Motorsport branding details
PUMA branding details
Style: 627539_07
Color: Vapor Gray', 17, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (121, N'Fuse', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/525699/01/fnd/PNA/fmt/png/Fuse-Stretch-Men''s-7%22-Shorts', 1000.0000, N'quan puma', N'<script>alert()</script>', 17, 70, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (122, N'Manchester City 24/25 Replica', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod01/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts', 1000.0000, N'quan puma', N'Hit the pitch like Manchester City''s finest in these soccer shorts. They''re made from sweat-wicking material to keep you cool in the tensest moments of the game and are finished with the team''s famous crest on the leg.
Style: 775114_05
Color: PUMA White-Marine Blue', 17, 1, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (123, N'ao', N'https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180', 1000.0000, N'ao', N'ao dep', 12, 1, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[SubImage] ON 

INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (173, 44, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b9a626b41f7c41efa29d3ebc98b113e7_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (174, 44, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8d821c649eb2442f9a5d7cd8153cfbde_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (175, 44, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/9c24bfdd799f4dc58d1e3922e10961c7_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (176, 44, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/88f7d0e319734a8fbfcb865cc97893c5_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (177, 45, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/99ac2fdea36e4714bdbaaf4200bcc5ff_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (178, 45, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/77e1d1d39aa34a9da351af4200bcd349_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (179, 45, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a0f30a04328b4750955aaf4200bcdcac_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (180, 45, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fc13e3955caa4dd2b973af4200bce617_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (181, 46, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b00a682997bd40d3bdfaaed70181d5b6_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (182, 46, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/1093d7bb099b4be68f3baed70181e461_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (183, 46, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f5d5f4f81ec412aa009aed70181ebd1_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (184, 46, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3064bab2d50643ecabffaed70181f508_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (219, 59, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fb1edca9a23e4c99b63f92dabffd1ad2_9366/Harden_Volume_8_Shoes_Orange_IE2694_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (220, 59, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c999a643731944cb9668b5b06031eb85_9366/Harden_Volume_8_Shoes_Orange_IE2694_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (230, 57, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bfff95f0750341bf939daed70141260e_9366/NMD_V3_Shoes_White_GX9468_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (231, 57, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c90c63056a2742b1868aaed70141410c_9366/NMD_V3_Shoes_White_GX9468_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (232, 57, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5b2404812e714e3e9702aed701414d7a_9366/NMD_V3_Shoes_White_GX9468_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (233, 57, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c12c8d2e072949a097f1aed701415b0c_9366/NMD_V3_Shoes_White_GX9468_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (234, 58, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/236d087cb25740908bf5c6deb683a3ba_9366/Predator_League_Firm_Ground_Football_Boots_Black_IG7763_22_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (235, 58, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0fb363db13f144e4ab4f5210c01103da_9366/Predator_League_Firm_Ground_Football_Boots_Black_IG7763_01_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (236, 58, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5631a3d165cb4ee58b806805db0c67e6_9366/Predator_League_Firm_Ground_Football_Boots_Black_IG7763_02_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (237, 58, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/db23d60171f64bda8bbb6f6fa8d9b9e0_9366/Predator_League_Firm_Ground_Football_Boots_Black_IG7763_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (246, 59, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a20d84f2f5e044889bb8eca9f6183149_9366/Harden_Volume_8_Shoes_Orange_IE2694_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (247, 59, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4087d45442e1415caa26938ea432b7ba_9366/Harden_Volume_8_Shoes_Orange_IE2694_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (248, 64, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b810b829e9b742378b88c42047781ef4_9366/Stan_Smith_CS_Shoes_White_IG1296_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (249, 64, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/1f1303d346fd4e8e845a93f172f237fa_9366/Stan_Smith_CS_Shoes_White_IG1296_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (250, 64, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ce7c4a14c05f44eda1f8ec1e66bb6c41_9366/Stan_Smith_CS_Shoes_White_IG1296_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (251, 64, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0fe5cbfa32314b6fb07f05a1ff9b9ad7_9366/Stan_Smith_CS_Shoes_White_IG1296_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (269, 63, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/73a000b08a1d4cbca81b6a1a434f9bee_9366/AE_1_Best_Of_Adi_Basketball_Shoes_White_IF1857_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (270, 63, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7b624b753a624995b29a6de535cdd090_9366/AE_1_Best_Of_Adi_Basketball_Shoes_White_IF1857_012_hover_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (271, 63, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/68741b74c10442b68f074e82df5ea2f6_9366/AE_1_Best_Of_Adi_Basketball_Shoes_White_IF1857_02_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (272, 63, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b351f069d8b44f2b9c1d80be57331004_9366/AE_1_Best_Of_Adi_Basketball_Shoes_White_IF1857_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (273, 62, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3bbecbdf584e40398446a8bf0117cf62_9366/Samba_OG_Shoes_White_B75806_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (274, 62, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8c4158c4c39a4ab09b8ba8c000c96fd0_9366/Samba_OG_Shoes_White_B75806_010_hover_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (275, 62, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ec595635a2994adea094a8bf0117ef1a_9366/Samba_OG_Shoes_White_B75806_02_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (276, 62, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4c70105150234ac4b948a8bf01187e0c_9366/Samba_OG_Shoes_Black_B75807_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (289, 68, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/15efd399b216463e9392af5700c52792_9366/Adifom_Superstar_Shoes_White_HQ8750_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (290, 68, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/9b8ee6de166747e3bad2af5700c53045_9366/Adifom_Superstar_Shoes_White_HQ8750_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (291, 68, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4ebab9221be0451db38faf5700c53844_9366/Adifom_Superstar_Shoes_White_HQ8750_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (292, 68, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6d4b0d88cc414baea3e7af5700c54174_9366/Adifom_Superstar_Shoes_White_HQ8750_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (293, 67, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/cb99a0d8acf548e583b32671ff2f3003_9366/Gazelle_Indoor_Shoes_White_IG1896_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (294, 67, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/98bcb2c4d42a4a17928eb7bf42b89384_9366/Gazelle_Indoor_Shoes_White_IG1896_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (295, 67, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bf28b8ff44484075858a486ad6ba6163_9366/Gazelle_Indoor_Shoes_White_IG1896_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (296, 67, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c0da555134b64f0883d2694d1dbd13a7_9366/Gazelle_Indoor_Shoes_White_IG1896_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (297, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/910be30b9d004bdaaee80d58bcf24d8d_9366/Campus_00s_Shoes_Brown_ID2077_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (298, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/88852f38e8c74682a86e4ddcd2b5dac1_9366/Campus_00s_Shoes_Brown_ID2077_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (299, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/29a262ad1607455f85fa342ea47af061_9366/Campus_00s_Shoes_Brown_ID2077_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (300, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2c1fede01239469ca79c3572e3cf7a81_9366/Campus_00s_Shoes_Brown_ID2077_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (301, 1, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/89b0414dbb05499782be24efffcf29c3_9366/Adifom_Climacool_Shoes_Green_IF3937_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (302, 1, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/aac7d180a6c247ecaf7ed7023253bc03_9366/Adifom_Climacool_Shoes_Green_IF3937_02_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (303, 1, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/81f01e3e86174cd7b555e5f4a9623ee3_9366/Adifom_Climacool_Shoes_Green_IF3937_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (304, 1, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/e7ad8dbaea85424c99bbeee480b730e0_9366/Adifom_Climacool_Shoes_Green_IF3937_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (305, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c05f80341d640ba9c0594c7479455db_9366/D.O.N._Issue_5_Shoes_White_IE7799_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (306, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c747e9bcbccd4452905a8538f0368529_9366/D.O.N._Issue_5_Shoes_White_IE7799_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (307, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/92baafb7c0ec4e2899b73d47690039f1_9366/D.O.N._Issue_5_Shoes_White_IE7799_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (308, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b6e6d6c5c91c42e9a2e953ec17c2d42e_9366/D.O.N._Issue_5_Shoes_White_IE7799_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (309, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b65606c1962f4d88a2f06f14de9c5b35_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (310, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4e4a5fce74f749979c8ac5c93402ecb2_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_012_hover_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (311, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/819175ed749b4afbb264faf4506a032a_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_02_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (312, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/02f9cc8d45134c988249444dbff00d90_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (313, 69, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/50577739-15d9-4141-bbd5-794b36bfbf7e/NIKE+DUNK+LOW+GS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (314, 69, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ef11bca0-da8d-4a01-a6c5-d78dfc5ed289/NIKE+DUNK+LOW+GS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (315, 69, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8e6b8299-c4f8-4e38-9bb7-6493455e3a99/NIKE+DUNK+LOW+GS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (316, 69, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/304fce14-97a9-4899-94e9-f11faeec9d82/NIKE+DUNK+LOW+GS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (317, 70, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/35a5a344-38fa-4eac-9e85-850665f567c8/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (318, 70, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4b7a659b-ead9-4a7c-a349-f94d09aa0e13/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (319, 70, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1a21f2d4-fa87-475a-8197-7b034b4b6618/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (320, 70, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e933d26a-5140-42c9-8203-fc3119feb02b/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (321, 71, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/odhlk8ksqmstmdcjjyn0/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (322, 71, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/kgeaoq1nlsmtqslaklul/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (323, 71, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/gjuudsgitusitpp0ye4e/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (324, 71, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/apvigcvbwytt279ku1jm/W+AF1+SHADOW.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (325, 72, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/332da330-4bb3-42d3-9123-5c7e64789342/NIKE+DUNK+HI+RETRO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (326, 72, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/811b9857-d626-46d0-b2ff-7a8858717fc6/NIKE+DUNK+HI+RETRO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (327, 72, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d3482474-5200-4d92-b556-f24fd2a2c577/NIKE+DUNK+HI+RETRO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (328, 72, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4a789a9d-dc8b-420f-ac4e-4dcc4a232c54/NIKE+DUNK+HI+RETRO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (329, 73, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0ab04620-a75f-4ea5-bce7-3e26a6dec829/custom-dunk-low-unlocked-by-you.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (330, 73, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/96610838-ebc8-4e42-9d4b-acaec7311b1c/custom-dunk-low-unlocked-by-you.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (331, 73, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/464c3c03-9731-4f17-bff0-9424364d2c67/custom-dunk-low-unlocked-by-you.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (332, 73, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d938ab89-a3da-4d7f-8128-7adc67c35c37/custom-dunk-low-unlocked-by-you.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (333, 74, N'https://image.goat.com/transform/v1/attachments/product_template_additional_pictures/images/092/494/732/original/1268737_01.jpg.jpeg?action=crop&width=600')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (334, 74, N'https://image.goat.com/transform/v1/attachments/product_template_additional_pictures/images/092/494/732/original/1268737_01.jpg.jpeg?action=crop&width=600')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (335, 74, N'https://image.goat.com/transform/v1/attachments/product_template_additional_pictures/images/092/494/732/original/1268737_01.jpg.jpeg?action=crop&width=600')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (336, 74, N'https://image.goat.com/transform/v1/attachments/product_template_additional_pictures/images/092/494/732/original/1268737_01.jpg.jpeg?action=crop&width=600')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (337, 75, N'https://sneakerdaily.vn/wp-content/uploads/2022/06/Giay-adidas-Yeezy-Foam-RNNR-Sand-FY4567.jpg.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (338, 75, N'https://sneakerdaily.vn/wp-content/uploads/2022/06/dep-adidas-yeezy-foam-rnnr-sand-fy4567-6.png.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (339, 75, N'https://sneakerdaily.vn/wp-content/uploads/2022/06/dep-adidas-yeezy-foam-rnnr-sand-fy4567-7.png.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (340, 75, N'https://sneakerdaily.vn/wp-content/uploads/2022/06/dep-adidas-yeezy-foam-rnnr-sand-fy4567.png.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (341, 76, N'https://sneakerdaily.vn/wp-content/uploads/2020/12/Giay-nam-Yeezy-Boost-350-V2-Black-Non-Reflective-FU9006.png.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (342, 76, N'https://sneakerdaily.vn/wp-content/uploads/2020/12/yeezy-boost-350-v2-black-non-reflective-fu9006.jpg.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (343, 76, N'https://sneakerdaily.vn/wp-content/uploads/2020/12/Giay-nam-Yeezy-Boost-350-V2-Black-Non-Reflective-FU9006.jpg.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (344, 76, N'https://sneakerdaily.vn/wp-content/uploads/2020/12/Giay-nam-Yeezy-Boost-350-V2-Black-Non-Reflective-FU9006..jpg.webp')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (345, 77, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c005f0ca-249c-4fec-b60e-96f98c8b7c61/JORDAN+TATUM+2+PF.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (346, 77, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/8bad3692-9653-4e1e-a1cd-3233eb1daa38/JORDAN+TATUM+2+PF.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (347, 77, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/fe50ebf3-fa2e-4882-808a-2ea079fc2516/JORDAN+TATUM+2+PF.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (348, 77, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/76e7f69d-ff86-4909-8f62-cbdb871751cb/JORDAN+TATUM+2+PF.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (349, 78, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cbfca82b-128b-4169-80ee-bfe94db3daaf/JORDAN+TATUM+2+PF.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (350, 78, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b704f13b-9137-4f54-a589-a88778f92f53/JORDAN+TATUM+2+PF.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (351, 78, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/461ef00c-e755-42d3-b314-e5f90920b28c/JORDAN+TATUM+2+PF.png')
GO
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (352, 78, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/d7286a69-972d-42f5-ae13-21cb52a94b9f/JORDAN+TATUM+2+PF.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (353, 79, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c50955c9-0891-41b2-afb1-371f64a23218/LEBRON+WITNESS+VIII+EP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (354, 79, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6379b756-95b3-4454-95ec-9211248da62e/LEBRON+WITNESS+VIII+EP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (355, 79, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6b4a2c16-072d-4f13-80c4-3f8f22f9bf53/LEBRON+WITNESS+VIII+EP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (356, 79, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ca2301b0-4b02-46ce-bda5-228cc5910f8f/LEBRON+WITNESS+VIII+EP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (357, 80, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/vans-authentic-classic-black-vn000ee3blk-1.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (358, 80, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/vans-authentic-classic-black-vn000ee3blk-2.png?v=1625925620597')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (359, 80, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/vans-authentic-classic-black-vn000ee3blk-3.png?v=1625925623543')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (360, 80, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/vans-authentic-classic-black-vn000ee3blk-4.png?v=1625925626347')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (361, 81, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-skate-sk8-hi-black-white-vn0a5fccy28-1.jpg?v=1726804493523')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (362, 81, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-skate-sk8-hi-black-white-vn0a5fccy28-2.jpg?v=1726804494453')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (363, 81, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-skate-sk8-hi-black-white-vn0a5fccy28-3.jpg?v=1726804495383')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (364, 81, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-skate-sk8-hi-black-white-vn0a5fccy28-4.jpg?v=1726804496230')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (365, 82, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-sk8-hi-tapered-color-theory-dusty-blue-vn0009qpdsb-1.jpg?v=1726802922103')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (366, 82, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-sk8-hi-tapered-color-theory-dusty-blue-vn0009qpdsb-2.jpg?v=1726802911643')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (367, 82, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-sk8-hi-tapered-color-theory-dusty-blue-vn0009qpdsb-3.jpg?v=1726802911643')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (368, 82, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-sk8-hi-tapered-color-theory-dusty-blue-vn0009qpdsb-4.jpg?v=1726802911643')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (369, 83, N'https://converse.com.br/media/catalog/product/c/o/co03800010_a_107x1_2.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (370, 83, N'https://converse.com.br/media/catalog/product/c/o/co03800010_c_08x1_2.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (371, 83, N'https://converse.com.br/media/catalog/product/c/o/co03800010_d_08x1_2.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (372, 83, N'https://converse.com.br/media/catalog/product/c/o/co03800010_f_08x1_2.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (373, 84, N'https://converse.com.br/media/catalog/product/c/o/co04550001_a_107x1_7.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (374, 84, N'https://converse.com.br/media/catalog/product/c/o/co04550001_b_08x1_7.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (375, 84, N'https://converse.com.br/media/catalog/product/c/o/co04550001_f_08x1_7.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (376, 84, N'https://converse.com.br/media/catalog/product/c/o/co04550001_e_08x1_7.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (377, 85, N'https://converse.com.br/media/catalog/product/a/0/a04582c_a_107x1_11.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (378, 85, N'https://converse.com.br/media/catalog/product/a/0/a04582c_b_08x1_1.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (379, 85, N'https://converse.com.br/media/catalog/product/a/0/a04582c_d_08x1_1.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (380, 85, N'https://converse.com.br/media/catalog/product/a/0/a04582c_f_08x1_1.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (381, 86, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/6a4a20da-4dde-4b88-900e-80ff454f8680/M+J+CHICAGO+JACKET+JT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (382, 86, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/da9ff703-0674-4b57-a306-02f8de9f689f/M+J+CHICAGO+JACKET+JT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (383, 86, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c40a0ee2-5271-4c88-bc51-5148d8aa445a/M+J+CHICAGO+JACKET+JT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (384, 86, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0f5c463a-0a56-41ab-84bb-71dc23c81a6a/M+J+CHICAGO+JACKET+JT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (385, 87, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/edc37952-0f6f-4584-a714-a693450db5b4/AS+U+ACG+TF+TUFF+FLC+PO+HOODIE.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (386, 87, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d063eacd-4796-435b-b4a7-cdde3f3c812a/AS+U+ACG+TF+TUFF+FLC+PO+HOODIE.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (387, 87, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/74f6f48d-e789-4392-90af-b074067839d1/AS+U+ACG+TF+TUFF+FLC+PO+HOODIE.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (388, 87, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/32ea6b26-c8d0-46ed-be80-49d79440758f/AS+U+ACG+TF+TUFF+FLC+PO+HOODIE.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (389, 88, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/e9cb9ce4-4eb4-4708-86e8-d7f22454eb4c/M+J+ZION+GFX+FLC+PO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (390, 88, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0e5f8183-7f7b-488d-92d2-98220bad0b5a/M+J+ZION+GFX+FLC+PO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (391, 88, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/057c9ef2-dc75-4cfe-8875-3fcbf69825d3/M+J+ZION+GFX+FLC+PO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (392, 88, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/6bac97fa-793f-46fb-a5b2-74beb442d8c3/M+J+ZION+GFX+FLC+PO.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (393, 89, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b5aeb40c-011e-4094-9c24-2cf00fc32b1b/AS+M+NK+DFADV+RUN+DIV+SS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (394, 89, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8014a6dc-ac37-4b3a-87ac-6643d572817b/AS+M+NK+DFADV+RUN+DIV+SS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (395, 89, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/23e27cc6-2e15-4f22-b996-7b9a84a5d582/AS+M+NK+DFADV+RUN+DIV+SS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (396, 89, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a5db43d9-2850-4188-9aa8-aa65f0f63e50/AS+M+NK+DFADV+RUN+DIV+SS.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (397, 90, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/bee09d2e-d527-4354-9da2-2e0353181beb/AS++KD+M+NK+DF+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (398, 90, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/451ea444-3498-46f1-b4ee-92b12cf3bc3f/AS++KD+M+NK+DF+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (399, 90, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/de82d0c1-ff23-4a20-b20e-9b3e6ff1aa6f/AS++KD+M+NK+DF+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (400, 90, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0a7644c4-937a-47cc-a367-094f9f4cd95c/AS++KD+M+NK+DF+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (401, 91, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dad9ada9-3812-471b-859e-cc857ae42698/AS+M+NK+TCH+FLC+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (402, 91, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ef16b0ef-2e0f-456d-ba53-2f4c25325f54/AS+M+NK+TCH+FLC+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (403, 91, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/85639ff7-bb87-4ca4-a30f-cdd125cd9d07/AS+M+NK+TCH+FLC+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (404, 91, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7a447262-de81-4529-9b61-b2b3ee0ad575/AS+M+NK+TCH+FLC+SS+TOP.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (405, 92, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0a06ddc2f5b14f2d87e10e3e52ad1023_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_White_JH3706_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (406, 92, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f579d003a1524cb8b48e50cc258731b6_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_White_JH3706_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (407, 92, N'https://assets.adidas.com/images/c_crop,f_auto,fl_lossy,g_north,h_840,q_auto,y_40/h_840/63b4feb837a94e65b56b27e5382af9cc_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_White_JH3706_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (408, 92, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/073d05141d064e26b05a060008d71cfd_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_White_JH3706_25_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (409, 93, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b1f1d284867c4e2089e9d0cde90bbf85_9366/adidas_Basketball_Hoodie_Black_IZ4907_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (410, 93, N'https://assets.adidas.com/images/c_crop,f_auto,fl_lossy,g_north,h_840,q_auto,y_40/h_840/192e75625774403ca6a2674232b30a0c_9366/adidas_Basketball_Hoodie_Black_IZ4907_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (411, 93, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4539a0bead49481ea29bafcbac5ff74f_9366/adidas_Basketball_Hoodie_Black_IZ4907_25_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (412, 93, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ea2d902b7d7a4815b2e9acc8ba4b0c6b_9366/adidas_Basketball_Hoodie_Black_IZ4907_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (413, 94, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5be02bcded1946ada051c82a0be45e42_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Grey_JD7466_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (414, 94, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/33cb5f60081a400f95512d92254ee544_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Grey_JD7466_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (415, 94, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/012782b2d67d4b42b9034e3f10dc1b47_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Grey_JD7466_25_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (416, 94, N'https://assets.adidas.com/images/c_crop,f_auto,fl_lossy,g_north,h_840,q_auto,y_40/h_840/fc475db276094678a09a2dc9285bd9cc_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Grey_JD7466_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (417, 95, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f7ccf84aace245698dcc8d8c95aae3f5_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_Grey_JH3707_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (418, 95, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5d61e4c093274138adeeaf9463a2c895_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_Grey_JH3707_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (419, 95, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5d61e4c093274138adeeaf9463a2c895_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_Grey_JH3707_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (420, 95, N'https://assets.adidas.com/images/c_crop,f_auto,fl_lossy,g_north,h_840,q_auto,y_40/h_840/a1ee2ea638ae4d23af1b7ea526c2b497_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_Grey_JH3707_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (421, 96, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ebe549c2988f4f1ca1905485fba207b7_9366/adidas_Z.N.E._Full-Zip_Hoodie_White_JE7849_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (422, 96, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/20f5b84026e94e539a37abc5441efcdc_9366/adidas_Z.N.E._Full-Zip_Hoodie_White_JE7849_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (423, 96, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/20f5b84026e94e539a37abc5441efcdc_9366/adidas_Z.N.E._Full-Zip_Hoodie_White_JE7849_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (424, 96, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f15bcca737f14318bd600d10024ccfbb_9366/adidas_Z.N.E._Full-Zip_Hoodie_White_JE7849_25_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (425, 97, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/257c5b9989764f90a52ca3ef21156069_9366/Dugout_Short_Sleeve_Hoodie_Blue_IS9769_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (426, 97, N'https://assets.adidas.com/images/c_crop,f_auto,fl_lossy,g_north,h_840,q_auto,y_40/h_840/257c5b9989764f90a52ca3ef21156069_9366/Dugout_Short_Sleeve_Hoodie_Blue_IS9769_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (427, 97, N'https://assets.adidas.com/images/c_crop,f_auto,fl_lossy,g_north,h_840,q_auto,y_40/h_840/257c5b9989764f90a52ca3ef21156069_9366/Dugout_Short_Sleeve_Hoodie_Blue_IS9769_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (428, 97, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0a92a9edfedf43a5ba2b8c4a75c43963_9366/Dugout_Short_Sleeve_Hoodie_Blue_IS9769_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (429, 98, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/aaff563fc60d4bad9a76c003c769d1a2_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Black_IW5653_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (430, 98, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/77d7eff82aec4b4697bffd1f3ccd4cab_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Black_IW5653_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (431, 98, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/dd0d5f1fb8ab43fa86d0cb28303fca93_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Black_IW5653_25_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (432, 98, N'https://assets.adidas.com/images/c_crop,f_auto,fl_lossy,g_north,h_840,q_auto,y_40/h_840/508f9e08d6574509b9d1ef16bf063e62_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Black_IW5653_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (433, 99, N'https://www.stussy.com/cdn/shop/files/1905055_WHIT_1.jpg?v=1728313824&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (434, 99, N'https://www.stussy.com/cdn/shop/files/1905055_WHIT_2.jpg?v=1728313824&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (435, 99, N'https://www.stussy.com/cdn/shop/files/1905055_WHIT_2.jpg?v=1728313824&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (436, 99, N'https://www.stussy.com/cdn/shop/files/1905055_WHIT_2.jpg?v=1728313824&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (437, 100, N'https://www.stussy.com/cdn/shop/files/118565_PURP_3.jpg?v=1729274714&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (438, 100, N'https://www.stussy.com/cdn/shop/files/118565_PURP_4.jpg?v=1729274714&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (439, 100, N'https://www.stussy.com/cdn/shop/files/118565_PURP_5.jpg?v=1729274714&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (440, 100, N'https://www.stussy.com/cdn/shop/files/118565_PURP_6.jpg?v=1729274714&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (441, 101, N'https://www.stussy.com/cdn/shop/files/1905060_BLAC_1.jpg?v=1728313848&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (442, 101, N'https://www.stussy.com/cdn/shop/files/1905060_BLAC_2.jpg?v=1728313848&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (443, 101, N'https://www.stussy.com/cdn/shop/files/1905060_BLAC_2.jpg?v=1728313848&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (444, 101, N'https://www.stussy.com/cdn/shop/files/1905060_BLAC_2.jpg?v=1728313848&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (445, 102, N'https://www.stussy.com/cdn/shop/files/115785_BLUE_3.jpg?v=1728980414&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (446, 102, N'https://www.stussy.com/cdn/shop/files/115785_BLUE_4.jpg?v=1728980414&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (447, 102, N'https://www.stussy.com/cdn/shop/files/115785_BLUE_5.jpg?v=1728980414&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (448, 102, N'https://www.stussy.com/cdn/shop/files/115785_BLUE_6.jpg?v=1728980414&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (449, 103, N'https://www.stussy.com/cdn/shop/files/115790_BLAC_3.jpg?v=1728491202&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (450, 103, N'https://www.stussy.com/cdn/shop/files/115790_BLAC_4.jpg?v=1728491202&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (451, 103, N'https://www.stussy.com/cdn/shop/files/115790_BLAC_8.jpg?v=1728491203&width=1920')
GO
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (452, 103, N'https://www.stussy.com/cdn/shop/files/115790_BLAC_5.jpg?v=1728491202&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (453, 104, N'https://www.stussy.com/cdn/shop/files/1905057_BLAC_1.jpg?v=1728313829&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (454, 104, N'https://www.stussy.com/cdn/shop/files/1905057_BLAC_1.jpg?v=1728313829&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (455, 104, N'https://www.stussy.com/cdn/shop/files/1905057_BLAC_2.jpg?v=1728313829&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (456, 104, N'https://www.stussy.com/cdn/shop/files/1905057_BLAC_2.jpg?v=1728313829&width=1920')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (457, 105, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9f936cde-a784-4652-ae40-9320550de439/AS+M+NK+CLUB+FLOW+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (458, 105, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/db02c3eb-a3dc-4724-931d-979dd8d8c272/AS+M+NK+CLUB+FLOW+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (459, 105, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7b67655c-369e-4cfe-b6fe-59b522766c7e/AS+M+NK+CLUB+FLOW+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (460, 105, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c26c1a63-08f8-4864-92ce-b2fc434f3cb3/AS+M+NK+CLUB+FLOW+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (461, 106, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/bc876e65-a5b1-4d76-aef5-269a8047f7ea/M+J+DF+SPRT+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (462, 106, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/f208f384-8734-47db-ad73-3133df89c4c0/M+J+DF+SPRT+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (463, 106, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/96e42479-a4e8-444f-bc86-be0ba5ff5d3c/M+J+DF+SPRT+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (464, 106, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/9559b3b3-d4f4-4fa9-b75a-d63234be1d01/M+J+DF+SPRT+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (465, 107, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/5c922d4e-b761-4c3c-b2f5-91cd73692c9e/M+J+DF+SPRT+AOP2+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (466, 107, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/a36d82c5-519a-4a9d-8cf9-383f2ba50127/M+J+DF+SPRT+AOP2+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (467, 107, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/5d077998-597f-430f-bd97-b42546e377fe/M+J+DF+SPRT+AOP2+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (468, 107, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/5a7e49e4-9539-4399-b07f-27c135d680c3/M+J+DF+SPRT+AOP2+DMND+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (469, 108, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ab7771d9-d859-43ac-848c-7cacaa120878/AS+M+NK+CLUB+FT+SHORT+APLQ+ARC.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (470, 108, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0dd7bfd6-f44c-41fc-98eb-31abaf908626/AS+M+NK+CLUB+FT+SHORT+APLQ+ARC.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (471, 108, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/bfc20156-d184-4b79-8266-1b9c75d7cf7a/AS+M+NK+CLUB+FT+SHORT+APLQ+ARC.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (472, 108, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3ca13c12-2e9e-42da-bbe5-ac6ab82f9f3e/AS+M+NK+CLUB+FT+SHORT+APLQ+ARC.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (473, 109, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d0b0c2bf-a817-450b-b6c9-7b2907e17f8a/N31+MNK+DF+DNA+SHORT+8IN.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (474, 109, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5c657f6e-7d68-4e0e-aa17-3035e193ac38/N31+MNK+DF+DNA+SHORT+8IN.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (475, 109, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/77ff3ebd-1caa-4d05-be89-0d684f403c81/N31+MNK+DF+DNA+SHORT+8IN.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (476, 109, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/77ff3ebd-1caa-4d05-be89-0d684f403c81/N31+MNK+DF+DNA+SHORT+8IN.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (477, 110, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29e082fc-2fa5-4fd1-a543-2c20c7a61cca/AS+M+NK+DF+FORM+5IN+UL+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (478, 110, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/89c6330b-cb6d-45cb-9335-bcf41fcaada6/AS+M+NK+DF+FORM+5IN+UL+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (479, 110, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/fe700033-2f1a-46d2-b606-a6c9ef8ff5ee/AS+M+NK+DF+FORM+5IN+UL+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (480, 110, N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4e4110f7-dcaa-4743-ade8-e705a799a927/AS+M+NK+DF+FORM+5IN+UL+SHORT.png')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (481, 111, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2f98f51dc01d46e88cdaadd7004c9ecb_9366/Entrada_22_Shorts_Black_H57508_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (482, 111, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2f98f51dc01d46e88cdaadd7004c9ecb_9366/Entrada_22_Shorts_Black_H57508_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (483, 111, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2f98f51dc01d46e88cdaadd7004c9ecb_9366/Entrada_22_Shorts_Black_H57508_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (484, 111, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2f98f51dc01d46e88cdaadd7004c9ecb_9366/Entrada_22_Shorts_Black_H57508_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (485, 112, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a96efa65f63d48b1a369adab0155f95f_9366/Team_Issue_Knit_Shorts_Red_HS7734_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (486, 112, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/682fbc0e22384acb997eadab0155b375_9366/Team_Issue_Knit_Shorts_Red_HS7734_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (487, 112, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/682fbc0e22384acb997eadab0155b375_9366/Team_Issue_Knit_Shorts_Red_HS7734_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (488, 112, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/682fbc0e22384acb997eadab0155b375_9366/Team_Issue_Knit_Shorts_Red_HS7734_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (489, 113, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/431b3805a8da4b8caa8287718491baac_9366/Firebird_Shorts_Black_IU2425_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (490, 113, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/431b3805a8da4b8caa8287718491baac_9366/Firebird_Shorts_Black_IU2425_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (491, 113, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d33acae716894960846e6a07db7cbea0_9366/Firebird_Shorts_Black_IU2425_23_hover_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (492, 113, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/dc168ad3d5ca48888a758cf34b05e395_9366/Firebird_Shorts_Black_IU2425_25_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (493, 114, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/557df5a1ffbc4f04b009af040108aa4b_9366/Stadium_4-Inch_Training_Shorts_White_HG2614_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (494, 114, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/557df5a1ffbc4f04b009af040108aa4b_9366/Stadium_4-Inch_Training_Shorts_White_HG2614_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (495, 114, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ef349a9d32ce49b8b8cfaf040108a6db_9366/Stadium_4-Inch_Training_Shorts_White_HG2614_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (496, 114, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ef349a9d32ce49b8b8cfaf040108a6db_9366/Stadium_4-Inch_Training_Shorts_White_HG2614_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (497, 115, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0db2f3f3460248cd828aaf1500bcf6df_9366/Essentials_Linear_French_Terry_Shorts_Plus_Size_Black_IB8758_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (498, 115, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0db2f3f3460248cd828aaf1500bcf6df_9366/Essentials_Linear_French_Terry_Shorts_Plus_Size_Black_IB8758_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (499, 115, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/247423e458664f2e954e38fd73ed1d9a_9366/Essentials_Linear_French_Terry_Shorts_Plus_Size_Green_JH3676_21_model.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (500, 115, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/dbae1d3c2f904e65b2100c443c83a901_9366/Essentials_Linear_French_Terry_Shorts_Plus_Size_Green_JH3676_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (501, 116, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3faa1608606e4d4390c9ade1017d4310_9366/Team_Issue_Shorts_Grey_HS7725_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (502, 116, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3faa1608606e4d4390c9ade1017d4310_9366/Team_Issue_Shorts_Grey_HS7725_01_laydown.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (503, 116, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/607f70852e3a4a0f8049ade1017d41ac_9366/Team_Issue_Shorts_Grey_HS7725_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (504, 116, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/607f70852e3a4a0f8049ade1017d41ac_9366/Team_Issue_Shorts_Grey_HS7725_02_laydown_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (505, 117, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627785/01/mod01/fnd/PNA/fmt/png/PUMA-x-LAMELO-BALL-1Love-Basketball-Shorts-Men')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (506, 117, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627785/01/mod03/fnd/PNA/fmt/png/PUMA-x-LAMELO-BALL-1Love-Basketball-Shorts-Men')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (507, 117, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627785/01/mod04/fnd/PNA/fmt/png/PUMA-x-LAMELO-BALL-1Love-Basketball-Shorts-Men')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (508, 117, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627785/01/fnd/PNA/fmt/png/PUMA-x-LAMELO-BALL-1Love-Basketball-Shorts-Men')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (509, 118, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627161/01/mod01/fnd/PNA/fmt/png/Media-Day-Classics-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (510, 118, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627161/01/mod02/fnd/PNA/fmt/png/Media-Day-Classics-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (511, 118, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627161/01/mod03/fnd/PNA/fmt/png/Media-Day-Classics-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (512, 118, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627161/01/fnd/PNA/fmt/png/Media-Day-Classics-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (513, 119, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/629215/01/mod01/fnd/PNA/fmt/png/Scoot-All-Jaws-All-Over-Print-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (514, 119, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/629215/01/mod03/fnd/PNA/fmt/png/Scoot-All-Jaws-All-Over-Print-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (515, 119, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/629215/01/mod05/fnd/PNA/fmt/png/Scoot-All-Jaws-All-Over-Print-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (516, 119, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/629215/01/fnd/PNA/fmt/png/Scoot-All-Jaws-All-Over-Print-Men''s-Basketball-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (517, 120, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627539/07/mod01/fnd/PNA/fmt/png/BMW-M-Motorsport-Men''s-Life-PUMATECH-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (518, 120, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627539/07/mod02/fnd/PNA/fmt/png/BMW-M-Motorsport-Men''s-Life-PUMATECH-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (519, 120, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627539/07/mod03/fnd/PNA/fmt/png/BMW-M-Motorsport-Men''s-Life-PUMATECH-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (520, 120, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627539/07/mod04/fnd/PNA/fmt/png/BMW-M-Motorsport-Men''s-Life-PUMATECH-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (525, 122, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod01/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (526, 122, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod02/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (527, 122, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod03/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (528, 122, N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod04/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (529, 123, N'https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (530, 123, N'https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (531, 123, N'https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (532, 123, N'https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180')
SET IDENTITY_INSERT [dbo].[SubImage] OFF
GO
INSERT [dbo].[View] ([viewed]) VALUES (173)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cID])
REFERENCES [dbo].[Category] ([cID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[SubImage]  WITH CHECK ADD  CONSTRAINT [FK_SubImage_Product] FOREIGN KEY([pID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[SubImage] CHECK CONSTRAINT [FK_SubImage_Product]
GO
