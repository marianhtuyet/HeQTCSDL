--create database QuanLyDaNgoai
use QuanLyDaNgoai
set dateformat dmy


USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[CongTyDuLich]    Script Date: 29/11/2018 11:29:14 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CongTyDuLich](
	[MaCongTy] [nvarchar](6) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[DiaChi] [text] NULL,
	[SDT] [nvarchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCongTy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[CTLop]    Script Date: 29/11/2018 11:30:11 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CTLop](
	[MaHS] [int] NOT NULL,
	[MaLop] [nvarchar](6) NOT NULL,
	[MaNH] [int] NOT NULL,
 CONSTRAINT [pk_CTLop] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[MaLop] ASC,
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CTLop]  WITH CHECK ADD FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO

ALTER TABLE [dbo].[CTLop]  WITH CHECK ADD FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHoc] ([MaLop])
GO

ALTER TABLE [dbo].[CTLop]  WITH CHECK ADD FOREIGN KEY([MaNH])
REFERENCES [dbo].[NamHoc] ([MaNH])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[ChiPhi]    Script Date: 29/11/2018 11:30:23 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChiPhi](
	[MaDiaDiem] [nvarchar](6) NOT NULL,
	[MaChuyenDi] [nvarchar](6) NOT NULL,
	[VeCong] [float] NULL,
	[TienXe] [float] NULL,
	[TienAnTrua] [float] NULL,
	[PhiHuongDanVien] [float] NULL,
	[NuocUong] [float] NULL,
	[TienAnXe] [float] NULL,
	[LinhTinh] [float] NULL,
	[GhiChu] [text] NULL,
 CONSTRAINT [pk_ChiPhi] PRIMARY KEY CLUSTERED 
(
	[MaDiaDiem] ASC,
	[MaChuyenDi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChiPhi]  WITH CHECK ADD FOREIGN KEY([MaChuyenDi])
REFERENCES [dbo].[ChuyenDi] ([MaChuyenDi])
GO

ALTER TABLE [dbo].[ChiPhi]  WITH CHECK ADD FOREIGN KEY([MaDiaDiem])
REFERENCES [dbo].[DiaDiem] ([MaDiaDiem])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[ChiTietChuyenDi]    Script Date: 29/11/2018 11:30:56 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChiTietChuyenDi](
	[MaChuyenDi] [nvarchar](6) NULL,
	[ThoiGian] [smalldatetime] NULL,
	[HoatDong] [text] NULL,
	[GhiChu] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChiTietChuyenDi]  WITH CHECK ADD FOREIGN KEY([MaChuyenDi])
REFERENCES [dbo].[ChuyenDi] ([MaChuyenDi])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[ChuyenDi]    Script Date: 29/11/2018 11:31:09 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChuyenDi](
	[MaChuyenDi] [nvarchar](6) NOT NULL,
	[MaCongTyDuLich] [nvarchar](6) NULL,
	[MaDiaDiem] [nvarchar](6) NULL,
	[GioKhoiHanh] [time](7) NULL,
	[GioKetThuc] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChuyenDi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChuyenDi]  WITH CHECK ADD FOREIGN KEY([MaCongTyDuLich])
REFERENCES [dbo].[CongTyDuLich] ([MaCongTy])
GO

ALTER TABLE [dbo].[ChuyenDi]  WITH CHECK ADD FOREIGN KEY([MaDiaDiem])
REFERENCES [dbo].[DiaDiem] ([MaDiaDiem])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[DiaDiem]    Script Date: 29/11/2018 11:31:20 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DiaDiem](
	[MaDiaDiem] [nvarchar](6) NOT NULL,
	[TenDiaDiem] [nvarchar](50) NULL,
	[DiaChi] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDiaDiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[GiaoVien]    Script Date: 29/11/2018 11:31:36 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GiaoVien](
	[MaGV] [int]  NOT NULL,
	[TenGV] [nvarchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](11) NULL,
	[CMND] [nvarchar](12) NULL,
	[MaLop] [nvarchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHoc] ([MaLop])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[GiaoVienThamGia]    Script Date: 29/11/2018 11:31:51 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GiaoVienThamGia](
	[MaGiaoVien] [int] NOT NULL,
	[MaLop] [nvarchar](6) NOT NULL,
	[MaChuyenDi] [int] NOT NULL,
	[ThamGia] [bit] NULL,
 CONSTRAINT [pk_GiaoVienThamGia] PRIMARY KEY CLUSTERED 
(
	[MaGiaoVien] ASC,
	[MaLop] ASC,
	[MaChuyenDi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GiaoVienThamGia]  WITH CHECK ADD FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO

ALTER TABLE [dbo].[GiaoVienThamGia]  WITH CHECK ADD FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHoc] ([MaLop])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[HocSinh]    Script Date: 29/11/2018 11:32:06 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HocSinh](
	[MaHS] [int]  NOT NULL,
	[TenHS] [nvarchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TenCha] [nvarchar](50) NULL,
	[TenMe] [nvarchar](50) NULL,
	[TenNguoiDamHo] [nvarchar](50) NULL,
	[SDT] [nvarchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[HocSinhThamGia]    Script Date: 29/11/2018 11:32:14 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HocSinhThamGia](
	[MaHS] [int] NOT NULL,
	[MaLop] [nvarchar](6) NOT NULL,
	[MaChuyenDi] [int] NOT NULL,
	[ThamGia] [bit] NULL,
	[IsDongTien] [bit] NULL,
 CONSTRAINT [pk_HocSinhThamGia] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[MaLop] ASC,
	[MaChuyenDi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HocSinhThamGia]  WITH CHECK ADD FOREIGN KEY([MaLop])
REFERENCES [dbo].[LopHoc] ([MaLop])
GO

ALTER TABLE [dbo].[HocSinhThamGia]  WITH CHECK ADD FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[HopDong]    Script Date: 29/11/2018 11:32:22 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HopDong](
	[MaHopDong] [nvarchar](6) NOT NULL,
	[MaChuyenDi] [nvarchar](6) NULL,
	[MaCongTy] [nvarchar](6) NULL,
	[TriGia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([MaCongTy])
REFERENCES [dbo].[CongTyDuLich] ([MaCongTy])
GO

ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([MaChuyenDi])
REFERENCES [dbo].[ChuyenDi] ([MaChuyenDi])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[LopHoc]    Script Date: 29/11/2018 11:32:37 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LopHoc](
	[MaLop] [nvarchar](6) NOT NULL,
	[TenLop] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[NamHoc]    Script Date: 29/11/2018 11:32:51 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NamHoc](
	[MaNH] [int] NOT NULL,
	[TenNH] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[ThongTinThanhToan]    Script Date: 29/11/2018 11:33:01 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ThongTinThanhToan](
	[MaHopDong] [nvarchar](6) NOT NULL,
	[LanThanhToan] [int] NOT NULL,
	[NgayThanhToan] [smalldatetime] NULL,
 CONSTRAINT [pk_ThongTinThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC,
	[LanThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ThongTinThanhToan]  WITH CHECK ADD FOREIGN KEY([MaHopDong])
REFERENCES [dbo].[HopDong] ([MaHopDong])
GO

USE [QuanLyDaNgoai]
GO

/****** Object:  Table [dbo].[User]    Script Date: 29/11/2018 11:33:08 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Level] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

