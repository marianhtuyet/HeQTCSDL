--procedure tu dong them ma hs, ma lop vao chuyen di

CREATE PROC ThemThamGia @MaNH int,  @MaChuyenDi NVARCHAR(6)
	AS
	BEGIN
	  DECLARE @MaHS INT , @MaLop NVARCHAR(6)
	DECLARE CURSORThamGia CURSOR FOR 
	(SELECT MaHS, MaLop FROM dbo.CTLop WHERE MaNH = @MaNH)
	OPEN CURSORThamGia 
	FETCH NEXT FROM CURSORThamGia INTO @MaHS, @MaLop
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
			INSERT INTO dbo.HocSinhThamGia
			        ( MaHS ,
			          MaLop ,
			          MaChuyenDi ,
			          ThamGia ,
			          IsDongTien
			        )
			VALUES  ( @MaHS, -- MaHS - int
			          @MaLop , -- MaLop - nvarchar(6)
			          @MaChuyenDi , -- MaChuyenDi - int
			          NULL , -- ThamGia - bit
			          NULL  -- IsDongTien - bit
			        )
		FETCH NEXT FROM CURSORThamGia INTO @MaHS, @MaLop
	END
	CLOSE CURSORThamGia
	DEALLOCATE CURSORThamGia


END 

DROP PROC dbo.ThemThamGia
EXEC  ThemThamGia  2018,  'CD1' 

  
--procedure them giao vien, malop , ma chuyen di vao tham gia

CREATE PROC ThemThamGiaGV @MaNH int,  @MaChuyenDi NVARCHAR(6)
	AS
	BEGIN
	  DECLARE @MaGV INT , @MaLop NVARCHAR(6)
	DECLARE CURSORThamGia CURSOR FOR 
	(SELECT MaGV, MaLop FROM dbo.CT_GV_Lop WHERE MaNH = @MaNH)
	OPEN CURSORThamGia 
	FETCH NEXT FROM CURSORThamGia INTO @MaGV, @MaLop
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
			INSERT INTO dbo.GiaoVienThamGia
			        ( MaGiaoVien ,
			          MaLop ,
			          MaChuyenDi ,
			          ThamGia
			        )
			VALUES  ( @MaGV , -- MaGiaoVien - int
			          @MaLop , -- MaLop - nvarchar(6)
			          @MaChuyenDi , -- MaChuyenDi - int
			          NULL  -- ThamGia - bit
			        )
		FETCH NEXT FROM CURSORThamGia INTO @MaGV, @MaLop
	END
	CLOSE CURSORThamGia
	DEALLOCATE CURSORThamGia


END 
EXEC  ThemThamGiaGV  2018,  'CD1' 




--Trigger thêm User không bị trùng lắp

-- Trigger dùng để xác định độ tuổi của trẻ từ 3-5 tuổi mới nhận
-- Nếu không thông báo lỗi cho người dùng

CREATE TRIGGER NamSinhHS
ON HocSinh
AFTER INSERT
AS 
BEGIN
	DECLARE @MaHS INT, @NgaySinh SMALLDATETIME, @Now SMALLDATETIME
	SELECT @MaHS = MaHS, @NgaySinh = NgaySinh FROM Inserted
	IF( YEAR(@NgaySinh) < (YEAR(GETDATE()) - 5) or YEAR(@NgaySinh) > (YEAR(GETDATE()) - 3))
	BEGIN
		PRINT 'Cannot insert HocSinh'
		ROLLBACK TRAN
	END
END

-- Trigger này dùng để set sĩ số lớp, sĩ số lớp tối đa là 50

CREATE TRIGGER SiSoLop
ON dbo.CTLop
AFTER INSERT
AS 
BEGIN
	DECLARE @MaHS INT, @MaLop NVARCHAR(6), @MaNH INT, @tong int
	SELECT @MaLop = MaLop, @MaNH = MaNH FROM Inserted
	SELECT @tong = COUNT(MaHS) FROM dbo.CTLop WHERE MaNH = @MaNH AND MaLop = @MaLop
	IF( @tong > 50)
	BEGIN
		PRINT 'Si so lop toi da, khong the them hoc sinh vao lop'
		ROLLBACK TRANSACTION
	END
END

-- proc thêm mã học sinh theo thứ tự. Nễu 1 học sinh cũ bị xóa đi, mã học sinh sẽ lấy mã lớn nhất



