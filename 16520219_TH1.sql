--2.1.a
create proc USP_a
as
begin
	print 'Hello world'
end

exec USP_a
GO
--2.1.b
create proc USP_b
as
begin
	print 'Xin chao'
end
exec USP_b
GO
--2.1.c
create proc USP_c
@ten Nvarchar(100)
end
exec USP_c @ten=N'Ha Thanh Doan'
GO
--2.1.d
--2.1.e
create proc USP_e
@s1 int, @s2 int
as
begin
	declare @result int
	set @result=@s1+@s2
	print @result
end
exec USP_e @s1=3, @s2=4
GO
--2.1.f
create proc USP_f
@s1 int, @s2 int
as
begin
	declare @result int
	set @result=@s1+@s2
	print 'Tong la: '+ cast(@result as Nvarchar(100))
end
exec USP_f @s1=3, @s2=4
GO
--2.1.g
create proc USP_g
@s1 int, @s2 int, @result int out
as
begin
	set @result=@s1+@s2
end
Declare @tg int
exec USP_g @s1= 3,@s2 = 4,@result=@tg out
print @tg
GO
--2.1.h.
create proc USP_h
@s1 int, @s2 int, @result int out
as
begin
	set @result=@s1+@s2
end
Declare @tg int
exec USP_h @s1= 3,@s2 = 4,@result=@tg out
print 'Tong la '+ cast(@tg as Nvarchar(100))
GO
--2.1.i
create proc USP_i
@s1 int, @s2 int
as
begin
	if @s1>@s2
	begin
		print 'max = ' + cast(@s1 as Nvarchar(100))
	end
	else if @s1<@s2
	begin
		print 'max = ' +cast(@s2 as nvarchar(100))
	end
	else
	begin
		print '2 so bang nhau'
	end
end

exec USP_i @s1=4, @s2=4
GO
--2.1.j
create proc USP_j
@s1 int, @s2 int
as
begin
	if @s1>@s2
	begin
		print 'So lon nhat cua '+cast(@s1 as Nvarchar(100))+' va '+cast(@s2 as Nvarchar(100))+' la: ' + cast(@s1 as Nvarchar(100))
	end
	else if @s1<@s2
	begin
		print 'max = '+cast(@s1 as Nvarchar(100))+' va '+cast(@s2 as Nvarchar(100))+' la: '+cast(@s2 as nvarchar(100))
	end
	else
	begin
		print '2 so bang nhau'
	end
end

exec USP_j @s1=50, @s2=9
GO
--2.1.k
create proc USP_k
@s1 int, @s2 int, @max int out, @min int out
as
begin
	if @s1 > @s2 
	begin
		set @max=@s1
		set @min=@s2
	end
	else
	begin
		set @max=@s2
		set @min=@s1
	end
		
end
declare @max1 int, @min1 int
exec USP_k @s1=5,@s2=6,@max=@max1 out,@min=@min1 out
print 'max = ' +cast(@max1 as nvarchar(100))+' min= '+cast(@min1 as nvarchar(100))
GO
--2.2.l
create proc USP_l
@n int
as
begin
	declare @i int
	set @i=1
	while @i<=@n
	begin
		print @i
		set @i=@i+1
	end
end
exec USP_l @n=5
GO
--2.2.m
create proc USP_m
@n int
as
begin
	declare @i int
	declare @tong int
	set @tong=0
	set @i=1
	while @i<=@n
	begin
		if @i%2 =0 begin
			set @tong=@tong + @i
		end
		set @i=@i+1
	end
	print 'Tong so chan la:'+cast(@tong as nvarchar(100))
end
exec USP_m @n=6
GO
--2.2.n
create proc USP_n
@n int
as
begin
	declare @i int
	declare @tong int
	declare @count int
	set @count =0
	set @tong=0
	set @i=1
	while @i<=@n
	begin
		if @i%2 =0 begin
			set @tong=@tong + @i
			set @count=@count +1
		end
		set @i=@i+1
	end
	print 'So luong so chan la: '+cast(@count as nvarchar(100))+' . Tong:'+cast(@tong as nvarchar(100))
end
exec USP_n @n=6
GO
--2.2.o
create proc USP_o
@s1 int, @s2 int
as
begin
	declare @i int
	declare @ucln int
	set @i=1
	set @ucln=1
	if @s1<@s2
	begin
		while @i<=@s1
		begin
			if(@s1%@i=0)and(@s2%@i=0) begin
				set @ucln=@i
			end
		set @i=@i+1
		end
	end
	else
	begin
		while @i<=@s2
		begin
			if(@s1%@i=0)and(@s2%@i=0) begin
				set @ucln=@i
			end
		set @i=@i+1
		end
	end
	print 'Uoc chung lon nhat la: '+cast(@ucln as nvarchar(100))
