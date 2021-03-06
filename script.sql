USE [master]
GO
/****** Object:  Database [J3.L.P0016]    Script Date: 12-Aug-21 8:44:28 PM ******/
CREATE DATABASE [J3.L.P0016]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0016', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0016.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J3.L.P0016_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\J3.L.P0016_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [J3.L.P0016] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0016].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0016] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0016] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0016] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0016] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0016] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0016] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0016] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0016] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0016] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0016] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0016] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0016] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0016] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3.L.P0016] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0016] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0016] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0016] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0016] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [J3.L.P0016] SET DELAYED_DURABILITY = DISABLED 
GO
USE [J3.L.P0016]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12-Aug-21 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [varchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registration]    Script Date: 12-Aug-21 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[userID] [varchar](200) NOT NULL,
	[password] [varchar](50) NULL,
	[fullName] [varchar](300) NULL,
	[phone] [varchar](10) NULL,
	[address] [varchar](80) NULL,
	[isManage] [bit] NULL,
	[status] [bit] NULL,
	[createDate] [date] NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[request]    Script Date: 12-Aug-21 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[request](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[resourceID] [int] NULL,
	[userID] [varchar](200) NULL,
	[quantity] [int] NULL,
	[createDate] [date] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_request] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[resource]    Script Date: 12-Aug-21 8:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[resource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[color] [varchar](50) NULL,
	[img] [varchar](max) NULL,
	[usingDate] [date] NULL,
	[quantity] [int] NULL,
	[categoryID] [varchar](10) NULL,
 CONSTRAINT [PK_resource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[category] ([categoryID], [categoryName]) VALUES (N'E', N'Electronic')
INSERT [dbo].[category] ([categoryID], [categoryName]) VALUES (N'P', N'Physical')
INSERT [dbo].[registration] ([userID], [password], [fullName], [phone], [address], [isManage], [status], [createDate]) VALUES (N'nhvanh2111@gmai.com', N'2', N'Van Anh', N'0987654321', N'HCM', 0, 1, CAST(N'2021-08-11' AS Date))
INSERT [dbo].[registration] ([userID], [password], [fullName], [phone], [address], [isManage], [status], [createDate]) VALUES (N'pthnhi12@gmail.com', N'1', N'Nhi Nguyen', N'0123456789', N'BT', 0, 1, CAST(N'2021-08-11' AS Date))
INSERT [dbo].[registration] ([userID], [password], [fullName], [phone], [address], [isManage], [status], [createDate]) VALUES (N'vananh21@gmail.com', N'1', N'Nguyen Huynh Van Anh', N'0375606034', N'HCM', 1, 1, CAST(N'2021-08-11' AS Date))
SET IDENTITY_INSERT [dbo].[request] ON 

INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (205, 3, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-11' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (206, 7, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-11' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (207, 14, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-11' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (208, 12, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-11' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (209, 7, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (210, 12, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (211, 3, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'delete')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (212, 13, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (213, 7, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (214, 14, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (215, 12, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (216, 5, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (217, 6, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
INSERT [dbo].[request] ([requestID], [resourceID], [userID], [quantity], [createDate], [status]) VALUES (218, 3, N'nhvanh2111@gmai.com', 1, CAST(N'2021-08-12' AS Date), N'accept')
SET IDENTITY_INSERT [dbo].[request] OFF
SET IDENTITY_INSERT [dbo].[resource] ON 

INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (1, N'Laptop', N'Black White', N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80', CAST(N'2021-08-14' AS Date), 2, N'E')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (2, N'Moblie', N'Black', N'https://images.unsplash.com/photo-1498582801152-3ebe4158143e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80', CAST(N'2021-08-13' AS Date), 10, N'E')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (3, N'Chair', N'White', N'data:image/jpeg;base64,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', CAST(N'2021-08-02' AS Date), 5, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (4, N'Mirror', N'Brown', N'https://images.unsplash.com/photo-1520783077-5c05dd1fdc99?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80', CAST(N'2021-08-11' AS Date), 10, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (5, N'Guitar', N'Yellow', N'https://images.unsplash.com/photo-1558098329-a11cff621064?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=336&q=80', CAST(N'2021-08-08' AS Date), 10, N'E')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (6, N'Glasses', N'Black', N'https://tikibook.com/upload/news/022020/dia-chi-ban-gong-kinh-chat-luong-o-hue.jpg', CAST(N'2021-08-05' AS Date), 10, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (7, N'Fan', N'Pink White', N'https://cf.shopee.vn/file/5c845118d4b534410085f332e0d697e0', CAST(N'2021-08-10' AS Date), 5, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (8, N'Pillow', N'Light Blue', N'https://images.unsplash.com/photo-1570786240066-c0d753711cfe?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=801&q=80', CAST(N'2021-08-11' AS Date), 10, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (9, N'Table', N'Blue', N'https://noithatduckhang.com.vn/img/uploads/ban-may-tinh-hoa-phat-hp202.jpg', CAST(N'2021-08-04' AS Date), 5, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (10, N'Paper Photocopy', N'White ', N'https://photocopyduclan.com.vn/wp-content/uploads/2020/03/Gi%E1%BA%A5y-photo-b%E1%BB%8B-%E1%BA%A9m-%C6%B0%E1%BB%9Bt.jpg', CAST(N'2021-08-11' AS Date), 5, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (11, N'Paper roll', N'White ', N'https://i1-vnexpress.vnecdn.net/2018/11/29/anh-1-4813-1543501596.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=JEHJtliipKjnk0-IXFa0Sg', CAST(N'2021-08-03' AS Date), 5, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (12, N'Folder', N'Colorful', N'https://nhanhnhanh-vn.com/wp-content/uploads/2018/08/Webp.net-resizeimage-1.png', CAST(N'2021-08-09' AS Date), 20, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (13, N'Printer', N'White', N'https://thegioimayin.vn/wp-content/uploads/2019/08/lbp2900-2.jpg', CAST(N'2021-08-12' AS Date), 20, N'E')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (14, N'Fax', N'White', N'https://lapdatcameragiare.vn/wp-content/uploads/2018/04/450_KX_MB_2085.jpg', CAST(N'2021-08-11' AS Date), 5, N'E')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (15, N'Board', N'White', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8QEBAQDxIPDw8PEhAVEBAQDxAPDw0PFxUWFhUVFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OFQ8PFSsdFRkrKy0tLS0rKystKy0tKy0rLS0tLSstLS0rKy03LTcrNy03Ky0tLS03Ky0rKysrLSsrK//AABEIANMA7wMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAAAgUBAwYEB//EAEYQAAIBAgIECAgLBwUBAAAAAAABAgMRBAUGEiExQVFhcZGhscETMkJicoGi0QciM1JTgpLC0uHwFCNEg7KzwxUkNENkFv/EABYBAQEBAAAAAAAAAAAAAAAAAAABAv/EABsRAQACAwEBAAAAAAAAAAAAAAABEQIxQSFR/9oADAMBAAIRAxEAPwD7iAAAAAAACvzHEVk7UVFuy2u21t2tvPF+1Y/5lP2fxFlX8f1LtMhFX+2Y/wCjp9X4jDx2P+ip/r6xamGhYqnmWP8AoIfr6xCWb45fw8X0+8t2jXJCxUSzzHr+FT9ciD0hxq34P2p+4t5I1SQFW9J8Wt+Cl9qf4R/9XiOHBVPtT/Ae+aNbRR5FpbW4cHV+1L8BNaXT4cJVX1n+E2tGArK0q/8APU6fyJLSqPDRqdK9xrZFkoehaUw+iqeySWk9P6Op7PvPEyLLSL3Ks2p4jX1FKLptKSklwq6atwb+gsCmyDxqvNT7GXJFAAAAAAAAAAAAAAAAeXE+Mub3mTGK3rml2fmZAGDIIIshJE2RYGto1yRtZrkUaJI1s3SNbKjW0QaNrINFEGRZNkWQa2iLRsZBlFlkHjVean2MuSmyDxq38v7xcmVAAAAAAAAAAAAAAAAebFLbH19wTKyjjJzxGrNxslOySttUorhe3f1FlHcuZdgGTDMmAMMiyTIyAgyEibISA1SNbNkiDKiDRGxNkSiEkQNkiDAg0RkTZBoD15NiacKk4SlGMquqoRe+dr3t0ovj55mOaU8LVjia2t4HDqcqmrHWkop8C4dx9AoVYzjGcXeM4qUXxxaumSSEwARQAAAAAAAAAACr0ox88NgsXiKer4ShQrVIOScoqUYNptLerrcWhCtSjOMoTjGcJpxlGSUozi1Zpp7GmuADg9Ec5liqeGxU46k6tOuprVcVKXhIxcop7oy1LrkaOzpP4q5l2HN4qnGlWjGCjGKqVFGMUkopqUrJLcth0OHfxI/rhNSkNrMGGwZUZFsyyLAiRkSZBlRCRBk5EGBFkGTZEoiyEibISAgYZIiwKWpgKWJxMaFePhKVRtVINtKcbzdnbg+Kj6BGKSSSSS2JLYkjhcod8wjxJ7OTZXb7juxkQAAyoAAAAAAAAAAAAA5XOILw0m/JmmudpLsky3wUr04+vtZWZ+rVJ8yfQl7j35Y70lzy7TXGXquLmGYIrLZFi5gKwyLMtmGEa5EWTkQYEWRJMiyiLIMlIgwMMiZZG4FVkG3Hrn/x1Ped6cDoy745c8v7X5nfDLaYgAMtAAAAAAAAAAAAADm9JF8d8tN/ePRk0r0vrPsT7zXpNH40eWEl+ukho7O9F+l92JrjPVo2YuYbDZFDAISklvaXO7doGWRZ56mYUI76tJfzIt9CZ5qmeYVf9ifowm+xFHvZFlRV0lw63KrLmgl2tHkqaVw8mlN+lOMexMUW6BkTmJ6VTfi0oL0puXuIrP8AEPyYpebTlLtbA6WZrbOYqZtiH5Ul9WnDuILEYme7w0uRSm/6QlupZqnUit7iudpFFTy7Gz3UZvllGX3rHqp6PY+XkwhzuC7GwI6IyTxuzbtn/ah7z6CfPtDsPKnjZwkmnB4hSbaevJaqbVvJ3Jbtx9BGRiAAy0AAAAAAAAAAAAAKTSVfJP0l2FNl9WtQhqKMW9ms3uutmzathdaUL93Tfn26U/cSp6PUV5U3zasV1IrPVPPMMQ/Kpx5lB+8888XWe+rJc149iR08ckw63xb55y95uhlmHW6lD1xT7S2VLh61Sb3zlL0pu3aeZ4WpLxdX6sZTfYfSIYeC3RiuaKRsJZT5m8pns8I6sdZpJyoSppt8rRmOSTe6nXnyrWcelRS6z6WBa0+fUtGKz3ULcs5pff7iGX5DiatSpB4Z4eNPYqtbwGpV2tfu9Ryk+O7tvPogFlOUpaIS8qslyQpy75dx66OidFb6laXM4Qv0Rv1nQAhTx4PLKNJWjG/nTevN/We09iQAUAAHH5Ar5jWfJiH01InYHH6LbcbiH5k+ur+R2BctpjoABFAAAAAAAAAAAAAFNpYv9vfinHvXeWuHleEXxxi+ordKI3wtTk1H7SPXlU70KL46cP6UXidesAEUAAAAAAAAAAAAAADEtzA5HQ3biMS/Nh1zm+4685HQXbPFPko/5GdcXLbOOgAEaAAAAAAAAAAAAAFdpDG+Fr+g30be4xo5O+FoPzLdDa7j0ZrDWoVlx0qn9LK/Q+d8HT5HNe0y8Tq6ABFAAAAAAAAAAAAAAhXdoyfFF9hM0Y+VqVV8VOb9lgc1oDuxD86kuiN+86w5X4P1+6rvjqpdFOHvOqLltMdAAIoAAAAAAAAAAAAAhXjeMlxxa6Uc/oHO+Fa+bUkuqL7zozl9BHaOKh8yvLst90vE66gAEUAAAA82IzChT8epTjyOav0AekFFidK8JDdKU/Ri7dMrFfLTGU3bD0JTf1p9UV3ikt1oOSVfN63iwjQT4XqQ7bvqMrRnFVf+RipcsY60l7Tt1Fot0OJzPD0/lKtOPI5q/RvKPNtMKEISWHlr1dmreEtS99t72vsvuN+G0PwkfGU6r8+bSfqjYtsLl1Cl8lSpw5Ywin07x4euPr6eVNValGKlZXcpSlG/IrLZ6ynzHSTHVYS1p6sXGV4QUYaytuvv6y2xeiU54yolGUMPN3jOGrqxb1pSuudlRmejWKwrbf72j8+CbSXnR3x7C+cZ966z4PYv9lk5b5VZX9UYruOnOO0JzjDwoqhOShU15ta2yE9aV1aW69rbGdiSdtRoABFAAAAAAAAAAAAAA5PQ52xWYw4qzft1PyNebaS1sJmUaVb/AIdSEXF6qVuCUlLhs7XXEymq5XUxOZYulSqKlt127ytOLUHuj43jcJYhJfQMRj6NP5SpTh6U4p9BV4nS3Bw3SlP0IO3S7IrcNoJTW2rXqz41CMaafay0w2imBh/1Kb46kpVOpuw8PVRX05TdqNJyfBrSu/sxT7TV/qubV/kqMoJ7mqap9dRnZUMPTpq1OEILijFRXUbRZTiVo/mVb5asoLidSc39lWiezDaFUl8rVqTfFFRpx731nVAWUq8Lo7g6e1UYNrhneo/auWUIKKtFJLiSSRIEUAAAAAAABz+caKYeveUF4Go+GCWpJ+dHd0WKBVsxy12kvC0L7L3nStyS3w5tx3558wwka9KpRn4tWEovkTVrlifqUq8o0ow2Icad/BVp3UaU2rzaTbUHulsTdt+zcXh820YyF/6hTlX8Kp4SVaVKNo6rbp+D1m7XcbSlbla5j6SJrhGgAEUAAAAAAAAAAHF/CDou8SliqClLE0Y6uon8rTveyT4Vd8+0o/g5ry/b5xqayn4GcXGd1KLj4NarT27LWPqBwmnOWTw9WGZ4b4soOKrpL1Ko1wryXyWLE8SY67sFdkObU8XRjVhZPdON7uE+Fd6fEWJFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIVqUZxlCaUoyTUovapRexpkwB8mqZlDIcbUjVqf7W0JPfKToTbUbpXetFppcdnxn1iMk0mtz3cx80+FnRWOJlTqvWhTqR8HXnBR1k4vWpt3XCk435j6NhI2p00r2UIrbv3LfylmUhuABFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABGpTjJWklJPemk0/UyQAAAAAAAAAAAAAAAAAAAAAAAAAAAAf/Z', CAST(N'2021-08-01' AS Date), 10, N'P')
INSERT [dbo].[resource] ([id], [name], [color], [img], [usingDate], [quantity], [categoryID]) VALUES (16, N'Type of pens', N'Colorful', N'https://threadcurve.com/wp-content/uploads/2020/08/types-of-pens-Aug272020-1-min.jpg', CAST(N'2021-08-12' AS Date), 20, N'P')
SET IDENTITY_INSERT [dbo].[resource] OFF
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_registration] FOREIGN KEY([userID])
REFERENCES [dbo].[registration] ([userID])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_registration]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_resource] FOREIGN KEY([resourceID])
REFERENCES [dbo].[resource] ([id])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_resource]
GO
ALTER TABLE [dbo].[resource]  WITH CHECK ADD  CONSTRAINT [FK_resource_category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[resource] CHECK CONSTRAINT [FK_resource_category]
GO
USE [master]
GO
ALTER DATABASE [J3.L.P0016] SET  READ_WRITE 
GO
