CREATE DATABASE QuanLyDaNgoai
--DROP DATABASE QuanLyDaNgoai
USE QuanLyDaNgoai
SET DATEFORMAT DMY

CREATE TABLE HocSinh
(
	MaHS INT PRIMARY KEY,
	TenHS NVARCHAR(50),
	NgaySinh SMALLDATETIME,
	DiaChi NVARCHAR(50),
	TenCha NVARCHAR(50),
	TenMe NVARCHAR(50),
	TenNguoiDamHo NVARCHAR(50),
	SDT NVARCHAR(11),
	TrangThai bit
)
CREATE TABLE NamHoc(
	MaNH INT PRIMARY KEY,
	TenNH NVARCHAR(20)
)
CREATE TABLE LopHoc
(

	MaLop NVARCHAR(6) PRIMARY KEY,
	TenLop NVARCHAR(20),

)


CREATE TABLE CTLop
(
	MaHS INT FOREIGN KEY REFERENCES dbo.HocSinh(MaHS),
	MaLop NVARCHAR(6) FOREIGN KEY REFERENCES dbo.LopHoc(MaLop), 
	MaNH INT FOREIGN KEY REFERENCES dbo.NamHoc(MaNH),
	CONSTRAINT pk_CTLop PRIMARY KEY(MaHS,MaLop, MaNH)
)

CREATE TABLE GiaoVien(
	MaGV INT PRIMARY KEY ,
	TenGV NVARCHAR(50),
	NgaySinh SMALLDATETIME,
	DiaChi NVARCHAR(50),
	SDT NVARCHAR(11),
	CMND NVARCHAR(12),
	MaLop NVARCHAR(6) FOREIGN KEY REFERENCES dbo.LopHoc(MaLop)
)
SELECT * FROM dbo.GiaoVien WHERE DiaChi LIKE '%Bi%'

CREATE TABLE CongTyDuLich(
	MaCongTy NVARCHAR(6) PRIMARY KEY,
	TenCongTy NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(255),
	SDT NVARCHAR(11)
)

DELETE dbo.CongTyDuLich
CREATE TABLE DiaDiem
(
-- dia diem 
	MaDiaDiem NVARCHAR(6) PRIMARY KEY,
	TenDiaDiem NVARCHAR(50),
	DiaChi NVARCHAR(255)
)

CREATE TABLE ChuyenDi
(
	MaChuyenDi  NVARCHAR(6) PRIMARY KEY,
	MaCongTyDuLich NVARCHAR(6) FOREIGN KEY REFERENCES dbo.CongTyDuLich(MaCongTy),
	MaDiaDiem NVARCHAR(6) FOREIGN KEY REFERENCES dbo.DiaDiem(MaDiaDiem),
	NgayKhoiHanh DATE
)
GO

INSERT INTO dbo.ChuyenDi
        ( MaChuyenDi ,
          MaCongTyDuLich ,
          MaDiaDiem ,
          NgayKhoiHanh
        )
VALUES  ( N'CD5' , -- MaChuyenDi - nvarchar(6)
          N'CT01' , -- MaCongTyDuLich - nvarchar(6)
          N'' , -- MaDiaDiem - nvarchar(6)
          GETDATE()  -- NgayKhoiHanh - date
        )
SELECT * FROM dbo.ChuyenDi
CREATE TABLE ChiTietChuyenDi(
	MaChuyenDi NVARCHAR(6) FOREIGN KEY REFERENCES dbo.ChuyenDi(MaChuyenDi),
	ThoiGian time(5),
	HoatDong nvarchar(255),
	GhiChu NVARCHAR(200),
	CONSTRAINT pk_ChiTietChuyenDi PRIMARY KEY(MaChuyenDi,ThoiGian)
)