end
exec USP_o @s1=12, @s2=32
GO
--2.2.p
create proc USP_p
@s1 int, @s2 int, @ucln int out
as
begin
	declare @i int
	set @i=1
	set @ucln=1
	if @s1<@s2
	begin
		while @i<=@s1
		begin
			if(@s1%@i=0)and(@s2%@i=0) begin
				set @ucln=@i
			end
		set @i=@i+1
		end
	end
	else
	begin
		while @i<=@s2
		begin
			if(@s1%@i=0)and(@s2%@i=0) begin
				set @ucln=@i
			end
		set @i=@i+1
		end
	end
end
declare @ucln1 int
exec USP_p @s1=4,@s2=6,@ucln=@ucln1 out
select @ucln1 
GO
--2.3.q

ALTER PROC USP_ucln
@s1 INT, @s2 INT
AS
 BEGIN
 DECLARE @ucln INT
 SET @ucln=1
	IF @s2=0 
	BEGIN
		SET @ucln=@s1
		PRINT 'Uoc chung lon nhat:' + CAST(@ucln AS VARCHAR(100))
	END
	DECLARE @temp INT
	SET @temp=@s1%@s2
	EXEC dbo.USP_ucln @s1 = @s2, -- int
	    @s2 = @temp -- int
	
 END

 EXEC dbo.USP_ucln @s1 = 12, -- int
     @s2 = 6 -- int
-----------------
--bai 1. cai dat csdl qly thu vien
CREATE DATABASE QuanLyThuVien
GO
USE QuanLyThuVien
GO
SET DATEFORMAT DMY
GO
CREATE TABLE DOCGIA
(
	MA_DOCGIA INT IDENTITY PRIMARY KEY,
	HO NVARCHAR(10),
	TENLOT NVARCHAR(100),
	TEN NVARCHAR(100),
	NGAYSINH DATE
)
GO
CREATE TABLE NGUOILON
(
	MA_DOCGIA INT FOREIGN KEY REFERENCES dbo.DOCGIA(MA_DOCGIA),
	SONHA Nvarchar(50),
	DUONG NVARCHAR(100),
	QUAN NVARCHAR(50),
	DIENTHOAI VARCHAR(12),
	HAN_SD DATE,
	CONSTRAINT PK_NGUOILON PRIMARY KEY (MA_DOCGIA)
)
GO 

CREATE TABLE TREEM
(
	MA_DOCGIA INT FOREIGN KEY REFERENCES dbo.DOCGIA(MA_DOCGIA),
	MA_DOCGIA_NGUOILON INT FOREIGN KEY REFERENCES dbo.NGUOILON(MA_DOCGIA),
	CONSTRAINT PK_TREEM PRIMARY KEY (MA_DOCGIA)
)

