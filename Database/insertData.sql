﻿SET DATEFORMAT DMY
INSERT INTO dbo.[User]
        ( ID, Email, Password, Level )
VALUES  ( 1, -- ID - int
          N'16521409@gm.uit.edu.vn', -- Email - nvarchar(50)
          N'1', -- Password - nvarchar(50)
          1  -- Level - int
          )
INSERT INTO dbo.[User]
        ( ID, Email, Password, Level )
VALUES  ( 2, -- ID - int
          N'16521396@gm.uit.edu.vn', -- Email - nvarchar(50)
          N'1', -- Password - nvarchar(50)
          1  -- Level - int
          )		
INSERT INTO	  dbo.[User]
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

INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'M1',  N'Mầm 1',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'M2',  N'Mầm 2',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'M3',  N'Mầm 3',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'C1',  N'Chồi 1',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'C2',  N'Chồi 2',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'C3',  N'Chồi 3',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'L1',  N'Lá 1',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'L2',  N'Lá 2',  2018  )		
INSERT INTO dbo.LopHoc ( MaLop, TenLop, MaNH ) VALUES  ( N'L3',  N'Lá 3',  2018  )		


INSERT INTO dbo.HocSinh( TenHS ,NgaySinh ,DiaChi ,TenCha ,TenMe ,TenNguoiGiamHo , SDT)VALUES  ( N'Tran Thi Thắm' ,NULL , N'456 Bình Lợi' , N'Trần Văn Ơn' ,N'Ngô Ngọc Thùy Linh' ,N'' ,  N'0123456789'  )
INSERT INTO dbo.CTLop ( MaHS, MaLop )VALUES  ( 1,  N'M1'  )