CREATE TABLE ChiPhi
(
	MaDiaDiem NVARCHAR(6) FOREIGN KEY REFERENCES dbo.DiaDiem(MaDiaDiem),
	MaChuyenDi NVARCHAR(6) FOREIGN KEY REFERENCES dbo.ChuyenDi(MaChuyenDi),
	VeCong FLOAT,
	TienXe FLOAT,
	TienAnTrua FLOAT,
	PhiHuongDanVien FLOAT,
	NuocUong FLOAT,
	TienAnXe FLOAT,
	LinhTinh float,
	GhiChu TEXT,
	CONSTRAINT pk_ChiPhi PRIMARY KEY (MaDiaDiem,MaChuyenDi)

)
ALTER TABLE dbo.ChiPhi ADD Tong FLOAT
CREATE TABLE HopDong
(
	MaHopDong NVARCHAR(6) PRIMARY KEY,
	MaChuyenDi NVARCHAR(6) FOREIGN KEY REFERENCES dbo.ChuyenDi(MaChuyenDi),
	MaCongTy NVARCHAR(6) FOREIGN KEY REFERENCES dbo.CongTyDuLich(MaCongTy),
	TriGia FLOAT,
	TrangThai NVARCHAR(20)
)
ALTER TABLE dbo.HopDong ADD NgayKy DATE
CREATE TABLE ThongTinThanhToan -- chi tiet hop dong
(
	MaHopDong NVARCHAR(6) FOREIGN KEY REFERENCES dbo.HopDong(MaHopDong),
	LanThanhToan INT ,
	NgayThanhToan DATE DEFAULT '01/01/2018',
	SoTien FLOAT DEFAULT 0,
	CONSTRAINT pk_ThongTinThanhToan PRIMARY KEY (MaHopDong,LanThanhToan)
)
DROP TABLE dbo.ThongTinThanhToan
CREATE TABLE HocSinhThamGia
(
	MaHS INT FOREIGN KEY REFERENCES dbo.HocSinh(MaHS),
	MaLop NVARCHAR(6) FOREIGN KEY REFERENCES dbo.LopHoc(MaLop),
	MaChuyenDi INT,
	ThamGia BIT,
	IsDongTien BIT,
	CONSTRAINT pk_HocSinhThamGia PRIMARY KEY (MaHS, MaLop, MaChuyenDi)
)

CREATE TABLE GiaoVienThamGia
(
	MaGiaoVien INT FOREIGN KEY REFERENCES dbo.GiaoVien(MaGV),
	MaLop NVARCHAR(6) FOREIGN KEY REFERENCES dbo.LopHoc(MaLop),
	MaChuyenDi INT,
	ThamGia BIT,
	CONSTRAINT pk_GiaoVienThamGia PRIMARY KEY (MaGiaoVien, MaLop, MaChuyenDi)
)

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

INSERT INTO dbo.CongTyDuLich
        ( MaCongTy, TenCongTy, DiaChi, SDT )
VALUES  ( N'CT02', -- MaCongTy - nvarchar(6)
          N'Cong ty B', -- TenCongTy - nvarchar(50)
          N'Binh Duong', -- DiaChi - nvarchar(50)
          N'0236412'  -- SDT - nvarchar(11)
          )

INSERT INTO dbo.LopHoc
        ( MaLop, TenLop )
VALUES  ( N'Lop3', -- MaLop - nvarchar(6)
          N'La'  -- TenLop - nvarchar(20)
          )

SELECT * FROM dbo.GiaoVien

INSERT INTO dbo.GiaoVien
        ( MaGV ,
          TenGV ,
          NgaySinh ,
          DiaChi ,
          SDT ,
          CMND ,
          MaLop
        )
VALUES  ( 1 , -- MaGV - int
          N'Nguyen Thi B' , -- TenGV - nvarchar(50)
          '05/23/1990' , -- NgaySinh - smalldatetime
          N'Binh Duong' , -- DiaChi - nvarchar(50)
          N'02512' , -- SDT - nvarchar(11)
          N'21531' , -- CMND - nvarchar(12)
          N'Lop2'  -- MaLop - nvarchar(6)
        )

CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
GO
DROP FUNCTION fuConvertToUnsign1
SELECT * FROM dbo.GiaoVien WHERE dbo.fuConvertToUnsign1(TenGV) LIKE N'%' + dbo.fuConvertToUnsign1(N'Nguyen') + '%'
SELECT * FROM dbo.ChiTietChuyenDi WHERE TenGV LIKE N'%Thành%' OR DiaChi LIKE N'%Bình%' OR SDT LIKE N'%Thanh%' OR CMND LIKE N'%Thanh%'

