CREATE DATABASE BOOKINGTICKET
GO
USE BOOKINGTICKET
GO
CREATE TABLE Users
(
    id int primary key identity,
    username nvarchar(255) not null unique,
	email varchar(100) not null,
	Phone char(12) not null,
    password char(64) not null,/*SHA256 encryption: http://www.xorbin.com/tools/sha256-hash-calculator */
	[Address] nvarchar(255) not null
)
GO
CREATE TABLE Groups
(
    id int primary key identity,
    groupname nvarchar(255) not null,
    username nvarchar(255) not null
)
GO
CREATE TABLE Seat
(
	ID int Identity(1,1) constraint pk_idseat Primary Key,
	Name nvarchar(20) not null
)
GO
CREATE TABLE Customer
(
	ID int identity(1,1) constraint pk_idcustomer Primary Key,
	Name nvarchar(50) not null,
	Phone char(12) not null,
)
GO
CREATE TABLE [Route]
(
	ID int identity(1,1) constraint pk_idroute Primary Key,
	Name nvarchar(50) not null,
	[Status] nvarchar(10) default 'Enable'
)
GO
CREATE TABLE [Price]
(
	ID int identity(1,1) constraint pk_idprice Primary Key,
	Origin nvarchar(50) not null,
	Destination nvarchar(50) not null,
	[Type] nvarchar(50) not null,
	Distance float not null,
	Duration nvarchar(50) not null,
	Schedule int not null,
	Price int not null,
	[Time] varchar(10)	
)
GO
CREATE TABLE Booking
(
	ID int identity(1,1) constraint pk_booking Primary Key,
	Idcustomer int constraint fk_idcustomer Foreign Key References Customer(ID),
	Idseat int constraint fk_idseat Foreign Key References Seat(ID),
	Idroute int constraint fk_idroute Foreign Key References [Route](ID),
	Origin nvarchar(100) not null,
	Destination nvarchar(100) not null,
	Departure_date datetime not null,
	[Status] nvarchar(30) not null
)



---Insert du lieu

---- Admin-------
--password khanh502x----
insert into users(username,email,Phone,password,Address)
values('Khanh','khanh.ngoba@gmail.com','01688624793','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',N'164 Giang Sơn, Đắc lắc');
insert into groups(groupname,username)
values('admin','Khanh');

----- Seat-------
INSERT [dbo].[Seat] VALUES (N'A1-D')
INSERT [dbo].[Seat] VALUES (N'B1-D')
INSERT [dbo].[Seat] VALUES (N'C1-D')
INSERT [dbo].[Seat] VALUES (N'A2-D')
INSERT [dbo].[Seat] VALUES (N'B2-D')
INSERT [dbo].[Seat] VALUES (N'C2-D')
INSERT [dbo].[Seat] VALUES (N'A3-D')
INSERT [dbo].[Seat] VALUES (N'B3-D')
INSERT [dbo].[Seat] VALUES (N'C3-D')
INSERT [dbo].[Seat] VALUES (N'A4-D')
INSERT [dbo].[Seat] VALUES (N'B4-D')
INSERT [dbo].[Seat] VALUES (N'C4-D')
INSERT [dbo].[Seat] VALUES (N'A5-D')
INSERT [dbo].[Seat] VALUES (N'B5-D')
INSERT [dbo].[Seat] VALUES (N'C5-D')
INSERT [dbo].[Seat] VALUES (N'A6-D')
INSERT [dbo].[Seat] VALUES (N'C6-D')
INSERT [dbo].[Seat] VALUES (N'D1-D')
INSERT [dbo].[Seat] VALUES (N'D2-D')
INSERT [dbo].[Seat] VALUES (N'D3-D')
INSERT [dbo].[Seat] VALUES (N'A1-T')
INSERT [dbo].[Seat] VALUES (N'B1-T')
INSERT [dbo].[Seat] VALUES (N'C1-T')
INSERT [dbo].[Seat] VALUES (N'A2-T')
INSERT [dbo].[Seat] VALUES (N'B2-T')
INSERT [dbo].[Seat] VALUES (N'C2-T')
INSERT [dbo].[Seat] VALUES (N'A3-T')
INSERT [dbo].[Seat] VALUES (N'B3-T')
INSERT [dbo].[Seat] VALUES (N'C3-T')
INSERT [dbo].[Seat] VALUES (N'A4-T')
INSERT [dbo].[Seat] VALUES (N'B4-T')
INSERT [dbo].[Seat] VALUES (N'C4-T')
INSERT [dbo].[Seat] VALUES (N'A5-T')
INSERT [dbo].[Seat] VALUES (N'B5-T')
INSERT [dbo].[Seat] VALUES (N'C5-T')
INSERT [dbo].[Seat] VALUES (N'A6-T')
INSERT [dbo].[Seat] VALUES (N'C6-T')
INSERT [dbo].[Seat] VALUES (N'D1-T')
INSERT [dbo].[Seat] VALUES (N'D2-T')
INSERT [dbo].[Seat] VALUES (N'D3-T')

-- Route---

INSERT [dbo].[Route] VALUES (N'Đắc Lắc - Sài Gòn','Enable')
INSERT [dbo].[Route] VALUES (N'Đà Lạt - Sài Gòn','Enable')
INSERT [dbo].[Route] VALUES (N'Nha Trang - Sài Gòn','Enable')
INSERT [dbo].[Route] VALUES (N'Sài Gòn - Đắc Lắc','Enable')
INSERT [dbo].[Route] VALUES (N'Sài Gòn - Đà Lạt','Enable')
INSERT [dbo].[Route] VALUES (N'Sài Gòn - Nha Trang','Enable')


---Price---

Insert Price values(N'Sài gòn',N'Đắc Lắc',N'Giường', 380, '8h', 1 , 220000, '18h')
Insert Price values(N'Sài gòn',N'Đà Lạt',N'Giường', 294, '8h', 1 , 210000, '18h')
Insert Price values(N'Sài gòn',N'Nha Trang',N'Giường', 434, '8h', 1 , 280000, '18h')
Insert Price values(N'Đắc Lắc',N'Sài gòn',N'Giường', 380, '8h', 1 , 220000, '18h')
Insert Price values(N'Đà Lạt',N'Sài gòn',N'Giường', 294, '8h', 1 , 210000, '18h')
Insert Price values(N'Nha Trang',N'Sài gòn',N'Giường', 434, '8h', 1 , 280000, '18h')