1) SELECT *, 
       ROW_NUMBER() OVER (ORDER BY SaleDate) AS RowNum
FROM ProductSales;
2) SELECT ProductName, 
       SUM(Quantity) AS TotalQuantity,
       DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS QuantityRank
FROM ProductSales
GROUP BY ProductName;
3) SELECT *
FROM (
    SELECT *, 
           RANK() OVER (PARTITION BY CustomerID ORDER BY SaleAmount DESC) AS rnk
    FROM ProductSales
) AS ranked
WHERE rnk = 1;
4) SELECT SaleID, SaleDate, SaleAmount,
       LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM ProductSales;
5) SELECT SaleID, SaleDate, SaleAmount,
       LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM ProductSales;
6) SELECT *
FROM (
    SELECT *, 
           LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PrevAmount
    FROM ProductSales
) AS sub
WHERE SaleAmount > PrevAmount;
7) SELECT SaleID, ProductName, SaleDate, SaleAmount,
       LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevAmount,
       SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DiffFromPrevious
FROM ProductSales;
8) SELECT SaleID, ProductName, SaleDate, SaleAmount,
       LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextAmount,
       ROUND(
           100.0 * (LEAD(SaleAmount) OVER (ORDER BY SaleDate) - SaleAmount) / SaleAmount,
           2
       ) AS PercentChangeToNext
FROM ProductSales;
9) SELECT SaleID, ProductName, SaleDate, SaleAmount,
       LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevAmount,
       ROUND(
           SaleAmount / NULLIF(LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate), 0),
           2
       ) AS RatioToPrevious
FROM ProductSales;
10) SELECT SaleID, ProductName, SaleDate, SaleAmount,
       FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS FirstSaleAmount,
       SaleAmount - FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DiffFromFirst
FROM ProductSales;
11) SELECT *
FROM (
    SELECT *, 
           LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevAmount
    FROM ProductSales
) AS sub
WHERE SaleAmount > PrevAmount;
12) SELECT SaleID, SaleDate, SaleAmount,
       SUM(SaleAmount) OVER (ORDER BY SaleDate) AS RunningTotal
FROM ProductSales;
13) SELECT SaleID, SaleDate, SaleAmount,
       ROUND(AVG(SaleAmount) OVER (
           ORDER BY SaleDate 
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ), 2) AS MovingAvg3
FROM ProductSales;
!4) SELECT SaleID, SaleDate, SaleAmount,
       ROUND(SaleAmount - AVG(SaleAmount) OVER (), 2) AS DiffFromAverage
FROM ProductSales;
15) SELECT *, 
       DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees1;
16) SELECT *
FROM (
    SELECT *, 
           DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DeptSalaryRank
    FROM Employees1
) ranked
WHERE DeptSalaryRank <= 2;
17) SELECT *
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary ASC) AS rn
    FROM Employees1
) lowest
WHERE rn = 1;
18) SELECT *, 
       SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS RunningSalaryTotal
FROM Employees1;
19) SELECT *,
       SUM(Salary) OVER (PARTITION BY Department) AS DeptTotalSalary
FROM Employees1;
20) SELECT *,
       AVG(Salary) OVER (PARTITION BY Department) AS DeptAvgSalary
FROM Employees1;
