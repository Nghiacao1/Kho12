/***B1****/
CREATE FUNCTION TenHang (@masp nchar(10))
RETURNS nvarchar(20)
AS 
BEGIN 
	DECLARE @Tenhang nvarchar(20) 
	SET @Tenhang = (SELECT Tenhang FROM Hangsx INNER JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx WHERE Sanpham.masp = @masp)
	RETURN @Tenhang
END
GO
SELECT dbo.TenHang('SP01')
GO
/****B2****/
CREATE FUNCTION GiaTriNhap (@x int, @y int)
RETURNS int
AS
BEGIN 
	DECLARE @GiaTriNhap int
	SELECT @GiaTriNhap = SUM(soluongN*dongiaN) FROM Nhap WHERE YEAR(NGAYNHAP) BETWEEN @x and @y
	RETURN @GiaTriNhap
END
GO
SELECT dbo.GiaTriNhap(2019,2021)
GO
/*****B3*****/
CREATE FUNCTION TongNhapXuat(@tensp nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongNhapXuat int
	SELECT @TongNhapXuat = soluongN - soluongX FROM Nhap INNER JOIN Xuat ON Nhap.masp = Xuat.masp INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
	WHERE Sanpham.tensp = @tensp AND YEAR(Ngaynhap) = @y AND YEAR(Ngayxuat) = @y
	RETURN @TongNhapXuat
END
GO
SELECT dbo.TongNhapXuat('GalaxyV21', 2020)
GO
/*****B4****/
CREATE FUNCTION TongGiaTriNhapNgay(@x int, @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongGiaTriNhapNgay int
	SELECT @TongGiaTriNhapNgay = SUM(soluongN*dongiaN) FROM Nhap 
	WHERE DAY(Ngaynhap) BETWEEN @x and @y
	RETURN @TongGiaTriNhapNgay
END
GO
SELECT dbo.TongGiaTriNhapNgay(1,20)
GO
/*****B5*****/
CREATE FUNCTION TongGiaTriXuat(@tenhang nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongGiaTriXuat int
	SELECT @TongGiaTriXuat = SUM(soluongX*giaban) FROM Xuat INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	WHERE Hangsx.Tenhang = @tenhang AND YEAR(Ngayxuat) = @y
	RETURN @TongGiaTriXuat
END
GO
SELECT dbo.TongGiaTriXuat('Samsung', 2020)
GO
/*****B6*****/
CREATE FUNCTION ThongKeNhanVien(@tenphong nvarchar(30))
RETURNS int
AS
BEGIN 
	DECLARE @ThongKeNhanVien int
	SELECT @ThongKeNhanVien = Count(Phong) FROM Nhanvien 
	WHERE Nhanvien.Phong = @tenphong
	RETURN @ThongKeNhanVien
END
GO
SELECT dbo.ThongKeNhanVien('Ke Toan')
GO
/******B7******/
CREATE FUNCTION Soluongxuattheongay(@tensp nvarchar(20),@y int)
RETURNS int
AS
BEGIN 
	DECLARE @Soluongxuattheongay int
	SELECT @Soluongxuattheongay = Sum(soluongX) FROM Xuat INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
	WHERE Sanpham.tensp = @tensp AND DAY(Ngayxuat) = @y
	RETURN @Soluongxuattheongay
END
GO
SELECT dbo.Soluongxuattheongay('GalaxyV21', 18)
GO
/*****B8****/
CREATE FUNCTION Sodienthoainhanvienxuat(@x nchar(10))
RETURNS int
AS
BEGIN 
	DECLARE @Sodienthoainhanvienxuat int
	SELECT @Sodienthoainhanvienxuat = Sodt FROM Nhanvien INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
	WHERE Xuat.Sohdx = @x
	RETURN @Sodienthoainhanvienxuat
END
GO
SELECT dbo.Sodienthoainhanvienxuat('X03')
GO
/*****B9*****/
CREATE FUNCTION TongNhapXuatTheoNam(@tensp nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongNhapXuat int
	SELECT @TongNhapXuat = soluongN - soluongX FROM Nhap INNER JOIN Xuat ON Nhap.masp = Xuat.masp INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
	WHERE Sanpham.tensp = @tensp AND YEAR(Ngaynhap) = @y AND YEAR(Ngayxuat) = @y
	RETURN @TongNhapXuat
END
GO
SELECT dbo.TongNhapXuatTheoNam('F1Plus', 2020)
GO
/*****B10******/
CREATE FUNCTION Tongsoluongsanpham(@tenhang nvarchar(20))
RETURNS int
AS
BEGIN 
	DECLARE @Tongsoluongsanpham int
	SELECT @Tongsoluongsanpham = Count(tensp) FROM Sanpham INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx 
	WHERE Hangsx.Tenhang = @tenhang
	RETURN @Tongsoluongsanpham
END
GO
SELECT dbo.Tongsoluongsanpham('Samsung')
GO