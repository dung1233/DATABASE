CREATE DATABASE ToyzUnlimited
go

use ToyzUnlimited
go

CREATE TABLE Toys (
    ProductCode varchar(5) PRIMARY KEY,
    Name varchar(30),
    Category varchar(30),
    Manufacturer varchar(40),
    AgeRange varchar(15),
    UnitPrice money,
    Netweight int,
    QtyOnHand int
);
go
INSERT INTO Toys (ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand)
VALUES
    ('P001', 'Lego Set', 'Building Blocks', 'Lego', '3-5 years', 19.99, 300, 25),
    ('P002', 'Chess Set', 'Board Games', 'Hasbro', '6+ years', 29.99, 1000, 30),
    ('P003', 'Dollhouse', 'Dolls & Accessories', 'Barbie', '3-8 years', 49.99, 1500, 40),
    ('P015', 'Remote Control Car', 'Remote Control Toys', 'Maisto', '8+ years', 39.99, 800, 35);
go

CREATE PROCEDURE HeavyToys
AS
BEGIN
    SELECT *
    FROM Toys
    WHERE Netweight > 500;
END;
go

CREATE PROCEDURE PriceIncrease
AS
BEGIN
    UPDATE Toys
    SET UnitPrice = UnitPrice + 10;
END;
go
CREATE PROCEDURE QtyOnHand1
AS
BEGIN
    UPDATE Toys
    SET QtyOnHand = QtyOnHand - 5
END;
go
EXEC HeavyToys;
EXEC PriceIncrease;
EXEC QtyOnHand1;
go

--1
EXEC sp_helptext 'HeavyToys';
EXEC sp_helptext 'PriceIncrease';
EXEC sp_helptext 'QtyOnHand';
go

SELECT definition
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('HeavyToys');
go
SELECT definition
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('PriceIncrease');
go
SELECT definition
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('QtyOnHand');
go

SELECT OBJECT_DEFINITION(OBJECT_ID('HeavyToys')) AS ProcedureDefinition;
go
SELECT OBJECT_DEFINITION(OBJECT_ID('PriceIncrease')) AS ProcedureDefinition;
go
SELECT OBJECT_DEFINITION(OBJECT_ID('QtyOnHand')) AS ProcedureDefinition;
go
--2
EXEC sp_depends 'HeavyToys';
EXEC sp_depends 'PriceIncrease';
EXEC sp_depends 'QtyOnHand';
go
--3
ALTER PROCEDURE PriceIncrease
AS
BEGIN
    UPDATE Toys
    SET UnitPrice = UnitPrice + 10;

    SELECT *
    FROM Toys;
END;
go
ALTER PROCEDURE QtyOnHand
AS
BEGIN
    UPDATE Toys
    SET QtyOnHand = QtyOnHand - 5
    WHERE DATEPART(WEEKDAY, GETDATE()) = 5;

    SELECT *
    FROM Toys;
END;
go
--4
CREATE PROCEDURE SpecificPriceIncrease
AS
BEGIN
    DECLARE @TotalQtyOnHand INT;

    SELECT @TotalQtyOnHand = SUM(QtyOnHand)
    FROM Toys;

    UPDATE Toys
    SET UnitPrice = UnitPrice + @TotalQtyOnHand;

    SELECT *
    FROM Toys;
END;
go

EXEC SpecificPriceIncrease;
--5
ALTER PROCEDURE SpecificPriceIncrease
AS
BEGIN
    DECLARE @TotalQtyOnHand INT;

    SELECT @TotalQtyOnHand = SUM(QtyOnHand)
    FROM Toys;

    UPDATE Toys
    SET UnitPrice = UnitPrice + @TotalQtyOnHand;

    SELECT *,
           @TotalQtyOnHand AS TotalUpdatedRecords
    FROM Toys;
END;
go
--6
ALTER PROCEDURE SpecificPriceIncrease
AS
BEGIN
    DECLARE @TotalQtyOnHand INT;

    SELECT @TotalQtyOnHand = SUM(QtyOnHand)
    FROM Toys;

    EXEC HeavyToys;

    UPDATE Toys
    SET UnitPrice = UnitPrice + @TotalQtyOnHand;

    SELECT *,
           @TotalQtyOnHand AS TotalUpdatedRecords
    FROM Toys;
END;
go
--7
ALTER PROCEDURE HeavyToys
AS
BEGIN
    BEGIN TRY
        SELECT *
        FROM Toys
        WHERE Netweight > 500;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing HeavyToys procedure.';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
go
ALTER PROCEDURE PriceIncrease
AS
BEGIN
    BEGIN TRY
        UPDATE Toys
        SET UnitPrice = UnitPrice + 10;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing PriceIncrease procedure.';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
go
ALTER PROCEDURE QtyOnHand
AS
BEGIN
    BEGIN TRY
        UPDATE Toys
        SET QtyOnHand = QtyOnHand - 5
        WHERE DATEPART(WEEKDAY, GETDATE()) = 5;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while executing QtyOnHand procedure.';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
go

DROP PROCEDURE HeavyToys;
DROP PROCEDURE PriceIncrease;
DROP PROCEDURE QtyOnHand;
DROP PROCEDURE SpecificPriceIncrease;