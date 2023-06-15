create database QuanLyKhachSan
--drop database QuanLyKhachSan1
GO

Use QuanLyKhachSan
GO
create table TAIKHOAN
(
	Username nvarchar(50) primary key not null,
	password nvarchar(50) not null
)
CREATE TABLE DANHMUCPHONG
(
	MaPhong varchar(4) PRIMARY KEY,
	TenPhong nvarchar(50) NOT NULL,
	MaLoaiPhong varchar(4) NOT NULL,
	TinhTrangPhong nvarchar(50) NOT NULL default N'Trống'
	foreign key (MaLoaiPhong) references dbo.LOAIPHONG(MaLoaiPhong)
)
ALTER TABLE DANHMUCPHONG
   ADD CONSTRAINT FK_DANHMUCPHONG_LOAIPHONG_PK FOREIGN KEY (MaLoaiPhong)
      REFERENCES dbo.LOAIPHONG (MaLoaiPhong)
;
-- drop table DANHMUCPHONG
GO

CREATE TABLE LOAIPHONG
(
	MaLoaiPhong varchar(4) PRIMARY KEY,
	TenLoaiPhong nvarchar(50) NOT NULL,
	DonGia int NOT NULL
)
-- drop table LOAIPHONG
GO

CREATE TABLE LOAIKHACHHANG
(
	MaLoaiKhach varchar(4) PRIMARY KEY,
	TenLoaiKhach nvarchar(50) NOT NULL,
	HeSoPhuThu float NOT NULL
)
-- drop table LOAIKHACHHANG
GO

CREATE TABLE PHIEUTHUEPHONG
(
	MaPhieuThuePhong varchar(4) PRIMARY KEY,
	MaPhong varchar(4) NOT NULL,
	DonGiaThue1Ngay float NOT NULL,
	SoKhachTrongPhong int NOT NULL,
	NgayBatDauThue date NOT NULL default getdate()
	foreign key (MaPhong) references dbo.DANHMUCPHONG(MaPhong),
	foreign key (SoKhachTrongPhong) references dbo.TILEPHUTHU(KhachThuBaoNhieu)
)
-- drop table PHIEUTHUEPHONG
GO

CREATE TABLE CT_PHIEUTHUEPHONG
(
	MaPhieuThuePhong varchar(4),
	MaLoaiKhach varchar(4),
	CMND nchar(10) NOT NULL,
	TenKhachHang nvarchar(50) NOT NULL,
	DiaChi nvarchar(50) NOT NULL
	Constraint CT_PHIEUTHUEPHONG_pk PRIMARY KEY (MaPhieuThuePhong,MaLoaiKhach)
	FOREIGN KEY (MaLoaiKhach) references dbo.LOAIKHACHHANG(MaLoaiKhach),
	foreign key (MaPhieuThuePhong) references dbo.PHIEUTHUEPHONG(MaPhieuThuePhong)
)
GO
/*Drop TABLE CT_PHIEUTHUEPHONG*/

CREATE TABLE TILEPHUTHU
(
	KhachThuBaoNhieu int PRIMARY KEY ,
	TiLePhuThu float NOT NULL
)
-- drop table TILEPHUTHU
GO

CREATE TABLE HOADON
(
	MaHoaDon varchar(4) PRIMARY KEY,
	TenKhachHangThanhToan nvarchar(50) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	NgayThanhToan date NOT NULL default getdate(),
	TriGia float NOT NULL
)
-- drop table HOADON
GO

CREATE TABLE CT_HOADON
(
	MaPhieuThuePhong varchar(4),
	MaHoaDon varchar(4),
	SoNgayThue int NOT NULL,
	SoTienPhaiTra float NOT NULL
	CONSTRAINT CT_HOADON_pk PRIMARY KEY (MaPhieuThuePhong,MaHoaDon)
	FOREIGN KEY (MaPhieuThuePhong) references dbo.PHIEUTHUEPHONG(MaPhieuThuePhong),
	Foreign key (MaHoaDon) references dbo.HOADON(MaHoaDon)
)
-- drop table CT_HOADON
GO