GO
DROP TABLE dbo.TREEM
CREATE TABLE TUASACH
(
	MA_TUASACH INT IDENTITY PRIMARY KEY,
	TUASACH NVARCHAR(100),
	TACGIA NVARCHAR(100),
	TOMTAT NVARCHAR(200)
)
GO
CREATE TABLE DAUSACH
(
	MA_DAUSACH INT IDENTITY PRIMARY KEY,
	MA_TUASACH INT FOREIGN KEY REFERENCES dbo.TUASACH(MA_TUASACH),
	NGONNGU NVARCHAR(100),
	BIA NVARCHAR(100),
	TRANGTHAI INT --0: KO THE CHO MUON. 1: CO THE MUON	
)
GO
CREATE TABLE CUONSACH
(
	MA_CUONSACH INT PRIMARY KEY,
	MA_DAUSACH INT FOREIGN KEY REFERENCES dbo.DAUSACH(MA_DAUSACH),
	TINHTRANG INT --0: KO CO SAN. 1: CO SAN

)
GO
DROP TABLE dbo.CUONSACH
CREATE TABLE DANGKY
(
	MA_DAUSACH INT FOREIGN KEY REFERENCES dbo.DAUSACH(MA_DAUSACH),
	MA_DOCGIA INT FOREIGN KEY REFERENCES dbo.DOCGIA(MA_DOCGIA),
	NGAYGIO_DK DATETIME,
	GHICHU NVARCHAR(200),
	CONSTRAINT pk_DANGKY PRIMARY KEY(MA_DAUSACH,MA_DOCGIA)
)
GO
CREATE TABLE MUON
(
	MA_DAUSACH INT FOREIGN KEY REFERENCES dbo.DAUSACH(MA_DAUSACH),
	MA_CUONSACH INT FOREIGN KEY REFERENCES dbo.CUONSACH(MA_CUONSACH),
	MA_DOCGIA INT FOREIGN KEY REFERENCES dbo.DOCGIA(MA_DOCGIA),
	NGAYGIOMUON DATETIME,
	NGAY_HETHAN DATETIME,
	CONSTRAINT PK_MUON PRIMARY KEY(MA_DAUSACH,MA_CUONSACH)
)
GO
CREATE TABLE QUATRINHMUON
(
	MA_DAUSACH INT FOREIGN KEY REFERENCES dbo.DAUSACH(MA_DAUSACH),
	MA_CUONSACH INT FOREIGN KEY REFERENCES dbo.CUONSACH(MA_CUONSACH),
	NGAYGIO_MUON DATETIME,
	MA_DOCGIA INT FOREIGN KEY REFERENCES dbo.DOCGIA(MA_DOCGIA),
	NGAY_HETHAN DATETIME, 
	NGAY_TRA DATETIME,
	TIENMUON MONEY,
	TIEN_DATRA MONEY,
	TIEN_DATCOC MONEY,
	GHICHU NVARCHAR(200),
	CONSTRAINT PK_QTMUON PRIMARY KEY(MA_DAUSACH,MA_CUONSACH,NGAYGIO_MUON)
)
GO

INSERT INTO dbo.DOCGIA
        (  HO, TENLOT, TEN, NGAYSINH )
VALUES  (  
          N'Nguyen', -- HO - nvarchar(10)
          N'Van', -- TENLOT - nvarchar(100)
          N'A', -- TEN - nvarchar(100)
          '20/01/1990'  -- NGAYSINH - date
          )
INSERT INTO dbo.DOCGIA
        (  HO, TENLOT, TEN, NGAYSINH )
VALUES  (
          N'Pham', -- HO - nvarchar(10)
          N'Quoc', -- TENLOT - nvarchar(100)
          N'B', -- TEN - nvarchar(100)
          '01/05/1995'  -- NGAYSINH - date
          )
INSERT INTO dbo.DOCGIA
        (  HO, TENLOT, TEN, NGAYSINH )
VALUES  ( 
          N'Le', -- HO - nvarchar(10)
          N'Thi', -- TENLOT - nvarchar(100)
          N'C', -- TEN - nvarchar(100)
          '24/06/1998'  -- NGAYSINH - date
          )
INSERT INTO dbo.DOCGIA
        (  HO, TENLOT, TEN, NGAYSINH )
VALUES  ( 
          N'Nguyen', -- HO - nvarchar(10)
          N'Quoc', -- TENLOT - nvarchar(100)
          N'Nam', -- TEN - nvarchar(100)
          '12/12/2001'  -- NGAYSINH - date
          )
		INSERT INTO dbo.DOCGIA
		          (  HO, TENLOT, TEN, NGAYSINH )
		  VALUES  ( 
		            N'Le', -- HO - nvarchar(10)
		            N'Van', -- TENLOT - nvarchar(100)
		            N'An', -- TEN - nvarchar(100)
		            '05/12/2002'  -- NGAYSINH - date
		            )
INSERT INTO dbo.NGUOILON
        ( MA_DOCGIA ,
          SONHA ,
          DUONG ,
          QUAN ,
          DIENTHOAI ,
          HAN_SD
        )
VALUES  ( 1 , -- MA_DOCGIA - int
          N'21/01' , -- SONHA - nvarchar(50)
          N'Cong Hoa' , -- DUONG - nvarchar(100)
          N'Tan Binh' , -- QUAN - nvarchar(50)
          '0123465' , -- DIENTHOAI - varchar(12)
          '21/12/2019'  -- HAN_SD - date
        )
INSERT INTO dbo.NGUOILON
        ( MA_DOCGIA ,
          SONHA ,
          DUONG ,
          QUAN ,
          DIENTHOAI ,
          HAN_SD
        )
VALUES  ( 2 , -- MA_DOCGIA - int
          N'21/21' , -- SONHA - nvarchar(50)
          N'Vo Van Ngan' , -- DUONG - nvarchar(100)
          N'Thu Duc' , -- QUAN - nvarchar(50)
          '0984562' , -- DIENTHOAI - varchar(12)
          '31/12/2018'  -- HAN_SD - date
        )
