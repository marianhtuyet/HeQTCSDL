--Lost update
--T1

--Lost update
--T1

SET TRAN ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN 
DECLARE @triGiaHD FLOAT
SELECT @triGiaHD = TriGia FROM dbo.HopDong  WHERE MaHopDong = 'HD1'
WAITFOR DELAY '00: 00: 10'
UPDATE dbo.HopDong SET TriGia = @triGiaHD + 100 WHERE MaHopDong = 'HD1'
COMMIT

SELECT TriGia FROM dbo.HopDong WHERE MaHopDong = 'HD1'
