1) WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 FROM Numbers WHERE num < 1000
)
SELECT * FROM Numbers;
2) SELECT e.EmployeeID, e.FirstName, e.LastName, dt.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) dt ON e.EmployeeID = dt.EmployeeID;
3) WITH AvgSalary AS (
    SELECT AVG(Salary) AS avg_salary FROM Employees
)
SELECT * FROM AvgSalary;
4) SELECT p.ProductID, p.ProductName, dt.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) dt ON p.ProductID = dt.ProductID;
5) WITH Doubles AS (
    SELECT 1 AS val
    UNION ALL
    SELECT val * 2 FROM Doubles WHERE val * 2 < 1000000
)
SELECT * FROM Doubles;
6) WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
    HAVING COUNT(*) > 5
)
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN SalesCount s ON e.EmployeeID = s.EmployeeID;
7) WITH BigSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
    HAVING SUM(SalesAmount) > 500
)
SELECT p.ProductID, p.ProductName, b.TotalSales
FROM Products p
JOIN BigSales b ON p.ProductID = b.ProductID;
8) WITH AvgSal AS (
    SELECT AVG(Salary) AS avg_sal FROM Employees
)
SELECT e.*
FROM Employees e
JOIN AvgSal a ON e.Salary > a.avg_sal;
Medium Tasks:
1) SELECT TOP 5 e.EmployeeID, e.FirstName, e.LastName, dt.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) dt ON e.EmployeeID = dt.EmployeeID
ORDER BY dt.OrderCount DESC;
2) SELECT p.CategoryID, SUM(s.SalesAmount) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.CategoryID;
3) WITH Factorial (Number, FactorialValue) AS (
    SELECT Number, CAST(1 AS BIGINT) FROM Numbers1 WHERE Number = 0 OR Number = 1
    UNION ALL
    SELECT n.Number, f.FactorialValue * n.Number
    FROM Numbers1 n
    JOIN Factorial f ON n.Number = f.Number + 1
    WHERE n.Number <= 20 -- limit for safety
)
SELECT DISTINCT Number, MAX(FactorialValue) OVER (PARTITION BY Number) AS Factorial
FROM Factorial;
4) WITH RECURSIVE SplitChars AS (
    SELECT Id, 1 AS pos, SUBSTRING(String, 1, 1) AS Char
    FROM Example
    WHERE LEN(String) > 0
    UNION ALL
    SELECT Id, pos + 1, SUBSTRING(String, pos + 1, 1)
    FROM SplitChars
    WHERE pos + 1 <= LEN((SELECT String FROM Example WHERE Example.Id = SplitChars.Id))
)
SELECT * FROM SplitChars;
5) WITH MonthlySales AS (
    SELECT 
        DATEFROMPARTS(YEAR(SaleDate), MONTH(SaleDate), 1) AS MonthStart,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY DATEFROMPARTS(YEAR(SaleDate), MONTH(SaleDate), 1)
),
SalesDiff AS (
    SELECT 
        m1.MonthStart,
        m1.TotalSales,
        m1.TotalSales - ISNULL(m2.TotalSales, 0) AS SalesDifference
    FROM MonthlySales m1
    LEFT JOIN MonthlySales m2 ON DATEADD(MONTH, 1, m2.MonthStart) = m1.MonthStart
)
SELECT * FROM SalesDiff;
6) SELECT e.EmployeeID, e.FirstName, e.LastName, dt.Quarter, dt.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        CONCAT('Q', DATEPART(QUARTER, SaleDate)) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) dt ON e.EmployeeID = dt.EmployeeID;