INSERT INTO dbo.NGUOILON
        ( MA_DOCGIA ,
          SONHA ,
          DUONG ,
          QUAN ,
          DIENTHOAI ,
          HAN_SD
        )
VALUES  ( 3 , -- MA_DOCGIA - int
          N'23/1' , -- SONHA - nvarchar(50)
          N'Kha Van Can' , -- DUONG - nvarchar(100)
          N'Thu Duc' , -- QUAN - nvarchar(50)
          '0321546' , -- DIENTHOAI - varchar(12)
          GETDATE()  -- HAN_SD - date
        )
INSERT INTO dbo.TREEM
        ( MA_DOCGIA, MA_DOCGIA_NGUOILON )
VALUES  ( 4, -- MA_DOCGIA - int
          1  -- MA_DOCGIA_NGUOILON - int
          )
INSERT INTO dbo.TREEM
        ( MA_DOCGIA, MA_DOCGIA_NGUOILON )
VALUES  ( 5, -- MA_DOCGIA - int
          2  -- MA_DOCGIA_NGUOILON - int
          )
INSERT INTO dbo.TUASACH
        (  TUASACH, TACGIA, TOMTAT )
VALUES  ( 
          N'Dong Vat Hoang Da', -- TUASACH - nvarchar(100)
          N'Tony Teo', -- TACGIA - nvarchar(100)
          N''  -- TOMTAT - nvarchar(200)
          )
INSERT INTO dbo.TUASACH
        (  TUASACH, TACGIA, TOMTAT )
VALUES  (
          N'Kham Pha Sao Hoa', -- TUASACH - nvarchar(100)
          N'Tony Stark', -- TACGIA - nvarchar(100)
          N''  -- TOMTAT - nvarchar(200)
          )
INSERT INTO dbo.DAUSACH
        ( 
          MA_TUASACH ,
          NGONNGU ,
          BIA ,
          TRANGTHAI
        )
VALUES  ( 
          1 , -- MA_TUASACH - int
          N'Tieng Anh' , -- NGONNGU - nvarchar(100)
          N'' , -- BIA - nvarchar(100)
          0  -- TRANGTHAI - int
        )

INSERT INTO dbo.DAUSACH
        ( 
          MA_TUASACH ,
          NGONNGU ,
          BIA ,
          TRANGTHAI
        )
VALUES  ( 
          2 , -- MA_TUASACH - int
          N'Tieng Viet' , -- NGONNGU - nvarchar(100)
          N'' , -- BIA - nvarchar(100)
          1 -- TRANGTHAI - int
        )
INSERT INTO dbo.CUONSACH
        ( MA_CUONSACH ,
          MA_DAUSACH ,
          TINHTRANG
        )
VALUES  ( 1 , -- MA_CUONSACH - int
          1 , -- MA_DAUSACH - int
          0  -- TINHTRANG - int
        )
INSERT INTO dbo.CUONSACH
        ( MA_CUONSACH ,
          MA_DAUSACH ,
          TINHTRANG
        )
VALUES  ( 2 , -- MA_CUONSACH - int
          3 , -- MA_DAUSACH - int
          1  -- TINHTRANG - int. 0:NO, 1: YES
        )
INSERT INTO dbo.DANGKY
        ( MA_DAUSACH ,
          MA_DOCGIA ,
          NGAYGIO_DK ,
          GHICHU
        )
VALUES  ( 1 , -- MA_DAUSACH - int
          1, -- MA_DOCGIA - int
          GETDATE() , -- NGAYGIO_DK - datetime
          N''  -- GHICHU - nvarchar(200)
        )
INSERT INTO dbo.DANGKY
        ( MA_DAUSACH ,
          MA_DOCGIA ,
          NGAYGIO_DK ,
          GHICHU
        )
VALUES  ( 3 , -- MA_DAUSACH - int
          1 , -- MA_DOCGIA - int
          GETDATE() , -- NGAYGIO_DK - datetime
          N''  -- GHICHU - nvarchar(200)
        )
INSERT INTO dbo.MUON
        ( MA_DAUSACH ,
          MA_CUONSACH ,
          MA_DOCGIA ,
          NGAYGIOMUON ,
          NGAY_HETHAN
        )
VALUES  ( 1 , -- MA_DAUSACH - int
          1 , -- MA_CUONSACH - int
          1 , -- MA_DOCGIA - int
          GETDATE() , -- NGAYGIOMUON - datetime
          '12/12/2018'  -- NGAY_HETHAN - datetime
        )
