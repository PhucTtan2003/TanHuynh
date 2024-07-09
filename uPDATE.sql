CREATE DATABASE Quanly;
GO
USE Quanly;
GO 

CREATE TABLE [user] (
    MAND INT IDENTITY(1,1) PRIMARY KEY,
    HOTEN NVARCHAR(100) NOT NULL,
    SODIENTHOAI NVARCHAR(15) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Account (
    MATAIKHOAN INT IDENTITY(1,1) PRIMARY KEY,
    TAIKHOAN NVARCHAR(50) UNIQUE NOT NULL,
    MATKHAU NVARCHAR(255) NOT NULL,
    MAND INT,
    FOREIGN KEY (MAND) REFERENCES [user](MAND)
);

CREATE TABLE Permission (
    MAQUYEN INT IDENTITY(1,1) PRIMARY KEY,
    TENQUYEN NVARCHAR(50) NOT NULL,
    MOTAQUYEN NVARCHAR(MAX)
);

CREATE TABLE Product (
    MASANPHAM INT IDENTITY(1,1) PRIMARY KEY,
    GIASP DECIMAL(10, 2) NOT NULL,
    TENSP NVARCHAR(100) NOT NULL,
    DANHMUCSANPHAM NVARCHAR(50), 
    CHITIETSP NVARCHAR(MAX)
);

CREATE TABLE Bill (
    MAHOADON INT IDENTITY(1,1) PRIMARY KEY,
    NGAYIN DATE NOT NULL,
    TONGSOTIEN DECIMAL(10, 2) NOT NULL,
    TRANGTHAI NVARCHAR(50) NOT NULL,
    MAND INT,
    FOREIGN KEY (MAND) REFERENCES [user](MAND)
);

CREATE TABLE DetailBill (
    MACHITIET INT IDENTITY(1,1) PRIMARY KEY,
    MAHOADON INT NOT NULL,
    MASANPHAM INT NOT NULL,
    SOLUONG INT NOT NULL CHECK (SOLUONG > 0),
    FOREIGN KEY (MAHOADON) REFERENCES Bill(MAHOADON),
    FOREIGN KEY (MASANPHAM) REFERENCES Product(MASANPHAM)
);
INSERT INTO [user] (HOTEN, SODIENTHOAI, Email) VALUES
('Nguyen Van A', '0912345678', 'nguyenvana@example.com'),
('Le Thi B', '0987654321', 'lethib@example.com');

INSERT INTO Account (TAIKHOAN, MATKHAU, MAND) VALUES
('VanA', '2003', 1),
('ThiB', 'password2', 2);

INSERT INTO Permission (TENQUYEN, MOTAQUYEN) VALUES
('Admin', 'Toan quyen truy cap'),
('user', 'Gioi han truy cap'),
('khachhang', 'Toi thieu truy cap');

INSERT INTO Product (GIASP, TENSP, DANHMUCSANPHAM, CHITIETSP) VALUES
(100.00, 'Kẹo', 'Bánh kẹo', 'Dẻo, Mềm, Vị Bạc Hà'),
(200.00, 'Socola', 'Bánh kẹo', 'Vị đắng nhẹ, cứng'),
(300.00, 'Singum', 'Bánh kẹo', 'Mát lạnh, ngọt lâu'),
(400.00, 'Mít sấy', 'Trái cây sấy', 'Giòn, ngọt'),
(500.00, 'Xoài sấy', 'Trái cây sấy', 'Dẻo, thơm, ngọt'),
(600.00, 'Dâu sấy', 'Trái cây sấy', 'Giòn, chua, ngọt'),
(700.00, 'Snack', 'Đồ ăn vặt', 'Giòn'),
(800.00, 'Mứt', 'Đồ ăn vặt', 'Dẻo'),
(900.00, 'Nước ngọt', 'Đồ uống', 'Tùy loại đồ uống'),
(1000.00, 'Trà trái cây', 'Đồ uống', 'Mát, Ngọt thanh');

INSERT INTO Bill (NGAYIN, TONGSOTIEN, TRANGTHAI, MAND) VALUES
(N'2024-06-01', 1000.00, 'Đã thanh toán', 1),
('2024-06-02', 2000.00, 'Chưa thanh toán', 2),
('2024-06-03', 1500.00, 'Đã thanh toán', 1);

INSERT INTO DetailBill (MAHOADON, MASANPHAM, SOLUONG) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1);
ALTER TABLE Account
ADD MASANPHAM INT,
FOREIGN KEY (MASANPHAM) REFERENCES Product(MASANPHAM);

ALTER TABLE Account
ADD MAQUYEN INT,
FOREIGN KEY (MAQUYEN) REFERENCES Permission(MAQUYEN);

