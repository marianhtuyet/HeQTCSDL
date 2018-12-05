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




