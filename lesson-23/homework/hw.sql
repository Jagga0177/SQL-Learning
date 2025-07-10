1) SELECT 
    Id,
    Dt,
    RIGHT('0' + CAST(MONTH(Dt) AS VARCHAR(2)), 2) AS MonthPrefixedWithZero
FROM Dates;
2) SELECT 
    COUNT(DISTINCT Id) AS Unique_IDs,
    SUM(MaxVal) AS SumOfMaxVals
FROM (
    SELECT 
        Id,
        rID,
        MAX(Vals) AS MaxVal
    FROM MyTabel
    GROUP BY Id, rID
) AS max_vals_per_group;
3) SELECT *
FROM TestFixLengths
WHERE 
    LEN(Vals) BETWEEN 6 AND 10;
4) SELECT ID, Item, Vals AS MaxVal
FROM TestMaximum
WHERE (ID, Vals) IN (
    SELECT ID, MAX(Vals)
    FROM TestMaximum
    GROUP BY ID
);
5) SELECT 
    Id,
    SUM(MaxVal) AS TotalMaxSum
FROM (
    SELECT 
        Id,
        DetailedNumber,
        MAX(Vals) AS MaxVal
    FROM SumOfMax
    GROUP BY Id, DetailedNumber
) AS MaxPerGroup
GROUP BY Id;
6) SELECT 
    Id,
    a,
    b,
    CASE 
        WHEN a - b = 0 THEN NULL
        ELSE a - b
    END AS Diff
FROM TheZeroPuzzle;
7) SELECT SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales;
8) SELECT AVG(UnitPrice) AS AverageUnitPrice
FROM Sales;
9) SELECT COUNT(*) AS TotalTransactions
FROM Sales;
10) SELECT MAX(QuantitySold) AS MaxUnitsSold
FROM Sales;
11) SELECT 
    Category,
    SUM(QuantitySold) AS TotalUnitsSold
FROM Sales
GROUP BY Category;
12) SELECT 
    Region,
    SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM Sales
GROUP BY Region;
13) SELECT TOP 1 
    Product,
    SUM(QuantitySold * UnitPrice) AS ProductRevenue
FROM Sales
GROUP BY Product
ORDER BY ProductRevenue DESC;
14) SELECT 
    SaleDate,
    Product,
    QuantitySold * UnitPrice AS Revenue,
    SUM(QuantitySold * UnitPrice) OVER (
        ORDER BY SaleDate
    ) AS RunningTotalRevenue
FROM Sales
ORDER BY SaleDate;
15) SELECT 
    Category,
    ROUND(
        100.0 * SUM(QuantitySold * UnitPrice) / 
        (SELECT SUM(QuantitySold * UnitPrice) FROM Sales), 2
    ) AS RevenuePercentage
FROM Sales
GROUP BY Category;