INSERT INTO dbo.MUON
        ( MA_DAUSACH ,
          MA_CUONSACH ,
          MA_DOCGIA ,
          NGAYGIOMUON ,
          NGAY_HETHAN
        )
VALUES  ( 3, -- MA_DAUSACH - int
          1 , -- MA_CUONSACH - int
          2 , -- MA_DOCGIA - int
          GETDATE() , -- NGAYGIOMUON - datetime
          '23/1/2019'  -- NGAY_HETHAN - datetime
        )
INSERT INTO dbo.QUATRINHMUON
        ( MA_DAUSACH ,
          MA_CUONSACH ,
          NGAYGIO_MUON ,
          MA_DOCGIA ,
          NGAY_HETHAN ,
          NGAY_TRA ,
          TIENMUON ,
          TIEN_DATRA ,
          TIEN_DATCOC ,
          GHICHU
        )
VALUES  ( 1 , -- MA_DAUSACH - int
          1 , -- MA_CUONSACH - int
          GETDATE() , -- NGAYGIO_MUON - datetime
          1, -- MA_DOCGIA - int
         '12/12/2018' , -- NGAY_HETHAN - datetime
          '23/10/2018' , -- NGAY_TRA - datetime
          12000 , -- TIENMUON - money
          12000 , -- TIEN_DATRA - money
          0 , -- TIEN_DATCOC - money
          N''  -- GHICHU - nvarchar(200)
        )
INSERT INTO dbo.QUATRINHMUON
        ( MA_DAUSACH ,
          MA_CUONSACH ,
          NGAYGIO_MUON ,
          MA_DOCGIA ,
          NGAY_HETHAN ,
          NGAY_TRA ,
          TIENMUON ,
          TIEN_DATRA ,
          TIEN_DATCOC ,
          GHICHU
        )
VALUES  ( 3 , -- MA_DAUSACH - int
          2 , -- MA_CUONSACH - int
          '12/4/2018' , -- NGAYGIO_MUON - datetime
          1 , -- MA_DOCGIA - int
          GETDATE() , -- NGAY_HETHAN - datetime
          NULL,-- NGAY_TRA - datetime
          NULL , -- TIENMUON - money
          NULL , -- TIEN_DATRA - money
          NULL , -- TIEN_DATCOC - money
          N''  -- GHICHU - nvarchar(200)
        )
INSERT INTO dbo.QUATRINHMUON
        ( MA_DAUSACH ,
          MA_CUONSACH ,
          NGAYGIO_MUON ,
          MA_DOCGIA ,
          NGAY_HETHAN ,
          NGAY_TRA ,
          TIENMUON ,
          TIEN_DATRA ,
          TIEN_DATCOC ,
          GHICHU
        )
VALUES  ( 1 , -- MA_DAUSACH - int
          1, -- MA_CUONSACH - int
          '01/09/2018' , -- NGAYGIO_MUON - datetime
          2 , -- MA_DOCGIA - int
          NULL , -- NGAY_HETHAN - datetime
          NULL , -- NGAY_TRA - datetime
          NULL , -- TIENMUON - money
          NULL , -- TIEN_DATRA - money
          NULL , -- TIEN_DATCOC - money
          N''  -- GHICHU - nvarchar(200)
        )

INSERT INTO dbo.QUATRINHMUON
        ( MA_DAUSACH ,
          MA_CUONSACH ,
          NGAYGIO_MUON ,
          MA_DOCGIA ,
          NGAY_HETHAN ,
          NGAY_TRA ,
          TIENMUON ,
          TIEN_DATRA ,
          TIEN_DATCOC ,
          GHICHU
        )
VALUES  ( 3 , -- MA_DAUSACH - int
          1 , -- MA_CUONSACH - int
          '01/08/2018', -- NGAYGIO_MUON - datetime
          4 , -- MA_DOCGIA - int
          NULL , -- NGAY_HETHAN - datetime
          NULL, -- NGAY_TRA - datetime
          NULL , -- TIENMUON - money
          NULL , -- TIEN_DATRA - money
          NULL , -- TIEN_DATCOC - money
          N'jhbytffghf'  -- GHICHU - nvarchar(200)
        )
GO
INSERT dbo.DAUSACH
        (  NGONNGU, BIA, TRANGTHAI )
VALUES  ( 
          N'Phap', -- NGONNGU - nvarchar(100)
          N'', -- BIA - nvarchar(100)
          0  -- TRANGTHAI - int
          )
