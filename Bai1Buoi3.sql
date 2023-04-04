/**B1**/
SELECT Hangsx.Tenhang, Count(masp) 
FROM Hangsx INNER JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.Tenhang
/**B2**/
SELECT  tongtiennhap = Nhap.dongiaN*Nhap.soluongN, Nhap.Masp, tensp
FROM Nhap INNER JOIN Sanpham ON Nhap.Masp=Sanpham.masp 
GROUP BY Nhap.dongiaN, Nhap.soluongN, Sanpham.tensp, Nhap.Masp
/**B3**/
SELECT Xuat.Masp, Sanpham.mahangsx, soluongX, tensp, Ngayxuat
FROM Xuat
JOIN Sanpham ON Xuat.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngayxuat) = 2018 AND soluongX>10000 AND Tenhang = 'Samsung'

/***B.4***/
SELECT COUNT(Manv), Tennv, Phong
FROM Nhanvien WHERE Gioitinh = 'Nam' GROUP BY Tennv, Phong

/***B.5***/
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN

/***B.6***/
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX

/***B.7***/
SELECT Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
FROM Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
GROUP BY Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
/**B8**/
SELECT *
FROM Nhap 
WHERE Nhap.masp NOT IN (SELECT Xuat.masp FROM Xuat)
/***B.9***/
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018
/***B.10***/
SELECT Manv, Tennv FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
/***B.11***/
SELECT Manv, Tennv FROM Nhanvien
WHERE Nhanvien.manv NOT IN(SELECT Xuat.manv FROM Xuat) AND Nhanvien.manv NOT IN (SELECT Nhap.manv FROM Nhap)