USE [Project_Group6]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[CartItems]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[Product_Size]    Script Date: 3/25/2025 3:38:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pID] [int] NULL,
	[sizeId] [int] NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[SubImage]    Script Date: 3/25/2025 3:38:40 AM ******/
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
/****** Object:  Table [dbo].[View]    Script Date: 3/25/2025 3:38:40 AM ******/
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
SET IDENTITY_INSERT [dbo].[Account] OFF
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
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2032, CAST(N'2025-03-24' AS Date), 2021, N'hn', N'0869381123', N'quan tri', 4197000.0000, 3, 2016)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2033, CAST(N'2025-03-25' AS Date), 2021, N'Rach Gia', N'0639381823', N'Vinh Tran', 1348000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2034, CAST(N'2025-03-25' AS Date), 2021, N'Rach Gia', N'0639381823', N'Vinh Tran', 490000.0000, 0, NULL)
INSERT [dbo].[Order] ([id], [orderDate], [accountID], [addressReceive], [sdt], [name], [totalPrice], [status], [shipperID]) VALUES (2035, CAST(N'2025-03-25' AS Date), 2021, N'Rach Gia', N'0639381823', N'Minh Quang', 1017000.0000, 0, NULL)
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
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (1, N'Jordan 1 Retro High Dark Mocha', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/89b0414dbb05499782be24efffcf29c3_9366/Adifom_Climacool_Shoes_Green_IF3937_01_standard.jpg', 320.0000, N'', N'', 9, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (2, N'Jordan 5 Retro Alternate Bel-Air', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7c05f80341d640ba9c0594c7479455db_9366/D.O.N._Issue_5_Shoes_White_IE7799_01_standard.jpg', 630.0000, N'', N'', 9, 19, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (3, N'Jordan 4 Retro SE 95 Neon', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b65606c1962f4d88a2f06f14de9c5b35_9366/S2G_Spikeless_24_Wide_Golf_Shoes_Grey_IF0340_01_standard.jpg', 455.0000, N'', N'', 9, 13, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (25, N'Adidas Yeezy Boost 350 V2 Black Red', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/910be30b9d004bdaaee80d58bcf24d8d_9366/Campus_00s_Shoes_Brown_ID2077_01_standard.jpg', 200.0000, N'', N'', 8, 14, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (44, N'Vans Sk8-Hi Re-Issue Flags', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b9a626b41f7c41efa29d3ebc98b113e7_9366/S2G_Spikeless_24_Wide_Golf_Shoes_White_IF0277_01_standard.jpg', 60.0000, N'', N'', 10, 8, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (45, N'Vans Authentic Comme des Garcons White', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/99ac2fdea36e4714bdbaaf4200bcc5ff_9366/Island_Club_Adilette_22_Slides_Brown_HQ4670_01_standard.jpg', 220.0000, N'', N'', 10, 8, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (46, N'Vans Style 36 C2H4 50/50 Enlighten Trailblazer', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b00a682997bd40d3bdfaaed70181d5b6_9366/VULC_RAID3R_Lifestyle_Skateboarding_Slip-On_Canvas_Shoes_Black_HP6554_01_standard.jpg', 360.0000, N'', N'', 10, 10, 1)
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
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (71, N'Nike Air Force 1 Shadow', N'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/odhlk8ksqmstmdcjjyn0/W+AF1+SHADOW.png', 1000.0000, N'nike', N'The Nike Air Force 1 Shadow puts a playful twist on a classic b-ball design.Using a layered approach, doubling the branding and exaggerating the midsole, it highlights AF-1 DNA with a bold, new look.', 1, 7, 1)
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
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (121, N'Fuse', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/525699/01/fnd/PNA/fmt/png/Fuse-Stretch-Men''s-7%22-Shorts', 1000.0000, N'quan puma', N'In a world of motorsport and sportswear, where performance is paramount, the BMW M Motorsport LIFE PACK emerges as your ultimate companion. These regular fit shorts feature our dryCELL tech to wick moisture and keep you feeling at your best.

dryCELL: Performance technology designed to wick moisture from the body and keep you free of sweat during exercise
Made with at least 70% recycled materials
Regular fit
225 gsm, dobby
Mid-rise
BMW M Motorsport branding details
PUMA branding details
Style: 627539_07
Color: Vapor Gray', 17, 70, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (122, N'Manchester City 24/25 Replica', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/775114/05/mod01/fnd/PNA/fmt/png/Manchester-City-24/25-Men''s-Replica-Soccer-Shorts', 1000.0000, N'quan puma', N'Hit the pitch like Manchester City''s finest in these soccer shorts. They''re made from sweat-wicking material to keep you cool in the tensest moments of the game and are finished with the team''s famous crest on the leg.
Style: 775114_05
Color: PUMA White-Marine Blue', 17, 1, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (123, N'ao', N'https://tse4.mm.bing.net/th?id=OIP.tztwvsqbipCAjZj6E3uqAgHaEc&pid=Api&P=0&h=180', 1000.0000, N'ao', N'ao dep', 12, 1, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (124, N'test tạo kệ 1', N'http://sieuthithucpham.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/8/18_cai_na_2_.jpg', 342.0000, N'fsd1', N'fsd1', 16, 66, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (125, N'ao dep1', N'1http://sieuthithucpham.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/8/18_cai_na_2_.jpg', 37.0000, N'dae1', N'ew1', 13, 12, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (126, N'Bóng rổ Spalding Sketch Dribble – Indoor/Outdoor Size 7 84-381z - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336413725.jpg?v=1739336417683', 700000.0000, N'Spalding Sketch Series Basketball - Vibrant Orange with Artistic Design', N'Add a touch of creativity to your game with the Spalding Sketch Series Basketball. Featuring a striking orange color and intricate black sketches of basketball patterns, this ball stands out with its unique and artistic design. The Spalding logo is prominently displayed, and the "Sketch" series branding adds a cool, modern flair. Perfect for both casual play and collectors, this basketball combines style with performance, making it a must-have for basketball enthusiasts. Ideal for both indoor and outdoor use.', 17, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (127, N'Áo khoác gió Jogarbola Track Jacket ', N'https://bizweb.dktcdn.net/100/485/982/products/pj309-11-1736937642291.jpg?v=1736937647630', 369000.0000, N'Jogarbola Track Jacket "Xanh Navy" MJ-PJ309-11 - Official Product', N'Stay stylish and comfortable with the Jogarbola Track Jacket in Navy Blue. Made by Động Lực, this jacket is perfect for both casual wear and athletic activities. With a sleek design, the jacket features a high-quality zipper and a sporty look. The jacket is available in size S, with other sizes available upon request. Now at a 40% discount, it''s the perfect time to grab this jacket at just 369,000 VND, down from 615,000 VND. Durable, lightweight, and functional, this jacket is a great addition to any wardrobe.', 17, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (128, N'Áo phông chính thức của giải bóng rổ sinh viên toàn quốc NUC "Đen" - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1736741570266.jpg?v=1736741573570', 135000.0000, N'Official NUC Basketball Tournament T-Shirt - Black', N'Support the NUC Basketball Tournament with this stylish black t-shirt. Featuring the bold "NUC BASKETBALL" logo in yellow, this shirt is a perfect choice for fans and participants alike. The comfortable cotton fabric and modern fit make it ideal for casual wear, sports events, or showing off your team spirit. Available in size M, this t-shirt is on sale for just 135,000 VND, down from 225,000 VND with a 40% discount. Don''t miss out on this great deal!', 17, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (129, N'Bóng rổ Spalding TF33 Gold – Indoor/Outdoor Size 6 84-532z - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336319401.jpg?v=1739336324170', 600000.0000, N'Spalding TF33 Gold Basketball – Indoor/Outdoor, Size 6

', N'Experience superior quality and performance with the Spalding TF33 Gold Basketball, designed for both indoor and outdoor play. Featuring the signature Spalding branding and a bold yellow and navy color scheme, this basketball is built for durability and a great feel. With a size 6 specification, it’s perfect for youth and recreational players alike. Priced at 600,000 VND, this high-performance ball is a must-have for any basketball enthusiast.', 17, 10, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (130, N'Bóng rổ Spalding Commander – Indoor/Outdoor Size 7 84-589z - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336230269.jpg?v=1739336234637', 550000.0000, N'Spalding Commander Basketball – Indoor/Outdoor, Size 7', N'The Spalding Commander Basketball is built for both indoor and outdoor use, offering durability and exceptional performance. With a unique camouflage design in green and beige tones, it stands out with its bold black Spalding logo and "COMMANDER" branding. This size 7 basketball is perfect for competitive play, providing a great grip and control for players. Available for 520,000 VND, it''s a reliable choice for any basketball enthusiast looking for style and performance on the court.', 17, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (131, N'Áo khoác gió Jogarbola "Trắng" MJ-P3124-03 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/3-1736935304176.jpg?v=1736935310623', 645000.0000, N'Jogarbola White Windbreaker Jacket MJ-P3124-03 – Official Product

', N'Stay comfortable and stylish with the Jogarbola White Windbreaker Jacket MJ-P3124-03. Made by Động Lực, this jacket features a sleek white body with contrasting navy blue and brown sleeves, offering a modern and sporty look. The lightweight, breathable fabric makes it perfect for both casual and active wear. The jacket is available in sizes S, M, L, XL, and 2XL. Priced at 645,000 VND, this high-quality jacket is a great addition to your wardrobe for any outdoor activity or casual outing.', 17, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (132, N'Balo thể thao Zocker Winner Energy - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057', 500000.0000, N'Zocker Winner Energy Sports Backpack - Black

', N'Carry your essentials in style with the Zocker Winner Energy Sports Backpack. Designed with a sleek black color and a bold pattern, this backpack is perfect for sports enthusiasts and everyday use. It features multiple compartments for easy organization and durable straps for comfortable carrying. The backpack is priced at 329,000 VND, making it an affordable option for anyone looking for a reliable and stylish bag. Available in other colors, it’s an essential accessory for both school and sports activities.', 17, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (133, N'Động Lực Promax "Light/Khaki" Volleyball Shoes PR-241023-10', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742791379096.jpg?v=1742791386883', 519000.0000, N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "Light/Khaki" PR-241023-10 - Hàng Chính Hãng
', N'Step up your game with the Động Lực Promax "Light/Khaki" Volleyball Shoes. Designed for both comfort and performance, these shoes feature a sleek light khaki color with a breathable upper, ensuring that your feet stay cool and supported during intense games. The durable sole provides excellent grip, making them perfect for indoor volleyball courts. Priced at 519,000 VND (down from 580,000 VND), these shoes are available in size 36, with other sizes up to 39. Get the perfect fit for your volleyball needs at an affordable price.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (134, N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "Red/White" PR-241023-09 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742719095817.jpg?v=1742719099427', 519000.0000, N'Động Lực Promax "Red/White" Volleyball Shoes PR-241023-09

', N'Step onto the court with confidence in the Động Lực Promax "Red/White" Volleyball Shoes. These shoes combine vibrant red and white colors with advanced design for both style and performance. They feature a breathable upper and a durable sole for excellent traction and support during intense matches. Priced at 519,000 VND (down from 580,000 VND), these shoes are available in sizes 36 to 39, offering a perfect fit for players. Elevate your game with the perfect combination of comfort, durability, and style.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (135, N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "White/Purple" PR-241023-08 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742719061430.jpg?v=1742719064840', 519000.0000, N'Giày Cầu Lông / Bóng Chuyền Động Lực Promax "White/Purple" PR-241023-08 - Hàng Chính Hãng
', N'Play in style with the Động Lực Promax "White/Purple" Volleyball Shoes. Featuring a sleek white and purple design with a touch of gold, these shoes offer a perfect combination of comfort and performance. Built with a durable sole for excellent traction and stability, they are ideal for indoor volleyball. Available in sizes 36 to 39, these shoes are priced at 519,000 VND, down from 580,000 VND, offering a great value for high-quality footwear. Get ready to elevate your game with the perfect fit and design.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (136, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Cam" PR-2406.M-03 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/8.jpg?v=1741682201577', 199000.0000, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Cam" PR-2406.M-03 - Hàng Chính Hãng', N'Show off your athletic style with the Động Lực Promax Men''s Volleyball Set in vibrant orange. Featuring a dynamic geometric pattern, this set combines comfort and performance for your best game yet. The shirt and shorts are made from breathable fabric, designed for maximum flexibility and movement during play. Priced at just 199,000 VND, this set is available in sizes M, L, XL, and 2XL, making it a great value for anyone looking to enhance their volleyball gear. Perfect for both practice and casual matches.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (137, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Xanh" PR-2406.M-02 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740991448008.jpg?v=1741682211267', 199000.0000, N'Động Lực Promax Men''s Volleyball Set "Blue" PR-2406.M-02

', N'Enhance your volleyball game with the Động Lực Promax Men''s Volleyball Set in vibrant blue. Featuring a sleek geometric design and comfortable fit, this set is perfect for both casual players and athletes. Made with breathable fabric, it ensures flexibility and comfort throughout your match. Priced at just 199,000 VND, this set is available in sizes M, L, XL, and 2XL, making it a great choice for players of all sizes. Ideal for practice or competitive play, this stylish and functional set offers great value for volleyball enthusiasts.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (138, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Trắng" PR-2406.M-01 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1740991388760.jpg?v=1741682219680', 199000.0000, N'Bộ quần áo bóng chuyền Nam Promax PR-2406.M "Trắng" PR-2406.M-01 - Hàng Chính Hãng', N'Enhance your volleyball game with the Động Lực Promax Men''s Volleyball Set in vibrant blue. Featuring a sleek geometric design and comfortable fit, this set is perfect for both casual players and athletes. Made with breathable fabric, it ensures flexibility and comfort throughout your match. Priced at just 199,000 VND, this set is available in sizes M, L, XL, and 2XL, making it a great choice for players of all sizes. Ideal for practice or competitive play, this stylish and functional set offers great value for volleyball enthusiasts.', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (139, N'Bóng Chuyền Da Thi Đấu Thăng Long Dragon Master DG7700 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1735194880897.jpg?v=1735199116150', 1050000.0000, N'Bóng Chuyền Da Thi Đấu Thăng Long Dragon Master DG7700 - Hàng Chính Hãng
', N'Experience top-tier performance with the Thăng Long Dragon Master DG7700 Volleyball. Crafted to meet international standards, this volleyball features an excellent grip, ensuring optimal control and comfort during play. The ball is designed with soft touch technology for a smooth feel and durable construction, making it ideal for both professional and recreational use. With its vibrant blue, yellow, and white colors, it is both visually appealing and functional. Available for 1,050,000 VND, this official size 5 ball is a must-have for volleyball enthusiasts.






', 16, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (140, N'Bộ luyện tập Đội tuyển Bóng đá Quốc gia 2025 "Blue" MJ-E4047-29 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/10-1742178409663.jpg?v=1742178420100', 398000.0000, N'Bộ luyện tập Đội tuyển Bóng đá Quốc gia 2025 "Blue" MJ-E4047-29 - Hàng Chính Hãng
', N'Show your support for the national football team with the Động Lực National Football Team Training Kit 2025 in vibrant blue. Featuring a dynamic design with abstract patterns and the national flag, this training kit is made for comfort and performance. Crafted from breathable fabric, it provides excellent flexibility and moisture control, perfect for training sessions. Available in sizes S, M, L, XL, 2XL, and 3XL, the set is priced at 398,000 VND, offering great value for football enthusiasts looking for stylish and practical gear.', 11, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (141, N'Áo thi đấu Đội tuyển Bóng đá Quốc gia 2025 (bản Player) "Đỏ" MJ-E4040-03 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1742176692649.jpg?v=1742176707080', 750000.0000, N'Áo thi đấu Đội tuyển Bóng đá Quốc gia 2025 (bản Player) "Đỏ" MJ-E4040-03 - Hàng Chính Hãng', N'Support your national football team with the official Động Lực National Football Team Player Jersey 2025 in bold red. Featuring vibrant yellow accents, this jersey is designed for both comfort and performance, with breathable fabric that ensures flexibility and moisture control during intense matches. Ideal for fans and players, this jersey is available in sizes S, M, L, XL, 2XL, and 3XL. Priced at 750,000 VND, it is a premium choice for those who want to show their team spirit in style. Perfect for both casual wear and sporting events.', 11, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (142, N'Bộ quần áo bóng đá Jogarbola Vibrant "D.Purple" MJ-TP0924.B02-01 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/1-1729654482457.jpg?v=1729660781827', 255000.0000, N'Bộ quần áo bóng đá Jogarbola Vibrant "D.Purple" MJ-TP0924.B02-01 - Hàng Chính Hãng
', N'Get ready for your next game with the Jogarbola Vibrant "D.Purple" Football Kit. This stylish kit features a dynamic purple and blue design, offering both comfort and performance on the field. Made from high-quality fabric, it ensures breathability and flexibility for optimal movement during play. Available in sizes S, M, L, XL, and 2XL, this kit is priced at 255,000 VND. Perfect for both training and matches, it delivers the ideal combination of style and functionality for football enthusiasts.', 11, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (143, N'Áo tập thể thao Jogarbola nữ "Hồng" JG-9028-02 - Hàng Chính Hãng', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9028-02-01-1686824149952.jpg?v=1686826222627', 339000.0000, N'Áo tập thể thao Jogarbola nữ "Hồng" JG-9028-02 - Hàng Chính Hãng', N'Stay stylish and comfortable with the Jogarbola Women''s Training Top in a soft pink shade. Designed for active women, this top offers a modern cropped fit, perfect for a variety of workouts or casual wear. Made with breathable, stretchable fabric, it ensures maximum comfort and flexibility during your activities. Available in sizes S, M, and L, the top is priced at 339,000 VND, down from 395,000 VND, making it a great value for your fitness wardrobe.', 13, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (144, N'Quần tập thể thao Jogarbola nữ ', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9030-01-01-1686824594477.jpg?v=1686826204057', 339000.0000, N'Quần Thể Thao', N'Mô tả đang cập nhật', 13, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (145, N'Bộ thi đấu bóng chuyền Sao Vàng Combat ', N'https://bizweb.dktcdn.net/100/485/982/products/22-1706526254083.jpg?v=1706527351447', 165000.0000, N'rfdsf', N'eger', 16, 5, 1)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (146, N'Áo tập thể thao Jogarbola nữ ', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9028-01-01-1686824071474.jpg?v=1686826130840', 339000.0000, N'Áo tập thể thao Jogarbola nữ "Xanh Ngọc" JG-9028-01 - Hàng Chính Hãng
', N'Stay comfortable and stylish with the Jogarbola Women''s Training Shorts in classic black. Designed for active women, these shorts offer a perfect blend of comfort and flexibility, ideal for various workouts or casual wear. Made with breathable and stretchy fabric, they provide ease of movement and support. Available in sizes M and L, these training shorts are priced at 339,000 VND, down from 395,000 VND, offering great value for your activewear collection. Perfect for staying cool and confident during your fitness sessions.', 13, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (147, N'Áo tập thể thao Jogarbola nữ ', N'https://bizweb.dktcdn.net/100/485/982/products/jg-9028-01-01-1686824071474.jpg?v=1686826130840', 339000.0000, N'Áo tập thể thao Jogarbola nữ "Xanh Ngọc" JG-9028-01 - Hàng Chính Hãng
', N'Stay comfortable and stylish with the Jogarbola Women''s Training Shorts in classic black. Designed for active women, these shorts offer a perfect blend of comfort and flexibility, ideal for various workouts or casual wear. Made with breathable and stretchy fabric, they provide ease of movement and support. Available in sizes M and L, these training shorts are priced at 339,000 VND, down from 395,000 VND, offering great value for your activewear collection. Perfect for staying cool and confident during your fitness sessions.', 13, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (148, N'Ván trượt trẻ em từ 4 đến 7 tuổi - Play 120 họa tiết hoạt hình', N'https://contents.mediadecathlon.com/p2444102/k$a54f1e42016e11e0dd43c21532853437/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-tre%CC%89-em-t%C6%B0%CC%80-4-%C4%91%C3%AA%CC%81n-7-tu%C3%B4%CC%89i-play-120-ho%CC%A3a-ti%C3%AA%CC%81t-ho%E1%BA%A1t-h%C3%ACnh-decathlon-8640793.jpg?f=768x0&format=auto', 899000.0000, N'Ván trượt trẻ em từ 4 đến 7 tuổi - Play 120 họa tiết hoạt hình
DECATHLON

Mã sản phẩm: 8640793', N'Introduce your little one to the joy of skateboarding with the Play 120 Children''s Skateboard. Designed for kids aged 4 to 7, this skateboard features a fun, colorful cartoon theme with a playful space design. The sturdy board and yellow wheels offer great stability and are perfect for young beginners learning to balance. With a price of 899,000 VND, this skateboard is a fun, exciting way to keep your child active and entertained while developing their coordination and balance skills.', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (149, N'Giày cổ thấp trượt ván và trượt ván dài Vulca 100 cho người lớn - Đen/Trắng', N'https://contents.mediadecathlon.com/p1822393/k$e340c49b3ec0ebc3ae8cbed5e91ed6dc/gia%CC%80y-c%C3%B4%CC%89-th%C3%A2%CC%81p-tr%C6%B0%C6%A1%CC%A3t-v%C3%A1n-v%C3%A0-tr%C6%B0%E1%BB%A3t-v%C3%A1n-d%C3%A0i-vulca-100-cho-ng%C6%B0%C6%A1%CC%80i-l%C6%A1%CC%81n-%C4%91en-tr%E1%BA%AFng-decathlon-8577224.jpg?f=768x0&format=auto', 739000.0000, N'Vulca Low Skateboarding Shoes for Adults – Black/White', N'These stylish Vulca Low Skateboarding Shoes are perfect for adults who enjoy both comfort and performance. Designed with a classic black and white color combination, these shoes are ideal for skating or casual wear. They feature a durable and flexible design with comfortable cushioning, providing excellent grip and support. Priced at 739,000 VND, they offer great value and come with a 50% discount for a limited time. Perfect for skateboarders looking for a reliable, stylish pair of shoes for their next ride.', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (150, N'Dụng cụ sửa xe đạp đa năng 100', N'https://contents.mediadecathlon.com/p1115060/k$3560e74f25865d27cd2d2857525ba97a/d%E1%BB%A5ng-c%E1%BB%A5-s%E1%BB%ADa-xe-%C4%91%E1%BA%A1p-%C4%91a-n%C4%83ng-100-decathlon-8386669.jpg?f=768x0&format=auto', 90000.0000, N'B''Twin Multi-Tool for Bicycle Repair

', N'Keep your bike in top condition with the B''Twin Multi-Tool, designed for quick and efficient bicycle repairs on the go. Featuring multiple tools in one compact design, this essential toolset includes various wrenches and screwdrivers to handle any maintenance task while cycling. Lightweight and durable, it''s the perfect companion for every rider. Priced at only 99,000 VND, this multi-tool is currently on sale with a 50% discount. A must-have for cyclists who need reliability and convenience in their toolkits.', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (151, N'Ván trượt dài - Carve 540 họa tiết', N'https://contents.mediadecathlon.com/p1645122/k$4325a6ca56dd59e9c9518efd1f4e6b75/va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-da%CC%80i-carve-540-ho%CC%A3a-ti%C3%AA%CC%81t-decathlon-8523398.jpg?f=768x0&format=auto', 3399000.0000, N'Carve 540 Longboard with Vibrant Design – 3,399,000 VND

', N'Experience smooth rides with the Carve 540 Longboard, featuring a vibrant and playful design with colorful frog and plant patterns. This longboard is built for durability, offering great control and comfort during your rides. Perfect for both beginners and experienced skaters, the Carve 540 ensures stability and easy maneuverability. It is priced at 3,399,000 VND, with a 50% discount currently available, making it an excellent choice for those seeking style and performance. Get ready to cruise in style with this high-quality longboard!', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (152, N'Giấy nhám tự dính cho ván trượt', N'https://contents.mediadecathlon.com/p1291109/k$7d9a8109afa0575c515c0320533beb50/gi%C3%A2%CC%81y-nha%CC%81m-t%C6%B0%CC%A3-di%CC%81nh-cho-va%CC%81n-tr%C6%B0%C6%A1%CC%A3t-decathlon-8111158.jpg?f=768x0&format=auto', 119000.0000, N'Self-Adhesive Skateboard Grip Tape – 119,000 VND

', N'Ensure better traction and control with this self-adhesive skateboard grip tape. Designed for durability and ease of application, this high-quality tape provides a secure grip for a safer and smoother ride. The black grip tape is ideal for any skateboard or longboard, offering superior performance for both beginners and experienced skaters. Available for just 119,000 VND, it’s the perfect accessory for your board.', 1, 5, 0)
GO
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (153, N'Balo thể thao 17L - Đỏ', N'https://contents.mediadecathlon.com/p2704911/k$5584c523b718cf12890a01828cf907dc/balo-th%E1%BB%83-thao-17l-%C4%91%E1%BB%8F-kipsta-8887029.jpg?f=768x0&format=auto', 245000.0000, N'Kipsta 17L Sports Backpack – Red

', N'Carry your gear in style with the Kipsta 17L Sports Backpack in a bold red color. This compact yet spacious backpack is designed for active individuals, offering enough room for your essentials while remaining lightweight. With its vibrant color and durable material, it’s perfect for both sports activities and casual use. Priced at 245,000 VND, it is currently available with a 50% discount, making it a great value. Ideal for those looking for a practical, stylish, and affordable sports backpack.', 1, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (154, N'Giày trượt patin 1 hàng FIT100 cho người lớn - Đen', N'https://contents.mediadecathlon.com/p2075761/k$481f6df57ca8e82513e265ea6e5ba029/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-fit100-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-%C4%91en-oxelo-8614734.jpg?f=768x0&format=auto', 1399000.0000, N'Oxelo FIT100 Inline Skates for Adults – Black

', N'Take your skating experience to the next level with the Oxelo FIT100 Inline Skates. Designed for comfort and durability, these black skates are perfect for adult beginners or those looking to enjoy a smooth, controlled ride. With a sturdy build and reliable wheels, they offer great performance whether you''re skating outdoors or on smooth surfaces. Priced at 1,399,000 VND, these skates are currently available with a 50% discount, making them an affordable choice for those seeking a fun and practical way to stay active.', 1, 1, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (155, N'Giày trượt patin 1 hàng Freeride MF500 cho người lớn - Kaki nhạt', N'https://contents.mediadecathlon.com/p2152434/k$a357a00dc44f572d2c01f75ead47533c/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-kaki-nh%E1%BA%A1t-oxelo-8738741.jpg?f=768x0&format=auto', 3399000.0000, N'Oxelo Freeride MF500 Inline Skates for Adults – Khaki

', N'Elevate your skating with the Oxelo Freeride MF500 Inline Skates in stylish khaki. Perfect for adults who enjoy both comfort and performance, these skates are designed for freeride skating, offering excellent stability, maneuverability, and durability. With their high-quality build and sleek design, they’re ideal for both beginners and experienced skaters. Priced at 3,399,000 VND, these skates are currently on sale with a 50% discount, making them an excellent value for anyone looking to enjoy smooth, controlled rides.', 8, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (156, N'Giày trượt 1 hàng Freeskate MF900 cho người lớn - Xanh lá', N'https://contents.mediadecathlon.com/p2152454/k$464ac1042400d991f1c7ec745f4732c9/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-1-h%C3%A0ng-freeskate-mf900-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-xanh-l%C3%A1-oxelo-8738700.jpg?f=768x0&format=auto', 3999000.0000, N'Oxelo Freeskate MF900 Inline Skates for Adults – Green

', N'Step up your skating game with the Oxelo Freeskate MF900 Inline Skates, designed for adults who love freestyle skating. These high-performance skates feature a sleek green design, providing both style and functionality. Engineered for durability and speed, the skates offer a comfortable fit and excellent control, ideal for both urban and park skating. Priced at 3,999,000 VND, these skates are currently available with a 50% discount, making them a great value for anyone looking to enhance their skating experience.', 8, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (157, N'Tất trượt patin bảo vệ bàn chân - 100 xám', N'https://contents.mediadecathlon.com/p2487620/k$a712df6a50d1e3dbb53f36d316ae24e9/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto', 90000.0000, N'https://contents.mediadecathlon.com/p2487611/k$2440cf092c8fc4ec19481457e1638f56/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2487611/k$2440cf092c8fc4ec19481457e1638f56/t%E1%BA%A5t-tr%C6%B0%E1%BB%A3t-patin-b%E1%BA%A3o-v%E1%BB%87-b%C3%A0n-ch%C3%A2n-100-x%C3%A1m-oxelo-8809529.jpg?f=768x0&format=auto', 8, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (158, N'Giày trượt patin 1 hàng Freeride MF500 cho người lớn - Trắng', N'https://contents.mediadecathlon.com/p2152966/k$a28397880ee5a3050ebf20dfa87a209b/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto', 3599000.0000, N'https://contents.mediadecathlon.com/p2152965/k$ba8f7d0763d203287d9668aad97b4576/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto', N'https://contents.mediadecathlon.com/p2152965/k$ba8f7d0763d203287d9668aad97b4576/gi%C3%A0y-tr%C6%B0%E1%BB%A3t-patin-1-h%C3%A0ng-freeride-mf500-cho-ng%C6%B0%E1%BB%9Di-l%E1%BB%9Bn-tr%E1%BA%AFng-oxelo-8738742.jpg?f=1024x0&format=auto', 8, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (159, N'Áo polo cưỡi ngựa cho nữ ngắn tay 500 - Xanh lá', N'https://contents.mediadecathlon.com/p2126795/k$2dd086a13773ad87b35c44a083f0bc0a/a%CC%81o-polo-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-cho-n%C6%B0%CC%83-ng%C4%83%CC%81n-tay-500-xanh-l%C3%A1-fouganza-8669932.jpg?f=768x0&format=auto', 295000.0000, N'Fouganza Women''s Polo Shirt for Equestrian Riding – Short Sleeve, Green', N'Stay stylish and comfortable during your equestrian rides with the Fouganza Women''s Polo Shirt. Designed for active riders, this green polo shirt offers both flexibility and breathability, ensuring you stay cool and comfortable. The short sleeves and lightweight fabric are perfect for outdoor activities, providing a flattering fit while allowing freedom of movement. Priced at 295,000 VND, this shirt is currently available with a 50% discount, making it an excellent addition to your riding wardrobe.', 9, 6, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (160, N'Mũ bảo hiểm cưỡi ngựa 100 - Đen', N'https://contents.mediadecathlon.com/p2126483/k$43cce0b9a8dcdf2ce17e46a4a404e388/mu%CC%83-ba%CC%89o-hi%C3%AA%CC%89m-c%C6%B0%C6%A1%CC%83i-ng%C6%B0%CC%A3a-100-%C4%91en-fouganza-961392.jpg?f=768x0&format=auto', 539000.0000, N'Fouganza 100 Equestrian Helmet for Riding – Black

', N'Ensure safety and comfort with the Fouganza 100 Equestrian Helmet, designed for riders who prioritize protection. This black helmet is perfect for beginners and experienced equestrians alike, offering a snug and secure fit. Made with durable materials and breathable padding, it keeps you safe and cool during your rides. Priced at 539,000 VND, it is currently available with a 50% discount, making it an affordable option for those looking for reliable head protection while riding.', 9, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (161, N'Áo bảo hộ cơ thể cưỡi ngựa trẻ em mức bảo vệ 2 - 100 đen', N'https://contents.mediadecathlon.com/p2588818/k$ade7644ecde359ccea67fb08f7ea5b19/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto', 1399000.0000, N'https://contents.mediadecathlon.com/p2588841/k$74a4968a9b818c822ae5a7949ab97528/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2588841/k$74a4968a9b818c822ae5a7949ab97528/a%CC%81o-ba%CC%89o-h%C3%B4%CC%A3-c%C6%A1-th%C3%AA%CC%89-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-tr%E1%BA%BB-em-m%E1%BB%A9c-b%E1%BA%A3o-v%E1%BB%87-2-100-%C4%91en-fouganza-8801391.jpg?f=768x0&format=auto', 9, 3, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (162, N'Quần cưỡi ngựa nam cho người mới bắt đầu - 100 đen', N'https://contents.mediadecathlon.com/p2800958/k$95e4358461d7712a2fa075deb24147be/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto', 839000.0000, N'https://contents.mediadecathlon.com/p2800956/k$fe2e58480c7b69212b284133b7340e6b/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto', N'https://contents.mediadecathlon.com/p2800956/k$fe2e58480c7b69212b284133b7340e6b/qu%E1%BA%A7n-c%C6%B0%E1%BB%A1i-ng%E1%BB%B1a-nam-cho-ng%C6%B0%E1%BB%9Di-m%E1%BB%9Bi-b%E1%BA%AFt-%C4%91%E1%BA%A7u-100-%C4%91en-fouganza-8874142.jpg?f=768x0&format=auto', 9, 5, 0)
INSERT [dbo].[Product] ([pID], [pName], [image], [price], [title], [description], [cID], [pAmount], [isDeleted]) VALUES (163, N'Diều thả nhẹ & nhạy gió - MFK 140 họa tiết con bạch tuộc', N'https://contents.mediadecathlon.com/p2481139/k$b70d18a61fd0c41b324ebf0b032048c7/di%C3%AA%CC%80u-th%E1%BA%A3-nh%E1%BA%B9-nh%E1%BA%A1y-gi%C3%B3-mfk-140-h%E1%BB%8Da-ti%E1%BA%BFt-con-b%E1%BA%A1ch-tu%E1%BB%99c-orao-8306395.jpg?f=768x0&format=auto', 299000.0000, N'
5/5
There is a specific and very special type of joy that can only be had by chasing a stunned-looking octopus as it flutters erratically across the park. Even my father in law had fun. 10/10 would buy again.', N'
5/5
There is a specific and very special type of joy that can only be had by chasing a stunned-looking octopus as it flutters erratically across the park. Even my father in law had fun. 10/10 would buy again.', 10, 5, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Size] ON 

INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (1, 1, 5)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (2, 1, 6)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (3, 1, 7)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (4, 2, 6)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (5, 2, 7)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (6, 3, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (7, 3, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (8, 3, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (12, 125, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (13, 125, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (14, 122, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (15, 122, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (16, 122, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (17, 120, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (18, 120, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (19, 120, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (20, 119, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (21, 109, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (22, 109, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (23, 71, 5)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (24, 71, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (25, 71, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (26, 71, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (37, 126, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (38, 126, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (39, 127, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (40, 127, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (41, 127, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (42, 128, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (43, 128, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (44, 128, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (45, 128, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (46, 129, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (47, 129, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (48, 130, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (49, 130, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (50, 131, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (51, 131, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (52, 131, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (53, 131, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (54, 132, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (55, 132, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (56, 132, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (57, 133, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (58, 133, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (59, 133, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (60, 133, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (61, 134, 5)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (62, 134, 6)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (63, 134, 7)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (64, 134, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (65, 134, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (66, 134, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (67, 134, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (68, 134, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (69, 134, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (70, 135, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (71, 135, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (72, 135, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (73, 135, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (74, 135, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (75, 135, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (76, 136, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (77, 136, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (78, 136, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (79, 136, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (80, 137, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (81, 137, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (82, 137, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (83, 137, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (84, 138, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (85, 138, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (86, 138, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (87, 138, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (88, 139, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (89, 139, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (90, 140, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (91, 140, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (92, 140, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (93, 140, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (94, 141, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (95, 141, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (96, 141, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (97, 141, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (98, 142, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (99, 142, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (100, 142, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (101, 142, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (102, 143, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (103, 143, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (104, 143, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (105, 143, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (114, 145, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (115, 145, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (116, 145, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (117, 145, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (118, 144, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (119, 144, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (120, 144, 3)
GO
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (121, 144, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (130, 146, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (131, 146, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (132, 146, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (133, 146, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (134, 147, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (135, 147, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (136, 147, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (137, 147, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (138, 148, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (148, 149, 5)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (149, 149, 6)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (150, 149, 7)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (151, 149, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (152, 149, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (153, 149, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (154, 149, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (155, 149, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (156, 149, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (157, 150, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (158, 150, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (159, 150, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (160, 151, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (161, 151, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (162, 151, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (163, 152, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (164, 153, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (165, 153, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (166, 153, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (167, 154, 5)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (168, 154, 6)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (169, 154, 7)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (170, 154, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (171, 154, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (172, 154, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (173, 154, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (174, 154, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (175, 154, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (176, 155, 7)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (177, 155, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (178, 155, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (179, 155, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (180, 155, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (181, 155, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (182, 155, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (183, 156, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (184, 156, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (185, 156, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (186, 156, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (187, 156, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (188, 156, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (189, 157, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (190, 157, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (191, 157, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (192, 158, 8)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (193, 158, 9)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (194, 158, 10)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (195, 158, 11)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (196, 158, 12)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (197, 158, 13)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (198, 159, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (199, 159, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (200, 159, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (201, 159, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (202, 160, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (203, 160, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (204, 160, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (205, 161, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (206, 161, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (207, 161, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (208, 162, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (209, 162, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (210, 162, 3)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (211, 162, 4)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (212, 163, 1)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (213, 163, 2)
INSERT [dbo].[Product_Size] ([id], [pID], [sizeId]) VALUES (214, 163, 3)
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
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[SubImage] ON 

INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (533, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1739336413732.jpg?v=1739336418463')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (534, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336413741.jpg?v=1739336419353')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (535, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336413749.jpg?v=1739336420317')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (536, 126, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336413749.jpg?v=1739336420317')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (537, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736937642309.png?v=1736937648307')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (538, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736937642326.png?v=1736937648813')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (539, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736937642326.png?v=1736937648813')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (540, 127, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736937642326.png?v=1736937648813')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (541, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1736741570267.jpg?v=1736741574930')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (542, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/8d651afa6b49bc17e558-1736741570269.jpg?v=1736741575590')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (543, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7d0ba99871d5a78bfec45-1736741570273.jpg?v=1736741576183')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (544, 128, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7d0ba99871d5a78bfec45-1736741570273.jpg?v=1736741576183')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (545, 129, N'https://bizweb.dktcdn.net/100/485/982/products/1-1739336319401.jpg?v=1739336324170')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (546, 129, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1739336319411.jpg?v=1739336325330')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (547, 129, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1739336319411.jpg?v=1739336325330')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (548, 129, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336319420.jpg?v=1739336326640')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (549, 130, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1739336230279.jpg?v=1739336235437')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (550, 130, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1739336230288.jpg?v=1739336236230')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (551, 130, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336230298.jpg?v=1739336237223')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (552, 130, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1739336230298.jpg?v=1739336237223')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (553, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736935304196.png?v=1736935311307')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (554, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736935304212.png?v=1736935312607')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (555, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736935304212.png?v=1736935312607')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (556, 131, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1736935304222.png?v=1736935313757')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (557, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (558, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (559, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (560, 132, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742266009143.jpg?v=1742266017057')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (561, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1742719120968.jpg?v=1742791386883')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (562, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1742719121793.jpg?v=1742791386883')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (563, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1742719122591.jpg?v=1742791386883')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (564, 133, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1742718351774.png?v=1742791386883')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (565, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1742719096585.jpg?v=1742719100227')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (566, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1742719097533.jpg?v=1742719101267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (567, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1742719097533.jpg?v=1742719101267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (568, 134, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1742719098556.jpg?v=1742719102173')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (569, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1742719062283.jpg?v=1742719065790')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (570, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1742719063145.jpg?v=1742719066633')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (571, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1742719063858.jpg?v=1742719067493')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (572, 135, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1742719064937.jpg?v=1742719068950')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (573, 136, N'https://bizweb.dktcdn.net/100/485/982/products/8.jpg?v=1741682201577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (574, 136, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-1740991485153.jpg?v=1741682201577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (575, 136, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740991485166.jpg?v=1741682201577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (576, 136, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740991485177.jpg?v=1741682201577')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (577, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/1-1740991448008.jpg?v=1741682211267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (578, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740991448023.jpg?v=1741682211267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (579, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740991448035.jpg?v=1741682211267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (580, 137, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740991448050.jpg?v=1741682211267')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (581, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740991388767.jpg?v=1741682219680')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (582, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1740991388767.jpg?v=1741682219680')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (583, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1740991388774.jpg?v=1741682219680')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (584, 138, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1740991388777.jpg?v=1741682219680')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (585, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/2-1735194881962.jpg?v=1735199116700')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (586, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1690282065607.jpg?v=1735199116707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (587, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1690282067231.jpg?v=1735199116707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (588, 139, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/6-1690282067231.jpg?v=1735199116707')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (589, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/7-1742178409640.jpg?v=1742178416123')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (590, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/8-1742178409651.jpg?v=1742178417923')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (591, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1742178409660.jpg?v=1742178419257')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (592, 140, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/9-1742178409660.jpg?v=1742178419257')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (593, 141, N'https://bizweb.dktcdn.net/100/485/982/products/2-1742176692653.jpg?v=1742176707590')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (594, 141, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/3-1742176692657.jpg?v=1742176708563')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (595, 141, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/4-1742176692667.jpg?v=1742176709270')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (596, 141, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/5-1742176692676.jpg?v=1742176710563')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (597, 142, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482477.png?v=1729660782367')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (598, 142, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482498.png?v=1729660783510')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (599, 142, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482502.png?v=1729660783850')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (600, 142, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1729654482516.png?v=1729660784530')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (601, 143, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824097556.png?v=1686826223243')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (602, 143, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/24-d75e6345d83747d5ae368ed032608-1686824150929.jpg?v=1686826223937')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (603, 143, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824122997.png?v=1686826224730')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (604, 143, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824128741.png?v=1686826227000')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (605, 144, N'https://bizweb.dktcdn.net/100/485/982/products/image-1686824554023.png?v=1686826206537')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (606, 144, N'https://bizweb.dktcdn.net/100/485/982/products/image-1686824556833.png?v=1686826208020')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (607, 144, N'https://bizweb.dktcdn.net/100/485/982/products/image-1686824562542.png?v=1686826208543')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (608, 144, N'https://bizweb.dktcdn.net/100/485/982/products/image-1686824565268.png?v=1686826209423')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (613, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824007679.png?v=1686826132073')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (614, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824007679.png?v=1686826132073')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (615, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/27-0e5f6e78c9e64a7dbcd1cfb09ad28-1686824072631.jpg?v=1686826132723')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (616, 146, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824028976.png?v=1686826133793')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (617, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824007679.png?v=1686826132073')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (618, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824007679.png?v=1686826132073')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (619, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/27-0e5f6e78c9e64a7dbcd1cfb09ad28-1686824072631.jpg?v=1686826132723')
INSERT [dbo].[SubImage] ([subImageID], [pID], [SImage]) VALUES (620, 147, N'https://bizweb.dktcdn.net/thumb/medium/100/485/982/products/image-1686824028976.png?v=1686826133793')
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
GO
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
SET IDENTITY_INSERT [dbo].[SubImage] OFF
GO
INSERT [dbo].[View] ([viewed]) VALUES (252)
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
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
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