GO 
INSERT INTO dbo.CUONSACH
        ( MA_CUONSACH ,
          MA_DAUSACH ,
          TINHTRANG
        )
VALUES  ( 3 , -- MA_CUONSACH - int
          4 , -- MA_DAUSACH - int
          0  -- TINHTRANG - int
        )

INSERT INTO dbo.CUONSACH
        ( MA_CUONSACH ,
          MA_DAUSACH ,
          TINHTRANG
        )
VALUES  ( 4 , -- MA_CUONSACH - int
          1 , -- MA_DAUSACH - int
          1  -- TINHTRANG - int
        )
GO
---BAI 3.---
--3.t. 
CREATE PROC USP_t
AS
BEGIN
	SELECT MA_TUASACH FROM dbo.TUASACH
END
GO
EXEC usp_t
--3.u.
CREATE PROC USP_u
AS
BEGIN
	SELECT MA_DOCGIA,HO,TENLOT,TEN  FROM dbo.DOCGIA
END
GO
EXEC USP_u
GO
---	BAI 4----
--4.1.Xem th�ng tin ??c gi? 
CREATE PROC sp_ThongTinDocGia
@madocgia int 
AS
BEGIN
	IF @madocgia IN (SELECT MA_DOCGIA FROM dbo.NGUOILON)
	BEGIN
		SELECT * FROM dbo.DOCGIA,dbo.NGUOILON WHERE dbo.DOCGIA.MA_DOCGIA=dbo.NGUOILON.MA_DOCGIA AND DOCGIA.MA_DOCGIA=@madocgia
	END
	IF @madocgia IN (SELECT MA_DOCGIA FROM dbo.TREEM)
	BEGIN
		SELECT * FROM dbo.DOCGIA,dbo.TREEM WHERE dbo.DOCGIA.MA_DOCGIA=dbo.TREEM.MA_DOCGIA AND DOCGIA.MA_DOCGIA=@madocgia
	END
END
GO
EXEC dbo.sp_ThongTinDocGia @madocgia = 4 -- int
GO
--4.2. Th�ng tin ??u s�ch 
CREATE PROC sp_ThongTinDauSach
@madausach INT
AS
BEGIN
	SELECT * FROM dbo.TUASACH,dbo.DAUSACH
	WHERE TUASACH.MA_TUASACH=dbo.DAUSACH.MA_TUASACH  AND dbo.DAUSACH.MA_DAUSACH=@madausach
	SELECT COUNT(MA_CUONSACH) AS [Tong so luong] FROM dbo.CUONSACH WHERE MA_DAUSACH=@madausach AND TINHTRANG=1
END
GO
EXEC dbo.sp_ThongTinDauSach @madausach = 1 -- int
GO
--4.3. Li?t k� nh?ng ??c gi? ng??i l?n ?ang m??n s�ch 
CREATE PROC sp_ThongTinNguoiLonDangMuon
AS
BEGIN
	SELECT * FROM dbo.NGUOILON,dbo.DOCGIA WHERE DOCGIA.MA_DOCGIA=NGUOILON.MA_DOCGIA AND DOCGIA.MA_DOCGIA IN(
SELECT MA_DOCGIA FROM dbo.QUATRINHMUON WHERE NGAY_TRA IS NULL)
END
GO
EXEC dbo.sp_ThongTinNguoiLonDangMuon
GO
--4.4. Li?t k� nh?ng ??c gi? ng??i l?n ?ang m??n s�ch qu� h?n 
CREATE PROC sp_ThongTinNguoiLonQuaHan
AS
BEGIN
SELECT * FROM dbo.NGUOILON, dbo.DOCGIA WHERE dbo.NGUOILON.MA_DOCGIA=dbo.DOCGIA.MA_DOCGIA AND dbo.NGUOILON.MA_DOCGIA IN(
	SELECT MA_DOCGIA FROM dbo.QUATRINHMUON WHERE NGAY_TRA IS NULL AND DATEDIFF(DAY,dbo.QUATRINHMUON.NGAYGIO_MUON,GETDATE())>14 --qua han 14 ngay
)
END
GO
EXEC dbo.sp_ThongTinNguoiLonQuaHan
GO
--4.5. Li?t k� nh?ng ??c gi? ng??i l?n ?ang m??n s�ch c� tr? em c?ng ?ang m??n s�ch 
CREATE PROC sp_DocGiaCoTreEmMuon
AS
BEGIN
SELECT * FROM dbo.NGUOILON,dbo.DOCGIA,dbo.TREEM 
WHERE dbo.NGUOILON.MA_DOCGIA=dbo.DOCGIA.MA_DOCGIA AND dbo.TREEM.MA_DOCGIA_NGUOILON=dbo.NGUOILON.MA_DOCGIA AND dbo.NGUOILON.MA_DOCGIA IN(
SELECT MA_DOCGIA FROM dbo.QUATRINHMUON WHERE NGAY_TRA IS NULL) AND dbo.TREEM.MA_DOCGIA IN (
SELECT MA_DOCGIA FROM dbo.QUATRINHMUON WHERE NGAY_TRA IS NULL)
END 
GO
EXEC dbo.sp_DocGiaCoTreEmMuon
GO