--- taoj proc tìm mã học sinh
CREATE PROC TimMaHS @MaHS INT OUT
AS
	BEGIN
		DECLARE @max INT, @i INT
		SELECT @max = MAX(MaHS) FROM dbo.HocSinh
		SET @i = 1;
		SET @MaHS = 0;
		WHILE @i < @max
			BEGIN
				IF(@i = SOME(SELECT MaHS FROM dbo.HocSinh))
					SET @i +=1
				ELSE
					BEGIN
                		SET @MaHS = @i
						BREAK
					END
			END 
		IF(@MaHS = 0)
		BEGIN
			SET @MaHS = @max + 1

		END

	END

	-- proc chính
	CREATE PROC InsertHocSinh @TenHS NVARCHAR(50), @NgaySinh SMALLDATETIME, @DiaChi NVARCHAR(50), @TenCha NVARCHAR(50), 
			@TenMe NVARCHAR(50), @TenNguoiGiamHo NVARCHAR(50), @SDT NVARCHAR(10), @MaLop NVARCHAR(6), @MaNH INT
AS
	BEGIN
		DECLARE @MaHS INT, @temp INT
		EXEC TimMaHS @MaHS OUT
		IF(@TenHS = SOME(SELECT TenHS FROM dbo.HocSinh))
			IF(@NgaySinh = SOME(SELECT NgaySinh FROM dbo.HocSinh))
				IF(@DiaChi = SOME(SELECT DiaChi FROM dbo.HocSinh))
					IF(@TenCha = SOME(SELECT TenCha FROM dbo.HocSinh))
						IF(@SDT = SOME(SELECT SDT FROM dbo.HocSinh))
							SET @temp = 1
		IF(@temp != 0)
			PRINT 'Hoc Sinh bi trung'		
		ELSE

			INSERT INTO dbo.HocSinh( MaHS , TenHS , NgaySinh ,DiaChi , TenCha , TenMe , TenNguoiGiamHo , SDT , TrangThai)
			VALUES  (@MaHS,@TenHS, @NgaySinh, @DiaChi, @TenCha, @TenMe , @TenNguoiGiamHo, @SDT, 1)
			INSERT INTO dbo.CTLop VALUES  ( @MaHS, @MaLop, @MaNH)

	END


--proc them user theo thu tu tang dan

CREATE PROC TimMaUser @MaUser INT OUT
AS
	BEGIN
		DECLARE @max INT, @i INT
		SELECT @max = MAX(ID) FROM dbo.[User]
		SET @i = 1;
		SET @MaUser = 0;
		WHILE @i < @max
			BEGIN
				IF(@i = SOME(SELECT ID FROM dbo.[User]))
					SET @i +=1
				ELSE
					BEGIN
                		SET @MaUser = @i
						BREAK
					END
			END 
		IF(@MaUser = 0)
		BEGIN
			SET @MaUser = @max + 1

		END

	END

CREATE PROC InsertUser @Email NVARCHAR(50), @Pass NVARCHAR(50)
AS
	BEGIN
		DECLARE @MaUser INT, @temp INT
		EXEC TimMaUser @MaUser OUT
		IF( @Email = SOME(SELECT Email FROM dbo.[User]))
			SET @temp = 1
		IF(@temp != 0)
			PRINT 'User bi trung'		
		ELSE

			INSERT INTO dbo.[User]
			VALUES  (@MaUser, @Email, @Pass, 1)

	END



---procedure chon hoc sinh theo lop, theo ten
CREATE PROC SelectHocSinh @MaNH INT, @MaLop NVARCHAR(6)
AS
	BEGIN
		IF(@@ERROR = 0 AND @@ROWCOUNT = 0)
			SELECT * FROM dbo.CTLop INNER JOIN dbo.HocSinh ON HocSinh.MaHS = CTLop.MaHS
		WHERE dbo.CTLop.MaLop = @MaLop AND dbo.CTLop.MaNH = @MaNH AND dbo.HocSinh.TrangThai = 'true'
		ELSE
        
			PRINT 'Khong the hien thi danh sach hoc sinh'
	END


-- chon lop hoc


CREATE PROC SelectLopHoc  
AS
	BEGIN
		IF(@@ERROR = 0 AND @@ROWCOUNT = 0)
			SELECT * FROM dbo.LopHoc
		ELSE
        
			PRINT 'Khong the hien thi danh sach hoc sinh'
	END
	

--Select nam hoc

CREATE PROC SelectNamHoc  
AS
	BEGIN
		IF(@@ERROR = 0 AND @@ROWCOUNT = 0)
			SELECT * FROM dbo.NamHoc
		ELSE
			PRINT 'Khong the hien thi danh sach hoc sinh'
	END
