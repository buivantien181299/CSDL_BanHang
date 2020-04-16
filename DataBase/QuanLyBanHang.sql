DROP DATABASE IF EXISTS QuanLyGiaoHang;
CREATE DATABASE IF NOT EXISTS QuanLyGiaoHang;

USE QuanLyGiaoHang;

DROP TABLE IF EXISTS LoaiMaHang;
CREATE TABLE IF NOT EXISTS LoaiMaHang
(
	MaLoaiMatHang			NVARCHAR(50) PRIMARY KEY NOT NULL,
    TenLoaiMatHang			VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS DichVu;
CREATE TABLE IF NOT EXISTS DichVu
(
	MaDichVu				CHAR(10) PRIMARY KEY NOT NULL,
    TenDichVu				VARCHAR(60) NOT NULL
);

DROP TABLE IF EXISTS KhuVuc;
CREATE TABLE IF NOT EXISTS KhuVuc
(
	MaKhuVuc				CHAR(10) PRIMARY KEY NOT NULL,
    TenKhuVuc				VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS KhachHang;
CREATE TABLE IF NOT EXISTS	KhachHang
(
	MaKhachHang 				CHAR(10) NOT NULL PRIMARY KEY,
    MaKhuVuc					CHAR(10) NOT NULL,
    TenKhachHang				VARCHAR(50) NOT NULL,
    TenCuaHang					VARCHAR(50) NOT NULL,
    SoDTKhachHang				INT	NOT NULL,
    DiaChiEmail					VARCHAR(50) NOT NULL,
    DiaChiNhanHang				VARCHAR(50) NOT NULL,
    FOREIGN KEY (MaKhuVuc)	REFERENCES KhuVuc(MaKhuVuc)
);

DROP TABLE IF EXISTS KhoangThoiGian;
CREATE TABLE IF NOT EXISTS KhoangThoiGian
(
	MaKhoangThoiGian		CHAR(10) PRIMARY KEY NOT NULL,
    Mota					NVARCHAR(20) NOT NULL 
);

DROP TABLE IF EXISTS DangKyGiaoHang;
CREATE TABLE IF NOT EXISTS DangKyGiaoHang
(
	MaThanhVienGiaoHang 		CHAR(10) NOT NULL,
    MaKhoangThoiGianDKGiaoHang	CHAR(10) NOT NULL ,
    PRIMARY KEY (MaThanhVienGiaoHang, MaKhoangThoiGianDKGiaoHang),
    FOREIGN KEY (MaKhoangThoiGianDKGiaoHang) REFERENCES KhoangThoiGian(MaKhoangThoiGian)
);

DROP TABLE IF EXISTS ThanhVienGiaoHang;
CREATE TABLE IF NOT EXISTS ThanhVienGiaoHang
(
	MaThanhVienGiaoHang			CHAR(10) PRIMARY KEY NOT NULL,
    TenThanhVienGiaoHang		NVARCHAR(50) NOT NULL,
    NgaySinh					DATETIME NOT NULL,
    GioiTinh					CHAR(5) NOT NULL,
    SoDTThanhVien				INT NOT NULL,
    DiaChiThanhVien				VARCHAR(70) NOT NULL
);

DROP TABLE IF EXISTS ChiTiet_DonHang;
CREATE TABLE IF NOT EXISTS	ChiTiet_DonHang
(
	MaDOnHangGiaoHang			CHAR(10) NOT NULL,
    TenSanPhamDuocGiao			VARCHAR(50) NOT NULL,
    SoLuong						SMALLINT NOT NULL,
    TrongLuong					DECIMAL(4,2) NOT NULL,
    MaLoaiMatHang				NVARCHAR(50) NOT NULL,
    TienThuHo					DECIMAL(9) NOT NULL,
    FOREIGN KEY (MaLoaiMatHang) REFERENCES LoaiMaHang(MaLoaiMatHang)
);



DROP TABLE IF EXISTS DonHang_GiaoHang;
CREATE TABLE IF NOT EXISTS	DonHang_GiaoHang
(
	MaDonHangGiaoHang			CHAR(10) PRIMARY KEY NOT NULL,
    MaKhachHang 				CHAR(10) NOT NULL,
    MaThanhVienGiaoHang 		CHAR(10) NOT NULL,
    MaDichVu					CHAR(10) NOT NULL,
    MaKhuVucGiaoHang			CHAR(10) NOT NULL,
    TenNguoiNhan				VARCHAR(50) NOT NULL,
    DiaChiGiaoHang				VARCHAR(50) NOT NULL,
    SoDTNguoiNhan				INT NOT NULL,
    MaKhoangThoiGianGiaoHang	CHAR(10) NOT NULL,
    NgayGiaoHang				DATE NOT NULL,
    PhuongThucThanhToan			NVARCHAR(50) NOT NULL,
    TrangThaiPheDuyet			NVARCHAR(50) NOT NULL,
    TrangThaiGiaoHang			VARCHAR(50) ,
    FOREIGN KEY (MaKhachHang)	REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaThanhVienGiaoHang)	REFERENCES ThanhVienGiaoHang(MaThanhVienGiaoHang),
    FOREIGN KEY (MaDichVu)	REFERENCES DichVu(MaDichVu),
    FOREIGN KEY (MaKhuVucGiaoHang)	REFERENCES KhuVuc(MaKhuVuc),
    FOREIGN KEY (MaKhoangThoiGianGiaoHang )	REFERENCES KhoangThoiGian(MaKhoangThoiGian)
);

INSERT INTO LoaiMaHang
			(MaLoaiMatHang,	TenLoaiMatHang)
VALUES
			('MH001',	'Quan ao'),
            ('MH002',	'My Pham'),
            ('MH003',	'Do Gia Dung'),
            ('MH004',	'Do Dien Tu');
            
INSERT INTO DichVu
			(MaDichVu,	TenDichVu	)
VALUES 		
			('DV001',	'Giao Hang Nguoi Nhan Tra Phi'),
            ('DV002',	'Giao Hang Nguoi Gui Tra Phi'),
            ('DV003',	'Giao Hang Khong Tinh Phi');

INSERT INTO	KhuVuc
			(MaKhuVuc,	TenKhuVuc)
VALUES		
			('KV001',	'Son Tra'),
            ('KV002',	'Liem Chieu'),
            ('KV003',	'Ngu Hanh Son'),
            ('KV004',	'Hai Chau'),
            ('KV005',	'Thanh Khe');
            
INSERT INTO KhoangThoiGian
			(MaKhoangThoiGian,	Mota)
VALUES
			('TG001',	'7h - 9h AM'),
            ('TG002',	'9h - 11h AM'),
            ('TG003',	'1h - 3h PM'),
            ('TG004',	'3h - 5h PM'),
            ('TG005',	'5h - 7h PM');
            
INSERT INTO ThanhVienGiaoHang
			(MaThanhVienGiaoHang,	TenThanhVienGiaoHang,	NgaySinh,	GioiTinh,	 SoDTThanhVien	,DiaChiThanhVien)
VALUES
			('TV001',	'Nguyen Van A',					'1995-11-20',	'Nam',	090511111,	'23 Ong Kbiem'),
            ('TV002',	'Nguyen Van B',					'1992-12-26',	'Nu',	090511112,	'234 Ton Duc Thang'),
			('TV003',	'Nguyen Van C',					'1990-11-30',	'Nu',	090511113,	'45 Hoang Dieu'),			
			('TV004',	'Nguyen Van D',					'1995-07-08',	'Nam',	090511114,	'23/33 Ngu Hanh Son'),			
            ('TV005',	'Truong Thi Thu Quynh Ngoc ',	'1995-11-20',	'Nu',	090511115,	'56 Dinh Thi Dieu'),
			('TV006',	'Chuong Thi Thu Quynh Ngoc ',	'1995-11-20',	'Nu',	090511115,	'56 Dinh Thi Dieu');
   
INSERT INTO DangKyGiaoHang
			(MaThanhVienGiaoHang,	MaKhoangThoiGianDKGiaoHang)
VALUES
			('TVD001','TG004'),
            ('TVD002','TG005'),
            ('TVD003','TG001'),
            ('TVD004','TG002'),
            ('TVD005','TG003');

INSERT INTO	KhachHang
			(MaKhachHang, 	MaKhuVuc,	TenKhachHang,	TenCuaHang,	SoDTKhachHang,	DiaChiEmail,	DiaChiNhanHang)
VALUES
			('KH001',	'KV001',	'Le Thi A',		'Cua Hang 1',	'09051111',	'alethi@gmail.com',		'80 Pham Thu Thai'),
            ('KH002',	'KV001',	'Nguyen Van B',	'Cua Hang 2',	'09051112',	'bnguyenvan@gmail.com',	'100 Phan Tu'),
			('KH003',	'KV002',	'Le Thi B',		'Cua Hang 3',	'09051113',	'blethi@gmail.com',		'23 An Thuong 18'),			
            ('KH004',	'KV002',	'Nguyen Van C',	'Cua Hang 4',	'09051114',	'cnguyenvan@gmail.com',	'67 Ngo the Thai'), 	
            ('KH005',	'KV001',	'Le Thi D',		'Cua Hang 5',	'09051115',	'dlethi@gmail.com',		'100 Chau Trinh');		
             
INSERT INTO   DonHang_GiaoHang
			(MaDonHangGiaoHang,		MaKhachHang,	MaThanhVienGiaoHang,	MaDichVu,	MaKhuVucGiaoHang,	TenNguoiNhan,	DiaChiGiaoHang,	SoDTNguoiNhan,	MaKhoangThoiGianGiaoHang,	NgayGiaoHang,	PhuongThucThanhToan,	TrangThaiPheDuyet,	TrangThaiGiaoHang)
VALUES	
			('DH001',	'KH001',	'TV001',	'DV001',	'KV001',	'Pham Van A',	'30 Hoang Van Thu',	090511111,	'TG004',	'2016-10-10',	'Tien Mat',	'Da Phe Duyet',	'Da Giao Hang'),
			('DH002',	'KH001',	'TV002',	'DV001',	'KV005',	'Pham Van B',	'15 Le Dinh Ly',	090511112,	'TG005',	'2016-12-23',	'Tien Mat',	'Da Phe Duyet',	'Chua Giao Hang'), 	
            ('DH003',	'KH002',	'TV003',	'DV001',	'KV005',	'Pham Van C',	'23 Le Dinh Duong',	090511113,	'TG001',	'2017-04-08',	'Tien Mat',	'Da Phe Duyet',	'Da Giao Hang'), 				
            ('DH004',	'KH003',	'TV001',	'DV003',	'KV002',	'Pham Van D',	'45 Pham Thu Hoai',	090511114,	'TG002',	'2015-10-11',	'Chuyen Khoan',	'Da Phe Duyet',	'Da Giao Hang'), 		
            ('DH005',	'KH003',	'TV005',	'DV003',	'KV003',	'Pham Van E',	'78 Honag Dieu',	090511115,	'TG003',	'2017-04-04',	'Chuyen Khoan',	'Chua Phe Duyet',	NULL);			

INSERT INTO   ChiTiet_DonHang
			(MaDOnHangGiaoHang,	TenSanPhamDuocGiao,	SoLuong,	TrongLuong,	MaLoaiMatHang,	TienThuHo)
VALUES	
			('DH001',	'Ao Len',				2,	0.5,	'MH001',	200000),
            ('DH002',	'Quan Au',				1,	0.25,	'MH002',	350000),
            ('DH003',	'Ao Thun',				1,	0.25,	'MH003',	1000000),
            ('DH004',	'Ao Khoac',				3,	0.25,	'MH002',	2000000),
            ('DH005',	'Sua Duong The',		2,	0.25,	'MH003',	780000),
            ('DH006',	'Kem Tay Da Chet',		3,	0.5,	'MH001',	150000),
            ('DH007',	'Kem Duong Ban dem',	4,	0.25,	'MH002',	900000);
             				
 -- Câu 1: Xóa những khách hàng tên là "Lê Thị A";
 
DELETE FROM DonHang_GiaoHang
WHERE MaKhachHang = (SELECT 
						MaKhachHang
					FROM
						KhachHang
					WHERE
						TenKhachHang = 'Lê Thị A');

 DELETE FROM KhachHang
 WHERE TenKhachHang = 'Lê Thị A';

 -- Câu 2: Cập nhật những khách hàng đang thường trú ở khu vực “Son Tra” thành khu vực “Ngu Hanh Son”.            						
 
UPDATE KhachHang 
SET MaKhuVuc = (SELECT MaKhuVuc 
				FROM KhuVuc 
				WHERE TenKhuVuc = 'Ngu Hanh Son') 
WHERE MaKhuVuc = (SELECT MaKhuVuc 
					FROM KhuVuc 
					WHERE TenKhuVuc = 'Son Tra');
                    
-- Câu 3: Liệt kê những thành viên (shipper) có họ tên bắt đầu là ký tự ‘Tr’ và có độ dài ít nhất là 25 ký tự (kể cả ký tự trắng).
SELECT  MaThanhVienGiaoHang, TenThanhVienGiaoHang
FROM ThanhVienGiaoHang
WHERE TenThanhVienGiaoHang LIKE 'Tr%'
GROUP BY MaThanhVienGiaoHang
HAVING LENGTH(TenThanhVienGiaoHang) >= 25;

-- Câu 4: Liệt kê những đơn hàng có NgayGiaoHang nằm trong năm 2017 và có khu vực giao hàng là “Ngu Hanh Son”.     

SELECT dg.MaDonHangGiaoHang, dg.MaKhachHang , dg.MaThanhVienGiaoHang, dg.TenNguoiNhan	
FROM 	DonHang_GiaoHang dg
		LEFT JOIN 
        KhuVuc kv ON kv.MaKhuVuc = dg.MaKhuVucGiaoHang
WHERE YEAR(dg.NgayGiaoHang) =2017 AND kv.TenKhuVuc = 'Ngu Hanh Son';

/* Câu 5: Liệt kê MaDonHangGiaoHang, MaThanhVienGiaoHang, TenThanhVienGiaoHang,
NgayGiaoHang, PhuongThucThanhToan của tất cả những đơn hàng có trạng thái là “Da giao
hang”. Kết quả hiển thị được sắp xếp tăng dần theo NgayGiaoHang và giảm dần theo
PhuongThucThanhToan */

SELECT dg.MaDonHangGiaoHang, dg.MaThanhVienGiaoHang, tvgh.TenThanhVienGiaoHang, dg.NgayGiaoHang, dg.PhuongThucThanhToan
FROM DonHang_GiaoHang dg
	JOIN
    ThanhVienGiaoHang tvgh ON tvgh.MaThanhVienGiaoHang = dg.MaThanhVienGiaoHang
WHERE TrangThaiGiaoHang = 'Da giao hang'
ORDER BY PhuongThucThanhToan AND NgayGiaoHang DESC;

-- Câu 6: Liệt kê những thành viên có giới tính là “Nam” và chưa từng được giao hàng lần nào.

SELECT *
FROM ThanhVienGiaoHang
WHERE MaThanhVienGiaoHang NOT IN (SELECT MaThanhVienGiaoHang
									FROM DonHang_GiaoHang);
/*
Liệt kê họ tên của những khách hàng đang có trong hệ thống. Nếu họ tên trùng nhau
thì chỉ hiển thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau (mỗi cách
được tính 0.5 điểm) 
*/
-- Cach_1:
SELECT * 
FROM KhachHang
WHERE MaKhachHang IN (	SELECT MaKhachHang 
						FROM DonHang_GiaoHang)
GROUP BY TenKhachHang;

-- Cach_2:
SELECT kh.*
FROM 	KhachHang kh
	JOIN
		DonHang_GiaoHang dg ON dg.MaKhachHang = kh.MaKhachHang
GROUP BY kh.TenKhachHang;

/*
Liệt kê MaKhachHang, TenKhachHang, DiaChiNhanHang, MaDonHangGiaoHang,
PhuongThucThanhToan, TrangThaiGiaoHang của tất cả các khách hàng đang có trong hệ
thống
 */
 
 SELECT kh.MaKhachHang, kh.TenKhachHang,kh.DiaChiNhanHang, dg.MaDonHangGiaoHang, dg.PhuongThucThanhToan, dg.TrangThaiGiaoHang
 FROM KhachHang kh
	JOIN
		DonHang_GiaoHang dg ON dg.MaKhachHang = kh.MaKhachHang;

/*
Liệt kê những thành viên giao hàng có giới tính là “Nu” và từng giao hàng cho 10
khách hàng khác nhau ở khu vực giao hàng là “Hai Chau”
*/

SELECT tvgh.TenThanhVienGiaoHang
FROM ThanhVienGiaoHang tvgh
	JOIN
    DonHang_GiaoHang dg ON dg.MaThanhVienGiaoHang = tvgh.MaThanhVienGiaoHang
WHERE tvgh.GioiTinh = 'Nu' AND dg.MaKhuVucGiaoHang = (SELECT MaKhuVuc FROM KhuVuc WHERE TenKhuVuc = 'Hai Chau')
GROUP BY dg.MaKhachHang
HAVING COUNT(dg.MaKhachHang) = 10;

/*
Liệt kê những khách hàng đã từng yêu cầu giao hàng tại khu vực “Lien Chieu” và
chưa từng được một thành viên giao hàng nào có giới tính là “Nam” nhận giao hàng
 */
 SELECT kh.* 
 FROM KhachHang kh
	JOIN
    DonHang_GiaoHang dg ON dg.MaKhachHang = kh.MaKhachHang
WHERE dg.MaThanhVienGiaoHang IN (SELECT MaThanhVienGiaoHang FROM ThanhVienGiaoHang WHERE GioiTinh ='Nam');
    