CREATE TABLE BAOCAODOANHTHUTHANG
(
	MaBCDTT varchar(4) PRIMARY KEY,
	Thang date NOT NULL,
	Nam date NOT NULL,
	TongDoanhThu float NOT NULL default 0,
)
-- drop table BAOCAODOANHTHUTHANG
GO

CREATE TABLE CT_BAOCAODOANHTHUTHANG
(
	MaCTBKDTT varchar(4) primary key,
	MaBCDTT varchar(4) NOT NULL,
	MaHoaDon varchar(4) NOT NULL,
	Thang date NOT NULL,
	Nam date NOT NULL,
	MaLoaiPhong varchar(4) NOT NULL,
	DoanhThu float NOT NULL default 0,
	TiLe float
	foreign key (MaBCDTT) references dbo.BAOCAODOANHTHUTHANG(MaBCDTT),
	foreign key (MaHoaDon) references dbo.HOADON(MaHoaDon)
)
-- drop table CT_BAOCAODOANHTHUTHANG
GO

CREATE TABLE THAMSO
(
	SoKhachToiDa int NOT NULL,
	SoKhachKhongTinhPhuThu int NOT NULL
)
-- drop table THAMSO
GO
alter table DANHMUCPHONG
drop constraint FK_DANHMUCPHONG_LOAIPHONG_PK

insert into dbo.TAIKHOAN(Username,password)
values (N'Nhom3',20521495)
insert into dbo.TAIKHOAN(Username,password)
values (N'Kiet',20521495)
insert into dbo.TAIKHOAN(Username,password)
values (N'Tri',20521495)
insert into dbo.TAIKHOAN(Username,password)
values (N'Minh',20521495)
go

create proc USP_GetListAccount
@Username nvarchar(50)
as
begin
select * from dbo.TAIKHOAN where @Username = Username
end
go

exec USP_GetListAccount @Username = 'Nhom3'


select * from TAIKHOAN


-- Thêm phòng
declare @room int = 0
while @room<= 10
begin 
	insert dbo.DANHMUCPHONG(MaPhong,TenPhong,MaLoaiPhong,TinhTrangPhong)
	Values (N'A'+cast(@room as nvarchar(50)),N'Phòng A'+cast(@room as nvarchar(50)),N'A',N'Trống')
	set @room =@room+1
end


declare @roomb int = 0
while @roomb<= 10
begin 
	insert dbo.DANHMUCPHONG(MaPhong,TenPhong,MaLoaiPhong,TinhTrangPhong)
	Values (N'B'+cast(@roomb as nvarchar(50)),N'Phòng B'+cast(@roomb as nvarchar(50)),N'B',N'Trống')
	set @roomb =@roomb+1
end

declare @roomc int = 0
while @roomc<= 10
begin 
	insert dbo.DANHMUCPHONG(MaPhong,TenPhong,MaLoaiPhong,TinhTrangPhong)
	Values (N'C'+cast(@roomc as nvarchar(50)),N'Phòng C'+cast(@roomc as nvarchar(50)),N'C',N'Trống')
	set @roomc=@roomc+1
end

select * from DANHMUCPHONG
go

create proc USP_GetRoomList
AS Select * From DANHMUCPHONG
Go

update danhmucphong set TinhTrangPhong = N'Có người' where MaLoaiPhong='A'
go
-- Thêm loại khách hàng
insert into LOAIKHACHHANG(MaLoaiKhach,TenLoaiKhach,HeSoPhuThu) values (N'IN',N'Khách nội địa',1.0) 
insert into LOAIKHACHHANG(MaLoaiKhach,TenLoaiKhach,HeSoPhuThu) values (N'OUT',N'Khách ngoại địa',1.5) 
go
select * from LOAIKHACHHANG

-- Thêm tỉ lệ phụ thu
insert into TILEPHUTHU(KhachThuBaoNhieu,TiLePhuThu) values (2,1.0)
insert into TILEPHUTHU(KhachThuBaoNhieu,TiLePhuThu) values (3,1.25)
select * from TILEPHUTHU

-- Thêm loại phòng
insert into LOAIPHONG(MaLoaiPhong,TenLoaiPhong,DonGia) values (N'A',N'Loại phòng A',150000)
-- Thêm phiếu thuê phòng
select * from PHIEUTHUEPHONG
select * from CT_PHIEUTHUEPHONG

