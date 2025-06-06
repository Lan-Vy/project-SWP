USE [Project_Group6_2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/31/2025 1:04:37 AM ******/
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
/****** Object:  Table [dbo].[CartItems]    Script Date: 3/31/2025 1:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[productId] [int] NULL,
	[sizeId] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/31/2025 1:04:37 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/31/2025 1:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[orderId] [int] NULL,
	[rating] [int] NULL,
	[feedbackContent] [nvarchar](max) NULL,
	[feedbackDate] [datetime] NULL,
	[replyUserId] [int] NULL,
	[replyContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/31/2025 1:04:37 AM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/31/2025 1:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[SizeID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC,
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/31/2025 1:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pID] [int] IDENTITY(1,1) NOT NULL,
	[pName] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 3/31/2025 1:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pID] [int] NULL,
	[sizeId] [int] NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[isDeleted] [int] NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 3/31/2025 1:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[size] [nvarchar](max) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubImage]    Script Date: 3/31/2025 1:04:37 AM ******/
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
/****** Object:  Table [dbo].[View]    Script Date: 3/31/2025 1:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[viewed] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (11, N'admin', N'123', 2, N'admin@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2015, N'dang', N'123', 3, N'shipper2@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2016, N'lanvy', N'123', 3, N'vy@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2017, N'thanh', N'123', 3, N'shipper@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2021, N'Tranvinh204', N'Quocvinh@204', 1, N'vinhtran5114@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2022, N'tran quoc vinh', N'Quocvinh@204', 1, N'Vinhtqce181347@fpt.edu.vn')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2023, N'AdminShop', N'Abc@123', 2, N'adminshop@gmail.com')
INSERT [dbo].[Account] ([uID], [userName], [passWord], [role], [email]) VALUES (2024, N'ShipperShop', N'Abc@123', 3, N'Hieuvtce180452@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([id], [userId], [productId], [sizeId], [quantity]) VALUES (7, 2022, 152, 1, 1)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cID], [cName]) VALUES (1, N'Skateboarding')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (8, N'Roller skating')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (9, N'Horseback riding')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (10, N'Kite flying')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (11, N'Football & Futsal')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (12, N'Running & Walking')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (13, N'Gym & Workout')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (14, N'Bi-a (Billiards)')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (15, N'Badminton')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (16, N'Volleyball')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (17, N'Basketball')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (18, N'Pickleball')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [userId], [orderId], [rating], [feedbackContent], [feedbackDate], [replyUserId], [replyContent]) VALUES (1, 2021, 2032, 3, N'ok nhe mn', CAST(N'2025-03-24T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Feedback] ([Id], [userId], [orderId], [rating], [feedbackContent], [feedbackDate], [replyUserId], [replyContent]) VALUES (2, 2021, 2039, 5, N'ok dep lam mn a', CAST(N'2025-03-24T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Feedback] ([Id], [userId], [orderId], [rating], [feedbackContent], [feedbackDate], [replyUserId], [replyContent]) VALUES (3, 2021, 2048, 4, N'shop rat uy tin', CAST(N'2025-03-30T23:57:35.090' AS DateTime), 11, N'cam on b nha')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2032, CAST(N'2025-02-24' AS Date), 2021, N'hn', N'0869381123', N'quan tri', 4197000.0000, 3, 2016)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2033, CAST(N'2025-03-25' AS Date), 2021, N'Rach Gia', N'0639381823', N'Vinh Tran', 1348000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2034, CAST(N'2025-03-25' AS Date), 2021, N'Rach Gia', N'0639381823', N'Vinh Tran', 490000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2035, CAST(N'2025-03-25' AS Date), 2021, N'Rach Gia', N'0639381823', N'Minh Quang', 1017000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2036, CAST(N'2025-03-25' AS Date), 2015, N'can tho', N'0984813654', N'vinh tran', 90000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2037, CAST(N'2025-03-25' AS Date), 2021, N'can tho', N'0984813654', N'vinh tran', 90000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2038, CAST(N'2025-03-25' AS Date), 2021, N'can tho', N'0984813654', N'vinh tran', 90000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2039, CAST(N'2025-04-25' AS Date), 2021, N'can tho', N'0984813654', N'vinh tran', 2093000.0000, 3, 2015)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2040, CAST(N'2025-05-25' AS Date), 2021, N'can tho', N'0984813654', N'vinh tran', 90000.0000, 3, 2015)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2041, CAST(N'2025-03-26' AS Date), 2021, N'sadfasdfsad', N'0983813612', N'vinh tran', 90000.0000, 3, 2015)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2042, CAST(N'2025-03-27' AS Date), 2022, N'sadfasdfsad', N'0983813612', N'vinh tran', 450000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2043, CAST(N'2025-03-27' AS Date), 2022, N'sadfasdfsad', N'0983813612', N'vinh tran', 450000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2044, CAST(N'2025-03-28' AS Date), 2021, N'rach gia kieng giang', N'123', N'tran vinh', 90000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2045, CAST(N'2025-03-28' AS Date), 2021, N'rach gia kieng giang', N'123', N'tran vinh', 119000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2046, CAST(N'2025-03-28' AS Date), 2021, N'as', N'123', N'sas sas', 119000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2047, CAST(N'2025-03-28' AS Date), 2021, N'asas', N'asas', N'asas sasas', 245000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2048, CAST(N'2025-03-30' AS Date), 2021, N'123 Can Tho', N'0869381123', N'Kim Anh', 3475000.0000, 3, 2016)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2049, CAST(N'2025-03-30' AS Date), 2021, N'345 phung hung', N'0869381123', N'Kim Anh', 119000.0000, 0, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2032, 154, 1399000.0000, 1, 6)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2032, 154, 1399000.0000, 2, 8)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2033, 150, 90000.0000, 1, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2033, 150, 90000.0000, 2, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2033, 160, 539000.0000, 2, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2034, 153, 245000.0000, 2, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2035, 143, 339000.0000, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2035, 143, 339000.0000, 1, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2036, 150, 90000.0000, 1, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2037, 150, 90000.0000, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2038, 150, 90000.0000, 1, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2039, 163, 299000.0000, 7, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2040, 150, 90000.0000, 1, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2041, 150, 90000.0000, 1, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2042, 150, 90000.0000, 5, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2043, 150, 90000.0000, 5, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2044, 157, 90000.0000, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2045, 152, 119000.0000, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2046, 152, 119000.0000, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2047, 153, 245000.0000, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2048, 149, 739000.0000, 2, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2048, 154, 1399000.0000, 1, 6)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2048, 163, 299000.0000, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2048, 163, 299000.0000, 1, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [SizeID]) VALUES (2049, 152, 119000.0000, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (1, N'Jordan 1 Retro High Dark Mocha', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/89b0414dbb05499782be24efffcf29c3_9366/Adifom_Climacool_Shoes_Green_IF3937_01_standard.jpg', N'', N'', 9)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (2, N'Jordan 5 Retro Alternate Bel-Air', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c05f80341d640ba9c0594c7479455db_9366/D.O.N._Issue_5_Shoes_White_IE7799_01_standard.jpg', N'', N'', 9)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (3, N'Jordan 4 Retro SE 95 Neon', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b65606c1962f4d88a2f06f14de9c5b35_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_01_standard.jpg', N'', N'', 9)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (71, N'Nike Air Force 1 Shadow', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/odhlk8ksqmstmdcjjyn0/W+AF1+SHADOW.png', N'nike', N'The Nike Air Force 1 Shadow puts a playful twist on a classic b-ball design.Using a layered approach, doubling the branding and exaggerating the midsole, it highlights AF-1 DNA with a bold, new look.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (109, N'Team 31 DNA', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d0b0c2bf-a817-450b-b6c9-7b2907e17f8a/N31+MNK+DF+DNA+SHORT+8IN.png', N'quan nike', N'Show your love for the league in these Team 31 DNA shorts. They''re made from lightweight, yet durable material that wicks sweat to help keep you feeling dry and focused.


Colour Shown: Neutral Olive/Hyper Crimson
Style: FQ3690-276
Country/Region of Origin: Thailand', 15)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (119, N'Scoot All Jaws', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/629215/01/mod01/fnd/PNA/fmt/png/Scoot-All-Jaws-All-Over-Print-Men''s-Basketball-Shorts', N'quan puma', N'Game-ready shorts for hardwood heroes. Scoot Henderson branding and a relaxed fit let you dominate without distraction. Knitted for breathability so you''re fresh for the 4th quarter. Take your game to the next level in PUMA style.
Style: 629215_01
Color: PUMA Black-AOP', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (120, N'BMW M Motorsport Life', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/627539/07/mod01/fnd/PNA/fmt/png/BMW-M-Motorsport-Men''s-Life-PUMATECH-Shorts', N'quan puma', N'In a world of motorsport and sportswear, where performance is paramount, the BMW M Motorsport LIFE PACK emerges as your ultimate companion. These regular fit shorts feature our dryCELL tech to wick moisture and keep you feeling at your best.

dryCELL: Performance technology designed to wick moisture from the body and keep you free of sweat during exercise
Made with at least 70% recycled materials
Regular fit
225 gsm, dobby
Mid-rise
BMW M Motorsport branding details
PUMA branding details
Style: 627539_07
Color: Vapor Gray', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (122, N'Manchester City 24/25 Replica', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod01/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts', N'quan puma', N'Hit the pitch like Manchester City''s finest in these soccer shorts. They''re made from sweat-wicking material to keep you cool in the tensest moments of the game and are finished with the team''s famous crest on the leg.
Style: 775114_05
Color: PUMA White-Marine Blue', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (125, N'ao dep1', N'1http://sieuthithucpham.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/8/18_cai_na_2_.jpg', N'dae1', N'ew1', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (126, N'Bóng rổ Spalding Sketch Dribble – Indoor/Outdoor Size 7 84-381z - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336413725.jpg?v=1739336417683', N'Spalding Sketch Series Basketball - Vibrant Orange with Artistic Design', N'Add a touch of creativity to your game with the Spalding Sketch Series Basketball. Featuring a striking orange color and intricate black sketches of basketball patterns, this ball stands out with its unique and artistic design. The Spalding logo is prominently displayed, and the "Sketch" series branding adds a cool, modern flair. Perfect for both casual play and collectors, this basketball combines style with performance, making it a must-have for basketball enthusiasts. Ideal for both indoor and outdoor use.', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (127, N'Áo khoác gió Jogarbola Track Jacket ', N'https://bizweb.dktcdn.net/100/485/982/products/pj309-11-1736937642291.jpg?v=1736937647630', N'Jogarbola Track Jacket "Xanh Navy" MJ-PJ309-11 - Official Product', N'Stay stylish and comfortable with the Jogarbola Track Jacket in Navy Blue. Made by Động Lực, this jacket is perfect for both casual wear and athletic activities. With a sleek design, the jacket features a high-quality zipper and a sporty look. The jacket is available in size S, with other sizes available upon request. Now at a 40% discount, it''s the perfect time to grab this jacket at just 369,000 VND, down from 615,000 VND. Durable, lightweight, and functional, this jacket is a great addition to any wardrobe.', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (128, N'Áo phông chính thức của giải bóng rổ sinh viên toàn quốc NUC "Đen" - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1736741570266.jpg?v=1736741573570', N'Official NUC Basketball Tournament T-Shirt - Black', N'Support the NUC Basketball Tournament with this stylish black t-shirt. Featuring the bold "NUC BASKETBALL" logo in yellow, this shirt is a perfect choice for fans and participants alike. The comfortable cotton fabric and modern fit make it ideal for casual wear, sports events, or showing off your team spirit. Available in size M, this t-shirt is on sale for just 135,000 VND, down from 225,000 VND with a 40% discount. Don''t miss out on this great deal!', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (129, N'Bóng rổ Spalding TF33 Gold – Indoor/Outdoor Size 6 84-532z - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336319401.jpg?v=1739336324170', N'Spalding TF33 Gold Basketball – Indoor/Outdoor, Size 6

', N'Experience superior quality and performance with the Spalding TF33 Gold Basketball, designed for both indoor and outdoor play. Featuring the signature Spalding branding and a bold yellow and navy color scheme, this basketball is built for durability and a great feel. With a size 6 specification, it’s perfect for youth and recreational players alike. Priced at 600,000 VND, this high-performance ball is a must-have for any basketball enthusiast.', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (130, N'Bóng rổ Spalding Commander – Indoor/Outdoor Size 7 84-589z - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336230269.jpg?v=1739336234637', N'Spalding Commander Basketball – Indoor/Outdoor, Size 7', N'The Spalding Commander Basketball is built for both indoor and outdoor use, offering durability and exceptional performance. With a unique camouflage design in green and beige tones, it stands out with its bold black Spalding logo and "COMMANDER" branding. This size 7 basketball is perfect for competitive play, providing a great grip and control for players. Available for 520,000 VND, it''s a reliable choice for any basketball enthusiast looking for style and performance on the court.', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (131, N'Áo khoác gió Jogarbola "Trắng" MJ-P3124-03 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/3-1736935304176.jpg?v=1736935310623', N'Jogarbola White Windbreaker Jacket MJ-P3124-03 – Official Product

', N'Stay comfortable and stylish with the Jogarbola White Windbreaker Jacket MJ-P3124-03. Made by Động Lực, this jacket features a sleek white body with contrasting navy blue and brown sleeves, offering a modern and sporty look. The lightweight, breathable fabric makes it perfect for both casual and active wear. The jacket is available in sizes S, M, L, XL, and 2XL. Priced at 645,000 VND, this high-quality jacket is a great addition to your wardrobe for any outdoor activity or casual outing.', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (132, N'Balo thể thao Zocker Winner Energy - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057', N'Zocker Winner Energy Sports Backpack - Black

', N'Carry your essentials in style with the Zocker Winner Energy Sports Backpack. Designed with a sleek black color and a bold pattern, this backpack is perfect for sports enthusiasts and everyday use. It features multiple compartments for easy organization and durable straps for comfortable carrying. The backpack is priced at 329,000 VND, making it an affordable option for anyone looking for a reliable and stylish bag. Available in other colors, it’s an essential accessory for both school and sports activities.', 17)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (133, N'Động Lực Promax "Light/Khaki" Volleyball Shoes PR-241023-10', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742791379096.jpg?v=1742791386883', N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "Light/Khaki" PR-241023-10 - Hàng Chính Hãng
', N'Step up your game with the Động Lực Promax "Light/Khaki" Volleyball Shoes. Designed for both comfort and performance, these shoes feature a sleek light khaki color with a breathable upper, ensuring that your feet stay cool and supported during intense games. The durable sole provides excellent grip, making them perfect for indoor volleyball courts. Priced at 519,000 VND (down from 580,000 VND), these shoes are available in size 36, with other sizes up to 39. Get the perfect fit for your volleyball needs at an affordable price.', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (134, N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "Red/White" PR-241023-09 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742719095817.jpg?v=1742719099427', N'Động Lực Promax "Red/White" Volleyball Shoes PR-241023-09

', N'Step onto the court with confidence in the Động Lực Promax "Red/White" Volleyball Shoes. These shoes combine vibrant red and white colors with advanced design for both style and performance. They feature a breathable upper and a durable sole for excellent traction and support during intense matches. Priced at 519,000 VND (down from 580,000 VND), these shoes are available in sizes 36 to 39, offering a perfect fit for players. Elevate your game with the perfect combination of comfort, durability, and style.', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (135, N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "White/Purple" PR-241023-08 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742719061430.jpg?v=1742719064840', N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "White/Purple" PR-241023-08 - Hàng Chính Hãng
', N'Play in style with the Động Lực Promax "White/Purple" Volleyball Shoes. Featuring a sleek white and purple design with a touch of gold, these shoes offer a perfect combination of comfort and performance. Built with a durable sole for excellent traction and stability, they are ideal for indoor volleyball. Available in sizes 36 to 39, these shoes are priced at 519,000 VND, down from 580,000 VND, offering a great value for high-quality footwear. Get ready to elevate your game with the perfect fit and design.', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (136, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Cam" PR-2406.M-03 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/8.jpg?v=1741682201577', N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Cam" PR-2406.M-03 - Hàng Chính Hãng', N'Show off your athletic style with the Động Lực Promax Men''s Volleyball Set in vibrant orange. Featuring a dynamic geometric pattern, this set combines comfort and performance for your best game yet. The shirt and shorts are made from breathable fabric, designed for maximum flexibility and movement during play. Priced at just 199,000 VND, this set is available in sizes M, L, XL, and 2XL, making it a great value for anyone looking to enhance their volleyball gear. Perfect for both practice and casual matches.', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (137, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Xanh" PR-2406.M-02 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740991448008.jpg?v=1741682211267', N'Động Lực Promax Men''s Volleyball Set "Blue" PR-2406.M-02

', N'Enhance your volleyball game with the Động Lực Promax Men''s Volleyball Set in vibrant blue. Featuring a sleek geometric design and comfortable fit, this set is perfect for both casual players and athletes. Made with breathable fabric, it ensures flexibility and comfort throughout your match. Priced at just 199,000 VND, this set is available in sizes M, L, XL, and 2XL, making it a great choice for players of all sizes. Ideal for practice or competitive play, this stylish and functional set offers great value for volleyball enthusiasts.', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (138, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Trắng" PR-2406.M-01 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740991388760.jpg?v=1741682219680', N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Trắng" PR-2406.M-01 - Hàng Chính Hãng', N'Enhance your volleyball game with the Động Lực Promax Men''s Volleyball Set in vibrant blue. Featuring a sleek geometric design and comfortable fit, this set is perfect for both casual players and athletes. Made with breathable fabric, it ensures flexibility and comfort throughout your match. Priced at just 199,000 VND, this set is available in sizes M, L, XL, and 2XL, making it a great choice for players of all sizes. Ideal for practice or competitive play, this stylish and functional set offers great value for volleyball enthusiasts.', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (139, N'Bóng Chuyền Da Thi Đấu Thăng Long Dragon Master DG7700 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1735194880897.jpg?v=1735199116150', N'Bóng Chuyền Da Thi Đấu Thăng Long Dragon Master DG7700 - Hàng Chính Hãng
', N'Experience top-tier performance with the Thăng Long Dragon Master DG7700 Volleyball. Crafted to meet international standards, this volleyball features an excellent grip, ensuring optimal control and comfort during play. The ball is designed with soft touch technology for a smooth feel and durable construction, making it ideal for both professional and recreational use. With its vibrant blue, yellow, and white colors, it is both visually appealing and functional. Available for 1,050,000 VND, this official size 5 ball is a must-have for volleyball enthusiasts.






', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (140, N'Bộ luyện tập Đội tuyển Bóng đá Quốc gia 2025 "Blue" MJ-E4047-29 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/10-1742178409663.jpg?v=1742178420100', N'Bộ luyện tập Đội tuyển Bóng đá Quốc gia 2025 "Blue" MJ-E4047-29 - Hàng Chính Hãng
', N'Show your support for the national football team with the Động Lực National Football Team Training Kit 2025 in vibrant blue. Featuring a dynamic design with abstract patterns and the national flag, this training kit is made for comfort and performance. Crafted from breathable fabric, it provides excellent flexibility and moisture control, perfect for training sessions. Available in sizes S, M, L, XL, 2XL, and 3XL, the set is priced at 398,000 VND, offering great value for football enthusiasts looking for stylish and practical gear.', 11)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (141, N'Áo thi đấu Đội tuyển Bóng đá Quốc gia 2025 (bản Player) "Đỏ" MJ-E4040-03 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742176692649.jpg?v=1742176707080', N'Áo thi đấu Đội tuyển Bóng đá Quốc gia 2025 (bản Player) "Đỏ" MJ-E4040-03 - Hàng Chính Hãng', N'Support your national football team with the official Động Lực National Football Team Player Jersey 2025 in bold red. Featuring vibrant yellow accents, this jersey is designed for both comfort and performance, with breathable fabric that ensures flexibility and moisture control during intense matches. Ideal for fans and players, this jersey is available in sizes S, M, L, XL, 2XL, and 3XL. Priced at 750,000 VND, it is a premium choice for those who want to show their team spirit in style. Perfect for both casual wear and sporting events.', 11)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (142, N'Bộ quần áo bóng đá Jogarbola Vibrant "D.Purple" MJ-TP0924.B02-01 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1729654482457.jpg?v=1729660781827', N'Bộ quần áo bóng đá Jogarbola Vibrant "D.Purple" MJ-TP0924.B02-01 - Hàng Chính Hãng
', N'Get ready for your next game with the Jogarbola Vibrant "D.Purple" Football Kit. This stylish kit features a dynamic purple and blue design, offering both comfort and performance on the field. Made from high-quality fabric, it ensures breathability and flexibility for optimal movement during play. Available in sizes S, M, L, XL, and 2XL, this kit is priced at 255,000 VND. Perfect for both training and matches, it delivers the ideal combination of style and functionality for football enthusiasts.', 11)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (143, N'Women''s Jogarbola Workout Shirt', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9028-02-01-1686824149952.jpg?v=1686826222627', N'Áo tập thể thao Jogarbola nữ "Hồng" JG-9028-02 - Hàng Chính Hãng', N'Stay stylish and comfortable with the Jogarbola Women''s Training Top in a soft pink shade. Designed for active women, this top offers a modern cropped fit, perfect for a variety of workouts or casual wear. Made with breathable, stretchable fabric, it ensures maximum comfort and flexibility during your activities. Available in sizes S, M, and L, the top is priced at 339,000 VND, down from 395,000 VND, making it a great value for your fitness wardrobe.', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (144, N'Women''s Jogarbola Workout Pants', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9030-01-01-1686824594477.jpg?v=1686826204057', N'Quần Thể Thao', N'Mô tả đang cập nhật', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (145, N'Bộ thi đấu bóng chuyền Sao Vàng Combat ', N'https://bizweb.dktcdn.net/100/485/982/products/22-1706526254083.jpg?v=1706527351447', N'rfdsf', N'eger', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (146, N'Women''s Jogarbola Workout Shirt', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9028-01-01-1686824071474.jpg?v=1686826130840', N'Áo tập thể thao Jogarbola nữ "Xanh Ngọc" JG-9028-01 - Hàng Chính Hãng
', N'Stay comfortable and stylish with the Jogarbola Women''s Training Shorts in classic black. Designed for active women, these shorts offer a perfect blend of comfort and flexibility, ideal for various workouts or casual wear. Made with breathable and stretchy fabric, they provide ease of movement and support. Available in sizes M and L, these training shorts are priced at 339,000 VND, down from 395,000 VND, offering great value for your activewear collection. Perfect for staying cool and confident during your fitness sessions.', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (147, N'Women''s Jogarbola Workout Shirt', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9028-01-01-1686824071474.jpg?v=1686826130840', N'Áo tập thể thao Jogarbola nữ "Xanh Ngọc" JG-9028-01 - Hàng Chính Hãng
', N'Stay comfortable and stylish with the Jogarbola Women''s Training Shorts in classic black. Designed for active women, these shorts offer a perfect blend of comfort and flexibility, ideal for various workouts or casual wear. Made with breathable and stretchy fabric, they provide ease of movement and support. Available in sizes M and L, these training shorts are priced at 339,000 VND, down from 395,000 VND, offering great value for your activewear collection. Perfect for staying cool and confident during your fitness sessions.', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (148, N'Kids Skateboards 4 to 7 Years Old - Play 120 Cartoon Textures', N'https://contents.mediadecathlon.com/p2444102/k$a54f1e42016e11e0dd43c21532853437/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-tre%CC%89-em-t%C6%B0%CC%80-4-%C4%91%C3%AA%CC%81n-7-tu%C3%B4%CC%89i-play-120-ho%CC%A3a-ti%C3%AA%CC%81t-ho%E1%BA%A1t-h%C3%ACnh-decathlon-8640793.jpg?f=768x0&format=auto', N'Ván trượt trẻ em từ 4 đến 7 tuổi - Play 120 họa tiết hoạt hình
DECATHLON

Mã sản phẩm: 8640793', N'Introduce your little one to the joy of skateboarding with the Play 120 Children''s Skateboard. Designed for kids aged 4 to 7, this skateboard features a fun, colorful cartoon theme with a playful space design. The sturdy board and yellow wheels offer great stability and are perfect for young beginners learning to balance. With a price of 899,000 VND, this skateboard is a fun, exciting way to keep your child active and entertained while developing their coordination and balance skills.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (149, N'Vulca 100 Skateboard and Long Skateboard Boots for Adults - Black/White', N'https://contents.mediadecathlon.com/p1822393/k$e340c49b3ec0ebc3ae8cbed5e91ed6dc/gia%CC%80y-c%C3%B4%CC%89-th%C3%A2%CC%81p-tr%C6%B0%C6%A1%CC%A3t-v%C3%A1n-v%C3%A0-tr%C6%B0%E1%BB%A3t-v%C3%A1n-d%C3%A0i-vulca-100-cho-ng%C6%B0%C6%A1%CC%80i-l%C6%A1%CC%81n-%C4%91en-tr%E1%BA%AFng-decathlon-8577224.jpg?f=768x0&format=auto', N'Vulca Low Skateboarding Shoes for Adults – Black/White', N'These stylish Vulca Low Skateboarding Shoes are perfect for adults who enjoy both comfort and performance. Designed with a classic black and white color combination, these shoes are ideal for skating or casual wear. They feature a durable and flexible design with comfortable cushioning, providing excellent grip and support. Priced at 739,000 VND, they offer great value and come with a 50% discount for a limited time. Perfect for skateboarders looking for a reliable, stylish pair of shoes for their next ride.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (150, N'Multi-Purpose Bike Repair Tool 100', N'https://contents.mediadecathlon.com/p1115060/k$3560e74f25865d27cd2d2857525ba97a/d%E1%BB%A5ng-c%E1%BB%A5-s%E1%BB%ADa-xe-%C4%91%E1%BA%A1p-%C4%91a-n%C4%83ng-100-decathlon-8386669.jpg?f=768x0&format=auto', N'B''Twin Multi-Tool for Bicycle Repair

', N'Keep your bike in top condition with the B''Twin Multi-Tool, designed for quick and efficient bicycle repairs on the go. Featuring multiple tools in one compact design, this essential toolset includes various wrenches and screwdrivers to handle any maintenance task while cycling. Lightweight and durable, it''s the perfect companion for every rider. Priced at only 99,000 VND, this multi-tool is currently on sale with a 50% discount. A must-have for cyclists who need reliability and convenience in their toolkits.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (151, N'Long Skateboard - Carve 540 Pattern', N'https://contents.mediadecathlon.com/p1645122/k$4325a6ca56dd59e9c9518efd1f4e6b75/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-da%CC%80i-carve-540-ho%CC%A3a-ti%C3%AA%CC%81t-decathlon-8523398.jpg?f=768x0&format=auto', N'Carve 540 Longboard with Vibrant Design – 3,399,000 VND

', N'Experience smooth rides with the Carve 540 Longboard, featuring a vibrant and playful design with colorful frog and plant patterns. This longboard is built for durability, offering great control and comfort during your rides. Perfect for both beginners and experienced skaters, the Carve 540 ensures stability and easy maneuverability. It is priced at 3,399,000 VND, with a 50% discount currently available, making it an excellent choice for those seeking style and performance. Get ready to cruise in style with this high-quality longboard!', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (152, N'Self Adhesive Sandpaper For Skateboard', N'https://contents.mediadecathlon.com/p1291109/k$7d9a8109afa0575c515c0320533beb50/gi%C3%A2%CC%81y-nha%CC%81m-t%C6%B0%CC%A3-di%CC%81nh-cho-va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-decathlon-8111158.jpg?f=768x0&format=auto', N'Self-Adhesive Skateboard Grip Tape – 119,000 VND

', N'Ensure better traction and control with this self-adhesive skateboard grip tape. Designed for durability and ease of application, this high-quality tape provides a secure grip for a safer and smoother ride. The black grip tape is ideal for any skateboard or longboard, offering superior performance for both beginners and experienced skaters. Available for just 119,000 VND, it’s the perfect accessory for your board.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (153, N'Sport Backpack 17L - Red', N'https://contents.mediadecathlon.com/p2704911/k$5584c523b718cf12890a01828cf907dc/balo-th%E1%BB%83-thao-17l-%C4%91%E1%BB%8F-kipsta-8887029.jpg?f=768x0&format=auto', N'Kipsta 17L Sports Backpack – Red

', N'Carry your gear in style with the Kipsta 17L Sports Backpack in a bold red color. This compact yet spacious backpack is designed for active individuals, offering enough room for your essentials while remaining lightweight. With its vibrant color and durable material, it’s perfect for both sports activities and casual use. Priced at 245,000 VND, it is currently available with a 50% discount, making it a great value. Ideal for those looking for a practical, stylish, and affordable sports backpack.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (154, N'Adult 1-Row Roller Skates FIT100 - Black', N'https://contents.mediadecathlon.com/p2075761/k$481f6df57ca8e82513e265ea6e5ba029/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-fit100-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-%C4%91en-oxelo-8614734.jpg?f=768x0&format=auto', N'Oxelo FIT100 Inline Skates for Adults – Black

', N'Take your skating experience to the next level with the Oxelo FIT100 Inline Skates. Designed for comfort and durability, these black skates are perfect for adult beginners or those looking to enjoy a smooth, controlled ride. With a sturdy build and reliable wheels, they offer great performance whether you''re skating outdoors or on smooth surfaces. Priced at 1,399,000 VND, these skates are currently available with a 50% discount, making them an affordable choice for those seeking a fun and practical way to stay active.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (155, N'Adult 1-Row Roller Skates FIT100 - Black', N'https://contents.mediadecathlon.com/p2152434/k$a357a00dc44f572d2c01f75ead47533c/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-kaki-nh%E1%BA%A1t-oxelo-8738741.jpg?f=768x0&format=auto', N'Oxelo Freeride MF500 Inline Skates for Adults – Khaki

', N'Elevate your skating with the Oxelo Freeride MF500 Inline Skates in stylish khaki. Perfect for adults who enjoy both comfort and performance, these skates are designed for freeride skating, offering excellent stability, maneuverability, and durability. With their high-quality build and sleek design, they’re ideal for both beginners and experienced skaters. Priced at 3,399,000 VND, these skates are currently on sale with a 50% discount, making them an excellent value for anyone looking to enjoy smooth, controlled rides.', 8)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (156, N'Freeride MF500 1-Row Roller Skates for Adults - Light Kaki', N'https://contents.mediadecathlon.com/p2152454/k$464ac1042400d991f1c7ec745f4732c9/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-1-h%C3%A0ng-freeskate-mf900-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-xanh-l%C3%A1-oxelo-8738700.jpg?f=768x0&format=auto', N'Oxelo Freeskate MF900 Inline Skates for Adults – Green

', N'Step up your skating game with the Oxelo Freeskate MF900 Inline Skates, designed for adults who love freestyle skating. These high-performance skates feature a sleek green design, providing both style and functionality. Engineered for durability and speed, the skates offer a comfortable fit and excellent control, ideal for both urban and park skating. Priced at 3,999,000 VND, these skates are currently available with a 50% discount, making them a great value for anyone looking to enhance their skating experience.', 8)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (157, N'Foot Protector Roller Skate Socks - 100 Grey', N'https://contents.mediadecathlon.com/p2487620/k$a712df6a50d1e3dbb53f36d316ae24e9/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2487611/k$2440cf092c8fc4ec19481457e1638f56/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2487611/k$2440cf092c8fc4ec19481457e1638f56/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto', 8)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (158, N'Freeride MF500 1-Row Roller Skates for Adults - White', N'https://contents.mediadecathlon.com/p2152966/k$a28397880ee5a3050ebf20dfa87a209b/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto', N'https://contents.mediadecathlon.com/p2152965/k$ba8f7d0763d203287d9668aad97b4576/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto', N'https://contents.mediadecathlon.com/p2152965/k$ba8f7d0763d203287d9668aad97b4576/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto', 8)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (159, N'Women''s Short Sleeve Equestrian Polo Shirt 500 - Green', N'https://contents.mediadecathlon.com/p2126795/k$2dd086a13773ad87b35c44a083f0bc0a/a%CC%81o-polo-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-cho-n%C6%B0%CC%83-ng%C4%83%CC%81n-tay-500-xanh-l%C3%A1-fouganza-8669932.jpg?f=768x0&format=auto', N'Fouganza Women''s Polo Shirt for Equestrian Riding – Short Sleeve, Green', N'Stay stylish and comfortable during your equestrian rides with the Fouganza Women''s Polo Shirt. Designed for active riders, this green polo shirt offers both flexibility and breathability, ensuring you stay cool and comfortable. The short sleeves and lightweight fabric are perfect for outdoor activities, providing a flattering fit while allowing freedom of movement. Priced at 295,000 VND, this shirt is currently available with a 50% discount, making it an excellent addition to your riding wardrobe.', 9)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (160, N'Equestrian Helmet 100 - Black', N'https://contents.mediadecathlon.com/p2126483/k$43cce0b9a8dcdf2ce17e46a4a404e388/mu%CC%83-ba%CC%89o-hi%C3%AA%CC%89m-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-100-%C4%91en-fouganza-961392.jpg?f=768x0&format=auto', N'Fouganza 100 Equestrian Helmet for Riding – Black

', N'Ensure safety and comfort with the Fouganza 100 Equestrian Helmet, designed for riders who prioritize protection. This black helmet is perfect for beginners and experienced equestrians alike, offering a snug and secure fit. Made with durable materials and breathable padding, it keeps you safe and cool during your rides. Priced at 539,000 VND, it is currently available with a 50% discount, making it an affordable option for those looking for reliable head protection while riding.', 9)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (161, N'Children''s Riding Body Protective Vest Protection Level 2 - 100 Black', N'https://contents.mediadecathlon.com/p2588818/k$ade7644ecde359ccea67fb08f7ea5b19/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2588841/k$74a4968a9b818c822ae5a7949ab97528/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2588841/k$74a4968a9b818c822ae5a7949ab97528/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto', 9)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (162, N'Men''s Beginner Riding Pants - 100 Black', N'https://contents.mediadecathlon.com/p2800958/k$95e4358461d7712a2fa075deb24147be/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2800956/k$fe2e58480c7b69212b284133b7340e6b/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2800956/k$fe2e58480c7b69212b284133b7340e6b/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto', 9)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (163, N'Lightweight & Wind-Sensitive Kite - MFK 140 Octopus Motif', N'https://contents.mediadecathlon.com/p2481139/k$b70d18a61fd0c41b324ebf0b032048c7/di%C3%AA%CC%80u-th%E1%BA%A3-nh%E1%BA%B9-nh%E1%BA%A1y-gi%C3%B3-mfk-140-h%E1%BB%8Da-ti%E1%BA%BFt-con-b%E1%BA%A1ch-tu%E1%BB%99c-orao-8306395.jpg?f=768x0&format=auto', N'5/5
There is a specific and very special type of joy that can only be had by chasing a stunned-looking octopus as it flutters erratically across the park. Even my father in law had fun. 10/10 would buy again.', N'5/5
There is a specific and very special type of joy that can only be had by chasing a stunned-looking octopus as it flutters erratically across the park. Even my father in law had fun. 10/10 would buy again.', 10)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (164, N'2 in 1 kite - Izypilot 100 green/blue', N'https://contents.mediadecathlon.com/p1210414/k$603bc7c640643c958d1217281c55626c/di%C3%AA%CC%80u-2-trong-1-izypilot-100-xanh-l%C3%A1-xanh-d%C6%B0%C6%A1ng-orao-8394873.jpg?f=768x0&format=auto', N'2-in-1 design makes it easy for kids to convert from a fixed kite (1 line) to a controllable kite (2 lines)! 

The kite combines 2 lines and 1 line, suitable for kids from 5 years old.', N'Product benefits

Aerodynamics
Fly even in very light or unstable winds => Wind speeds from 15 to 40 km/h.

Easy to assemble
Izy system + kite tail bag + quick-attach kite line connector

Flexibility
2 in 1! Convert from a single-line kite to a double-line kite in a snap

Durability
"Shock Ring" nose. Woven canvas, sturdy ripstop material

Easy to use
The kite flies automatically when pulled in the 1-line position. Adjustable control bar, limited falling
', 10)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (165, N'2 in 1 kite - Izypilot 100 green/blue', N'https://contents.mediadecathlon.com/p1210414/k$603bc7c640643c958d1217281c55626c/di%C3%AA%CC%80u-2-trong-1-izypilot-100-xanh-l%C3%A1-xanh-d%C6%B0%C6%A1ng-orao-8394873.jpg?f=768x0&format=auto', N'2-in-1 design makes it easy for kids to convert from a fixed kite (1 line) to a controllable kite (2 lines)! 

The kite combines 2 lines and 1 line, suitable for kids from 5 years old.', N'Product benefits

Aerodynamics
Fly even in very light or unstable winds => Wind speeds from 15 to 40 km/h.

Easy to assemble
Izy system + kite tail bag + quick-attach kite line connector

Flexibility
2 in 1! Convert from a single-line kite to a double-line kite in a snap

Durability
"Shock Ring" nose. Woven canvas, sturdy ripstop material

Easy to use
The kite flies automatically when pulled in the 1-line position. Adjustable control bar, limited falling
', 10)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (166, N'Butterfly kite size L - CN KITE 160 pink', N'https://contents.mediadecathlon.com/p2174463/k$bf319016766986a49fe631e60cd58593/di%E1%BB%81u-c%C3%A1nh-b%C6%B0%E1%BB%9Bm-c%E1%BB%A1-l-cn-kite-160-h%E1%BB%93ng-orao-8758434.jpg?f=768x0&format=auto', N'Butterfly kite size L - CN KITE 160 pink
', N'Easy to assemble and durable!

A single-line kite to discover kite flying with family and friends!

• Product code 8758434
Product benefits

Aerodynamics
Light or slightly unstable wind conditions. Wind speeds from 5 to 40 km/h.

Durability
Kite fabric (technical textile) and reinforced for durability.

Easy to use
The kite is easy to take off and fly. The kite is easy to assemble!', 10)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (167, N'ONE-STRING KITE CRANK WITH STRING - Green', N'https://contents.mediadecathlon.com/p1304104/k$bb8608f09b7aee439907d23c4b6305ce/tay-quay-c%C3%B3-d%C3%A2y-d%C3%A0nh-cho-di%E1%BB%81u-m%E1%BB%99t-d%C3%A2y-xanh-l%C3%A1-c%C3%A2y-orao-8494999.jpg?f=768x0&format=auto', N'ONE-STRING KITE CRANK WITH STRING - Green', N'Required for connecting the MFK 100 kite, or replacing broken lines in the "MFK" single-line kite product line
', 10)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (168, N'Breathable Weightlifting Gloves for Women - Gray', N'https://contents.mediadecathlon.com/p2069756/k$8a8052d11f2e2d38800940916e5ad29a/g%C4%83ng-tay-t%C3%A2%CC%A3p-c%C6%B0%CC%89-ta%CC%A3-tho%C3%A1ng-kh%C3%AD-cho-n%C6%B0%CC%83-xa%CC%81m-domyos-8595215.jpg?f=768x0&format=auto', N'Breathable Weightlifting Gloves for Women - Gray
', N'Lightweight, ultra-breathable gloves that make you forget you''re wearing them. Specially designed for women''s hands. Thick material in the right place protects the hand without restricting movement.

Our team designed these women''s weightlifting gloves just for you.

• Product code 8595215
Product benefits

Sweat-wicking
Breathable fabric with a cut-out design on the top.', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (169, N'Set of 2 1kg dumbbells - Green', N'https://contents.mediadecathlon.com/p2720162/k$c672746e4e4c5bfd8193c9a1cd25ac2a/b%C3%B4%CC%A3-2-ta%CC%A3-c%E1%BA%A7m-tay-1-kg-xanh-l%C3%A1-domyos-8336571.jpg?f=768x0&format=auto', N'Set of 2 1kg dumbbells - Green', N'Comfortable grip. Shape prevents the dumbbell from rolling. Helps increase the difficulty of squats, lunges, and curls.

Dumbbells are an indispensable product in the training equipment set. The product has 6 weight sizes to suit your training needs.

• Product code 8336571
Product benefits

Versatility
6 options from 500g to 5kg to suit your needs! Exercise instructions included!

Sturdiness
Convenient: no rolling on the floor!

Easy to maintain
The glossy coating is easy to clean and leaves no marks on the floor!
', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (170, N'15L Sports Drawstring Bag - Black', N'https://contents.mediadecathlon.com/p1872651/k$e272faf3c4fded72e8eb15b8e6b3038f/t%C3%BAi-d%C3%A2y-r%C3%BAt-th%E1%BB%83-thao-15l-%C4%91en-domyos-8584676.jpg?f=768x0&format=auto', N'15L Sports Drawstring Bag - Black
', N'Description
Compact sports bag with trendy style. Convenient drawstring design, allowing for multiple wearing styles: shoulder, back or hand carry.

Sports backpack is designed to hold and carry sports items. The backpack is smartly and conveniently designed, can be carried anytime, anywhere.

• Product code 8584676', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (171, N'Non-slip yoga towel - Gray', N'https://contents.mediadecathlon.com/p2737645/k$37c2a9ed7ccab9ad83321f2450513f29/kh%C4%83n-tr%E1%BA%A3i-t%E1%BA%ADp-yoga-ch%E1%BB%91ng-tr%C6%A1n-tr%C6%B0%E1%BB%A3t-x%C3%A1m-xanh-d%C6%B0%C6%A1ng-kimjaly-8576776.jpg?f=768x0&format=auto', N'Non-slip yoga towel - Gray
', N'Note on how to wash and preserve to maintain the quality of the mat.

Yoga mat towels help improve grip when performing yoga movements, while also helping to keep clean and absorb sweat after practice.', 13)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (172, N'Men''s running shoes - Run One grey', N'https://contents.mediadecathlon.com/p207647/k$2586dfd49665dd378518222c7093088e/gia%CC%80y-ch%E1%BA%A1y-b%E1%BB%99-nam-run-one-x%C3%A1m-decathlon-8351755.jpg?f=768x0&format=auto', N'Men''s running shoes - Run One grey
', N'These shoes have an EVA foam sole, making them comfortable and lightweight for beginner runners.

Beginner runner shoes.

• Product code 8351755
', 12)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (173, N'Men''s running shoes - Jogflow 190.1 navy blue', N'https://contents.mediadecathlon.com/p2636506/k$a9b8b91d2467eacdc3f7f5cc94ac6fb7/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-jogflow-190-1-xanh-navy-kiprun-8874411.jpg?f=768x0&format=auto', N'Men''s running shoes - Jogflow 190.1 navy blue', N'hese shoes feature soft cushioning that absorbs shock effectively, providing a light feel and protecting your feet while running.

Lightweight running shoes designed with cushioning for running up to 20 km per week.

• Product code 8874411
Product benefits

Shock absorbing
The IMEVA foam midsole absorbs shock.

Responsive
The shoe is flexible to optimize foot movement.

Comfortable fit
Our testers scored it 8.2/10 for comfort.', 12)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (174, N'Men''s running shoes with carbon midsole - KD900X white', N'https://contents.mediadecathlon.com/p2563895/k$198cfc4256e647a8a07a206e7e9f2b7d/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-c%C3%B3-%C4%91%E1%BB%87m-cacbon-%E1%BB%9F-%C4%91%E1%BA%BF-gi%E1%BB%AFa-kd900x-tr%E1%BA%AFng-xanh-l%C3%A1-t%C3%ADm-kiprun-8801426.jpg?f=768x0&format=auto', N'Men''s running shoes with carbon midsole - KD900X white', N'Bạn đã sẵn sàng phát huy khả năng của bản thân và đánh bại kỷ lục của chính mình chưa? Với lớp đệm cacbon và mút xốp VFOAM PLUS kiểu mới, cuộc chạy marathon của bạn sẽ tràn đầy phấn khởi!

Are you ready to push yourself and beat your own records? With carbon cushioning and new VFOAM PLUS foam, your marathon will be full of excitement! 

The KD900X LD was co-designed with our athletes to help runners take on long-distance races.', 12)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (175, N'Men''s running shoes with carbon midsole - KD900X white', N'https://contents.mediadecathlon.com/p2563895/k$198cfc4256e647a8a07a206e7e9f2b7d/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-c%C3%B3-%C4%91%E1%BB%87m-cacbon-%E1%BB%9F-%C4%91%E1%BA%BF-gi%E1%BB%AFa-kd900x-tr%E1%BA%AFng-xanh-l%C3%A1-t%C3%ADm-kiprun-8801426.jpg?f=768x0&format=auto', N'Men''s running shoes with carbon midsole - KD900X white', N'Bạn đã sẵn sàng phát huy khả năng của bản thân và đánh bại kỷ lục của chính mình chưa? Với lớp đệm cacbon và mút xốp VFOAM PLUS kiểu mới, cuộc chạy marathon của bạn sẽ tràn đầy phấn khởi!

Are you ready to push yourself and beat your own records? With carbon cushioning and new VFOAM PLUS foam, your marathon will be full of excitement! 

The KD900X LD was co-designed with our athletes to help runners take on long-distance races.', 12)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (176, N'Pack of 2 thin running socks - Run 500 black', N'https://contents.mediadecathlon.com/p2590640/k$48e398d799127558c5d9d2840880ff58/g%C3%B3i-2-%C4%91%C3%B4i-t%E1%BA%A5t-ch%E1%BA%A1y-b%E1%BB%99-m%E1%BB%8Fng-run-500-%C4%91en-kiprun-8810965.jpg?f=768x0&format=auto', N'Pack of 2 thin running socks - Run 500 black
', N'
Why choose thin socks? Finely woven with a ventilation zone at the instep, these running socks are ideal for runners looking for lightness and freshness in the summer.

Running socks protect your feet from blisters while running.

• Product code 8810965
Product benefits

Quick-drying
Polyamide fibers and ventilation zone at the instep

Lightweight
Finely woven without loops. The sock collar is a few millimeters above the ankle.', 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (177, N'Soft running water bottle 500ML - SA2020 blue', N'https://contents.mediadecathlon.com/p1286356/k$8363a17fb2d8e74b0e0699b5ed4f4f34/b%C3%ACnh-n%C6%B0%E1%BB%9Bc-m%E1%BB%81m-ch%E1%BA%A1y-b%E1%BB%99-500ml-sa2020-xanh-d%C6%B0%C6%A1ng-kiprun-8605419.jpg?f=768x0&format=auto', N'Soft running water bottle 500ML - SA2020 blue
', N'Always feel comfortable when running on the trail. Thanks to its flexible shape, the 500 ml water bottle is easy to carry in your hand and can be folded into a running bag or jacket.

The 500 mL running water bottle allows you to comfortably carry your drink while running on the trail.

• Product code 8605419
Product benefits

Compact design
Save space thanks to the bottle''s flexible and compressible material.

Noise level
The bottle does not make noise when running because the air inside is easily removed.

Lightweight
Feel light when running: the bottle weighs only 35 g when empty.

Easy to use
Drink easily with the design of the bottle cap with a rotating drinking valve.

Comfortable to hold
The silicone drinking valve is easy to use and comfortable to drink while running.', 12)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (178, N'Foldable pool table BT 500 US - Gray', N'https://contents.mediadecathlon.com/p2350346/k$6e1fc60b941ac57fc814b41f14b28237/b%C3%A0n-bida-g%E1%BA%A5p-%C4%91%C6%B0%E1%BB%A3c-bt-500-us-x%C3%A1m-pongori-8640446.jpg?f=768x0&format=auto', N'Foldable pool table BT 500 US - Gray
', N'Smart Pool Table: Portable, Foldable, and Has Plenty of Storage. This compact, accurate pool table will please both young and old.

Experience American-style pool at home with this compact, foldable friend. Have fun practicing and improving your pool performance.

• Product Code 8640446
Product Benefits

Compact Design
Space Saving: The design folds up after playing.

Easy to Use
Comes with a storage compartment so you can store your cues and balls and take them out when needed.

Easy to Move
Move and store the pool table easily thanks to the 4 caster wheels.

Accuracy
Similar dimensions to a standard pool table (L=2W).

Easy to Open/Close
Fold or unfold the table in less than 3 minutes!

Assembly Time
Set up this pool table in just 30 minutes with 2 people!

Stability
The table leg leveler keeps the table flat and absolutely stable.', 14)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (179, N'Mini pool table BT 50 US - Grey felt', N'https://contents.mediadecathlon.com/p2356733/k$37fb623fdff60f8cb98b67f71f193fbf/b%C3%A0n-bida-mini-bt-50-us-n%E1%BB%89-x%C3%A1m-pongori-8796637.jpg?f=768x0&format=auto', N'Mini pool table BT 50 US - Grey felt', N'Easy to carry around for fun thanks to its light weight and carry handle. Want to play billiards while travelling? Now it''s possible!

We''ve designed this ultra-compact and sturdy pool table for learning to play billiards even in the smallest of playing areas.

• Product code 8796637
Product benefits

Compact design
Easy to store thanks to its ultra-compact dimensions: 78 x 53 cm.

Easy to move
Easy to transport thanks to the carry handle, light weight and removable mechanism.

Easy to use
Place it on any table and start playing right away!

Precision
The pool table offers excellent ball roll and bounce for high-quality play.

Easy to assemble
Install the 4 legs (8 cm) in less than 5 minutes!

Durability
The table does not move during play thanks to the support legs and thickness.

Stability
The mini pool table is sturdy thanks to the pads under the legs.', 14)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (180, N'Essential Black 35L Sports Bag', N'https://contents.mediadecathlon.com/p2193917/k$9ed6e075962cd691016e034a5d60ea3a/t%C3%BAi-th%E1%BB%83-thao-ti%E1%BB%87n-l%E1%BB%A3i-35l-essential-%C4%91en-xanh-d%C6%B0%C6%A1ng-kipsta-8580096.jpg?f=768x0&format=auto', N'Essential Black 35L Sports Bag', N'Wondering where to put your bag after use? We designed this shoulder bag to be compact, sturdy, and folds into the side pocket of the bag for easy storage.

The handy shoulder bag makes it easy to carry your sports equipment. Folds into the side pocket of the bag for easy storage!', 15)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (181, N'V900 Volleyball - White', N'https://contents.mediadecathlon.com/p1347823/k$b6a6061bffc75696dded1f053819691f/qu%E1%BA%A3-b%C3%B3ng-chuy%E1%BB%81n-v900-tr%E1%BA%AFng-%C4%91%E1%BB%8F-kipsta-8408660.jpg?f=768x0&format=auto', N'V900 Volleyball - White', N'Our product engineer - who is also a volleyball player - developed this FIVB-approved volleyball. The 12-piece construction offers a unique design for every practice and match.', 16)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (182, N'Pickleball Racket - 500 Blue', N'https://contents.mediadecathlon.com/p2312625/k$efb4b76f48cdba35957c13b98fd3eba4/v%C6%A1%CC%A3t-pickleball-500-xanh-d%C6%B0%C6%A1ng-artengo-8767140.jpg?f=768x0&format=auto', N'Pickleball Racket - 500 Blue', N'The thin, thick head, soft grip and 6mm honeycomb structure inside make this 500 racket very comfortable and stable to use.', 18)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (183, N'Multi-surface soccer shoes - Viralto III orange', N'https://contents.mediadecathlon.com/p2671911/k$a4a121b4a7fe5f3691bb79d7a7bbc354/gi%C3%A0y-%C4%91%C3%A1-b%C3%B3ng-%C4%91a-d%E1%BA%A1ng-m%E1%BA%B7t-s%C3%A2n-viralto-iii-cam-kipsta-8843842.jpg?f=768x0&format=auto', N'Multi-surface soccer shoes - Viralto III orange', N'Looking for a comfortable, innovative football boot? With an Air Mesh upper and multidirectional Flex-H sole, the Viralto III delivers a great feel so you can control the game!', 11)
INSERT [dbo].[Product] ([pID], [pName], [image], [title], [description], [cID]) VALUES (185, N'Kim Anh1', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHwAfAMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAADBAIFBgEAB//EADsQAAIBAwIDBgMFBgYDAAAAAAECAwAEERIhBTFBEyJRYXGBBjKRI0KxwdEUQ5Kh4fFSU2KC0vAVJDP/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIEAwX/xAAiEQEBAAICAgICAwAAAAAAAAAAAQIRAyESMQRRQaETI0L/2gAMAwEAAhEDEQA/ANyrCiq9JB9qIr7c65bWdR6ZjcVXK9Hjkp7LSyRqYjaq5JKZjfNBU05yprAcRXR8QcRQfft45PoxFbvVkViuNLo+KMn97YsP4WzS0IxfH1KcTJx8yKcn6flROGsNTagjDQe9O2EHX67V74oGLyJ9hlOY8jQeF924Riqc9OuY5UZ25daz5xpwq7j/APaXQO2vQN9EY7KBfX+3vU1kA+yFxg8v2fhi5PvJ1+vtXLWF71dOme+0j5R9lAnt/SmS6QJpkuwq/wCRw5MZ9Xz+dZ9XfTRvSAVrTbTacMB3732059sbfSpJaGYm4ispblhzu+JSYUe2eXvXoHKBjZR2VhH96aZu1lPmByz7GglEvZQRDxDjEo+9MTHEvoP6ClZZ7G9uzXED/ZXF7Nenl+y8Oj0x+hOwP86IkF4qgQcDsYY+i3EhL+p3H4UKW5kgBin4la2I5G34cmqQ+RIyQfcUr+y20vfTgV/dg/vppgGb12P40g0ytUg/nSuras/xriV3BP2aNoXoa9Fha9JPOjo48a+cjil0BtOc+BNHg4hfy', N'tuiii1', N'gfdgg1', 10)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Size] ON 

INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (1, 1, 5, 30, 320.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (2, 1, 6, 30, 320.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (3, 1, 7, 30, 320.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (4, 2, 6, 30, 630.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (5, 2, 7, 30, 630.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (6, 3, 9, 30, 455.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (7, 3, 10, 30, 455.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (8, 3, 11, 30, 455.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (12, 125, 2, 30, 37.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (13, 125, 3, 30, 37.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (14, 122, 1, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (15, 122, 2, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (16, 122, 3, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (17, 120, 2, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (18, 120, 3, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (19, 120, 4, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (20, 119, 2, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (21, 109, 1, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (22, 109, 2, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (23, 71, 5, 0, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (24, 71, 8, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (25, 71, 9, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (26, 71, 10, 30, 1000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (37, 126, 1, 30, 700000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (38, 126, 2, 30, 700000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (39, 127, 1, 30, 369000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (40, 127, 2, 30, 369000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (41, 127, 3, 30, 369000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (42, 128, 1, 30, 135000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (43, 128, 2, 30, 135000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (44, 128, 3, 30, 135000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (45, 128, 4, 30, 135000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (46, 129, 1, 30, 600000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (47, 129, 2, 30, 600000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (48, 130, 1, 30, 550000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (49, 130, 2, 30, 550000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (50, 131, 1, 30, 645000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (51, 131, 2, 30, 645000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (52, 131, 3, 30, 645000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (53, 131, 4, 30, 645000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (54, 132, 1, 30, 500000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (55, 132, 2, 30, 500000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (56, 132, 3, 30, 500000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (57, 133, 10, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (58, 133, 11, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (59, 133, 12, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (60, 133, 13, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (61, 134, 5, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (62, 134, 6, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (63, 134, 7, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (64, 134, 8, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (65, 134, 9, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (66, 134, 10, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (67, 134, 11, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (68, 134, 12, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (69, 134, 13, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (70, 135, 8, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (71, 135, 9, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (72, 135, 10, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (73, 135, 11, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (74, 135, 12, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (75, 135, 13, 30, 519000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (76, 136, 1, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (77, 136, 2, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (78, 136, 3, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (79, 136, 4, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (80, 137, 1, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (81, 137, 2, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (82, 137, 3, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (83, 137, 4, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (84, 138, 1, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (85, 138, 2, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (86, 138, 3, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (87, 138, 4, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (88, 139, 1, 30, 1050000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (89, 139, 2, 30, 1050000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (90, 140, 1, 30, 398000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (91, 140, 2, 30, 398000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (92, 140, 3, 30, 398000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (93, 140, 4, 30, 398000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (94, 141, 1, 30, 750000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (95, 141, 2, 30, 750000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (96, 141, 3, 30, 750000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (97, 141, 4, 30, 750000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (98, 142, 1, 30, 255000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (99, 142, 2, 30, 255000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (100, 142, 3, 30, 255000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (101, 142, 4, 30, 255000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (114, 145, 1, 30, 165000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (115, 145, 2, 30, 165000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (116, 145, 3, 30, 165000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (117, 145, 4, 30, 165000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (218, 162, 1, 30, 839000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (219, 162, 2, 30, 839000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (220, 162, 3, 30, 839000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (221, 162, 4, 30, 839000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (222, 161, 2, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (223, 161, 3, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (224, 161, 4, 30, 1399000.0000, 0)
GO
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (228, 160, 1, 30, 539000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (229, 160, 2, 30, 539000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (230, 160, 3, 30, 539000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (231, 159, 1, 30, 295000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (232, 159, 2, 30, 295000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (233, 159, 3, 30, 295000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (234, 159, 4, 30, 295000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (235, 158, 8, 30, 3599000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (236, 158, 9, 30, 3599000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (237, 158, 10, 30, 3599000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (238, 158, 11, 30, 3599000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (239, 158, 12, 30, 3599000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (240, 158, 13, 30, 3599000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (241, 157, 1, 30, 90000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (242, 157, 2, 30, 90000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (243, 157, 3, 30, 90000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (244, 156, 8, 30, 3999000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (245, 156, 9, 30, 3999000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (246, 156, 10, 30, 3999000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (247, 156, 11, 30, 3999000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (248, 156, 12, 30, 3999000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (249, 156, 13, 30, 3999000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (250, 155, 7, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (251, 155, 8, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (252, 155, 9, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (253, 155, 10, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (254, 155, 11, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (255, 155, 12, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (256, 155, 13, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (257, 154, 5, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (258, 154, 6, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (259, 154, 7, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (260, 154, 8, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (261, 154, 9, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (262, 154, 10, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (263, 154, 11, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (264, 154, 12, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (265, 154, 13, 30, 1399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (266, 153, 1, 30, 245000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (267, 153, 2, 30, 245000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (268, 153, 3, 30, 245000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (269, 152, 1, 29, 119000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (270, 151, 1, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (271, 151, 2, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (272, 151, 3, 30, 3399000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (273, 150, 1, 0, 190000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (274, 150, 2, 0, 290000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (275, 150, 3, 0, 390000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (276, 149, 5, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (277, 149, 6, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (278, 149, 7, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (279, 149, 8, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (280, 149, 9, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (281, 149, 10, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (282, 149, 11, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (283, 149, 12, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (284, 149, 13, 30, 739000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (285, 148, 1, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (286, 147, 1, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (287, 147, 2, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (288, 147, 3, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (289, 147, 4, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (290, 146, 1, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (291, 146, 2, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (292, 146, 3, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (293, 146, 4, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (294, 144, 1, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (295, 144, 2, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (296, 144, 3, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (297, 144, 4, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (298, 143, 1, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (299, 143, 2, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (300, 143, 3, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (301, 143, 4, 30, 339000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (302, 163, 1, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (303, 163, 2, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (304, 163, 3, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (305, 164, 1, 30, 459000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (306, 164, 2, 30, 459000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (307, 164, 3, 30, 459000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (309, 165, 2, 30, 459000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (310, 165, 3, 30, 459000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (311, 166, 2, 30, 539000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (312, 167, 2, 30, 69000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (313, 168, 1, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (314, 168, 2, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (315, 168, 3, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (316, 168, 4, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (317, 169, 2, 30, 199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (318, 170, 3, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (319, 171, 2, 30, 699000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (320, 171, 3, 30, 699000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (321, 172, 5, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (322, 172, 6, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (323, 172, 7, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (324, 172, 8, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (325, 172, 9, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (326, 172, 10, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (327, 172, 11, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (328, 172, 12, 30, 299000.0000, 0)
GO
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (329, 172, 13, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (330, 173, 7, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (331, 173, 8, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (332, 173, 9, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (333, 173, 10, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (334, 173, 11, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (335, 173, 12, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (336, 173, 13, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (337, 174, 6, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (338, 174, 7, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (339, 174, 8, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (340, 174, 9, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (341, 174, 10, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (342, 174, 11, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (343, 174, 12, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (344, 174, 13, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (345, 175, 6, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (346, 175, 7, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (347, 175, 8, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (348, 175, 9, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (349, 175, 10, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (350, 175, 11, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (351, 175, 12, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (352, 175, 13, 30, 4199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (353, 176, 1, 30, 129000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (354, 176, 2, 30, 129000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (355, 176, 3, 30, 129000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (356, 177, 1, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (357, 178, 4, 30, 5999000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (358, 179, 3, 30, 3199000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (359, 180, 2, 30, 299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (360, 181, 2, 30, 899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (361, 182, 2, 30, 1299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (362, 182, 3, 30, 1299000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (363, 183, 7, 30, 1899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (364, 183, 8, 30, 1899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (365, 183, 9, 30, 1899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (366, 183, 10, 30, 1899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (367, 183, 11, 30, 1899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (368, 183, 12, 30, 1899000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (369, 185, 1, 12, 520000.0000, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (370, 185, 3, 123, 4000000.0000, 0)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId], [quantity], [price], [isDeleted]) VALUES (371, 185, 4, 123, 4000000.0000, 0)
SET IDENTITY_INSERT [dbo].[Product_Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id], [size]) VALUES (1, N'M')
INSERT [dbo].[Size] ([id], [size]) VALUES (2, N'L')
INSERT [dbo].[Size] ([id], [size]) VALUES (3, N'XL')
INSERT [dbo].[Size] ([id], [size]) VALUES (4, N'2XL')
INSERT [dbo].[Size] ([id], [size]) VALUES (5, N'36')
INSERT [dbo].[Size] ([id], [size]) VALUES (6, N'37')
INSERT [dbo].[Size] ([id], [size]) VALUES (7, N'38')
INSERT [dbo].[Size] ([id], [size]) VALUES (8, N'39')
INSERT [dbo].[Size] ([id], [size]) VALUES (9, N'40')
INSERT [dbo].[Size] ([id], [size]) VALUES (10, N'41')
INSERT [dbo].[Size] ([id], [size]) VALUES (11, N'42')
INSERT [dbo].[Size] ([id], [size]) VALUES (12, N'43')
INSERT [dbo].[Size] ([id], [size]) VALUES (13, N'44')
INSERT [dbo].[Size] ([id], [size]) VALUES (14, N'5')
INSERT [dbo].[Size] ([id], [size]) VALUES (15, N'6')
INSERT [dbo].[Size] ([id], [size]) VALUES (16, N'7')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[SubImage] ON 

INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (557, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (558, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (559, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (560, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (621, 148, N'https://contents.mediadecathlon.com/p2381298/k$0c39485269f37e181bb44201d49d8720/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-tre%CC%89-em-t%C6%B0%CC%80-4-%C4%91%C3%AA%CC%81n-7-tu%C3%B4%CC%89i-play-120-ho%CC%A3a-ti%C3%AA%CC%81t-ho%E1%BA%A1t-h%C3%ACnh-decathlon-8640793.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (622, 148, N'https://contents.mediadecathlon.com/p2379520/k$f903a1c2851e582b4d69af659d826e10/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-tre%CC%89-em-t%C6%B0%CC%80-4-%C4%91%C3%AA%CC%81n-7-tu%C3%B4%CC%89i-play-120-ho%CC%A3a-ti%C3%AA%CC%81t-ho%E1%BA%A1t-h%C3%ACnh-decathlon-8640793.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (623, 148, N'https://contents.mediadecathlon.com/p2379514/k$e263124549dc7ad84e6a00513664fb1c/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-tre%CC%89-em-t%C6%B0%CC%80-4-%C4%91%C3%AA%CC%81n-7-tu%C3%B4%CC%89i-play-120-ho%CC%A3a-ti%C3%AA%CC%81t-ho%E1%BA%A1t-h%C3%ACnh-decathlon-8640793.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (624, 148, N'https://contents.mediadecathlon.com/p2379513/k$f2e6bb446f79530cee9db39ce4601c02/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-tre%CC%89-em-t%C6%B0%CC%80-4-%C4%91%C3%AA%CC%81n-7-tu%C3%B4%CC%89i-play-120-ho%CC%A3a-ti%C3%AA%CC%81t-ho%E1%BA%A1t-h%C3%ACnh-decathlon-8640793.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (625, 149, N'https://contents.mediadecathlon.com/p1822401/k$13f1a1c9f38f0bfd212843f69d8014b3/gia%CC%80y-c%C3%B4%CC%89-th%C3%A2%CC%81p-tr%C6%B0%C6%A1%CC%A3t-v%C3%A1n-v%C3%A0-tr%C6%B0%E1%BB%A3t-v%C3%A1n-d%C3%A0i-vulca-100-cho-ng%C6%B0%C6%A1%CC%80i-l%C6%A1%CC%81n-%C4%91en-tr%E1%BA%AFng-decathlon-8577224.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (626, 149, N'https://contents.mediadecathlon.com/p1822382/k$7634d165a3fd405f26d21bd29b737c37/gia%CC%80y-c%C3%B4%CC%89-th%C3%A2%CC%81p-tr%C6%B0%C6%A1%CC%A3t-v%C3%A1n-v%C3%A0-tr%C6%B0%E1%BB%A3t-v%C3%A1n-d%C3%A0i-vulca-100-cho-ng%C6%B0%C6%A1%CC%80i-l%C6%A1%CC%81n-%C4%91en-tr%E1%BA%AFng-decathlon-8577224.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (627, 149, N'https://contents.mediadecathlon.com/p1822400/k$cf62041d1f6be7800d9cddda2f107be3/gia%CC%80y-c%C3%B4%CC%89-th%C3%A2%CC%81p-tr%C6%B0%C6%A1%CC%A3t-v%C3%A1n-v%C3%A0-tr%C6%B0%E1%BB%A3t-v%C3%A1n-d%C3%A0i-vulca-100-cho-ng%C6%B0%C6%A1%CC%80i-l%C6%A1%CC%81n-%C4%91en-tr%E1%BA%AFng-decathlon-8577224.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (628, 149, N'https://contents.mediadecathlon.com/p1822380/k$6a622af66aded30540949a08ead06f5d/gia%CC%80y-c%C3%B4%CC%89-th%C3%A2%CC%81p-tr%C6%B0%C6%A1%CC%A3t-v%C3%A1n-v%C3%A0-tr%C6%B0%E1%BB%A3t-v%C3%A1n-d%C3%A0i-vulca-100-cho-ng%C6%B0%C6%A1%CC%80i-l%C6%A1%CC%81n-%C4%91en-tr%E1%BA%AFng-decathlon-8577224.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (629, 150, N'https://contents.mediadecathlon.com/p2659685/k$f8911ea0bb7712b3556e4f70ee88d909/d%E1%BB%A5ng-c%E1%BB%A5-s%E1%BB%ADa-xe-%C4%91%E1%BA%A1p-%C4%91a-n%C4%83ng-100-decathlon-8386669.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (630, 150, N'https://contents.mediadecathlon.com/p2658848/k$7d0b2473fc4258728ec2113c03519bc3/d%E1%BB%A5ng-c%E1%BB%A5-s%E1%BB%ADa-xe-%C4%91%E1%BA%A1p-%C4%91a-n%C4%83ng-100-decathlon-8386669.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (631, 150, N'https://contents.mediadecathlon.com/p1115057/k$8b4c52a802b41450be28a9911695e922/d%E1%BB%A5ng-c%E1%BB%A5-s%E1%BB%ADa-xe-%C4%91%E1%BA%A1p-%C4%91a-n%C4%83ng-100-decathlon-8386669.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (632, 150, N'https://contents.mediadecathlon.com/p1115059/k$a3eacff4ad3ca47aa05e813456ccefd5/d%E1%BB%A5ng-c%E1%BB%A5-s%E1%BB%ADa-xe-%C4%91%E1%BA%A1p-%C4%91a-n%C4%83ng-100-decathlon-8386669.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (633, 151, N'https://contents.mediadecathlon.com/p1420451/k$ea00495a943dee1921ec14f3c0a05396/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-da%CC%80i-carve-540-ho%CC%A3a-ti%C3%AA%CC%81t-decathlon-8523398.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (634, 151, N'https://contents.mediadecathlon.com/p1420203/k$6470064d706e8fc2e676ff52170f8a79/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-da%CC%80i-carve-540-ho%CC%A3a-ti%C3%AA%CC%81t-decathlon-8523398.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (635, 151, N'https://contents.mediadecathlon.com/p1420367/k$91bf613a99de0a516fc5a507852a1c3a/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-da%CC%80i-carve-540-ho%CC%A3a-ti%C3%AA%CC%81t-decathlon-8523398.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (636, 151, N'https://contents.mediadecathlon.com/p1420327/k$df607073dcfc787985b465ea917f1611/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-da%CC%80i-carve-540-ho%CC%A3a-ti%C3%AA%CC%81t-decathlon-8523398.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (637, 152, N'https://contents.mediadecathlon.com/p1232304/k$a9a411dc5356f4ce1519b3dccf269402/gi%C3%A2%CC%81y-nha%CC%81m-t%C6%B0%CC%A3-di%CC%81nh-cho-va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-decathlon-8111158.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (638, 152, N'https://contents.mediadecathlon.com/p1291178/k$6989d65393078685e267a2cf02bc330d/gi%C3%A2%CC%81y-nha%CC%81m-t%C6%B0%CC%A3-di%CC%81nh-cho-va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-decathlon-8111158.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (639, 152, N'https://contents.mediadecathlon.com/p1291037/k$eaabcf87c8cab9ac071361dc37a82dfc/gi%C3%A2%CC%81y-nha%CC%81m-t%C6%B0%CC%A3-di%CC%81nh-cho-va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-decathlon-8111158.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (640, 152, N'https://contents.mediadecathlon.com/p1291178/k$6989d65393078685e267a2cf02bc330d/gi%C3%A2%CC%81y-nha%CC%81m-t%C6%B0%CC%A3-di%CC%81nh-cho-va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-decathlon-8111158.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (641, 153, N'https://contents.mediadecathlon.com/p1760173/k$0a73c37c0b439cc4062a93cb05efb0b1/balo-th%E1%BB%83-thao-17l-%C4%91%E1%BB%8F-kipsta-8887029.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (642, 153, N'https://contents.mediadecathlon.com/p1760065/k$54c7aedbd9715fd788b5f89db7d5e6d1/balo-th%E1%BB%83-thao-17l-%C4%91%E1%BB%8F-kipsta-8887029.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (643, 153, N'https://contents.mediadecathlon.com/p1760065/k$54c7aedbd9715fd788b5f89db7d5e6d1/balo-th%E1%BB%83-thao-17l-%C4%91%E1%BB%8F-kipsta-8887029.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (644, 153, N'https://contents.mediadecathlon.com/p1760065/k$54c7aedbd9715fd788b5f89db7d5e6d1/balo-th%E1%BB%83-thao-17l-%C4%91%E1%BB%8F-kipsta-8887029.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (645, 154, N'https://contents.mediadecathlon.com/p2075873/k$0109625342e5e5b879c3f69bdcefad8d/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-fit100-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-%C4%91en-oxelo-8614734.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (646, 154, N'https://contents.mediadecathlon.com/p2075867/k$f7d9da8e6b237dd56921b26a69819ff8/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-fit100-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-%C4%91en-oxelo-8614734.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (647, 154, N'https://contents.mediadecathlon.com/p2075918/k$e12d27ec4f8c38fedc3bd935a863ff2c/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-fit100-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-%C4%91en-oxelo-8614734.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (648, 154, N'https://contents.mediadecathlon.com/p2075867/k$f7d9da8e6b237dd56921b26a69819ff8/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-fit100-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-%C4%91en-oxelo-8614734.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (649, 155, N'https://contents.mediadecathlon.com/p2152432/k$b8f8e2f1da651ce6beda51c5e825cd2f/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-kaki-nh%E1%BA%A1t-oxelo-8738741.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (650, 155, N'https://contents.mediadecathlon.com/p2152433/k$e8be4c6aa8b5bdfe0c65f95283aa24ba/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-kaki-nh%E1%BA%A1t-oxelo-8738741.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (651, 155, N'https://contents.mediadecathlon.com/p2152431/k$cf81dfc69dbbe6b44feef8c71152469e/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-kaki-nh%E1%BA%A1t-oxelo-8738741.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (652, 155, N'https://contents.mediadecathlon.com/p2152430/k$9722a5393c5f859cb5bc2e1d730a975c/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-kaki-nh%E1%BA%A1t-oxelo-8738741.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (653, 156, N'https://contents.mediadecathlon.com/p2152449/k$27fb88b0a94bf07b41fb4bef7d8f2172/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-1-h%C3%A0ng-freeskate-mf900-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-xanh-l%C3%A1-oxelo-8738700.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (654, 156, N'https://contents.mediadecathlon.com/p2152450/k$ea7b74d2817ae56a7807c816d45b0394/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-1-h%C3%A0ng-freeskate-mf900-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-xanh-l%C3%A1-oxelo-8738700.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (655, 156, N'https://contents.mediadecathlon.com/p2152448/k$1b82ffb5cfa6a6e8a6490171b2859ad2/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-1-h%C3%A0ng-freeskate-mf900-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-xanh-l%C3%A1-oxelo-8738700.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (656, 156, N'https://contents.mediadecathlon.com/p2152447/k$cd6d5e14cc3098102cd53fe0b047b219/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-1-h%C3%A0ng-freeskate-mf900-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-xanh-l%C3%A1-oxelo-8738700.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (657, 157, N'https://contents.mediadecathlon.com/p2487617/k$d3484ed6d9d58c284eaf6423a09ef3f7/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (658, 157, N'https://contents.mediadecathlon.com/p2487615/k$398452d73d78dd896a584caf5b7adbb3/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (659, 157, N'https://contents.mediadecathlon.com/p2487611/k$2440cf092c8fc4ec19481457e1638f56/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (660, 157, N'https://contents.mediadecathlon.com/p2487611/k$2440cf092c8fc4ec19481457e1638f56/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (661, 158, N'https://contents.mediadecathlon.com/p2152964/k$007495d0cbe1266971d6bb90bdb9cb1a/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (662, 158, N'https://contents.mediadecathlon.com/p2152963/k$2cfcd283d65374bb723c277e3fba0582/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (663, 158, N'https://contents.mediadecathlon.com/p2152965/k$ba8f7d0763d203287d9668aad97b4576/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (664, 158, N'https://contents.mediadecathlon.com/p2152965/k$ba8f7d0763d203287d9668aad97b4576/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (665, 159, N'https://contents.mediadecathlon.com/p2126798/k$e33f3d7ffb1351c9d3295476b0735a86/a%CC%81o-polo-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-cho-n%C6%B0%CC%83-ng%C4%83%CC%81n-tay-500-xanh-l%C3%A1-fouganza-8669932.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (666, 159, N'https://contents.mediadecathlon.com/p2126793/k$7a83803e5209cb2cbf19e6693792d3f1/a%CC%81o-polo-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-cho-n%C6%B0%CC%83-ng%C4%83%CC%81n-tay-500-xanh-l%C3%A1-fouganza-8669932.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (667, 159, N'https://contents.mediadecathlon.com/p2126790/k$95a4aaf29647631155547ee44a763157/a%CC%81o-polo-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-cho-n%C6%B0%CC%83-ng%C4%83%CC%81n-tay-500-xanh-l%C3%A1-fouganza-8669932.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (668, 159, N'https://contents.mediadecathlon.com/p2126790/k$95a4aaf29647631155547ee44a763157/a%CC%81o-polo-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-cho-n%C6%B0%CC%83-ng%C4%83%CC%81n-tay-500-xanh-l%C3%A1-fouganza-8669932.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (669, 160, N'https://contents.mediadecathlon.com/p2292147/k$a38ea89d128090fa15677994d7ea5f64/mu%CC%83-ba%CC%89o-hi%C3%AA%CC%89m-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-100-%C4%91en-fouganza-961392.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (670, 160, N'https://contents.mediadecathlon.com/p2126481/k$56a83a11f6ee95a9d883ac195da06955/mu%CC%83-ba%CC%89o-hi%C3%AA%CC%89m-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-100-%C4%91en-fouganza-961392.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (671, 160, N'https://contents.mediadecathlon.com/p2127791/k$b0df0d6ad9beea35299b2fee1668a7d7/mu%CC%83-ba%CC%89o-hi%C3%AA%CC%89m-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-100-%C4%91en-fouganza-961392.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (672, 160, N'https://contents.mediadecathlon.com/p2267528/k$2c2ae00d3134d0484dd49320efaeecdb/mu%CC%83-ba%CC%89o-hi%C3%AA%CC%89m-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-100-%C4%91en-fouganza-961392.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (673, 161, N'https://contents.mediadecathlon.com/p2588938/k$ad5bcb5773067cb5a3894c4c6224e85e/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (674, 161, N'https://contents.mediadecathlon.com/p2588921/k$f25edfd3f74994523111bbc11c8c3f06/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (675, 161, N'https://contents.mediadecathlon.com/p2588870/k$b63c6e127e101b326d8285ba623f2c5a/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (676, 161, N'https://contents.mediadecathlon.com/p2588841/k$74a4968a9b818c822ae5a7949ab97528/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (677, 162, N'https://contents.mediadecathlon.com/p2800955/k$0043af263577d2ad7a1a5400d893cb0e/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (678, 162, N'https://contents.mediadecathlon.com/p2800957/k$34eb77bc6ce98159b80abb52a7bf3e01/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (679, 162, N'https://contents.mediadecathlon.com/p2800956/k$fe2e58480c7b69212b284133b7340e6b/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (680, 162, N'https://contents.mediadecathlon.com/p2800956/k$fe2e58480c7b69212b284133b7340e6b/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (681, 163, N'https://contents.mediadecathlon.com/p2481141/k$af83da2b80c42bc9f52448a405053a02/di%C3%AA%CC%80u-th%E1%BA%A3-nh%E1%BA%B9-nh%E1%BA%A1y-gi%C3%B3-mfk-140-h%E1%BB%8Da-ti%E1%BA%BFt-con-b%E1%BA%A1ch-tu%E1%BB%99c-orao-8306395.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (682, 163, N'https://contents.mediadecathlon.com/p2481142/k$95bee867a6ef6915ba9298b31112efae/di%C3%AA%CC%80u-th%E1%BA%A3-nh%E1%BA%B9-nh%E1%BA%A1y-gi%C3%B3-mfk-140-h%E1%BB%8Da-ti%E1%BA%BFt-con-b%E1%BA%A1ch-tu%E1%BB%99c-orao-8306395.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (683, 163, N'https://contents.mediadecathlon.com/p2481143/k$aa9d86a1713c5a479c54269f4fd97eca/di%C3%AA%CC%80u-th%E1%BA%A3-nh%E1%BA%B9-nh%E1%BA%A1y-gi%C3%B3-mfk-140-h%E1%BB%8Da-ti%E1%BA%BFt-con-b%E1%BA%A1ch-tu%E1%BB%99c-orao-8306395.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (684, 163, N'https://contents.mediadecathlon.com/p2481143/k$aa9d86a1713c5a479c54269f4fd97eca/di%C3%AA%CC%80u-th%E1%BA%A3-nh%E1%BA%B9-nh%E1%BA%A1y-gi%C3%B3-mfk-140-h%E1%BB%8Da-ti%E1%BA%BFt-con-b%E1%BA%A1ch-tu%E1%BB%99c-orao-8306395.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (685, 164, N'https://contents.mediadecathlon.com/p1210466/k$9e24c62282e0c0ae2f0c17323f648055/di%C3%AA%CC%80u-2-trong-1-izypilot-100-xanh-l%C3%A1-xanh-d%C6%B0%C6%A1ng-orao-8394873.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (686, 164, N'https://contents.mediadecathlon.com/p1210555/k$ee20741c8a888685c8d9713fa68d9f1b/di%C3%AA%CC%80u-2-trong-1-izypilot-100-xanh-l%C3%A1-xanh-d%C6%B0%C6%A1ng-orao-8394873.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (687, 164, N'https://contents.mediadecathlon.com/p1210560/k$678fdd831d4eb1d91e44576284f7b83b/di%C3%AA%CC%80u-2-trong-1-izypilot-100-xanh-l%C3%A1-xanh-d%C6%B0%C6%A1ng-orao-8394873.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (688, 164, N'https://contents.mediadecathlon.com/p1210402/k$cfd8c393a9b2047987e7c7c8e9ea3fc8/di%C3%AA%CC%80u-2-trong-1-izypilot-100-xanh-l%C3%A1-xanh-d%C6%B0%C6%A1ng-orao-8394873.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (693, 166, N'https://contents.mediadecathlon.com/p2174459/k$2444b064d0e2ad94e4b7eb38529137ed/di%E1%BB%81u-c%C3%A1nh-b%C6%B0%E1%BB%9Bm-c%E1%BB%A1-l-cn-kite-160-h%E1%BB%93ng-orao-8758434.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (694, 166, N'https://contents.mediadecathlon.com/p2174462/k$ec6068b29216839e7fab9b4f684489c0/di%E1%BB%81u-c%C3%A1nh-b%C6%B0%E1%BB%9Bm-c%E1%BB%A1-l-cn-kite-160-h%E1%BB%93ng-orao-8758434.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (695, 166, N'https://contents.mediadecathlon.com/p2174458/k$79468da4147e30760bc6a9002ee23666/di%E1%BB%81u-c%C3%A1nh-b%C6%B0%E1%BB%9Bm-c%E1%BB%A1-l-cn-kite-160-h%E1%BB%93ng-orao-8758434.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (696, 166, N'https://contents.mediadecathlon.com/p2174460/k$bce10a5eac9840c5915f764a3835f7b7/di%E1%BB%81u-c%C3%A1nh-b%C6%B0%E1%BB%9Bm-c%E1%BB%A1-l-cn-kite-160-h%E1%BB%93ng-orao-8758434.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (697, 167, N'https://contents.mediadecathlon.com/p1304110/k$2c37c26c13592547526cfc7c87e2265a/tay-quay-c%C3%B3-d%C3%A2y-d%C3%A0nh-cho-di%E1%BB%81u-m%E1%BB%99t-d%C3%A2y-xanh-l%C3%A1-c%C3%A2y-orao-8494999.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (698, 167, N'https://contents.mediadecathlon.com/p1304130/k$6db593184ad3efa73cd77960d75dcc48/tay-quay-c%C3%B3-d%C3%A2y-d%C3%A0nh-cho-di%E1%BB%81u-m%E1%BB%99t-d%C3%A2y-xanh-l%C3%A1-c%C3%A2y-orao-8494999.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (699, 167, N'https://contents.mediadecathlon.com/p1304103/k$8447984bf79b93048019892b361db415/tay-quay-c%C3%B3-d%C3%A2y-d%C3%A0nh-cho-di%E1%BB%81u-m%E1%BB%99t-d%C3%A2y-xanh-l%C3%A1-c%C3%A2y-orao-8494999.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (700, 167, N'https://contents.mediadecathlon.com/p1304117/k$cbfe2c1e9f9cd526f2d2ef5d589b6c65/tay-quay-c%C3%B3-d%C3%A2y-d%C3%A0nh-cho-di%E1%BB%81u-m%E1%BB%99t-d%C3%A2y-xanh-l%C3%A1-c%C3%A2y-orao-8494999.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (701, 168, N'https://contents.mediadecathlon.com/p2703466/k$54f6dbdbe0a98532197e6c6dc3992fe4/g%C4%83ng-tay-t%C3%A2%CC%A3p-c%C6%B0%CC%89-ta%CC%A3-tho%C3%A1ng-kh%C3%AD-cho-n%C6%B0%CC%83-xa%CC%81m-domyos-8595215.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (702, 168, N'https://contents.mediadecathlon.com/p2743161/k$00de985858f0d069a9f4bf170f8c448a/g%C4%83ng-tay-t%C3%A2%CC%A3p-c%C6%B0%CC%89-ta%CC%A3-tho%C3%A1ng-kh%C3%AD-cho-n%C6%B0%CC%83-xa%CC%81m-domyos-8595215.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (703, 168, N'https://contents.mediadecathlon.com/p2743160/k$3409675f3627746e1ebe589dbc3e150b/g%C4%83ng-tay-t%C3%A2%CC%A3p-c%C6%B0%CC%89-ta%CC%A3-tho%C3%A1ng-kh%C3%AD-cho-n%C6%B0%CC%83-xa%CC%81m-domyos-8595215.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (704, 168, N'https://contents.mediadecathlon.com/p2069769/k$32251c0b40f0e4fae27db6e4ccd788a8/g%C4%83ng-tay-t%C3%A2%CC%A3p-c%C6%B0%CC%89-ta%CC%A3-tho%C3%A1ng-kh%C3%AD-cho-n%C6%B0%CC%83-xa%CC%81m-domyos-8595215.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (705, 169, N'https://contents.mediadecathlon.com/p2720220/k$ead663df487b8f03c9a5c424f1474b33/b%C3%B4%CC%A3-2-ta%CC%A3-c%E1%BA%A7m-tay-1-kg-xanh-l%C3%A1-domyos-8336571.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (706, 169, N'https://contents.mediadecathlon.com/p2720283/k$d2aeb7cf19880fe7211f3c3843ac2499/b%C3%B4%CC%A3-2-ta%CC%A3-c%E1%BA%A7m-tay-1-kg-xanh-l%C3%A1-domyos-8336571.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (707, 169, N'https://contents.mediadecathlon.com/p2091943/k$5e67d50efed2de0a6c1d65f773a3b1ba/b%C3%B4%CC%A3-2-ta%CC%A3-c%E1%BA%A7m-tay-1-kg-xanh-l%C3%A1-domyos-8336571.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (708, 169, N'https://contents.mediadecathlon.com/p2092244/k$5df3b3e306b8591f37a28aa43945caaf/b%C3%B4%CC%A3-2-ta%CC%A3-c%E1%BA%A7m-tay-1-kg-xanh-l%C3%A1-domyos-8336571.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (709, 170, N'https://contents.mediadecathlon.com/p1872706/k$f946e8b9834357cb75806546f89b9d84/t%C3%BAi-d%C3%A2y-r%C3%BAt-th%E1%BB%83-thao-15l-%C4%91en-domyos-8584676.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (710, 170, N'https://contents.mediadecathlon.com/p1872666/k$77ee3852ad88d59826f85345f47c75c9/t%C3%BAi-d%C3%A2y-r%C3%BAt-th%E1%BB%83-thao-15l-%C4%91en-domyos-8584676.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (711, 170, N'https://contents.mediadecathlon.com/p1872615/k$d2b2f8bf8d0d95cbab77b814490e66f8/t%C3%BAi-d%C3%A2y-r%C3%BAt-th%E1%BB%83-thao-15l-%C4%91en-domyos-8584676.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (712, 170, N'https://contents.mediadecathlon.com/p1872615/k$d2b2f8bf8d0d95cbab77b814490e66f8/t%C3%BAi-d%C3%A2y-r%C3%BAt-th%E1%BB%83-thao-15l-%C4%91en-domyos-8584676.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (713, 171, N'https://contents.mediadecathlon.com/p2881598/k$c8c3dd7e6b4a37768c40d4f59b64fa88/kh%C4%83n-tr%E1%BA%A3i-t%E1%BA%ADp-yoga-ch%E1%BB%91ng-tr%C6%A1n-tr%C6%B0%E1%BB%A3t-x%C3%A1m-xanh-d%C6%B0%C6%A1ng-kimjaly-8576776.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (714, 171, N'https://contents.mediadecathlon.com/p1786346/k$634b94c5e902c88fbcd9f15479f651fa/kh%C4%83n-tr%E1%BA%A3i-t%E1%BA%ADp-yoga-ch%E1%BB%91ng-tr%C6%A1n-tr%C6%B0%E1%BB%A3t-x%C3%A1m-xanh-d%C6%B0%C6%A1ng-kimjaly-8576776.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (715, 171, N'https://contents.mediadecathlon.com/p1786347/k$c2be7a3d7b8c123fa785249ae6df81ac/kh%C4%83n-tr%E1%BA%A3i-t%E1%BA%ADp-yoga-ch%E1%BB%91ng-tr%C6%A1n-tr%C6%B0%E1%BB%A3t-x%C3%A1m-xanh-d%C6%B0%C6%A1ng-kimjaly-8576776.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (716, 171, N'https://contents.mediadecathlon.com/p1786344/k$2959d2e54c1574573f0b6c565c685171/kh%C4%83n-tr%E1%BA%A3i-t%E1%BA%ADp-yoga-ch%E1%BB%91ng-tr%C6%A1n-tr%C6%B0%E1%BB%A3t-x%C3%A1m-xanh-d%C6%B0%C6%A1ng-kimjaly-8576776.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (717, 172, N'https://contents.mediadecathlon.com/p207648/k$ed152355e8cb224d610830760a3349b9/gia%CC%80y-ch%E1%BA%A1y-b%E1%BB%99-nam-run-one-x%C3%A1m-decathlon-8351755.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (718, 172, N'https://contents.mediadecathlon.com/p207649/k$e8b2163c85d904436ac7fd48239dcc92/gia%CC%80y-ch%E1%BA%A1y-b%E1%BB%99-nam-run-one-x%C3%A1m-decathlon-8351755.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (719, 172, N'https://contents.mediadecathlon.com/p207657/k$78c5886a59a3adf6eb9d284d486d0e86/gia%CC%80y-ch%E1%BA%A1y-b%E1%BB%99-nam-run-one-x%C3%A1m-decathlon-8351755.jpg?f=768x0&format=auto')
GO
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (720, 172, N'https://contents.mediadecathlon.com/p207656/k$2c879d146045f7a64f201d1503d3cfa8/gia%CC%80y-ch%E1%BA%A1y-b%E1%BB%99-nam-run-one-x%C3%A1m-decathlon-8351755.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (721, 173, N'https://contents.mediadecathlon.com/p2636514/k$b9e7ae0b6709674ddb83a2a249d735a6/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-jogflow-190-1-xanh-navy-kiprun-8874411.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (722, 173, N'https://contents.mediadecathlon.com/p2636516/k$aaa13b300fe852a99d7f5d320cb70a97/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-jogflow-190-1-xanh-navy-kiprun-8874411.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (723, 173, N'https://contents.mediadecathlon.com/p2636515/k$a30d0abc9bd5f70909de09c525a2f285/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-jogflow-190-1-xanh-navy-kiprun-8874411.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (724, 173, N'https://contents.mediadecathlon.com/p2636517/k$6227046327a4b8dd918b8e50cd3b26b6/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-jogflow-190-1-xanh-navy-kiprun-8874411.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (725, 174, N'https://contents.mediadecathlon.com/p2563889/k$ee22608e404b0f36af0c8e41db514822/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-c%C3%B3-%C4%91%E1%BB%87m-cacbon-%E1%BB%9F-%C4%91%E1%BA%BF-gi%E1%BB%AFa-kd900x-tr%E1%BA%AFng-xanh-l%C3%A1-t%C3%ADm-kiprun-8801426.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (726, 174, N'https://contents.mediadecathlon.com/p2563887/k$ba1d3db90e1d08cfff67ad9eb13c9d07/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-c%C3%B3-%C4%91%E1%BB%87m-cacbon-%E1%BB%9F-%C4%91%E1%BA%BF-gi%E1%BB%AFa-kd900x-tr%E1%BA%AFng-xanh-l%C3%A1-t%C3%ADm-kiprun-8801426.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (727, 174, N'https://contents.mediadecathlon.com/p2563884/k$9817b718a1685756ce89e46c5319b98d/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-c%C3%B3-%C4%91%E1%BB%87m-cacbon-%E1%BB%9F-%C4%91%E1%BA%BF-gi%E1%BB%AFa-kd900x-tr%E1%BA%AFng-xanh-l%C3%A1-t%C3%ADm-kiprun-8801426.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (728, 174, N'https://contents.mediadecathlon.com/p2563883/k$36e8692a6fa07e2dc4a46b443d5b36c4/gi%C3%A0y-ch%E1%BA%A1y-b%E1%BB%99-nam-c%C3%B3-%C4%91%E1%BB%87m-cacbon-%E1%BB%9F-%C4%91%E1%BA%BF-gi%E1%BB%AFa-kd900x-tr%E1%BA%AFng-xanh-l%C3%A1-t%C3%ADm-kiprun-8801426.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (733, 176, N'https://contents.mediadecathlon.com/p2590633/k$5128ea92ecedd6683e512450542133b1/g%C3%B3i-2-%C4%91%C3%B4i-t%E1%BA%A5t-ch%E1%BA%A1y-b%E1%BB%99-m%E1%BB%8Fng-run-500-%C4%91en-kiprun-8810965.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (734, 176, N'https://contents.mediadecathlon.com/p2590585/k$f6f68c14470858cc0459eedf2737a421/g%C3%B3i-2-%C4%91%C3%B4i-t%E1%BA%A5t-ch%E1%BA%A1y-b%E1%BB%99-m%E1%BB%8Fng-run-500-%C4%91en-kiprun-8810965.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (735, 176, N'https://contents.mediadecathlon.com/p2590603/k$c3d78d1530ae4296d4b96db4a1ce5371/g%C3%B3i-2-%C4%91%C3%B4i-t%E1%BA%A5t-ch%E1%BA%A1y-b%E1%BB%99-m%E1%BB%8Fng-run-500-%C4%91en-kiprun-8810965.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (736, 176, N'https://contents.mediadecathlon.com/p2590633/k$5128ea92ecedd6683e512450542133b1/g%C3%B3i-2-%C4%91%C3%B4i-t%E1%BA%A5t-ch%E1%BA%A1y-b%E1%BB%99-m%E1%BB%8Fng-run-500-%C4%91en-kiprun-8810965.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (737, 177, N'https://contents.mediadecathlon.com/p1286329/k$64d9ef6e1b94b905319a52944c53f2ad/b%C3%ACnh-n%C6%B0%E1%BB%9Bc-m%E1%BB%81m-ch%E1%BA%A1y-b%E1%BB%99-500ml-sa2020-xanh-d%C6%B0%C6%A1ng-kiprun-8605419.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (738, 177, N'https://contents.mediadecathlon.com/p1286320/k$63f02df7dcea2540cacdee4e427e56a0/b%C3%ACnh-n%C6%B0%E1%BB%9Bc-m%E1%BB%81m-ch%E1%BA%A1y-b%E1%BB%99-500ml-sa2020-xanh-d%C6%B0%C6%A1ng-kiprun-8605419.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (739, 177, N'https://contents.mediadecathlon.com/p1286360/k$7be8eca35400579315b3b8249d8a4067/b%C3%ACnh-n%C6%B0%E1%BB%9Bc-m%E1%BB%81m-ch%E1%BA%A1y-b%E1%BB%99-500ml-sa2020-xanh-d%C6%B0%C6%A1ng-kiprun-8605419.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (740, 177, N'https://contents.mediadecathlon.com/p1286339/k$607c93c0dc515cffcc41686fe12f1ec9/b%C3%ACnh-n%C6%B0%E1%BB%9Bc-m%E1%BB%81m-ch%E1%BA%A1y-b%E1%BB%99-500ml-sa2020-xanh-d%C6%B0%C6%A1ng-kiprun-8605419.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (741, 178, N'https://contents.mediadecathlon.com/p2481705/k$0bf01363213740b4133538fc1dd75444/b%C3%A0n-bida-g%E1%BA%A5p-%C4%91%C6%B0%E1%BB%A3c-bt-500-us-x%C3%A1m-pongori-8640446.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (742, 178, N'https://contents.mediadecathlon.com/p2329561/k$ea274c2f3807d37557a4c5a7f57203ff/b%C3%A0n-bida-g%E1%BA%A5p-%C4%91%C6%B0%E1%BB%A3c-bt-500-us-x%C3%A1m-pongori-8640446.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (743, 178, N'https://contents.mediadecathlon.com/p2329557/k$10967b89d7a09d3c1fa0d42c69ab5e0f/b%C3%A0n-bida-g%E1%BA%A5p-%C4%91%C6%B0%E1%BB%A3c-bt-500-us-x%C3%A1m-pongori-8640446.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (744, 178, N'https://contents.mediadecathlon.com/p2329560/k$69a0210894f2b2910360153d434f71d2/b%C3%A0n-bida-g%E1%BA%A5p-%C4%91%C6%B0%E1%BB%A3c-bt-500-us-x%C3%A1m-pongori-8640446.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (745, 179, N'https://contents.mediadecathlon.com/p2356870/k$4cc5e46abfdeb1a343d6e3ad6f362821/b%C3%A0n-bida-mini-bt-50-us-n%E1%BB%89-x%C3%A1m-pongori-8796637.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (746, 179, N'https://contents.mediadecathlon.com/p2350343/k$681655036128d26da2e25265d7fd7193/b%C3%A0n-bida-mini-bt-50-us-n%E1%BB%89-x%C3%A1m-pongori-8796637.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (747, 179, N'https://contents.mediadecathlon.com/p2350342/k$4a3b4081451e5f56ddb12f75a99e41bd/b%C3%A0n-bida-mini-bt-50-us-n%E1%BB%89-x%C3%A1m-pongori-8796637.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (748, 179, N'https://contents.mediadecathlon.com/p2332112/k$0c6ef7aecf8c9ce9d52839d062f71176/b%C3%A0n-bida-mini-bt-50-us-n%E1%BB%89-x%C3%A1m-pongori-8796637.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (749, 180, N'https://contents.mediadecathlon.com/p2193912/k$1d77f153f2acea96d8523f681ba7ed14/t%C3%BAi-th%E1%BB%83-thao-ti%E1%BB%87n-l%E1%BB%A3i-35l-essential-%C4%91en-xanh-d%C6%B0%C6%A1ng-kipsta-8580096.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (750, 180, N'https://contents.mediadecathlon.com/p2193914/k$42160eb7b2b68054300325685b83258b/t%C3%BAi-th%E1%BB%83-thao-ti%E1%BB%87n-l%E1%BB%A3i-35l-essential-%C4%91en-xanh-d%C6%B0%C6%A1ng-kipsta-8580096.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (751, 180, N'https://contents.mediadecathlon.com/p2161267/k$5b703605b776e3089e9cbc110d126a08/t%C3%BAi-th%E1%BB%83-thao-ti%E1%BB%87n-l%E1%BB%A3i-35l-essential-%C4%91en-xanh-d%C6%B0%C6%A1ng-kipsta-8580096.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (752, 180, N'https://contents.mediadecathlon.com/p2193913/k$302f1e21ee8ae8702e67b8b55399b2b8/t%C3%BAi-th%E1%BB%83-thao-ti%E1%BB%87n-l%E1%BB%A3i-35l-essential-%C4%91en-xanh-d%C6%B0%C6%A1ng-kipsta-8580096.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (753, 181, N'https://contents.mediadecathlon.com/p1347825/k$4b0a829fea75b19a21622801db67eb65/qu%E1%BA%A3-b%C3%B3ng-chuy%E1%BB%81n-v900-tr%E1%BA%AFng-%C4%91%E1%BB%8F-kipsta-8408660.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (754, 181, N'https://contents.mediadecathlon.com/p1347829/k$c09cea488457fa42e67a87297355aa53/qu%E1%BA%A3-b%C3%B3ng-chuy%E1%BB%81n-v900-tr%E1%BA%AFng-%C4%91%E1%BB%8F-kipsta-8408660.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (755, 181, N'https://contents.mediadecathlon.com/p1347826/k$855c6564ff613321a85df718ec551e26/qu%E1%BA%A3-b%C3%B3ng-chuy%E1%BB%81n-v900-tr%E1%BA%AFng-%C4%91%E1%BB%8F-kipsta-8408660.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (756, 181, N'https://contents.mediadecathlon.com/p1347831/k$81878be149665c1f91b529e41c10d2a5/qu%E1%BA%A3-b%C3%B3ng-chuy%E1%BB%81n-v900-tr%E1%BA%AFng-%C4%91%E1%BB%8F-kipsta-8408660.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (757, 182, N'https://contents.mediadecathlon.com/p2312624/k$ff77f0ebb5d52bcf58484b318a1a430d/v%C6%A1%CC%A3t-pickleball-500-xanh-d%C6%B0%C6%A1ng-artengo-8767140.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (758, 182, N'https://contents.mediadecathlon.com/p2312623/k$ef6b244caabe55420f36b5583deb885c/v%C6%A1%CC%A3t-pickleball-500-xanh-d%C6%B0%C6%A1ng-artengo-8767140.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (759, 182, N'https://contents.mediadecathlon.com/p2312622/k$63a1707017fcb32387e5420bfdab2310/v%C6%A1%CC%A3t-pickleball-500-xanh-d%C6%B0%C6%A1ng-artengo-8767140.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (760, 182, N'https://contents.mediadecathlon.com/p2580237/k$3852aa2db76b0955578a6ad3e7cbf0e8/v%C6%A1%CC%A3t-pickleball-500-xanh-d%C6%B0%C6%A1ng-artengo-8767140.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (761, 183, N'https://contents.mediadecathlon.com/p2671914/k$acbf02700815ea07f14100473fb378df/gi%C3%A0y-%C4%91%C3%A1-b%C3%B3ng-%C4%91a-d%E1%BA%A1ng-m%E1%BA%B7t-s%C3%A2n-viralto-iii-cam-kipsta-8843842.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (762, 183, N'https://contents.mediadecathlon.com/p2671955/k$3a3c35f1993c7931aa4f78485f95e60a/gi%C3%A0y-%C4%91%C3%A1-b%C3%B3ng-%C4%91a-d%E1%BA%A1ng-m%E1%BA%B7t-s%C3%A2n-viralto-iii-cam-kipsta-8843842.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (763, 183, N'https://contents.mediadecathlon.com/p2671991/k$8041a097fc93bee74af0aa73a351bd17/gi%C3%A0y-%C4%91%C3%A1-b%C3%B3ng-%C4%91a-d%E1%BA%A1ng-m%E1%BA%B7t-s%C3%A2n-viralto-iii-cam-kipsta-8843842.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (764, 183, N'https://contents.mediadecathlon.com/p2672076/k$7ab4865e8d71710b287f17dc27a1b0e1/gi%C3%A0y-%C4%91%C3%A1-b%C3%B3ng-%C4%91a-d%E1%BA%A1ng-m%E1%BA%B7t-s%C3%A2n-viralto-iii-cam-kipsta-8843842.jpg?f=768x0&format=auto')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (765, 183, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3bbecbdf584e40398446a8bf0117cf62_9366/Samba_OG_Shoes_White_B75806_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (766, 183, N'https://product.hstatic.net/200000411281/product/34_1506206626c9401ea97217bfc76ba9c1_master.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (767, 183, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ec595635a2994adea094a8bf0117ef1a_9366/Samba_OG_Shoes_White_B75806_02_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (768, 183, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4c70105150234ac4b948a8bf01187e0c_9366/Samba_OG_Shoes_Black_B75807_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (769, 183, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3bbecbdf584e40398446a8bf0117cf62_9366/Samba_OG_Shoes_White_B75806_01_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (770, 183, N'https://product.hstatic.net/200000411281/product/34_1506206626c9401ea97217bfc76ba9c1_master.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (771, 183, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bf28b8ff44484075858a486ad6ba6163_9366/Gazelle_Indoor_Shoes_White_IG1896_03_standard.jpg')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (772, 183, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2c1fede01239469ca79c3572e3cf7a81_9366/Campus_00s_Shoes_Brown_ID2077_04_standard.jpg')
SET IDENTITY_INSERT [dbo].[SubImage] OFF
GO
INSERT [dbo].[View] ([viewed]) VALUES (353)
GO
ALTER TABLE [dbo].[Product_Size] ADD  CONSTRAINT [DF_Product_Size_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Product_Size] ADD  CONSTRAINT [DF_Product_Size_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Account]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Product]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Size1] FOREIGN KEY([sizeId])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Size1]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Order]
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
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Size]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cID])
REFERENCES [dbo].[Category] ([cID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Product] FOREIGN KEY([pID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Product]
GO
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Size] FOREIGN KEY([sizeId])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Size]
GO
ALTER TABLE [dbo].[SubImage]  WITH CHECK ADD  CONSTRAINT [FK_SubImage_Product] FOREIGN KEY([pID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[SubImage] CHECK CONSTRAINT [FK_SubImage_Product]
GO
