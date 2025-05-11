1. BULK INSERT Products
FROM 'C:\Data\products.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
2. CSV (Comma-Separated Values)

TXT (Plain Text File)

XML (via OPENXML or BCP tools)

JSON (via OPENJSON or BULK INSERT with row formatters)
3. CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
4. INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 1000.00),
(2, 'Mouse', 25.50),
(3, 'Keyboard', 45.99);
5. Concept	Explanation
NULL	Indicates the absence of a value (unknown or missing data). It is not equal to 0 or empty string.
NOT NULL	Ensures the column must always contain a value (i.e., cannot be left blank).
6. ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
7. 
SELECT * FROM Products
WHERE Price > 100;
8. CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
9. CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE
);
10. BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2  -- Skips header row if present
);
11. ALTER TABLE Products
ADD CategoryID INT;

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

12. | Feature         | PRIMARY KEY                    | UNIQUE KEY                                |
| --------------- | ------------------------------ | ----------------------------------------- |
| Uniqueness      | Enforces unique values         | Also enforces unique values               |
| Nullability     | **Cannot** contain NULL values | **Can** contain **one** NULL (SQL Server) |
| Count per table | Only **one** primary key       | Can have **multiple** unique constraints  |
| Main Purpose    | Identifies each row uniquely   | Prevents duplicate entries in a column    |
13. ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0);
14. ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
15. SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;
16.A FOREIGN KEY enforces referential integrity by ensuring that a value in one table (child) corresponds to a value in another table (parent).

Usage:

Ensures consistency across related tables.

Prevents invalid entries in the child table.

Helps maintain relationships between entities.
17. CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT CHECK (Age >= 18)
);
18. CREATE TABLE Products (
    ProductID INT IDENTITY(100,10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);
19. CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)  -- Composite Primary Key
);
20. | Function                      | Description                                       | Example                             | Notes                                      |
| ----------------------------- | ------------------------------------------------- | ----------------------------------- | ------------------------------------------ |
| `ISNULL(expr, replacement)`   | Returns `replacement` if `expr` is NULL           | `ISNULL(Price, 0)`                  | SQL Server-specific                        |
| `COALESCE(expr1, expr2, ...)` | Returns the first non-NULL expression in the list | `COALESCE(Price, DiscountPrice, 0)` | ANSI standard, supports multiple fallbacks |
21. CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
22. CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

