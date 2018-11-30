SET DATEFORMAT ymd
INSERT INTO User
        ( ID, Email, Password, Level )
VALUES  ( 1, -- ID - int
          N'16521409@gm.uit.edu.vn', -- Email - nvarchar(50)
          N'1', -- Password - nvarchar(50)
          1  -- Level - int
          )
INSERT INTO User
        ( ID, Email, Password, Level )
VALUES  ( 2, -- ID - int
          N'16521396@gm.uit.edu.vn', -- Email - nvarchar(50)
          N'1', -- Password - nvarchar(50)
          1  -- Level - int
          )		
INSERT INTO	  User
        ( ID, Email, Password, Level )
VALUES  ( 3, -- ID - int
          N'16520219', -- Email - nvarchar(50)
          N'1', -- Password - nvarchar(50)
          1  -- Level - int
          )

INSERT INTO dbo.NamHoc( MaNH, TenNH )VALUES  ( 2018, N'2018 - 2019' )
INSERT INTO dbo.NamHoc( MaNH, TenNH )VALUES  ( 2019, N'2019 - 2020' )
INSERT INTO dbo.NamHoc( MaNH, TenNH )VALUES  ( 2020, N'2020 - 2021' )
INSERT INTO dbo.NamHoc( MaNH, TenNH )VALUES  ( 2021, N'2021 - 2022' )

INSERT INTO dbo.LopHoc ( MaLop, TenLop ) VALUES  ( N'M1',  N'Mầm 1' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop) VALUES  ( N'M2',  N'Mầm 2' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop) VALUES  ( N'M3',  N'Mầm 3' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop) VALUES  ( N'C1',  N'Chồi 1' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop) VALUES  ( N'C2',  N'Chồi 2' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop) VALUES  ( N'C3',  N'Chồi 3' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop) VALUES  ( N'L1',  N'Lá 1' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop ) VALUES  ( N'L2',  N'Lá 2' )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop ) VALUES  ( N'L3',  N'Lá 3'  )		


INSERT INTO dbo.HocSinh(MaHS, TenHS ,NgaySinh ,DiaChi ,TenCha ,TenMe ,TenNguoiGiamHo , SDT)VALUES  (1,  N'Tran Thi Thắm' ,'22/12/1998', N'456 Bình Lợi' , N'Trần Văn Ơn' ,N'Ngô Ngọc Thùy Linh' ,N'Dong Nai' ,  N'0123456789'  )
INSERT INTO dbo.HocSinh(MaHS, TenHS ,NgaySinh ,DiaChi ,TenCha ,TenMe ,TenNguoiGiamHo , SDT)VALUES  (2, N'Nguyen Van Dau' ,'22/12/1998', N'456 Bình Lợi' , N'Trần Văn Ơn' ,N'Ngô Ngọc Thùy Linh' ,NULL,  N'0123456789'  )

UPDATE dbo.HocSinh SET TenHS = 'a', NgaySinh = '22/12/2000', DiaChi = 'Binh Thuan', TenCha = 'A', TenMe = 'b',
TenNguoiGiamHo = NULL, SDT = '098776543' WHERE MaHS = 5

INSERT INTO dbo.HocSinh( MaHS,TenHS ,NgaySinh , DiaChi ,TenCha ,TenMe ,TenNguoiGiamHo ,SDT) VALUES  (1,  N'Do Nhu Lan' , '20/03/2018' ,N'Dong Nai' ,  N'Do Van Canh' , N'Tran Thi THuy Huong' , 'null' , N'11234567'  )


INSERT INTO dbo.CTLop VALUES  ( 1, N'M1' , 2018)


SELECT * FROM dbo.HocSinh

SELECT MAX(dbo.HocSinh.MaHS) AS maxhs FROM dbo.HocSinh


INSERT INTO dbo.HocSinh( TenHS ,NgaySinh ,DiaChi ,TenCha ,TenMe ,TenNguoiGiamHo , SDT)VALUES  ( N'dssaxc' ,'2018-11-29', N's' , N'khkjnkj,' ,N'jhbnjm' ,N'njnjnk' ,  N'123456'  )