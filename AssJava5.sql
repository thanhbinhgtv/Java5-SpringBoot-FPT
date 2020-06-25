Create database AssJava5
go
use AssJava5

----bảng Thể Loại
IF OBJECT_ID('Categories') IS NOT NULL
DROP TABLE Categories
GO
CREATE TABLE Categories
(
	CategoryId INT NOT NULL PRIMARY KEY,
	Name VARCHAR(255) NULL
)
-----bảng sản phẩm---
IF OBJECT_ID('Products') IS NOT NULL
DROP TABLE Products
GO
CREATE TABLE Products
(
	ProductId INT NOT NULL PRIMARY KEY ,
	Name VARCHAR(255) NULL,
	Image VARCHAR(255) NULL,
    Quantity INT NULL,
    Price int, 
    Status VARCHAR(20) NULL,
    CategoryId INT NOT NULL,

	CONSTRAINT FK_Products_Categories FOREIGN KEY(CategoryId) REFERENCES Categories
)
	---phân quyền---
IF OBJECT_ID('Adminn') IS NOT NULL
DROP TABLE Adminn
GO
CREATE TABLE Adminn
(
	IdAdmin INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) NULL
)

IF OBJECT_ID('Customers') IS NOT NULL
DROP TABLE Customers
GO
CREATE TABLE Customers
(
	CustomerId NVARCHAR(50) NOT NULL PRIMARY KEY,
	IdAdmin INT NOT NULL,
    Name NVARCHAR(50) NULL,
    Gender bit NULL,
    Email NVARCHAR(255) NULL,
    Phone NVARCHAR(30) NULL,
    Password NVARCHAR(30) NULL,

	CONSTRAINT FK_Adminn_Customers FOREIGN KEY(IdAdmin) REFERENCES Adminn
    
    )

---CARTS---

IF OBJECT_ID('Carts') IS NOT NULL
DROP TABLE Carts
GO
CREATE TABLE Carts
(
	CartId INT NOT NULL PRIMARY KEY ,
    CustomerId NVARCHAR(50) NOT NULL,  
	CONSTRAINT FK_Carts_Customers FOREIGN KEY(CustomerId)REFERENCES Customers
)

---CartDetails---

IF OBJECT_ID('CartDetails') IS NOT NULL
DROP TABLE CartDetails
GO
CREATE TABLE CartDetails
(
	CartDetailId INT NOT NULL PRIMARY KEY ,
	CartId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NULL,
    Price INT NULL,
	Note NVARCHAR(255) null
	CONSTRAINT FK_CartDetails_Products FOREIGN KEY(ProductId) REFERENCES Products,
	CONSTRAINT FK_CartDetails_Carts FOREIGN KEY(CartId) REFERENCES Carts
)
-----truy vấn dữ liệu
Go
DELETE FROM dbo.Categories
INSERT INTO Categories VALUES ('01',N'Quan')
INSERT INTO Categories VALUES ('02',N'Ao')
INSERT INTO Categories VALUES ('03',N'Giay')
INSERT INTO Categories VALUES ('04',N'Phu Kien')
Go
DELETE FROM dbo.Products
INSERT INTO Products VALUES ('01',N'Quan',N'product1.png',2,1500000,N'IN STOCK','01')
INSERT INTO Products VALUES ('02',N'Ao',N'product2.png',4,200000,N'IN STOCK','02')
INSERT INTO Products VALUES ('03',N'Giay',N'product3.png',5,300000,N'IN STOCK','03')
INSERT INTO Products VALUES ('04',N'Phu Kien',N'product4.png',7,800000,N'IN STOCK','04')
Go
DELETE FROM dbo.Adminn
INSERT INTO Adminn VALUES ('01',N'Thanh Binh')
INSERT INTO Adminn VALUES ('02',N'MANH CUONG')
INSERT INTO Adminn VALUES ('03',N'NGUYEN Hang')
INSERT INTO Adminn VALUES ('04',N'NGUYEN MAI')
Go
DELETE FROM dbo.Customers
INSERT INTO Customers VALUES ('01','01',N'Thanh Binh',1,'thanhbinh@gmail.com','0964742696','123')
INSERT INTO Customers VALUES ('02','02',N'MANH CUONG',0,'manhcuong@gmail.com','0333701269','123')
INSERT INTO Customers VALUES ('03','03',N'NGUYEN Hang',1,'nguyenhang@gmail.com','0355708901','123')
INSERT INTO Customers VALUES ('04','04',N'NGUYEN MAI',1,'nguyenmai@gmail.com','0320076050','123')
Go
DELETE FROM dbo.Carts
INSERT INTO Carts VALUES ('01','01')
INSERT INTO Carts VALUES ('02','02')
INSERT INTO Carts VALUES ('03','03')
INSERT INTO Carts VALUES ('04','04')

Go
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Adminn
SELECT * FROM Customers
SELECT * FROM Carts
------------ Demo
IF OBJECT_ID('Demo') IS NOT NULL
	DROP TABLE Demo
GO
CREATE TABLE Demo
(
	ID Int Identity(1,1) Not null,
	Name	Nvarchar(50) Not NULL,
	Phone	Nvarchar(20) NULL,
	CONSTRAINT PK_Demo PRIMARY KEY(ID)
)
Delete From Demo
Insert Into Demo Values(N'Quan', 500)
Insert Into Demo Values(N'Ao', 1000)
Insert Into Demo Values(N'Giay', 1500)

Select * From Demo
------------