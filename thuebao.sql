CREATE DATABASE MSSQLTWO5
GO

USE MSSQLTWO5
GO


CREATE TABLE KhachHang (
    KhachHangID INT PRIMARY KEY,
    TenKhachHang NVARCHAR(255),
    SoCMND NVARCHAR(255),
    DiaChi NVARCHAR(255)
);
go
CREATE TABLE DichVuDangKy (
    DichVuID INT PRIMARY KEY,
    TenDichVu NVARCHAR(255),
    GiaTien FLOAT,
    ThoiHan INT
);
go
CREATE TABLE SoThueBao (
    SoThueBaoID INT PRIMARY KEY,
    KhachHangID INT,
    SoThueBao NVARCHAR(255),
    NgayDangKy DATE,
    DichVuID INT,
    FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID),
    FOREIGN KEY (DichVuID) REFERENCES DichVuDangKy(DichVuID)
);
go