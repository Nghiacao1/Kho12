GO
CREATE VIEW VIEW1 AS
SELECT TOP 10 masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota 
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
ORDER BY giaban DESC
GO
SELECT * FROM VIEW1
GO
CREATE VIEW VIEW2 AS
SELECT masp, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='Samsung'
GO
SELECT * FROM VIEW2
GO
CREATE VIEW VIEW3 AS
SELECT * FROM Nhanvien 
WHERE Nhanvien.Gioitinh = 'Nu' AND Phong = 'Ke Toan'
GO
SELECT * FROM VIEW3
GO
CREATE VIEW VIEW4 AS
SELECT TOP 10 Nhap.Sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.Tenhang, Nhap.soluongN, Nhap.dongiaN, tiennhap=Nhap.soluongN*Nhap.dongiaN, Sanpham.mausac, Sanpham.donvitinh, Nhap.Ngaynhap, Nhanvien.Tennv, Nhanvien.Phong
FROM Nhap
join Sanpham ON Nhap.masp = Sanpham.masp
join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
join Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Sohdn ASC
GO
SELECT * FROM VIEW4
GO
CREATE VIEW VIEW5 AS
SELECT DISTINCT TOP 10 Sohdx, Sanpham.masp, tensp, Tenhang, soluongX, tienxuat=soluongX*giaban, mausac, donvitinh, Ngayxuat, Tennv, Phong
FROM Xuat inner join Sanpham
ON Xuat.masp = Sanpham.masp inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx inner join Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Ngayxuat) = 2018 AND MONTH(Ngayxuat) = 10
ORDER BY sohdx ASC
GO
SELECT * FROM VIEW5
GO
CREATE VIEW VIEW6 AS
SELECT sohdn, Nhap.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap inner join Sanpham ON Nhap.masp = Sanpham.masp inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx inner join Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.Tenhang = 'Samsung'AND YEAR(Ngaynhap) = 2017
GO
SELECT * FROM VIEW6
GO
CREATE VIEW VIEW7 AS
SELECT TOP 10 sohdx, tensp, soluongX
FROM Xuat 
inner join Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Ngayxuat) = 2023
ORDER BY soluongX DESC
GO
SELECT * FROM VIEW7
GO
CREATE VIEW VIEW8 AS
SELECT giaban, masp, tensp
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE 100000<giaban AND giaban<500000
GO
SELECT * FROM VIEW8
GO
CREATE VIEW VIEW9 AS
SELECT TOP 10 tensp, giaban 
FROM Sanpham
ORDER BY giaban DESC
GO
SELECT * FROM VIEW9
GO
CREATE VIEW VIEW10 AS
SELECT  tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
GO 
SELECT * FROM VIEW10
GO
CREATE VIEW VIEW11 AS
SELECT Hangsx.Tenhang, Count(masp) AS DEM
FROM Hangsx INNER JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.Tenhang
GO
SELECT * FROM VIEW11
GO 
CREATE VIEW VIEW12 AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN
GO 
SELECT * FROM VIEW12
GO
CREATE VIEW VIEW13 AS
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongX>10000 AND Tenhang = 'Samsung'
GO
SELECT * FROM VIEW13
GO
CREATE VIEW VIEW14 AS
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX
GO 
SELECT * FROM VIEW14
GO
CREATE VIEW VIEW15 AS
SELECT Manv, Tennv FROM Nhanvien
WHERE Nhanvien.manv NOT IN(SELECT Xuat.manv FROM Xuat) AND Nhanvien.manv NOT IN (SELECT Nhap.manv FROM Nhap)
GO
SELECT * FROM VIEW15