--4.6. C?p nh?t tr?ng th�i c?a ??u s�c
CREATE PROC sp_CapNhatTrangThaiDauSach
AS
BEGIN 
UPDATE dbo.DAUSACH SET TRANGTHAI = 1 WHERE MA_DAUSACH IN(
SELECT MA_DAUSACH FROM dbo.CUONSACH WHERE TINHTRANG=1)
UPDATE dbo.DAUSACH SET TRANGTHAI = 0 WHERE MA_DAUSACH NOT IN(
SELECT MA_DAUSACH FROM dbo.CUONSACH WHERE TINHTRANG=1)
END 
GO
EXEC dbo.sp_CapNhatTrangThaiDauSach
GO
--4.11. X�a ??c gi? .
CREATE PROC sp_XoaDocGia
@madocgia INT  
AS
BEGIN
	IF @madocgia NOT IN (SELECT MA_DOCGIA FROM dbo.DOCGIA)
		PRINT 'Doc gia khong ton tai!'
	ELSE
	BEGIN
		IF @madocgia IN (SELECT MA_DOCGIA FROM dbo.MUON)
			PRINT 'Khong the xoa'
		ELSE
		BEGIN
			IF @madocgia IN (SELECT MA_DOCGIA FROM dbo.NGUOILON)
			BEGIN
				IF @madocgia NOT IN (SELECT MA_DOCGIA_NGUOILON FROM dbo.TREEM)
				BEGIN
					DELETE FROM dbo.DANGKY WHERE MA_DOCGIA =@madocgia
					DELETE FROM dbo.QUATRINHMUON WHERE MA_DOCGIA=@madocgia
					DELETE FROM dbo.NGUOILON WHERE MA_DOCGIA=@madocgia
					DELETE FROM dbo.DOCGIA WHERE MA_DOCGIA =@madocgia
				END
				ELSE
				IF @madocgia IN (SELECT MA_DOCGIA_NGUOILON FROM dbo.TREEM)
				BEGIN
					DELETE FROM dbo.TREEM WHERE MA_DOCGIA_NGUOILON=@madocgia
					DELETE FROM dbo.DANGKY WHERE MA_DOCGIA =@madocgia
					DELETE FROM dbo.QUATRINHMUON WHERE MA_DOCGIA=@madocgia
					DELETE FROM dbo.NGUOILON WHERE MA_DOCGIA=@madocgia
					DELETE FROM dbo.DOCGIA WHERE MA_DOCGIA =@madocgia
				END
			END
			ELSE
			IF @madocgia IN (SELECT MA_DOCGIA FROM dbo.TREEM)
			BEGIN
				DELETE FROM dbo.DANGKY WHERE MA_DOCGIA=@madocgia
				DELETE FROM dbo.QUATRINHMUON WHERE MA_DOCGIA=@madocgia
				DELETE FROM dbo.TREEM WHERE MA_DOCGIA=@madocgia
				DELETE FROM dbo.DOCGIA WHERE MA_DOCGIA=@madocgia
			END 
		END 
	END
