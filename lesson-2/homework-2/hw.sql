1. CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
2. INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alice Johnson', 5000.00);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (2, 'Bob Smith', 6000.00);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(3, 'Carol White', 5500.00);
3. UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;
4. DELETE FROM Employees
WHERE EmpID = 2;
5. -- Create a test table
CREATE TABLE TestTable (
    ID INT,
    Data VARCHAR(50)
);

-- Insert sample data
INSERT INTO TestTable VALUES (1, 'Sample1'), (2, 'Sample2');

-- DELETE (removes rows, keeps table and schema)
DELETE FROM TestTable;

-- TRUNCATE (removes all rows, faster, resets identity, cannot use WHERE)
TRUNCATE TABLE TestTable;

-- DROP (removes table and all its data and structure)
DROP TABLE TestTable;
5.
DELETE - Removes specific rows; supports WHERE clause; can be rolled back (if in transaction).
TRUNCATE - Removes all rows; cannot use WHERE; faster than DELETE; resets identity counters.    
DROP - Completely removes the table from the database including its schema.                  |
6. ALTER TABLE Employees
MODIFY COLUMN Name VARCHAR(100);
7. ALTER TABLE Employees
ADD Department VARCHAR(50);
8.	ALTER TABLE Employees
MODIFY COLUMN Salary FLOAT;
11. CREATE TABLE TempDepartments (
    DeptName VARCHAR(50)
);

INSERT INTO TempDepartments VALUES
('HR'), ('Finance'), ('IT'), ('Marketing'), ('Logistics');
CREATE TABLE Departments (
    DeptName VARCHAR(50)
);

INSERT INTO Departments (DeptName)
SELECT DeptName FROM TempDepartments;
12. UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
13.DELETE FROM Employees;
14. ALTER TABLE Employees
DROP COLUMN Department;
22. SELECT * INTO Products_Backup
FROM Products;
23. EXEC sp_rename 'Products', 'Inventory';
RENAME TABLE Products TO Inventory;
ALTER TABLE Products RENAME TO Inventory;
24. ALTER TABLE Inventory
MODIFY COLUMN Price FLOAT;
25. ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
