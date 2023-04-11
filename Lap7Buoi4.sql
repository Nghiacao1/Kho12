/****B1****/
CREATE PROC NhapLieuHangSX(@mahangsx nvarchar(10), @tenhang nvarchar(20), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20))
AS 
	IF @tenhang NOT IN (SELECT Tenhang FROM Hangsx)
	BEGIN
		INSERT INTO Hangsx(mahangsx, Tenhang, Diachi, Sodt, email)
		VALUES (@mahangsx, @tenhang, @diachi, @sodt, @email)
	END
	ELSE 
	BEGIN
		RAISERROR (N'Tên Hãng đã tồn tại',16,1)
		ROLLBACK TRAN
	END
GO
dbo.NhapLieuHangSX 'H01', 'Samsung', 'Cà Mau', '019461841', 'Samsung.email'
GO
/****B2****/
CREATE PROC NhapLieuSPmoi(@masp nvarchar(10), @tenhangsx nvarchar(20), @tensp nvarchar(20), @soluong int, @mausac nvarchar(10), @giaban money, @donvitinh nvarchar(10), @mota nvarchar(10))
AS
	IF @masp IN (SELECT Masp FROM Sanpham)
	BEGIN 
		UPDATE Sanpham SET tensp = @tensp, mahangsx = @tenhangsx, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
		WHERE masp = @masp
	END
	ELSE 
	BEGIN 
		INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
		VALUES (@masp, @tenhangsx, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
	END
GO
dbo.NhapLieuSPmoi 'SP08', 'H03', 'Redmi note11', 12, 'Tim', 2000000, 'Chiec', 'Gia re'
GO
/****B3****/
CREATE PROC XoaHang (@Tenhang nvarchar(20))
AS
	IF @Tenhang IN (SELECT tenhang FROM Hangsx)
	BEGIN
		DELETE FROM Hangsx 
		WHERE Tenhang = @Tenhang
	END
	ELSE
	BEGIN
		RAISERROR (N'Hang khong ton tai', 16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaHang 'Xiaomi'
/****B4****/
CREATE PROC ChinhsuaNV(@manv nvarchar(10), @tennv nvarchar(20), @gioitinh nvarchar(10), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20), @phong nvarchar(30), @Flag int)
AS
	IF @Flag = 0
	BEGIN
		UPDATE Nhanvien SET Tennv = @tennv, Gioitinh = @gioitinh, Diachi = @diachi, Sodt = @sodt, email = @email, Phong = @phong
		WHERE manv = @manv
	END
	ELSE 
	BEGIN
		INSERT INTO Nhanvien(manv, Tennv, Gioitinh, Diachi, Sodt, email, Phong)
		VALUES (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
	END
GO
dbo.ChinhsuaNV 'NV04', 'Nguyễn Văn Hai', 'Nam', 'Hà Nội', '0164167142', 'Hainguyen@gmail.com', 'Ke toan', 0
GO
/****B5****/
CREATE PROC Nhaphang(@shdn nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngaynhap date, @soluongN int, @dongiaN money)
AS
	IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		IF @shdn IN (SELECT Sohdn FROM Nhap)
		BEGIN
			UPDATE Nhap SET masp = @masp, manv = @manv, Ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN
			WHERE Sohdn = @shdn
		END
		ELSE
		BEGIN
			INSERT INTO Nhap(Sohdn, masp, manv, Ngaynhap, soluongN, dongiaN)
			VALUES (@shdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
		END
	END
	ELSE
	BEGIN
		RAISERROR (N'Mã sản phẩm và mã nhân viên không tồn tại',16,1)
		ROLLBACK TRAN
	END
GO
dbo.Nhaphang 'N06', 'SP01', 'NV03','2023-3-12', 14, 8000000.0000
GO
/****B6****/
CREATE PROC Xuathang(@shdx nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngayxuat date, @soluongX int)
AS
	IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien) AND @soluongX <= (SELECT TOP 1 soluong FROM Sanpham)	
	BEGIN
		IF @shdx IN (SELECT Sohdx FROM Xuat)
		BEGIN
			UPDATE Xuat SET masp = @masp, manv = @manv, Ngayxuat = @ngayxuat, soluongX = @soluongX
			WHERE Sohdx = @shdx
		END
		ELSE
		BEGIN
			INSERT INTO Xuat(Sohdx, masp, manv, Ngayxuat, soluongX)
			VALUES (@shdx, @masp, @manv, @ngayxuat, @soluongX)
		END
	END
	ELSE
	BEGIN
		RAISERROR (N'Mã sản phẩm và mã nhân viên không tồn tại hoặc số lượng xuất nhiều hơn tồn kho',16,1)
		ROLLBACK TRAN
	END
GO
dbo.Xuathang 'X06', 'SP01', 'NV03','2023-3-12',12
GO
/****B7****/
CREATE PROC XoaNhanVien (@manv nvarchar(10))
AS
	IF @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		DELETE FROM Nhanvien WHERE manv = @manv
		DELETE FROM Nhap WHERE manv = @manv
		DELETE FROM Xuat WHERE manv = @manv
	END
	ELSE 
	BEGIN
		RAISERROR (N'Mã nhân viên không tồn tại',16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaNhanVien 'NV04'
GO
/****B8****/
CREATE PROC XoaSanPham (@masp nvarchar(10))
AS
	IF @masp IN (SELECT masp FROM Sanpham)
	BEGIN
		DELETE FROM Sanpham WHERE masp = @masp
		DELETE FROM Nhap WHERE masp = @masp
		DELETE FROM Xuat WHERE masp = @masp
	END
	ELSE 
	BEGIN
		RAISERROR (N'Mã sản phẩm không tồn tại',16,1)
		ROLLBACK TRAN
	END
GO
dbo.XoaSanPham 'SP08'
GO