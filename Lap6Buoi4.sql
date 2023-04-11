/*****B1*****/
CREATE FUNCTION TenSanPham (@Tenhang nvarchar(20))
RETURNS TABLE RETURN 
	SELECT tensp, masp FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx 
	WHERE Tenhang = @Tenhang
GO
SELECT * FROM dbo.TenSanPham('Samsung')
GO
/****B2****/
CREATE FUNCTION Danhsachtheongay(@x int, @y int)
RETURNS TABLE RETURN
	SELECT tensp, Sanpham.masp, tenhang FROM Hangsx INNER JOIN Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
	WHERE DAY(Ngaynhap) BETWEEN @x AND @y
GO
SELECT * FROM dbo.Danhsachtheongay(1, 20)
GO
/****B3****/
CREATE FUNCTION LuaChon(@luachon int)
RETURNS @bang TABLE (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang 
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong < 0
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang
			SELECT tensp, Sanpham.masp, tenhang, Soluong FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
			WHERE soluong > 0
	END
	RETURN
END
SELECT * FROM dbo.LuaChon(0)
GO
/****B4****/
CREATE FUNCTION XemNhanVien (@tenphong nvarchar(20))
RETURNS TABLE RETURN 
	SELECT * FROM Nhanvien WHERE Phong = @tenphong
GO
SELECT * FROM dbo.XemNhanVien('Ke Toan')
GO
/****B5****/
CREATE FUNCTION XemHang(@diachi nvarchar(20))
RETURNS TABLE RETURN
	SELECT tenhang, mahangsx, Diachi FROM Hangsx WHERE Diachi = @diachi
GO
SELECT * FROM dbo.XemHang('Korea')
GO
/****B6****/
CREATE FUNCTION HangXuatTheoNam(@x int, @y int)
RETURNS TABLE RETURN
	SELECT tensp, Sanpham.masp, tenhang FROM Hangsx INNER JOIN Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
	WHERE YEAR(NgayXuat) BETWEEN @x AND @y
GO
SELECT * FROM dbo.HangXuatTheoNam(2019, 2019)
GO
/****B7****/
CREATE FUNCTION LuaChonXuatNhap1(@luachon int)
RETURNS @bang1 TABLE (tensp nvarchar(20), masp nvarchar(10),tenhang nvarchar(20), Soluong int)
AS
BEGIN
	IF @luachon = 0
	BEGIN
		INSERT INTO @bang1 
			SELECT tensp, Sanpham.masp, tenhang, soluongN FROM Hangsx INNER JOIN Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
	
	END
	IF @luachon = 1
	BEGIN
		INSERT INTO @bang1
			SELECT tensp, Sanpham.masp, tenhang, soluongX FROM Hangsx INNER JOIN Sanpham ON Sanpham.mahangsx = Hangsx.mahangsx INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
	END
	RETURN
END
GO
SELECT * FROM dbo.LuaChonXuatNhap1('0')
GO
/****B8****/
CREATE FUNCTION NhanVienNhapTheo(@x int)
RETURNS TABLE RETURN
	SELECT Tennv, Nhanvien.manv FROM Nhanvien INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
	WHERE DAY(Ngaynhap) = @x
GO
SELECT * FROM dbo.NhanVienNhapTheo('11')
GO
/****B9****/
CREATE FUNCTION DanhSachSanPhamtheogia2(@x money, @y money, @tenhang nvarchar(20))
RETURNS TABLE RETURN 
	SELECT tensp, tenhang, giaban FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	WHERE Tenhang = @tenhang AND @x <= giaban AND giaban <= @y
GO
SELECT * FROM dbo.DanhSachSanPhamtheogia2(10000.0000, 10000000.0000, 'OPPO')
GO
/****B10****/
CREATE FUNCTION KhongThamBien ()
RETURNS TABLE RETURN
	SELECT tensp, masp, Tenhang FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
GO
SELECT * FROM dbo.KhongThamBien()
ORDER BY Tenhang
GO