/*******UPDATE******/
GO
ALTER VIEW VIEW1 AS
SELECT TOP 5 masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota 
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
ORDER BY giaban DESC
GO
SELECT * FROM VIEW1
GO
ALTER VIEW VIEW2 AS
SELECT masp, Tenhang, tensp, soluong, mausac, giaban
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE Hangsx.Tenhang='OPPO'
GO
SELECT * FROM VIEW2
GO
ALTER VIEW VIEW3 AS
SELECT * FROM Nhanvien 
WHERE Nhanvien.Gioitinh = 'Nam' AND Phong = 'Vat Tu'
GO
SELECT * FROM VIEW3
GO
ALTER VIEW VIEW4 AS
SELECT TOP 5 Nhap.Sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.Tenhang, Nhap.soluongN, Nhap.dongiaN, tiennhap=Nhap.soluongN*Nhap.dongiaN, Sanpham.mausac, Sanpham.donvitinh, Nhap.Ngaynhap, Nhanvien.Tennv, Nhanvien.Phong
FROM Nhap
join Sanpham ON Nhap.masp = Sanpham.masp
join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
join Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Sohdn ASC
GO
SELECT * FROM VIEW4
GO
ALTER VIEW VIEW5 AS
SELECT DISTINCT TOP 10 Sohdx, Sanpham.masp, tensp, Tenhang, soluongX, tienxuat=soluongX*giaban, mausac, donvitinh, Ngayxuat, Tennv, Phong
FROM Xuat inner join Sanpham
ON Xuat.masp = Sanpham.masp inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx inner join Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Ngayxuat) = 2020 AND MONTH(Ngayxuat) = 10
ORDER BY sohdx ASC
GO
SELECT * FROM VIEW5
GO
ALTER VIEW VIEW6 AS
SELECT sohdn, Nhap.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap inner join Sanpham ON Nhap.masp = Sanpham.masp inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx inner join Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.Tenhang = 'OPPO'AND YEAR(Ngaynhap) = 2022
GO
SELECT * FROM VIEW6
GO
ALTER VIEW VIEW7 AS
SELECT TOP 10 sohdx, tensp, soluongX
FROM Xuat 
inner join Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Ngayxuat) = 2020
ORDER BY soluongX DESC
GO
SELECT * FROM VIEW7
GO
ALTER VIEW VIEW8 AS
SELECT giaban, masp, tensp
FROM Sanpham inner join Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE 200000<giaban AND giaban<1000000
GO
SELECT * FROM VIEW8
GO
ALTER VIEW VIEW9 AS
SELECT TOP 10 tensp, giaban, masp 
FROM Sanpham
ORDER BY giaban DESC
GO
SELECT * FROM VIEW9
GO
ALTER VIEW VIEW10 AS
SELECT TOP 10 tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
GO 
SELECT * FROM VIEW10
GO
ALTER VIEW VIEW11 AS
SELECT Hangsx.Tenhang, Count(masp) AS DEM
FROM Hangsx INNER JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.Tenhang
GO
SELECT * FROM VIEW11
GO 
ALTER VIEW VIEW12 AS
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2020
GROUP BY Tenhang, tensp, soluongN
GO 
SELECT * FROM VIEW12
GO
ALTER VIEW VIEW13 AS
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2020 AND soluongX>20000 AND Tenhang = 'OPPO'
GO
SELECT * FROM VIEW13
GO
ALTER VIEW VIEW14 AS
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX
GO 
SELECT * FROM VIEW14
GO
ALTER VIEW VIEW15 AS
SELECT Manv, Tennv FROM Nhanvien
WHERE Nhanvien.manv NOT IN(SELECT Xuat.manv FROM Xuat) AND Nhanvien.manv NOT IN (SELECT Nhap.manv FROM Nhap)
GO
SELECT * FROM VIEW15
GO
/*************** XOA VIEW**************/
GO
DROP VIEW VIEW1
GO
DROP VIEW VIEW2
GO
DROP VIEW VIEW3
GO
DROP VIEW VIEW4
GO
DROP VIEW VIEW5
GO
DROP VIEW VIEW6
GO
DROP VIEW VIEW7
GO
DROP VIEW VIEW8
GO
DROP VIEW VIEW9
GO
DROP VIEW VIEW10
GO
DROP VIEW VIEW11
GO
DROP VIEW VIEW12
GO
DROP VIEW VIEW13
GO
DROP VIEW VIEW14
GO
DROP VIEW VIEW15
GO