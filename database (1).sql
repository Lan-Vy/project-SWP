USE [Project_Group1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/24/2025 12:44:02 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2/24/2025 12:44:02 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/24/2025 12:44:02 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2/24/2025 12:44:02 AM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/24/2025 12:44:02 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2/24/2025 12:44:02 AM ******/
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
/****** Object:  Table [dbo].[SubImage]    Script Date: 2/24/2025 12:44:02 AM ******/
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
/****** Object:  Table [dbo].[View]    Script Date: 2/24/2025 12:44:02 AM ******/
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

INSERT [dbo].[Category] ([cID], [cName]) VALUES (1, N'Basketball')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (8, N'Football
')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (9, N'Volleyball')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (10, N'Badminton')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (11, N'Billiards')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (12, N'Pickleball')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (13, N'Men''s Sportswear
')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (14, N'Women''s Sportswear
')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (15, N'Sports Accessories
')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (16, N'Running Shoes
')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (17, N'Football')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [userId], [productId], [rating], [feedbackContent], [feedbackDate]) VALUES (4, 12, 71, 5, N'qua mac', CAST(N'2024-11-04T14:00:44.450' AS DateTime))
INSERT [dbo].[Feedback] ([Id], [userId], [productId], [rating], [feedbackContent], [feedbackDate]) VALUES (5, 11, 129, 5, N'aloalo', CAST(N'2025-02-23T17:50:31.203' AS DateTime))
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
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2029, CAST(N'2025-02-20' AS Date), 11, N'hn', N'0123456789', N'minh hai', 12000.0000, 3, 2016)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2030, CAST(N'2025-02-23' AS Date), 1, N'hcm', N'123456789', N'Minh Anh', 100.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2031, CAST(N'2025-02-23' AS Date), 1, N'hcm', N'123456789', N'Minh Anh', 100.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2032, CAST(N'2025-02-23' AS Date), 11, N'1234567890908080', N'123456789', N'Minh Anh', 100.0000, 3, 2015)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2020, 64, 1990.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2030, 129, 100.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2031, 129, 100.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2032, 129, 100.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1, N'Jordan 1 Retro High Dark Mocha', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/89b0414dbb05499782be24efffcf29c3_9366/Adifom_Climacool_Shoes_Green_IF3937_01_standard.jpg', 320.0000, N'', N'', 9, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (2, N'Jordan 5 Retro Alternate Bel-Air', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c05f80341d640ba9c0594c7479455db_9366/D.O.N._Issue_5_Shoes_White_IE7799_01_standard.jpg', 630.0000, N'', N'', 9, 19, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (3, N'Jordan 4 Retro SE 95 Neon', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b65606c1962f4d88a2f06f14de9c5b35_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_01_standard.jpg', 455.0000, N'', N'', 9, 13, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (25, N'Adidas Yeezy Boost 350 V2 Black Red', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/910be30b9d004bdaaee80d58bcf24d8d_9366/Campus_00s_Shoes_Brown_ID2077_01_standard.jpg', 200.0000, N'', N'', 8, 14, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (44, N'Vans Sk8-Hi Re-Issue Flags', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b9a626b41f7c41efa29d3ebc98b113e7_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_01_standard.jpg', 60.0000, N'', N'', 10, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (45, N'Vans Authentic Comme des Garcons White', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/99ac2fdea36e4714bdbaaf4200bcc5ff_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_01_standard.jpg', 220.0000, N'', N'', 10, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (46, N'Vans Style 36 C2H4 50/50 Enlighten Trailblazer', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b00a682997bd40d3bdfaaed70181d5b6_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_01_standard.jpg', 360.0000, N'', N'', 10, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (57, N'Converse Ox Archival Flame Print', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bfff95f0750341bf939daed70141260e_9366/NMD_V3_Shoes_White_GX9468_01_standard.jpg', 66.0000, N'', N'', 11, 10, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (58, N'Converse Thunderbolt Ox Vince Staples', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/236d087cb25740908bf5c6deb683a3ba_9366/Predator_League_Firm_Ground_Football_Boots_Black_IG7763_22_model.jpg', 68.0000, N'', N'', 11, 10, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (59, N'Converse Hi Miley Cyrus White Black Stars (W)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fb1edca9a23e4c99b63f92dabffd1ad2_9366/Harden_Volume_8_Shoes_Orange_IE2694_01_standard.jpg', 45.0000, N'', N'', 11, 10, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (62, N'Nike Air Force 1 Low White ''07', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3bbecbdf584e40398446a8bf0117cf62_9366/Samba_OG_Shoes_White_B75806_01_standard.jpg', 2700.0000, N'', N'', 1, 10, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (63, N'Nike Air Max 97 Triple White Wolf Grey', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/73a000b08a1d4cbca81b6a1a434f9bee_9366/AE_1_Best_Of_Adi_Basketball_Shoes_White_IF1857_01_standard.jpg', 2500.0000, N'', N'', 1, 7, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (64, N'Nike Air Force 1 Low Off-White', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b810b829e9b742378b88c42047781ef4_9366/Stan_Smith_CS_Shoes_White_IG1296_01_standard.jpg', 1990.0000, N'', N'', 1, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (67, N'Adidas XPLR White Black', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/cb99a0d8acf548e583b32671ff2f3003_9366/Gazelle_Indoor_Shoes_White_IG1896_01_standard.jpg', 2830.0000, N'', N'', 8, 10, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (68, N'Adidas Prophere Triple White (W)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/15efd399b216463e9392af5700c52792_9366/Adifom_Superstar_Shoes_White_HQ8750_01_standard.jpg', 1540.0000, N'sdf', N'ds', 8, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (69, N'Nike Dunk Low', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/50577739-15d9-4141-bbd5-794b36bfbf7e/NIKE+DUNK+LOW+GS.png', 2000.0000, N'nike', N'The Nike Dunk Low is an easy score for your wardrobe. Thoughtfully made from durable synthetic leather for classic comfort and style, these kicks honour a hardwood icon with a design you can easily rock from PE to the park and everywhere in between.

', 1, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (70, N'Nike Air Force 1 Shadow', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/35a5a344-38fa-4eac-9e85-850665f567c8/W+AF1+SHADOW.png', 3000.0000, N'nike', N'Everything you love about the AF-1—but doubled! The Air Force 1 Shadow puts a playful twist on a hoops icon to highlight the best of AF-1 DNA. With 2 eyestays, 2 mudguards, 2 backtabs and 2 Swoosh logos, you get a layered look with double the branding.

', 1, 2, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (71, N'Nike Air Force 1 Shadow', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/odhlk8ksqmstmdcjjyn0/W+AF1+SHADOW.png', 1000.0000, N'nike', N'The Nike Air Force 1 Shadow puts a playful twist on a classic b-ball design.Using a layered approach, doubling the branding and exaggerating the midsole, it highlights AF-1 DNA with a bold, new look.', 1, 8, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (72, N'Nike Dunk High Retro', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5e7687f1-c13e-4bac-8ffa-a6f863ae9157/NIKE+DUNK+HI+RETRO.png', 3500.0000, N'nike', N'Created for the hardwood but taken to the streets, the ''80s basketball icon returns with perfectly sheened overlays and original university colours. With its classic hoops design, the Nike Dunk High Retro channels ''80s vintage back onto the streets while its padded, high-top collar adds an old-school look rooted in comfort.', 1, 3, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (73, N'Nike Dunk Low Unlocked By You', N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0ab04620-a75f-4ea5-bce7-3e26a6dec829/custom-dunk-low-unlocked-by-you.png', 5000.0000, N'nike', N'Cheetah and tiger and croc—oh my! It''s time to design the Dunk of your dreams. The left and right shoes can be customised independently (excluding character personalisation), so let your imagination go wild. Velvet cheetah and tiger prints in a ''90s-inspired colour palette mix with a textural croc suede for the ultimate maximalist look. Don''t forget your shoelery for the finishing touch.', 1, 1, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (74, N'Yeezy Boost 700 ''Wave Runner'' 2023', N'https://image.goat.com/transform/v1/attachments/product_template_additional_pictures/images/092/494/732/original/1268737_01.jpg.jpeg?action=crop&width=600', 10000.0000, N'adidas', N'The 2023 edition of the Yeezy Boost 700 brings back the original ''Wave Runner'' colorway, first released in 2017. The upper utilizes mixed materials, including leather, mesh, suede and 3M, while the sculpted midsole houses Boost for lightweight cushioning. The shoe is mostly grey and black, save for a splash of blue and teal on the forefoot, two orange hits on the midsole and yellow laces.', 8, 3, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (75, N'Giày adidas Yeezy Foam RNNR ‘Sand’ FY4567', N'https://sneakerdaily.vn/wp-content/uploads/2022/06/Giay-adidas-Yeezy-Foam-RNNR-Sand-FY4567.jpg.webp', 8000.0000, N'adidas', N'Thông tin phát hành Dép adidas Yeezy Foam RNNR ‘Sand’
Thời gian ra mắt :  26/03/2021

Thương hiệu: adidas

Thiết kế: Yeezy Foam

Xuất xứ: Đức

Mã sản phẩm: FY4567', 8, 8, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (76, N'Giày nam Yeezy Boost 350 V2 Black Non-Reflective FU9006', N'https://sneakerdaily.vn/wp-content/uploads/2020/12/Giay-nam-Yeezy-Boost-350-V2-Black-Non-Reflective-FU9006.png.webp', 20000.0000, N'adidas', N'Thông tin phát hành Yeezy Boost 350 V2 Black Non-Reflective
Ngày ra mắt: Ngày 17 tháng 2 năm 2019

Thương hiệu: adidas

Thiết kế: Yeezy 350

Mã sản phẩm: FU9006

Xuất xứ: Đức', 8, 1, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (77, N'Tatum 2 ''Vortex'' PF', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c005f0ca-249c-4fec-b60e-96f98c8b7c61/JORDAN+TATUM+2+PF.png', 2000.0000, N'jordan', N'Bright colours and big energy come together in the Tatum 2 ''Vortex''. The lightweight, flexible design was created with energy return in mind and this colourway is all about how Jayson helps energise his team. When you''re wearing them on the court, your opponents won''t be able to ignore all the moves you make—but that doesn''t mean they can stop you from scoring.', 9, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (78, N'Tatum 2 PF ''Lemonade''', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cbfca82b-128b-4169-80ee-bfe94db3daaf/JORDAN+TATUM+2+PF.png', 2000.0000, N'jordan', N'On those days when the sun just won''t let up and your brow''s wet with sweat, what''s more refreshing than a glass of ice-cold lemonade? Nothing! Capture those summertime vibes with kicks that put a classic twist on a fan favourite. Bright, season-right colours will make you get your sunglasses out, and condensation drops on the tongue are paired with a lemon patch on the heel to clinch the theme and satisfy your thirst.', 9, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (79, N'LeBron Witness 8 EP', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c50955c9-0891-41b2-afb1-371f64a23218/LEBRON+WITNESS+VIII+EP.png', 1700.0000, N'jordan', N'When you step on the floor, what kind of performance do you want to put on? Stop the show in these LeBron Witness 8s and let them know there are no limits to your flair and full-scale skills. This sleek and boldly sculpted shoe offers stability when exploding and soft landings when you come back to the ground, allowing kingpins like you and LeBron to bound, brake and bolt from baseline to baseline. With its extra-durable rubber outsole, this version gives you traction for outdoor courts.', 9, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (80, N'Vans AUTHENTIC CLASSIC BLACK/WHITE', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/vans-authentic-classic-black-vn000ee3blk-1.png', 1500.0000, N'vans', N'Khi thế giới ngày càng phát triển hơn về mọi mặt, thời trang cũng vì thế mà không ngừng tiến bước về phía trước. Nhưng! Tất cả những cái mới đều được xây dựng dựa trên một thứ gọi là NỀN TẢNG. Và dĩ nhiên, VANS được cộng đồng thể thao biết đến như một thương hiệu thời trang chuyên về giày dành cho các bộ môn nghệ thuật đường phố, nổi bật là trượt ván. Với chiều dài hoạt động chuyên môn hơn 50 năm trong ngành thời trang may mặc, thương hiệu được sáng lập bởi một nghệ nhân giày - ông Paul Van Doren vào năm 1966. VANS được đặt trụ sở đầu tiên tại Anaheim, California, Mỹ và hoạt động cho đến ngày nay. VANS AUTHENTIC là một trong những sản phẩm xung phong đầu tiên, mở đầu cho một con đường tiếp nối đam mê của một thương hiệu giày vươn tầm thế giới. Và khi mà cái cũng cùng cái mới giao thoa kết hợp cùng với sự tinh tế và sự cố gắng không ngừng phá bỏ giới hạn của nhà OFF THE WALL, một tinh hoa đã của làng Sneaker đã ra đời được ra mắt sớm nhất từ năm 1966 với tên gọi VANS #44, được trang bị đế cao su độ bám tốt cho những môn thể thao mạo hiểm như trượt ván, BMX v.v..., upper vải canvas cao cấp, phong cách cổ điển hợp với cả nam lẫn nữ.', 10, 9, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (81, N'Vans SKATE SK8-HI BLACK/WHITE', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-skate-sk8-hi-black-white-vn0a5fccy28-1.jpg?v=1726804493523', 2000.0000, N'vans', N'Dòng sản phẩm:	Sk8-hi
Mã SKU:	VN0A5FCCY28
Chất liệu:	Suede, Canvas
Màu sắc:	Black/White
Giới tính:	Unisex', 10, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (82, N'Vans SK8-HI TAPERED COLOR THEORY DUSTY BLUE', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/giay-vans-sk8-hi-tapered-color-theory-dusty-blue-vn0009qpdsb-1.jpg?v=1726802922103', 1200.0000, N'Vans', N'Dòng sản phẩm:	Sk8-hi
Mã SKU:	VN0009QPDSB
Chất liệu:	Suede, Canvas
Màu sắc:	Color Theory Dusty Blue
Giới tính:	Unisex', 10, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (83, N'Run Star Hike Seasonal Colors Bege', N'https://converse.com.br/media/catalog/product/c/o/co03800010_a_107x1_2.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:', 2030.0000, N'converse', N'Eleve o seu guarda-roupa com um par novo de plataformas. Uma elevação leve e sola de borracha tratorada dão um toque inesperado aos seus Chucks do dia a dia. Detalhes como a estrutura de lona, biqueira de borracha e o patch do tornozelo Chuck Taylor permanecem fiéis ao original, enquanto uma plataforma moldada, sola bicolor e salto arredondado emitem uma vibração futurista.', 11, 7, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (84, N'Run Star Hike Vintage Remastered Azul', N'https://converse.com.br/media/catalog/product/c/o/co04550001_a_107x1_7.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:', 2500.0000, N'converse', N'O Run Star Hike retorna com um estilo ousado e trabalhado. Projetado para conforto e elevação premium sem sacrificar o estilo, um solado tratorado robusto e uma palmilha mantêm você leve nos pés. Detalhes contrastantes destacam elementos de design de Chuck Taylor, enquanto detalhes contrastantes te ajudam a se diferenciar da multidão para que nada possa te atrasar.', 11, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (85, N'Chuck 70 At-cx Monochrome Preto', N'https://converse.com.br/media/catalog/product/a/0/a04582c_a_107x1_11.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:', 3000.0000, N'converse', N'Nesta estação, o Chuck 70 AT-CX mantém a simplicidade. As cores podem estar mais discretas, mas o estilo aventureiro é mais ousado do que nunca. Com conforto CX e estrutura pronta para atividades como caminhadas e trilhas com inspiração retrô, o Chuck 70 AT-CX foi criado para você que tem a mente exploradora e sempre curiosa.
', 11, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (86, N'Tatum Chicago', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/6a4a20da-4dde-4b88-900e-80ff454f8680/M+J+CHICAGO+JACKET+JT.png', 3000.0000, N'ao nike', N'Jayson Tatum has made a name for himself as one of the smoothest players in the game. So, it''s only fitting that his signature collection is just as smooth. Crafted from durable canvas, this workwear-inspired jacket features an all-over wash for that perfectly worn-in look.

', 12, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (87, N'Nike ACG Therma-FIT', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/edc37952-0f6f-4584-a714-a693450db5b4/AS+U+ACG+TF+TUFF+FLC+PO+HOODIE.png', 2000.0000, N'ao nike', N'After walking through the glacial wonders of Iceland, our design team was inspired to make a fleece-lined hoodie to help keep you warm and repel water for cool hikes and wintry walks. Plus, we made it with at least 75% sustainable materials, using a blend of organic cotton and recycled polyester fibres.', 12, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (88, N'Zion', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/e9cb9ce4-4eb4-4708-86e8-d7f22454eb4c/M+J+ZION+GFX+FLC+PO.png', 3000.0000, N'ao nike', N'Bring the heat. This relaxed hoodie is made from soft fleece that''s smooth on the outside and plush on the inside, so you know you''ll be staying cosy. And those graphics? Absolute fire.', 12, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (89, N'Nike Running Division', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b5aeb40c-011e-4094-9c24-2cf00fc32b1b/AS+M+NK+DFADV+RUN+DIV+SS.png', 1800.0000, N'ao nike', N'Day or night, rain or shine, Nike Running Division offers the features you need to navigate the concrete, cars and crossings of the paved landscape. This lightweight, sweat-wicking top features a perforated graphic on the back to help vent sweat and keep you feeling fresh with every mile. The butterfly graphic is inspired by the transformation we go through in exercise and life.', 12, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (90, N'Kevin Durant', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/bee09d2e-d527-4354-9da2-2e0353181beb/AS++KD+M+NK+DF+SS+TOP.png', 2000.0000, N'ao nike', N'From his picture-perfect jumper to his savvy business mind, Kevin Durant is a master of his craft on and off the court. Our KD signature apparel collection celebrates the next generation of do-it-all athletes with pieces you can wear anywhere. This relaxed-fit button-up top is breathable and helps keep the sweat away while you work on your game.', 12, 8, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (91, N'Nike Sportswear Tech Fleece Re-Imagined', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dad9ada9-3812-471b-859e-cc857ae42698/AS+M+NK+TCH+FLC+SS+TOP.png', 2000.0000, N'ao nike', N'This oversized short-sleeve top is everything you love about our smooth, comfy Tech Fleece in a spacious, inspired design. Exaggerated proportions, like extra-wide and long sleeves, a mock-neck collar and a loose drape through the body, make a statement look. Our premium, smooth-on-both-sides fleece feels warmer and softer than ever while keeping the same lightweight build you love. Wear it with our Tech Fleece Shorts for a look that''s all about clean lines and soft comfort.', 12, 8, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (92, N'Essentials Big Logo Regular Fleece Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0a06ddc2f5b14f2d87e10e3e52ad1023_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_White_JH3706_21_model.jpg', 1000.0000, N'ao adidas', N'A cozy hoodie that''s easy to throw on anytime.
No hoodie collection feels complete without this classic adidas number. Made from a cotton-blend fleece, it''s weighty and warm. Tighten up the hood for a bracing morning walk. Cocoon your phone inside the pouch pocket as you lounge around the house.
', 13, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (93, N'adidas Basketball Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b1f1d284867c4e2089e9d0cde90bbf85_9366/adidas_Basketball_Hoodie_Black_IZ4907_21_model.jpg', 2000.0000, N'ao adidas', N'A hoodie built with versatility in mind.
The next chapter of adidas Basketball is an exploration in form, function and color. A curated collection, built to fit the needs of the modern athlete. This fleece hoodie features ribbing on the cuffs and hem. It''s made of a blend of cotton and polyester fabric.Our cotton products support more sustainable cotton farming.', 13, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (94, N'adidas Basketball Spacer Hoodie (Gender Neutral)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5be02bcded1946ada051c82a0be45e42_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Grey_JD7466_21_model.jpg', 2000.0000, N'ao adidas', N'A hooded sweatshirt made for comfort and style on and off the court.
Get in the zone before the game. This adidas basketball hooded sweatshirt keeps you comfortable and focused. Made for easy movement on and off the court, its cotton and polyester doubleknit fabric has added stretch so you can move free and easy in every direction. Pull up the hood to block out distractions and get your mind in the game. This sweatshirt was made using UNITEFIT — an all-gender fit system that was created with a spectrum of sizes, genders and forms in mind.', 13, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (95, N'Essentials Big Logo Regular Fleece Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f7ccf84aace245698dcc8d8c95aae3f5_9366/Essentials_Big_Logo_Regular_Fleece_Hoodie_Grey_JH3707_21_model.jpg', 1000.0000, N'ao adidas', N'A cozy hoodie that''s easy to throw on anytime.
No hoodie collection feels complete without this classic adidas number. Made from a cotton-blend fleece, it''s weighty and warm. Tighten up the hood for a bracing morning walk. Cocoon your phone inside the pouch pocket as you lounge around the house.

We partner with Better Cotton to improve cotton farming globally. Better Cotton makes global cotton production better for the people who produce it, better for the environment it grows in, and better for the sector''s future.

Better Cotton is sourced via a chain-of-custody model called mass balance. This means that Better Cotton is not physically traceable to end products. However, Better Cotton Farmers benefit from the demand for Better Cotton in equivalent volumes to those we "source."

Find out more here:bettercotton.org/learnmore', 13, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (96, N'adidas Z.N.E. Full-Zip Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ebe549c2988f4f1ca1905485fba207b7_9366/adidas_Z.N.E._Full-Zip_Hoodie_White_JE7849_21_model.jpg', 1000.0000, N'ao adidas', N'A sporty hoodie made in part with a blend of recycled and renewable materials.
This adidas hoodie celebrates the community we find through sport. The soft three-layer adidas PRIMEKNIT fabric lends lightweight warmth and a soft feel, while the roomy hood adds extra coverage. Matte rubber-print graphics represent the lines that bring us together on the field of play. Zip it all the way up to block the breeze on cool days, or leave it open to show off your favorite team shirt beneath. When the game is about to start, stash your small essentials in the hidden zip pocket inside the kangaroo pocket and head out.

By choosing recycled, we are able to reuse materials that have already been created, which helps to reduce waste. Renewable materials choices will help us to remove our reliance on finite resources. Our products made with a blend of recycled and renewable materials feature at least 70% total of these materials.', 13, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (97, N'Dugout Short Sleeve Hoodie', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/257c5b9989764f90a52ca3ef21156069_9366/Dugout_Short_Sleeve_Hoodie_Blue_IS9769_01_laydown.jpg', 1000.0000, N'ao adidas', N'A short sleeve hoodie made in part with a blend of recycled and renewable materials.
Whether you''re heading to the outfield to shag flies or working on your swing in the batting cage, this short sleeve adidas baseball hoodie delivers comfort that lasts. Premium doubleknit fabric provides softness while the loose fit gives you a full range of motion. A classic kangaroo pocket can keep your hands warm between reps. This sweatshirt was made using UNITEFIT — an all-gender fit system that was created with a spectrum of sizes, genders and forms in mind.

By choosing recycled, we are able to reuse materials that have already been created, which helps to reduce waste. Renewable materials choices will help us to remove our reliance on finite resources. Our products made with a blend of recycled and renewable materials feature at least 70% total of these materials.', 13, 10, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (98, N'adidas Basketball Spacer Hoodie (Gender Neutral)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/aaff563fc60d4bad9a76c003c769d1a2_9366/adidas_Basketball_Spacer_Hoodie_Gender_Neutral_Black_IW5653_21_model.jpg', 2000.0000, N'ao adidas', N'A hooded sweatshirt made for comfort and style on and off the court.
Get in the zone before the game. This adidas basketball hooded sweatshirt keeps you comfortable and focused. Made for easy movement on and off the court, its cotton and polyester doubleknit fabric has added stretch so you can move free and easy in every direction. Pull up the hood to block out distractions and get your mind in the game. This sweatshirt was made using UNITEFIT — an all-gender fit system that was created with a spectrum of sizes, genders and forms in mind.', 13, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (99, N'RELAX TEE', N'https://www.stussy.com/cdn/shop/files/1905055_WHIT_1.jpg?v=1728313824&width=1920', 3000.0000, N'stussy', N'Oversized tee in midweight 6.5oz cotton jersey. Features screenprinted graphics.

- Shortsleeve
- Ribbed collar
- Runs large
- Unisex
- Material: 100% cotton
- Imported', 14, 2, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (100, N'FADED GRAPHIC ZIP HOODIE', N'https://www.stussy.com/cdn/shop/files/118565_PURP_3.jpg?v=1729274714&width=1920', 1000.0000, N'stussy', N'Relaxed fit hooded sweatshirt in a heavy 15.8oz cotton blend fleece. Stüssy logo screenprinted across the front.

- Round drawcord in hood
- #5 YKK metal zip closure
- Ribbed cuffs and hem
- Patch pocket
- Relaxed fit
- Unisex
- Material: 66% cotton / 34% polyester
- Imported', 14, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (101, N'BEAT SOUNDS TEE PIGMENT DYED', N'https://www.stussy.com/cdn/shop/files/1905060_BLAC_1.jpg?v=1728313848&width=1920', 2000.0000, N'stussy', N'Oversized pigment dyed tee in midweight 6.5oz cotton jersey. Features screenprinted graphics.

- Longsleeve
- Ribbed collar
- Runs large
- Unisex
- Material: 100% cotton
- Imported

*This garment has been individually dyed, producing a one-of-a-kind result. Color may fade or bleed after wash.', 14, 4, 1)
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
- Imported', 14, 4, 1)
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
- Imported', 14, 4, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (104, N'CODES TEE', N'https://www.stussy.com/cdn/shop/files/1905057_BLAC_1.jpg?v=1728313829&width=1920', 2000.0000, N'stussy', N'Oversized tee in midweight 6.5oz cotton jersey. Features screenprinted graphics with a gloss finish.

- Shortsleeve
- Ribbed collar
- Runs large
- Unisex
- Material: 100% cotton
- Imported', 14, 3, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (105, N'Nike Club', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9f936cde-a784-4652-ae40-9320550de439/AS+M+NK+CLUB+FLOW+SHORT.png', 2000.0000, N'quan nike', N'Sporty and versatile, these woven shorts are made for easy-going daily comfort. The fit is designed to fall above the knee and feel relaxed through the seat and thighs to keep them from feeling restrictive, especially in warmer weather. Mesh lining helps you stay cool and comfy around town. Pair them up with a tee and your favourite Nike sneakers for a look that gets you out there looking and feeling great.


Colour Shown: Black/White
Style: FN3308-010
Country/Region of Origin: China, Philippines, Vietnam', 15, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (106, N'Jordan Dri-FIT Sport', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/bc876e65-a5b1-4d76-aef5-269a8047f7ea/M+J+DF+SPRT+DMND+SHORT.png', 2000.0000, N'quan nike', N'You ready to ball? Made from light, breathable mesh with sweat-wicking technology, these shorts set you up with versatile wearability for your whole day, on or off the court.


Colour Shown: Gym Red/Black/Gym Red/Gym Red
Style: DX1487-687
Country/Region of Origin: China, Cambodia, Thailand, Vietnam
', 15, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (107, N'Jordan Sport', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/5c922d4e-b761-4c3c-b2f5-91cd73692c9e/M+J+DF+SPRT+AOP2+DMND+SHORT.png', 1000.0000, N'quan nike', N'Your wardrobe must-have is back. Ready to ball and down to chill, our Diamond shorts pair lightweight mesh with sweat-wicking technology to help you stay cool and comfortable. Designed to fall above the knee, they have a classic fit that lets you move freely on and off the court.


Colour Shown: Black/Black
Style: FV8616-010
Country/Region of Origin: Thailand', 15, 3, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (108, N'Nike Sportswear Club', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ab7771d9-d859-43ac-848c-7cacaa120878/AS+M+NK+CLUB+FT+SHORT+APLQ+ARC.png', 1000.0000, N'quan nike', N'Made with a roomy fit through the seat and thighs, these fleece shorts give you the familiar feel you love, with a little extra space to lounge. The satin "NIKE" lettering is stitched down for a varsity-inspired finish. For a comfortable, uniform look, pull them on with the matching hoodie and your favourite Nike sneakers.


Colour Shown: Midnight Navy/White
Style: FQ4093-410
Country/Region of Origin: Pakistan', 15, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (109, N'Team 31 DNA', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d0b0c2bf-a817-450b-b6c9-7b2907e17f8a/N31+MNK+DF+DNA+SHORT+8IN.png', 1000.0000, N'quan nike', N'Show your love for the league in these Team 31 DNA shorts. They''re made from lightweight, yet durable material that wicks sweat to help keep you feeling dry and focused.


Colour Shown: Neutral Olive/Hyper Crimson
Style: FQ3690-276
Country/Region of Origin: Thailand', 15, 3, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (110, N'Nike Form', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29e082fc-2fa5-4fd1-a543-2c20c7a61cca/AS+M+NK+DF+FORM+5IN+UL+SHORT.png', 1000.0000, N'quan nike', N'Designed for running, training and yoga, the versatile Form shorts are built to handle those days when you need to shake up your exercise routine. With a 13cm (approx.) inseam and smooth, sweat-wicking fabric, these shorts are designed to keep up with your moves—from PR deadlifts to hot yoga classes.


Colour Shown: Ashen Slate/Black
Style: FN4348-493
Country/Region of Origin: Vietnam', 15, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (111, N'Entrada 22 Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2f98f51dc01d46e88cdaadd7004c9ecb_9366/Entrada_22_Shorts_Black_H57508_01_laydown.jpg', 100.0000, N'quan adidas', N'Moisture-wicking soccer shorts made in part with recycled materials.
Wherever your day takes you, you''re set in these adidas soccer Entrada 22 Shorts. They have a clean, classic design and AEROREADY to keep you dry and fresh. The drawcord-adjustable elastic waist ensures a snug fit.

Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 16, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (112, N'Team Issue Knit Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a96efa65f63d48b1a369adab0155f95f_9366/Team_Issue_Knit_Shorts_Red_HS7734_01_laydown.jpg', 100.0000, N'quan adidas', N'Loose-fit knit shorts with a notched hem, made with recycled materials.
When leg day''s a scorcher in and out of the gym, the mesh inserts on these adidas shorts add a kick of cooling air, so you stay pumping with power. When you finally hit your stride and the sweat starts to pour, AEROREADY manages moisture, so you stay dry and finish strong.

Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 16, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (113, N'Firebird Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/431b3805a8da4b8caa8287718491baac_9366/Firebird_Shorts_Black_IU2425_21_model.jpg', 100.0000, N'quan adidas', N'These relaxed shorts are made in part with recycled materials.
Express your active spirit in these lightweight adidas shorts. Inspired by the iconic Firebird track suit, they''re built with zip pockets and a loose silhouette for freedom of movement. The soft tricot material keeps you comfortable whether you''re cozying up at home or going out for a spin.This product is made with at least 70% recycled materials. By reusing materials that have already been created, we help to reduce waste and our reliance on finite resources and reduce the footprint of the products we make.', 16, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (114, N'Stadium 4-Inch Training Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/557df5a1ffbc4f04b009af040108aa4b_9366/Stadium_4-Inch_Training_Shorts_White_HG2614_01_laydown.jpg', 1000.0000, N'quan adidas', N'Lightweight shorts made in part with recycled materials.
Weights rack to running track, these adidas shorts let your legs breathe. Light and stretchy, with AEROREADY to wick away moisture, they keep you dry through all types of workouts. Adjust the drawcord waistband for a stay-put fit as you train. Pockets add a practical touch.

Made with a series of recycled materials, and at least 70% recycled content, this product represents just one of our solutions to help end plastic waste.', 16, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (115, N'Essentials Linear French Terry Shorts (Plus Size)', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/0db2f3f3460248cd828aaf1500bcf6df_9366/Essentials_Linear_French_Terry_Shorts_Plus_Size_Black_IB8758_01_laydown.jpg', 1000.0000, N'quan adidas', N'Lightweight adidas shorts for laid-back weekends.
These adidas shorts are comfortable enough to live in. Made from cotton French terry fabric, they have a super-soft feel. With slits at the sides, they sit close against your legs while still allowing for plenty of movement.

Our cotton products support more sustainable cotton farming.', 16, 7, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (116, N'Team Issue Shorts', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3faa1608606e4d4390c9ade1017d4310_9366/Team_Issue_Shorts_Grey_HS7725_01_laydown.jpg', 1000.0000, N'quan adidas', N'Loose-fit shorts with airy mesh inserts, made with recycled materials.
With pockets on the sides and another on the back, these adidas shorts make it easy to get out the door before distractions put an end to your impromptu workout plan. AEROREADY keeps you dry while you decide between planks at the park or a run by the river. Can''t make up your mind? Do both.

Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.', 16, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (117, N'PUMA x LAMELO BALL 1Love', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627785/01/mod01/fnd/PNA/fmt/png/PUMA-x-LAMELO-BALL-1Love-Basketball-Shorts-Men', 1000.0000, N'quan puma', N'Description
To be Melo is to be yourself. This 1Love collection includes basketball and streetwear pieces transformed with bold colors and gradients. Intergalactic vibes and Melo’s NOT FROM HERE graphics round off this collection by LaMelo Ball. 
Made with 100% recycled material excluding trims & decorations
Relaxed fit
245 gsm
Zip pockets
Above knee length
PUMA branding details
Style: 627785_01
Color: Pink Alert', 17, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (118, N'Media Day', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627161/01/mod01/fnd/PNA/fmt/png/Media-Day-Classics-Men''s-Basketball-Shorts', 1000.0000, N'quan puma', N'Show you mean business on the basketball court in these Media Day Basketball shorts. They have a relaxed fit and PUMA Hoops jaws graphics that will strike fear into any opponent.

dryCELL: Performance technology designed to wick moisture from the body and keep you free of sweat during exercise
Made with 100% recycled material excluding trims & decorations.
Relaxed fit
140 gsm, mesh material
Mid-rise
Above-knee length
PUMA branding details
Style: 627161_01
Color: PUMA Black', 17, 10, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (119, N'Scoot All Jaws', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/629215/01/mod01/fnd/PNA/fmt/png/Scoot-All-Jaws-All-Over-Print-Men''s-Basketball-Shorts', 1000.0000, N'quan puma', N'Game-ready shorts for hardwood heroes. Scoot Henderson branding and a relaxed fit let you dominate without distraction. Knitted for breathability so you''re fresh for the 4th quarter. Take your game to the next level in PUMA style.
Style: 629215_01
Color: PUMA Black-AOP', 17, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (120, N'BMW M Motorsport Life', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627539/07/mod01/fnd/PNA/fmt/png/BMW-M-Motorsport-Men''s-Life-PUMATECH-Shorts', 1000.0000, N'quan puma', N'In a world of motorsport and sportswear, where performance is paramount, the BMW M Motorsport LIFE PACK emerges as your ultimate companion. These regular fit shorts feature our dryCELL tech to wick moisture and keep you feeling at your best.

dryCELL: Performance technology designed to wick moisture from the body and keep you free of sweat during exercise
Made with at least 70% recycled materials
Regular fit
225 gsm, dobby
Mid-rise
BMW M Motorsport branding details
PUMA branding details
Style: 627539_07
Color: Vapor Gray', 17, 6, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (121, N'Fuse', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/525699/01/fnd/PNA/fmt/png/Fuse-Stretch-Men''s-7%22-Shorts', 1000.0000, N'quan puma', N'<script>alert()</script>', 17, 70, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (122, N'Manchester City 24/25 Replica', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod01/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts', 1000.0000, N'quan puma', N'Hit the pitch like Manchester City''s finest in these soccer shorts. They''re made from sweat-wicking material to keep you cool in the tensest moments of the game and are finished with the team''s famous crest on the leg.
Style: 775114_05
Color: PUMA White-Marine Blue', 17, 1, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (123, N'ao', N'https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180', 1000.0000, N'ao', N'ao dep', 12, 1, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (124, N'Spalding Sketch Dribble – Indoor/Outdoor Size 7 84-381z ', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336413725.jpg?v=1739336417683', 550.0000, N'Product information is being updated', N'Product information is being updated', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (125, N'Spalding TF33 Gold – Indoor/Outdoor Size 6 84-532z ', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336319401.jpg?v=1739336324170', 300.0000, N'q', N'q', 1, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (126, N'Spalding Commander – Indoor/Outdoor Size 7 84-589z', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336230269.jpg?v=1739336234637', 350.0000, N'Product information is being updated', N'Product information is being updated', 1, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (127, N'Spalding Orange Graffiti – Indoor/Outdoor Size 7 84-376z', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336147000.jpg?v=1739336151900', 500.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336147025.jpg?v=1739336153813', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336147025.jpg?v=1739336153813', 1, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (128, N'Spalding Precision TF-1000 FIBA Approved Official Game Ball - All Surface Size 7', N'https://bizweb.dktcdn.net/100/485/982/products/tf1000-1699430520793.jpg?v=1699430525243', 600.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/spa0283-side-1699430520812.jpg?v=1699430527277', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/spa0283-side-1699430520812.jpg?v=1699430527277', 1, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (129, N'Official T-shirt of the National Student Basketball Tournament NUC "Black" - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1736741570266.jpg?v=1736741573570', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7d0ba99871d5a78bfec45-1736741570273.jpg?v=1736741576183', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7d0ba99871d5a78bfec45-1736741570273.jpg?v=1736741576183', 1, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (130, N'Referee T-shirt for the NUC National Student Basketball Tournament "Gray" MJ-AJ1207-23 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1730364442995.jpg?v=1730366674687', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1730364446911.jpg?v=1730366676590', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1730364446911.jpg?v=1730366676590', 1, 7, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (131, N'HBL Allstar 2019 "Red"', N'https://bizweb.dktcdn.net/100/485/982/products/1-1730273452756.jpg?v=1730276761143', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1730273452788.jpg?v=1730276764933', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1730273452788.jpg?v=1730276764933', 1, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (132, N'Jogarbola x Stepback "Green" JG-23232-02', N'https://bizweb.dktcdn.net/100/485/982/products/anh-san-pham-web-shop-1712570580690.jpg?v=1712572443607', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a7-3-jpeg-1712570580761.jpg?v=1712572443607', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a7-3-jpeg-1712570580761.jpg?v=1712572443607', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (133, N'Jogarbola x Stepback Ace "Navy Blue" JG-23211-02', N'https://bizweb.dktcdn.net/100/485/982/products/a11-3-jpeg-1712562851179.jpg?v=1712563668993', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a11-4-jpeg-1712562851253.jpg?v=1712563672837', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a11-4-jpeg-1712562851253.jpg?v=1712563672837', 1, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (134, N'PEAK Basketball Snake "White Canvas" E231281ATC', N'https://bizweb.dktcdn.net/100/485/982/products/e231281a-2-375x375-1693216039429.jpg?v=1693216045693', 500.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/chon-size-2-1024x630-1693216039435.jpg?v=1693216048070', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/chon-size-2-1024x630-1693216039435.jpg?v=1693216048070', 1, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (135, N'Thang Long Dragon Master DG7700', N'https://bizweb.dktcdn.net/100/485/982/products/1-1735194880897.jpg?v=1735199116150', 200.0000, N'VVhttps://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1690282067231.jpg?v=1735199116707', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1690282067231.jpg?v=1735199116707', 9, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (136, N'Thang Long Dragon DG7000', N'https://bizweb.dktcdn.net/100/485/982/products/dg7000-1739503426207.jpg?v=1739503430477', 100.0000, N'https://bizweb.dktcdn.net/100/485/982/products/dg7000-1739503426207.jpg?v=1739503430477', N'https://bizweb.dktcdn.net/100/485/982/products/dg7000-1739503426207.jpg?v=1739503430477', 9, 8, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (137, N'Jatan 150 DL-JATAN150', N'https://bizweb.dktcdn.net/100/485/982/products/jatan150-1689648784684.jpg?v=1689648925073', 50.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1689648784698.png?v=1689648933053', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1689648784698.png?v=1689648933053', 9, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (138, N'Sao Vang 301 Plus "Green" Volleyball Shoes SV301P-13', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740122491864.jpg?v=1740122495947', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740122491880.jpg?v=1740122501410', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740122491880.jpg?v=1740122501410', 9, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (139, N'Promax "Blue" Badminton / Volleyball Shoes PR-241023-07 - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/1-1738918189655.jpg?v=1738918195037', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1738918189688.jpg?v=1738918198787', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1738918189688.jpg?v=1738918198787', 9, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (140, N'Sao Vang 301 Volleyball Shoes ', N'https://bizweb.dktcdn.net/100/485/982/products/1-1724639763108.jpg?v=1724649868740', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724639763129.jpg?v=1724649872600', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724639763129.jpg?v=1724649872600', 9, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (141, N'Sao Vang 301 Plus Volleyball Shoes "Jade Green" SV301P-09 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/6-1726647087916.jpg?v=1726649822807', 250.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/10-1726647087929.jpg?v=1726649824427', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/10-1726647087929.jpg?v=1726649824427', 9, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (142, N' 93 / 5.000 Vietnam Men''s Volleyball Team 2024 "Red" Competition Uniform MJ-E2214-3 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1724930625597.jpg?v=1724930645447', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930629265.jpg?v=1724930645447', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930629265.jpg?v=1724930645447', 9, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (143, N'Vietnam Men''s Volleyball Team 2024 Competition Uniform "White" MJ-E2214-1 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/3-1724930545338.jpg?v=1724930573577', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930547002.jpg?v=1724930573577', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930547002.jpg?v=1724930573577', 9, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (144, N'Vietnam Men''s Volleyball Team 2024 "Navy" Competition Uniform MJ-E2214-11 - Genuine Product', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-1724930585720.jpg?v=1724930616510', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930590082.jpg?v=1724930616510', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930590082.jpg?v=1724930616510', 9, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (145, N'Vietnam Women''s Volleyball Team 2024 "Green" Competition Uniform WJ-371-03 - Genuine Product', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1720067015184.png?v=1720067021140', 150.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1724929918672.jpg?v=1724929922370', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1724929918672.jpg?v=1724929922370', 9, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (146, N'Vietnam Women''s Volleyball Team 2024 Competition Uniform "White" WJ-371-02 - Genuine Product', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1720066994640.png?v=1720066999177', 150.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1724929932707.jpg?v=1724929936097', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1724929932707.jpg?v=1724929936097', 9, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (147, N'Vietnam Women''s Volleyball Team 2024 "Gold" Competition Uniform WJ-371-01 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1720066986440.png?v=1720066993813', 150.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1724929946461.jpg?v=1724929949707', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1724929946461.jpg?v=1724929949707', 9, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (148, N'Anh Viet 4-edge cable leather volleyball net - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/luoi-bong-chuyen-da-cap-4-vien-thai-lan-1700538264943.jpg?v=1700538358650', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1700538265002.png?v=1700538363380', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1700538265002.png?v=1700538363380', 9, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (149, N'Jogarbola Vibrant "White" Soccer Jersey MJ-TP0924.B02-05 - Genuine product', N'https://bizweb.dktcdn.net/100/485/982/products/5-1729654907438.jpg?v=1729660820607', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654907465.png?v=1729660821370', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654907465.png?v=1729660821370', 8, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (150, N'Jogarbola Vibrant "D.Purple" Soccer Jersey MJ-TP0924.B02-01 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1729654482457.jpg?v=1729660781827', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482516.png?v=1729660784530', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482516.png?v=1729660784530', 8, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (151, N'NEX-0623.B02 "Blue" Motivational Soccer Jersey Set NEX-TP0623.B02-06 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/38-5fe4ea51647c435ebb1abff080a20-1713576659563.jpg?v=1713576663943', 100.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/37-dd96d1ae93ec48628d68108b5eb06-1713576659576.jpg?v=1713576668953', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/37-dd96d1ae93ec48628d68108b5eb06-1713576659576.jpg?v=1713576668953', 8, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (152, N'Zocker Denver ZK4-D2304 Size 4 Soccer Ball - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1725877710354-197f10e1-f44d-4fb4-af3a-d1097338ce56.jpg?v=1725877746600', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725877710358-78a70b5f-22e3-423e-9005-7547083b29af.jpg?v=1725877747207', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725877710358-78a70b5f-22e3-423e-9005-7547083b29af.jpg?v=1725877747207', 8, 4, 0)
GO
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (153, N'Zocker Empire ZK5-EN205 Size 5 Soccer Ball - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1725609480598-180fea13-548b-4c02-8d4d-ae25e56f9eb1.jpg?v=1725616237577', 500.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725609480609-e8bc2054-48ab-4f9f-b03e-8c6d01ee8bf1.jpg?v=1725616238753', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725609480609-e8bc2054-48ab-4f9f-b03e-8c6d01ee8bf1.jpg?v=1725616238753', 8, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (154, N'Fifa Quality Pro UHV 2.07 Legend Dynamic Soccer Ball DL-UHV207-LEGEND - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/legend-1718115077202.jpg?v=1718132663203', 1000.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718115077228.png?v=1718132668060', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718115077228.png?v=1718132668060', 8, 1, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (155, N'Jogarbola Kumo Dynamic Soccer Shoes "Light blue/Purple" JG-221106-1-04 - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/8-1719993566684.jpg?v=1720002012757', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/12-4-d2c7bb2b1fb14c5eb75d3e28d-1719993566705.jpg?v=1720002016773', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/12-4-d2c7bb2b1fb14c5eb75d3e28d-1719993566705.jpg?v=1720002016773', 8, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (156, N'Jogarbola Kumo Dynamic Soccer Shoes "Navy/Blue" JG-221106-1-01 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/5-1719993391160.jpg?v=1720001986383', 500.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-4-a0a53572bbb54c62b7adb1bd5a-1719993391176.jpg?v=1720001989317', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-4-a0a53572bbb54c62b7adb1bd5a-1719993391176.jpg?v=1720001989317', 8, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (157, N'Men''s Dynamic Jogarbola Racer JG-2223 "Orange" Artificial Turf Soccer Shoes JG-2223-04 - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/04-1703152503808.jpg?v=1703153014657', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/tun-4013-13aaa27cab794de5b9eb464-1703152503829.jpg?v=1703153019537', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/tun-4013-13aaa27cab794de5b9eb464-1703152503829.jpg?v=1703153019537', 8, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (158, N'Jogarbola Kira Men''s Dynamic Badminton / Volleyball Shoes "Red - Black" JG-220420-05 - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/4-1712571806157.jpg?v=1712571812750', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-4-1712571806236.jpg?v=1712571819887', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-4-1712571806236.jpg?v=1712571819887', 10, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (159, N'Jogarbola Kira Men''s Dynamic Badminton / Volleyball Shoes "Navy Blue" JG-220420-04 - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/1-1712571761220.jpg?v=1712572364877', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-4-1712571761319.jpg?v=1712572364877', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-4-1712571761319.jpg?v=1712572364877', 10, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (160, N'Jogarbola Kira "Green" Badminton / Volleyball Shoes for Men and Women - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/7-1712571612659.jpg?v=1722340469227', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-4-1712571612723.jpg?v=1722340469227', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-4-1712571612723.jpg?v=1722340469227', 10, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (161, N'Promax Motivation Men''s Badminton T-Shirt "Blue - White" DL-AP1369-11 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/3-1714042390043.jpg?v=1714042394160', 199.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-xanh-trang-4-1714116950227.jpg?v=1714117075613', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-xanh-trang-4-1714116950227.jpg?v=1714117075613', 10, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (162, N'Promax Women''s Motivational Badminton T-Shirt "Pink - White" DL-AP666-01 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/5-1714042329838.jpg?v=1714042333173', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pro86017-1714116764474.jpg?v=1714116979203', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pro86017-1714116764474.jpg?v=1714116979203', 10, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (163, N'Promax Motivation Men''s Badminton T-Shirt "Red - White" DL-AP1369-01 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/2-1714042233634.jpg?v=1714042252357', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-do-trang-5-1714116590289.jpg?v=1714116710333', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-do-trang-5-1714116590289.jpg?v=1714116710333', 10, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (164, N'Promax PR-18103 Dynamic Badminton Box - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/5-1698201008630.jpg?v=1698201011673', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1698201008650.png?v=1698201014840', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1698201008650.png?v=1698201014840', 10, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (165, N'Jogarbola Power J800 "Black/Blue" J800-01 Badminton Racket - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1729075222464.jpg?v=1729076094413', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1729075222471.jpg?v=1729660660290', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1729075222471.jpg?v=1729660660290', 10, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (166, N'Vợt cầu lông Jogarbola Power J800 "White/Yellow" J800-04 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1729075588215.jpg?v=1729076233717', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1729075588219.jpg?v=1729660665980', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1729075588219.jpg?v=1729660665980', 10, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (167, N'Peri Baron P-D07 PR-P-D07 Billiard Cue - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/image-1709542325177.png?v=1709542331097', 1500.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1709542325202.png?v=1709542333537', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1709542325202.png?v=1709542333537', 11, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (168, N'Peri Baron P-D08 PR-P-D08 Billiard Cue - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/image-1718871238783.png?v=1718871248917', 1300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-467d192d-13f2-4c7d-8802-ff609776c26d-1709785498381.jpg?v=1718871251397', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-467d192d-13f2-4c7d-8802-ff609776c26d-1709785498381.jpg?v=1718871251397', 11, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (169, N'Peri Baron P-D11 PR-P-D11 Billiard Cue - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/image-1711704801929.png?v=1711705120523', 2000.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pd102-scalewidthwziwmdbd-1-1711704947275.jpg?v=1711705123117', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pd102-scalewidthwziwmdbd-1-1711704947275.jpg?v=1711705123117', 11, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (170, N'3 Seconds 3x5 "Blue" Billiard Cue Case PR-3SCase35-03 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1723718002531.jpg?v=1723726235567', 3000.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1723718002549.jpg?v=1723726237350', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1723718002549.jpg?v=1723726237350', 11, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (171, N'Taom V10 "Blue" PR-ChalkTaom-V10-02 Billiard Cue Ball - Genuine Product', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-1730890846486.jpg?v=1730894036740', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1730890846540.png?v=1730894039457', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1730890846540.png?v=1730894039457', 11, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (172, N'Peri Billiard Cue Cleaning Cloth - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/khan-1714617445543.jpg?v=1714617454930', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1714617331734.png?v=1714617454957', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1714617331734.png?v=1714617454957', 11, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (173, N'Official World Pool Championship "White and Blue" Billiards Jersey WPC-03 - Genuine Product', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1716276497788.jpg?v=1716277283723', 200.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276497815.png?v=1716277285623', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276497815.png?v=1716277285623', 11, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (174, N'Official World Pool Championship "Black" Billiards Jersey WPC-01 - Genuine Product', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-1716276337327.jpg?v=1716277276987', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276337353.png?v=1716277278343', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276337353.png?v=1716277278343', 11, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (175, N'How Titan Cue Tip PR-HT Premium Billiard Eraser - Genuine Product', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1bdcac888ebf22e17bae5-1710782003181.jpg?v=1710782581130', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/c7afde89fcbe50e009af3-1710782003191.jpg?v=1710782584163', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/c7afde89fcbe50e009af3-1710782003191.jpg?v=1710782584163', 11, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (176, N'Peri Tai-chi PS2-02 PR-PS2-02 Billiard Cue - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/image-1709537188123.png?v=1709544656087', 10000.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ps2-02-4-1709537188137.jpg?v=1709544693747', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ps2-02-4-1709537188137.jpg?v=1709544693747', 11, 2, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1135, N'Zocker Happy HP02 Super Quality "Pink" HP02-03 Pickleball Racket - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740042159681.jpg?v=1740042163853', 600.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042159692.jpg?v=1740042172387', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042159692.jpg?v=1740042172387', 12, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1136, N'Zocker Happy HP02 Super Quality "Gradient" HP02-02 Pickleball Racket - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740042127465.jpg?v=1740042131043', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042127477.jpg?v=1740042133790', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042127477.jpg?v=1740042133790', 12, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1137, N'Zocker Happy HP02 Super Quality "Green" HP02-01 Pickleball Racket - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740042098404.jpg?v=1740042101680', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042098416.jpg?v=1740042103807', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042098416.jpg?v=1740042103807', 12, 300, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1138, N'Pickleball Promax PI86 "White/Navy" DL-PI86-03 Sports Shoes - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740039696802.jpg?v=1740039701770', 300.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740039696816.jpg?v=1740039704960', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740039696816.jpg?v=1740039704960', 12, 300, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1139, N'Pickleball Promax PI86 "Navy" DL-PI86-02 Sports Shoes - Genuine', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740039506674.jpg?v=1740039510533', 400.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740039506687.jpg?v=1740039514067', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740039506687.jpg?v=1740039514067', 12, 4, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1140, N'Pickleball Promax PI86 "Stone Blue" Sports Shoes DL-PI86-01 - Genuine Product', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740039438284.jpg?v=1740039442573', 400.0000, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740039438286.jpg?v=1740039444260', N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740039438286.jpg?v=1740039444260', 12, 3, 0)
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
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (297, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/910be30b9d004bdaaee80d58bcf24d8d_9366/Campus_00s_Shoes_Brown_ID2077_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (298, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/88852f38e8c74682a86e4ddcd2b5dac1_9366/Campus_00s_Shoes_Brown_ID2077_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (299, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/29a262ad1607455f85fa342ea47af061_9366/Campus_00s_Shoes_Brown_ID2077_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (300, 25, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2c1fede01239469ca79c3572e3cf7a81_9366/Campus_00s_Shoes_Brown_ID2077_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (305, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c05f80341d640ba9c0594c7479455db_9366/D.O.N._Issue_5_Shoes_White_IE7799_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (306, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c747e9bcbccd4452905a8538f0368529_9366/D.O.N._Issue_5_Shoes_White_IE7799_02_standard_hover.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (307, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/92baafb7c0ec4e2899b73d47690039f1_9366/D.O.N._Issue_5_Shoes_White_IE7799_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (308, 2, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b6e6d6c5c91c42e9a2e953ec17c2d42e_9366/D.O.N._Issue_5_Shoes_White_IE7799_04_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (309, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b65606c1962f4d88a2f06f14de9c5b35_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (310, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4e4a5fce74f749979c8ac5c93402ecb2_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_012_hover_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (311, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/819175ed749b4afbb264faf4506a032a_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_02_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (312, 3, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/02f9cc8d45134c988249444dbff00d90_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (533, 124, N'https://bizweb.dktcdn.net/100/485/982/products/2-1739336413732.jpg?v=1739336418463')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (534, 124, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336413741.jpg?v=1739336419353')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (535, 124, N'https://bizweb.dktcdn.net/100/485/982/products/4-1739336413749.jpg?v=1739336420317')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (536, 124, N'https://bizweb.dktcdn.net/100/485/982/products/4-1739336413749.jpg?v=1739336420317')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (537, 125, N'https://bizweb.dktcdn.net/100/485/982/products/2-1739336319411.jpg?v=1739336325330')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (538, 125, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336319420.jpg?v=1739336326640')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (539, 125, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336319420.jpg?v=1739336326640')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (540, 125, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336319420.jpg?v=1739336326640')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (541, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1739336230279.jpg?v=1739336235437')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (542, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336230288.jpg?v=1739336236230')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (543, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336230298.jpg?v=1739336237223')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (544, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336230298.jpg?v=1739336237223')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (545, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1739336147009.jpg?v=1739336152413')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (546, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336147017.jpg?v=1739336153317')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (547, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336147025.jpg?v=1739336153813')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (548, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336147025.jpg?v=1739336153813')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (549, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/sp0283-front-1699430520801.jpg?v=1699430525623')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (550, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/spa0283-front-side-1699430520807.jpg?v=1699430526443')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (551, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/spa0283-side-1699430520812.jpg?v=1699430527277')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (552, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/spa0283-side-1699430520812.jpg?v=1699430527277')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (553, 129, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1736741570267.jpg?v=1736741574930')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (554, 129, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/8d651afa6b49bc17e558-1736741570269.jpg?v=1736741575590')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (555, 129, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7d0ba99871d5a78bfec45-1736741570273.jpg?v=1736741576183')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (556, 129, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7d0ba99871d5a78bfec45-1736741570273.jpg?v=1736741576183')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (557, 130, N'https://bizweb.dktcdn.net/100/485/982/products/1-1730364442995.jpg?v=1730366674687')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (558, 130, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1730364445317.jpg?v=1730366676073')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (559, 130, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1730364444214.jpg?v=1730366675167')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (560, 130, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1730364446911.jpg?v=1730366676590')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (561, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1730273452762.jpg?v=1730276762113')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (562, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1730273452776.jpg?v=1730276763250')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (563, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1730273452782.jpg?v=1730276764053')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (564, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1730273452788.jpg?v=1730276764933')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (565, 132, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/anh-san-pham-web-shop-6313591e-db31-4696-b022-642d17af8c47.jpg?v=1712572443607')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (566, 132, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a7-7-jpeg-1712570580848.jpg?v=1712572443607')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (567, 132, N'https://bizweb.dktcdn.net/100/485/982/products/a7-2-jpeg-1712570580750.jpg?v=1712572443607')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (568, 132, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a7-3-jpeg-1712570580761.jpg?v=1712572443607')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (569, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a11-9-jpeg-1712562851210.jpg?v=1712563669783')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (570, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a11-9-jpeg-1712562851210.jpg?v=1712563669783')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (571, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a11-2-jpeg-1712562851232.jpg?v=1712563670607https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a11-2-jpeg-1712562851232.jpg?v=1712563670607')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (572, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/a11-4-jpeg-1712562851253.jpg?v=1712563672837')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (573, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1693216039428.png?v=1693216045367')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (574, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/e231281a-3-1693216039433.jpg?v=1693216047187')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (575, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/chon-size-2-1024x630-1693216039435.jpg?v=1693216048070')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (576, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/chon-size-2-1024x630-1693216039435.jpg?v=1693216048070')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (577, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1735194881962.jpg?v=1735199116700')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (578, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1690282065607.jpg?v=1735199116707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (579, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1690282067231.jpg?v=1735199116707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (580, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1690282067231.jpg?v=1735199116707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (581, 136, N'https://bizweb.dktcdn.net/100/485/982/products/dg7000-1739503426207.jpg?v=1739503430477')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (582, 136, N'https://bizweb.dktcdn.net/100/485/982/products/dg7000-1739503426207.jpg?v=1739503430477')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (583, 136, N'https://bizweb.dktcdn.net/100/485/982/products/dg7000-1739503426207.jpg?v=1739503430477')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (584, 136, N'https://bizweb.dktcdn.net/100/485/982/products/dg7000-1739503426207.jpg?v=1739503430477')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (585, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1689648784687.png?v=1689648933053')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (586, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1689648784690.png?v=1689648933053')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (587, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1689648784693.png?v=1689648933053')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (588, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1689648784698.png?v=1689648933053')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (589, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740122491869.jpg?v=1740122497183')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (590, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740122491873.jpg?v=1740122498257https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740122491873.jpg?v=1740122498257')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (591, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740122491877.jpg?v=1740122500577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (592, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740122491880.jpg?v=1740122501410')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (593, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1738918189660.jpg?v=1738918195903')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (594, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1738918189665.jpg?v=1738918196413')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (595, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1738918189672.jpg?v=1738918196897')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (596, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1738918189688.jpg?v=1738918198787')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (597, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1724639763113.jpg?v=1724649869430')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (598, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1724639763119.jpg?v=1724649870437')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (599, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1724639763124.jpg?v=1724649871160')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (600, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724639763129.jpg?v=1724649872600')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (601, 141, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-1726647087919.jpg?v=1726649823347')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (602, 141, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/8-1726647087923.jpg?v=1726649823837')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (603, 141, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1726647087926.jpg?v=1726649824130')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (604, 141, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/10-1726647087929.jpg?v=1726649824427')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (605, 142, N'https://bizweb.dktcdn.net/100/485/982/products/2-1724930626197.jpg?v=1724930645447')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (606, 142, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1724930626763.jpg?v=1724930645447')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (607, 142, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1724930627628.jpg?v=1724930645447')
GO
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (608, 142, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930629265.jpg?v=1724930645447')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (609, 143, N'https://bizweb.dktcdn.net/100/485/982/products/1-1724930543701.jpg?v=1724930573577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (610, 143, N'https://bizweb.dktcdn.net/100/485/982/products/2-1724930544598.jpg?v=1724930573577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (611, 143, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1724930546007.jpg?v=1724930573577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (612, 143, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930547002.jpg?v=1724930573577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (613, 144, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1724930586655.jpg?v=1724930616510')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (614, 144, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1724930587469.jpg?v=1724930616510')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (615, 144, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1724930588572.jpg?v=1724930616510')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (616, 144, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724930590082.jpg?v=1724930616510')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (617, 145, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-1724929917116.jpg?v=1724929921010')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (618, 145, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1724929917983.jpg?v=1724929921493')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (619, 145, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1724929918672.jpg?v=1724929922370')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (620, 145, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1724929918672.jpg?v=1724929922370')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (621, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-1724929931538.jpg?v=1724929935130')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (622, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/8-1724929932243.jpg?v=1724929935610')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (623, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1724929932707.jpg?v=1724929936097')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (624, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1724929932707.jpg?v=1724929936097')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (625, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1724929944920.jpg?v=1724929949143')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (626, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1724929945623.jpg?v=1724929949413')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (627, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1724929946461.jpg?v=1724929949707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (628, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1724929946461.jpg?v=1724929949707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (629, 148, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1700194768875-411c256d-3104-4928-bf6e-19ba8df6dbc4.png?v=1700538360020')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (630, 148, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1700194768893-bbc127ad-f8d0-40f7-b02a-4212348cbd13.png?v=1700538360627')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (631, 148, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1700538264976.png?v=1700538361567')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (632, 148, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1700538265002.png?v=1700538363380')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (633, 149, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654907462.png?v=1729660821103')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (634, 149, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654907465.png?v=1729660821370')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (635, 149, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654907465.png?v=1729660821370')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (636, 149, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654907465.png?v=1729660821370')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (637, 150, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482477.png?v=1729660782367')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (638, 150, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482498.png?v=1729660783510')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (639, 150, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482502.png?v=1729660783850')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (640, 150, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482516.png?v=1729660784530')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (641, 151, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/40-8592f5b8f1834d679f9dfd68a8a7f-1713576659566.jpg?v=1713576664903')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (642, 151, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/39-4b3dc1c5121743f2813edc43ca41f-1713576659569.jpg?v=1713576665487')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (643, 151, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/41-fa0bc8b976ca4c349714bde9a73a7-1713576659573.jpg?v=1713576667730')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (644, 151, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/37-dd96d1ae93ec48628d68108b5eb06-1713576659576.jpg?v=1713576668953')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (645, 152, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1725877710356-7b774bd8-97f5-493d-a3c4-159e1e042ad9.jpg?v=1725877746860')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (646, 152, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725877710358-78a70b5f-22e3-423e-9005-7547083b29af.jpg?v=1725877747207')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (647, 152, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725877710358-78a70b5f-22e3-423e-9005-7547083b29af.jpg?v=1725877747207')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (648, 152, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725877710358-78a70b5f-22e3-423e-9005-7547083b29af.jpg?v=1725877747207')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (649, 153, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1725609480603-a868e5f5-8c94-4f1a-b93b-f904229a34e7.jpg?v=1725616238267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (650, 153, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725609480609-e8bc2054-48ab-4f9f-b03e-8c6d01ee8bf1.jpg?v=1725616238753')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (651, 153, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725609480609-e8bc2054-48ab-4f9f-b03e-8c6d01ee8bf1.jpg?v=1725616238753')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (652, 153, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1725609480609-e8bc2054-48ab-4f9f-b03e-8c6d01ee8bf1.jpg?v=1725616238753')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (653, 154, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718115077208.png?v=1718132664137')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (654, 154, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718115077215.png?v=1718132664650')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (655, 154, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718115077221.png?v=1718132665247')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (656, 154, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718115077228.png?v=1718132668060')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (657, 155, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/12-1-9b618fe04c2b45baa41d33822-1719993566686.jpg?v=1720002013577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (658, 155, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/12-2-40e21e0d5a0040baa9e243e48-1719993566693.jpg?v=1720002014563')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (659, 155, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/12-3-17c11c2a35a14fd493e6ae6c4-1719993566699.jpg?v=1720002015437')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (660, 155, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/12-4-d2c7bb2b1fb14c5eb75d3e28d-1719993566705.jpg?v=1720002016773')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (661, 156, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1-884a3c264ffe41e59f137df6fd-1719993391164.jpg?v=1720001987207')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (662, 156, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-2-ed886e444e5b48708aaa191f7e-1719993391168.jpg?v=1720001987853')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (663, 156, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-3-b5d79fb5638e4785b8bf5b4a72-1719993391172.jpg?v=1720001988500')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (664, 156, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-4-a0a53572bbb54c62b7adb1bd5a-1719993391176.jpg?v=1720001989317')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (665, 157, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/tun-5940-8a2b591cb83240ccbb9cd8e-1703152503812.jpg?v=1703153015287')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (666, 157, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/tun-4093-fca0349593a743c48361501-1703152503820.jpg?v=1703153015893')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (667, 157, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/tun-4074-06c733d741c14c168a4ecc4-1703152503825.jpg?v=1703153016723')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (668, 157, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/tun-4013-13aaa27cab794de5b9eb464-1703152503829.jpg?v=1703153019537')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (669, 158, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-0-1712571806167.jpg?v=1712571813570')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (670, 158, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1-1712571806190.jpg?v=1712571815033')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (671, 158, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-2-1712571806212.jpg?v=1712571816173')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (672, 158, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-4-1712571806236.jpg?v=1712571819887')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (673, 159, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-64b8b536-856b-446a-a939-ce8fa8d4c0c2.jpg?v=1712572364877')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (674, 159, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-0-1712571761250.jpg?v=1712572364877')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (675, 159, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-2-1712571761291.jpg?v=1712572364877')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (676, 159, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-4-1712571761319.jpg?v=1712572364877')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (677, 160, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7.jpg?v=1722340469227')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (678, 160, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-1-1712571612683.jpg?v=1722340469227')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (679, 160, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-3-1712571612696.jpg?v=1722340469227')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (680, 160, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-4-1712571612723.jpg?v=1722340469227')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (681, 161, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-xanh-trang-1-1714116947102.jpg?v=1714117073653')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (682, 161, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-xanh-trang-2-1714116948142.jpg?v=1714117074213')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (683, 161, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-xanh-trang-1-1714116947102.jpg?v=1714117073653')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (684, 161, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-xanh-trang-3-1714116949291.jpg?v=1714117074760')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (685, 162, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pro85976-1714116761791.jpg?v=1714116976817')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (686, 162, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pro85987-1714116762785.jpg?v=1714116977463')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (687, 162, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pro85995-1714116763594.jpg?v=1714116978433')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (688, 162, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pro86017-1714116764474.jpg?v=1714116979203')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (689, 163, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-do-trang-1-1714116587289.jpg?v=1714116708500')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (690, 163, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-do-trang-2-1714116588313.jpg?v=1714116709077')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (691, 163, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-do-trang-3-1714116589281.jpg?v=1714116709673')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (692, 163, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ao-nam-do-trang-5-1714116590289.jpg?v=1714116710333')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (693, 164, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1698201008634.png?v=1698201012353')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (694, 164, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1698201008639.png?v=1698201013083')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (695, 164, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1698201008644.png?v=1698201013870')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (696, 164, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1698201008650.png?v=1698201014840')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (697, 165, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/j750-4-1729651190127.jpg?v=1729660660290')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (698, 165, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1729075222466.jpg?v=1729660660290')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (699, 165, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1729075222469.jpg?v=1729660660290')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (700, 165, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1729075222471.jpg?v=1729660660290')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (701, 166, N'https://bizweb.dktcdn.net/100/485/982/products/j750-2-1729651234248.jpg?v=1729660665980')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (702, 166, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1729075588216.jpg?v=1729660665980')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (703, 166, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1729075588218.jpg?v=1729660665980')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (704, 166, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1729075588219.jpg?v=1729660665980')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (705, 167, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1709542325190.png?v=1709542331877')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (706, 167, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1709542325194.png?v=1709542332363')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (707, 167, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1709542325199.png?v=1709542333053')
GO
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (708, 167, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1709542325202.png?v=1709542333537')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (709, 168, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718871238787.png?v=1718871249633')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (710, 168, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718871238791.png?v=1718871250253')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (711, 168, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1718871238794.png?v=1718871250733')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (712, 168, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-467d192d-13f2-4c7d-8802-ff609776c26d-1709785498381.jpg?v=1718871251397')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (713, 169, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1711704823447.png?v=1711705121280')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (714, 169, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1711704829716.png?v=1711705121873')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (715, 169, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1711704873963.png?v=1711705122437')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (716, 169, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/pd102-scalewidthwziwmdbd-1-1711704947275.jpg?v=1711705123117')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (717, 170, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1723718002534.jpg?v=1723726236043')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (718, 170, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1723718002538.jpg?v=1723726236550')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (719, 170, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1723718002541.jpg?v=1723726236830')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (720, 170, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1723718002549.jpg?v=1723726237350')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (721, 171, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1730890846490.jpg?v=1730894037227')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (722, 171, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1730890846506.png?v=1730894038107')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (723, 171, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1730890846511.png?v=1730894038957')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (724, 171, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1730890846540.png?v=1730894039457')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (725, 172, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1714617336295.png?v=1714617454957')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (726, 172, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1714617339306.png?v=1714617454957')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (727, 172, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1714617342571.png?v=1714617454957')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (728, 172, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1714617331734.png?v=1714617454957')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (729, 173, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276497800.png?v=1716277284220')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (730, 173, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276497809.png?v=1716277284923')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (731, 173, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276497815.png?v=1716277285623')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (732, 173, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276497815.png?v=1716277285623')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (733, 174, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276337337.png?v=1716277277503')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (734, 174, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276337347.png?v=1716277278003')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (735, 174, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276337353.png?v=1716277278343')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (736, 174, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1716276337353.png?v=1716277278343')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (737, 175, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/66b7118133b69fe8c6a71-1710782003184.jpg?v=1710782582040')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (738, 175, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/700a33271110bd4ee4012-1710782003186.jpg?v=1710782582993')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (739, 175, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/39713a2c181bb445ed0a4-1710782003188.jpg?v=1710782583670')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (740, 175, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/c7afde89fcbe50e009af3-1710782003191.jpg?v=1710782584163')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (741, 176, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ps2-02-1-1709537188127.jpg?v=1709544664967')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (742, 176, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ps2-02-2-1709537188130.jpg?v=1709544673703')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (743, 176, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ps2-02-3-1709537188133.jpg?v=1709544684453')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (744, 176, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/ps2-02-4-1709537188137.jpg?v=1709544693747')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1573, 1135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740042159684.jpg?v=1740042164997')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1574, 1135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740042159686.jpg?v=1740042166427')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1575, 1135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740042159689.jpg?v=1740042167830')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1576, 1135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042159692.jpg?v=1740042172387')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1577, 1136, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740042127471.jpg?v=1740042132267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1578, 1136, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740042127471.jpg?v=1740042132267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1579, 1136, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740042127474.jpg?v=1740042133020')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1580, 1136, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042127477.jpg?v=1740042133790')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1581, 1137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740042098407.jpg?v=1740042102153')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1582, 1137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740042098410.jpg?v=1740042102647')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1583, 1137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740042098413.jpg?v=1740042103120')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1584, 1137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740042098416.jpg?v=1740042103807')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1585, 1138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740039696805.jpg?v=1740039702577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1586, 1138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740039696810.jpg?v=1740039703383')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1587, 1138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740039696813.jpg?v=1740039703657')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1588, 1138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740039696816.jpg?v=1740039704960')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1589, 1139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740039506677.jpg?v=1740039511057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1590, 1139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740039506680.jpg?v=1740039511563')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1591, 1139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740039506684.jpg?v=1740039512063')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1592, 1139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1740039506687.jpg?v=1740039514067')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1593, 1140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740039438284.jpg?v=1740039443303')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1594, 1140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740039438285.jpg?v=1740039443773')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1595, 1140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740039438285.jpg?v=1740039443773')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (1596, 1140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740039438286.jpg?v=1740039444260')
SET IDENTITY_INSERT [dbo].[SubImage] OFF
GO
INSERT [dbo].[View] ([viewed]) VALUES (188)
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
