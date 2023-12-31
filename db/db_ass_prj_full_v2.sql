USE [Assignment_PRJ301]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 28/08/2023 2:30:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__tblOrder__E4FEDE2A6B87AABC] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 28/08/2023 2:30:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderCode] [varchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[order_date] [date] NULL,
	[total] [int] NOT NULL,
	[status] [varchar](20) NULL,
	[payment_method] [varchar](10) NULL,
	[payment_date] [datetime] NULL,
 CONSTRAINT [PK__tblOrder__0809337DADFFD651] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 28/08/2023 2:30:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [varchar](50) NOT NULL,
 CONSTRAINT [PK__tblProdu__2D10D14AECADC89F] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 28/08/2023 2:30:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[googleID] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[avatar] [nvarchar](255) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1, 1, N'pro02', 390000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, 1, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, 2, N'pro03', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, 3, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, 4, N'pro02', 390000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, 5, N'pro07', 590000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, 6, N'pro05', 790000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, 6, N'pro04', 520000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, 7, N'pro06', 299000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, 8, N'pro02', 390000, 10)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, 9, N'pro02', 390000, 10)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (12, 9, N'pro06', 299000, 38)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (13, 10, N'pro07', 590000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (14, 11, N'pro02', 390000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (15, 11, N'pro01', 300000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (16, 11, N'pro08', 900000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (17, 11, N'pro07', 590000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (18, 11, N'pro06', 299000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (19, 11, N'pro05', 790000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (20, 11, N'pro04', 520000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (21, 11, N'pro03', 499000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (22, 12, N'pro03', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (23, 13, N'pro02', 390000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (24, 14, N'pro02', 390000, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (25, 15, N'pro08', 900000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (26, 15, N'pro04', 520000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (27, 15, N'pro03', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (28, 16, N'pro02', 390000, 14)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1025, 1015, N'pro08', 900000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1026, 1015, N'pro07', 590000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1027, 1015, N'pro06', 299000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1028, 1015, N'pro05', 790000, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1, N'804871', N'Hoadnt', CAST(N'2023-07-05' AS Date), 710000, N'PENDING', N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (2, N'573891', N'Hoadnt', CAST(N'2023-07-05' AS Date), 519000, N'CANCELLED', N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (3, N'671249', N'Hoadnt', CAST(N'2023-07-06' AS Date), 320000, N'COMPLETED', N'VNPAY', CAST(N'2023-07-06T00:00:45.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (4, N'318599', N'Hoadnt', CAST(N'2023-07-06' AS Date), 800000, N'COMPLETED', N'VNPAY', CAST(N'2023-07-06T00:03:07.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (5, N'789946', N'Hoadnt', CAST(N'2023-07-06' AS Date), 610000, N'PENDING', N'COD', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (6, N'100564', N'giaduc0123', CAST(N'2023-07-08' AS Date), 1330000, N'COMPLETED', N'VNPAY', CAST(N'2023-07-08T08:09:22.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (7, N'856143', N'giaducdang', CAST(N'2023-07-08' AS Date), 618000, N'COMPLETED', N'COD', CAST(N'2023-07-20T17:33:37.063' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (8, N'052089', N'giaducdang', CAST(N'2023-07-08' AS Date), 3920000, N'CANCELLED', N'VNPAY', CAST(N'2023-07-08T08:18:43.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (9, N'957896', N'giaducdang', CAST(N'2023-07-08' AS Date), 15282000, N'CANCELLED', N'VNPAY', CAST(N'2023-07-08T08:29:20.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (10, N'432990', N'Hoadnt', CAST(N'2023-07-08' AS Date), 1200000, N'PENDING', N'COD', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (11, N'628153', N'giaduc0123', CAST(N'2023-07-08' AS Date), 8596000, N'COMPLETED', N'VNPAY', CAST(N'2023-07-08T13:49:07.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (12, N'980569', N'Hoadnt', CAST(N'2023-07-08' AS Date), 519000, N'PENDING', N'COD', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (13, N'688280', N'giaduc0123', CAST(N'2023-07-08' AS Date), 410000, N'PENDING', N'COD', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (14, N'585885', N'giaduc0123', CAST(N'2023-07-08' AS Date), 1190000, N'COMPLETED', N'VNPAY', CAST(N'2023-07-08T21:21:07.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (15, N'393650', N'NgocBao', CAST(N'2023-07-15' AS Date), 2839000, N'COMPLETED', N'COD', CAST(N'2023-07-21T15:34:14.600' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (16, N'380125', N'Hoadnt', CAST(N'2023-07-15' AS Date), 5480000, N'COMPLETED', N'COD', CAST(N'2023-07-21T15:35:12.827' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1015, N'329412', N'giaduc0123', CAST(N'2023-07-20' AS Date), 3798000, N'COMPLETED', N'VNPAY', CAST(N'2023-07-20T21:14:39.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro01', N'Mixed Basket Pink and Lilac', 300000, 15, N'Mixed-Basket-Pink-and-Lilac.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro02', N'Heavenly Red Rose Hand Tied', 390000, 34, N'Heavenly-Red-Rose-Hand-Tied.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro03', N'Autumn Basket', 499000, 27, N'Autumn-basket.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro04', N'Vera Wang Purest Grace', 520000, 12, N'Vera-Wang-Purest-Grace.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro05', N'Luxury Red Wine Gift Basket', 790000, 44, N'Luxury-Red-Wine-Gift-Basket.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro06', N'Pink Perfect Gift', 299000, 34, N'Pink-Perfect-Gift.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro07', N'Watering Can with Bailey Bear', 590000, 54, N'Watering-Can-with-Bailey-Bear.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro08', N'White Radiance Hand Tied', 900000, 19, N'White-Radiance-Hand-tied.webp')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'baoduong', N'Duong Ton Bao', N'1', N'AD', N'Vung Tau', NULL, N'duongbao2k3@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'ducdang', N'Dang Gia Duc', N'1', N'US', N'Long An', NULL, N'giaducdang@gmail.com', NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'ducdang03', N'Dang Duc', N'1234', N'US', NULL, NULL, N'giaduc0123@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'duongbao2k3', N'Duong Ton Bao', N'123456', N'US', NULL, NULL, N'duongbao2k3@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'giaduc0123', N'Gia Đức Đặng Phan', N'778219', N'US', N'Can Giuoc, Long An', N'115495047193819919329', N'giaduc0123@gmail.com', N'https://lh3.googleusercontent.com/a/AAcHTtcMumBcs879wZT8VT7YH4aY8na_xvWMLymAEb5tk9qHph-T=s96-c', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'giaducdang', N'Gia Đức Đặng', N'752155', N'US', N'Phuong Hiep Phu, TP. Thu Duc, TP. HCM', N'113270161035464853296', N'giaducdang@gmail.com', N'https://lh3.googleusercontent.com/a/AAcHTtcsTuhYDgal9_nqRUarLLyCuIQaS__HL8c0CWTo1ePOih4=s96-c', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', N'HCM', NULL, N'giaducdang@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'NgocBao', N'Pham Ngoc Buh', N'1234', N'US', N'160 XVNT p21 Q.Binh Thanh', NULL, N'1005hanhphuc@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblOrder__23699D68CD6D6C67]    Script Date: 28/08/2023 2:30:32 CH ******/
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [UQ__tblOrder__23699D68CD6D6C67] UNIQUE NONCLUSTERED 
(
	[orderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__order__6754599E] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK__tblOrderD__order__6754599E]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__produ__68487DD7] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK__tblOrderD__produ__68487DD7]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK__tblOrders__userI__6383C8BA] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK__tblOrders__userI__6383C8BA]
GO