END
GO
EXEC dbo.sp_XoaDocGia @madocgia = 3 -- int
SELECT * FROM dbo.MUON
GO
--4.13
CREATE PROC sp_
@madocgia INT 
AS
BEGIN
	DECLARE @soNgayTreHan INT
	DECLARE @soTienPhat INT 
	DECLARE @madausach INT 
	DECLARE @macuonsach INT
	DECLARE @ngaymuon DATETIME
	DECLARE @ngayhethan DATETIME
    SELECT @madausach=MA_DAUSACH FROM dbo.MUON WHERE MA_DOCGIA= @madocgia
	SELECT @macuonsach = MA_CUONSACH FROM dbo.MUON WHERE MA_DOCGIA= @madocgia
	SELECT @ngaymuon = NGAYGIOMUON FROM dbo.MUON WHERE MA_DOCGIA= @madocgia
	SELECT @ngayhethan = NGAY_HETHAN FROM dbo.MUON WHERE MA_DOCGIA= @madocgia
	SELECT @soNgayTreHan = DATEDIFF(DAY,@ngayhethan,GETDATE())
	IF @soNgayTreHan > 0
	BEGIN
		SET @soTienPhat=@soNgayTreHan*1000
		INSERT INTO dbo.QUATRINHMUON
		        ( MA_DAUSACH ,
		          MA_CUONSACH ,
		          NGAYGIO_MUON ,
		          MA_DOCGIA ,
		          NGAY_HETHAN ,
		          NGAY_TRA ,
		          TIENMUON ,
		          TIEN_DATRA ,
		          TIEN_DATCOC ,
		          GHICHU
		        )
		VALUES  ( @madausach , -- MA_DAUSACH - int
		          @macuonsach , -- MA_CUONSACH - int
		          @ngaymuon , -- NGAYGIO_MUON - datetime
		          @madocgia , -- MA_DOCGIA - int
		          @ngayhethan , -- NGAY_HETHAN - datetime
		          GETDATE() , -- NGAY_TRA - datetime
		          NULL , -- TIENMUON - money
		          NULL , -- TIEN_DATRA - money
		          NULL , -- TIEN_DATCOC - money
		          N'So tien phat: '+CAST(@soTienPhat AS NVARCHAR(10))  -- GHICHU - nvarchar(200)
		        )
		DELETE FROM dbo.MUON WHERE MA_DOCGIA=@madocgia
	END
	ELSE
	BEGIN
		INSERT INTO dbo.QUATRINHMUON
		        ( MA_DAUSACH ,
		          MA_CUONSACH ,
		          NGAYGIO_MUON ,
		          MA_DOCGIA ,
		          NGAY_HETHAN ,
		          NGAY_TRA ,
		          TIENMUON ,
		          TIEN_DATRA ,
		          TIEN_DATCOC ,
		          GHICHU
		        )
		VALUES  ( @madausach , -- MA_DAUSACH - int
		          @macuonsach , -- MA_CUONSACH - int
		          @ngaymuon , -- NGAYGIO_MUON - datetime
		          @madocgia , -- MA_DOCGIA - int
		          @ngayhethan , -- NGAY_HETHAN - datetime
		          GETDATE() , -- NGAY_TRA - datetime
		          NULL , -- TIENMUON - money
		          NULL , -- TIEN_DATRA - money
		          NULL , -- TIEN_DATCOC - money
		          N''  -- GHICHU - nvarchar(200)
		        )
		DELETE FROM dbo.MUON WHERE MA_DOCGIA =@madocgia
	END
END
GO

EXEC dbo.sp_ @madocgia = 4 -- int
GO
--B�i t?p trigger
--5.1. tg_delMuon 
CREATE TRIGGER UTG_1
ON dbo.MUON
FOR DELETE
AS
BEGIN
	DECLARE cursordelete CURSOR FOR SELECT Deleted.MA_CUONSACH FROM Deleted
	OPEN cursordelete
	DECLARE @macuonsach INT
	FETCH NEXT FROM cursordelete INTO @macuonsach
	WHILE(@@FETCH_STATUS=0)
	BEGIN
		UPDATE dbo.CUONSACH SET TINHTRANG = 1 WHERE MA_CUONSACH=@macuonsach
		FETCH NEXT FROM cursordelete INTO @macuonsach
	END
	CLOSE cursordelete
	DEALLOCATE cursordelete
END
GO
DELETE dbo.MUON WHERE MA_CUONSACH=1
GO
--5.2. tg_insMuon
CREATE TRIGGER UTG_2
ON dbo.MUON
FOR INSERT
AS
BEGIN
DECLARE @macuonsach INT
SELECT @macuonsach=Inserted.MA_CUONSACH FROM Inserted
UPDATE dbo.CUONSACH SET TINHTRANG = 0 WHERE MA_CUONSACH=@macuonsach
END
GO
INSERT INTO dbo.MUON
        ( MA_DAUSACH ,
          MA_CUONSACH ,
          MA_DOCGIA ,
          NGAYGIOMUON ,
          NGAY_HETHAN
        )
VALUES  ( 1 , -- MA_DAUSACH - int
          1 , -- MA_CUONSACH - int
          2 , -- MA_DOCGIA - int
          GETDATE() , -- NGAYGIOMUON - datetime
          '02/03/2019'  -- NGAY_HETHAN - datetime
        )

GO
