1) SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s2.CustomerName = s1.CustomerName
      AND MONTH(s2.SaleDate) = 3
      AND YEAR(s2.SaleDate) = 2024
);
2) SELECT Product
FROM (
    SELECT Product, SUM(Quantity * Price) AS TotalRevenue
    FROM #Sales
    GROUP BY Product
) AS RevenueTable
WHERE TotalRevenue = (
    SELECT MAX(SUM(Quantity * Price))
    FROM #Sales
    GROUP BY Product
);
3) SELECT MAX(SaleTotal) AS SecondHighestSale
FROM (
    SELECT Quantity * Price AS SaleTotal
    FROM #Sales
) AS SalesAmounts
WHERE SaleTotal < (
    SELECT MAX(Quantity * Price)
    FROM #Sales
);
4) SELECT 
    MONTH(SaleDate) AS SaleMonth,
    YEAR(SaleDate) AS SaleYear,
    (SELECT SUM(Quantity) 
     FROM #Sales s2 
     WHERE MONTH(s2.SaleDate) = MONTH(s1.SaleDate) AND YEAR(s2.SaleDate) = YEAR(s1.SaleDate)
    ) AS TotalQuantity
FROM #Sales s1
GROUP BY MONTH(SaleDate), YEAR(SaleDate);
5) SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s1.CustomerName <> s2.CustomerName
      AND s1.Product = s2.Product
);
6) SELECT Name, Fruit, COUNT(*) AS Quantity
FROM Fruits
GROUP BY Name, Fruit
ORDER BY Name, Fruit;
7) SELECT DISTINCT f1.ParentId AS OlderPerson, f2.ChildID AS YoungerPerson
FROM Family f1
JOIN Family f2 ON f1.ChildID = f2.ParentId;
14) WITH SaleMonths AS (
    SELECT DISTINCT MONTH(SaleDate) AS SaleMonth
    FROM Sales
),
EmployeeMonths AS (
    SELECT EmployeeID, MONTH(SaleDate) AS SaleMonth
    FROM Sales
    GROUP BY EmployeeID, MONTH(SaleDate)
)
SELECT DISTINCT e.EmployeeID
FROM Sales e
WHERE NOT EXISTS (
    SELECT 1
    FROM SaleMonths sm
    WHERE NOT EXISTS (
        SELECT 1
        FROM EmployeeMonths em
        WHERE em.EmployeeID = e.EmployeeID AND em.SaleMonth = sm.SaleMonth
    )
);
15) SELECT Name
FROM Products
WHERE Price > (
    SELECT AVG(Price) FROM Products
);
16) SELECT *
FROM Products
WHERE Stock < (
    SELECT MAX(Stock) FROM Products
);
17) SELECT Name
FROM Products
WHERE Category = (
    SELECT Category
    FROM Products
    WHERE Name = 'Laptop'
);
18) SELECT *
FROM Products
WHERE Price > (
    SELECT MIN(Price)
    FROM Products
    WHERE Category = 'Electronics'
);
