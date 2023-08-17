CREATE TABLE Customers1 (
    CustomerID1 INT PRIMARY KEY,
    CustomerName1 VARCHAR(255),
    ContactName1 VARCHAR(255)
);
--Tạo bảng

--thay đổi cấu trúc bảng

INSERT INTO Customers1 (CustomerID1, CustomerName1, ContactName1)
VALUES (1, 'ABC Company', 'John Smith');
--thêm dữ liệu vào bảng
UPDATE Products
SET UnitPrice = UnitPrice * 1.1
WHERE CategoryID = 1;
--Cập nhập dữ liệu trong bảng

SELECT * FROM Products;
--truy vấn tất cả
SELECT ProductName, UnitPrice FROM Products;
--truy vấn cụ thể
SELECT ProductName, UnitPrice
FROM Products
WHERE CategoryID = 3 AND UnitPrice > 50;
--truy vấn có diều kiện
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
--kết hợp bảng

DROP TABLE Customers1;
--xóa bảng 
ALTER TABLE Orders
ADD OrderDate DATE;


SELECT EmployeeID ,Country  FROM Employees
WHERE  City= 'London' and Country= 'UK';


SELECT EmployeeID AS SOLUONGCOUTRY FROM Employees
WHERE Country= 'USA';