GO
CREATE PROC USP_DeleteHopDong
@maHD NVARCHAR(6)
AS
BEGIN

	DELETE dbo.ThongTinThanhToan WHERE MaHopDong= @maHD
	DELETE dbo.HopDong WHERE MaHopDong= @maHD
END
GO
EXEC dbo.USP_DeleteHopDong @maHD = N'' -- nvarchar(6)

 GO
 CREATE TRIGGER UTG_CapNhatTrangThai
ON dbo.ThongTinThanhToan AFTER DELETE
AS
BEGIN
	DECLARE @maHD NVARCHAR(6)
	DECLARE @sum FLOAT
	DECLARE @triGiaHD FLOAT
	SELECT @maHD=Deleted.MaHopDong FROM Deleted
	SELECT @sum=SUM(SoTien) FROM dbo.ThongTinThanhToan WHERE MaHopDong=@maHD
	SELECT @triGiaHD = TriGia FROM dbo.HopDong WHERE MaHopDong = @maHD
	IF(@sum >= @triGiaHD)
		UPDATE dbo.HopDong SET TrangThai = N'Đã thanh toán' WHERE MaHopDong=@maHD
	ELSE 
		UPDATE dbo.HopDong SET TrangThai = N'Chưa thanh toán' WHERE MaHopDong=@maHD
END
GO
 ALTER TRIGGER UTG_CapNhatTrangThai1
ON dbo.ThongTinThanhToan AFTER INSERT,UPDATE
AS
BEGIN
	DECLARE @maHD NVARCHAR(6)
	DECLARE @sum FLOAT
	DECLARE @triGiaHD FLOAT
	SELECT @maHD=Inserted.MaHopDong FROM Inserted
	SELECT @sum=SUM(SoTien) FROM dbo.ThongTinThanhToan WHERE MaHopDong=@maHD
	SELECT @triGiaHD = TriGia FROM dbo.HopDong WHERE MaHopDong = @maHD
	IF(@sum >= @triGiaHD)
		UPDATE dbo.HopDong SET TrangThai = N'Đã thanh toán' WHERE MaHopDong=@maHD
	ELSE 
		UPDATE dbo.HopDong SET TrangThai = N'Chưa thanh toán' WHERE MaHopDong=@maHD
END
GO
CREATE TRIGGER UTG_CapNhatTriGiaHopDong
ON dbo.HopDong AFTER UPDATE
AS
BEGIN
	DECLARE @maHD NVARCHAR(6)
	DECLARE @sum FLOAT
	DECLARE @triGiaHD FLOAT
	SELECT @maHD=Inserted.MaHopDong FROM Inserted
	SELECT @sum=SUM(SoTien) FROM dbo.ThongTinThanhToan WHERE MaHopDong=@maHD
	SELECT @triGiaHD = TriGia FROM dbo.HopDong WHERE MaHopDong = @maHD
	IF(@sum >= @triGiaHD)
		UPDATE dbo.HopDong SET TrangThai = N'Đã thanh toán' WHERE MaHopDong=@maHD
	ELSE
		UPDATE dbo.HopDong SET TrangThai = N'Chưa thanh toán' WHERE MaHopDong=@maHD
END
GO

alter PROC USP_DeleteCongTy
@maCongTy NVARCHAR(6)
AS
BEGIN
	DECLARE @
	DELETE dbo.ChuyenDi WHERE MaCongTyDuLich = @maCongTy
	DECLARE @maHopDong NVARCHAR(6)
	SELECT @maHopDong=MaHopDong FROM dbo.HopDong WHERE MaCongTy=@maCongTy
	DELETE dbo.ThongTinThanhToan WHERE MaHopDong = @maHopDong
	DELETE dbo.HopDong WHERE MaCongTy = @maCongTy
END
EXEC dbo.USP_DeleteCongTy @maCongTy = N'' -- nvarchar(6)



