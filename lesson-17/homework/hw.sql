1) WITH Regions AS (SELECT DISTINCT Region FROM #RegionSales),
     Distributors AS (SELECT DISTINCT Distributor FROM #RegionSales),
     AllCombos AS (
         SELECT r.Region, d.Distributor
         FROM Regions r
         CROSS JOIN Distributors d
     )
SELECT 
    a.Region,
    a.Distributor,
    ISNULL(rs.Sales, 0) AS Sales
FROM AllCombos a
LEFT JOIN #RegionSales rs
    ON a.Region = rs.Region AND a.Distributor = rs.Distributor
ORDER BY a.Region, a.Distributor;
2) SELECT 
    managerId 
FROM Employee
WHERE managerId IS NOT NULL
GROUP BY managerId
HAVING COUNT(*) >= 5;
3) SELECT 
    p.product_name,
    SUM(o.unit) AS total_units
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
4) SELECT CustomerID, Vendor
FROM (
    SELECT 
        CustomerID, Vendor,
        COUNT(*) AS OrderCount,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rn
    FROM Orders
    GROUP BY CustomerID, Vendor
) ranked
WHERE rn = 1;
5) DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @IsPrime BIT = 1;

WHILE @i <= SQRT(@Check_Prime)
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @IsPrime = 0;
        BREAK;
    END
    SET @i = @i + 1;
END

IF @IsPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';
6) SELECT 
    Device_id,
    COUNT(DISTINCT Locations) AS LocationCount
INTO #TempLocCount
FROM Device
GROUP BY Device_id;
SELECT 
    Device_id,
    Locations AS MostFrequentLocation
INTO #TempTopLoc
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Device_id ORDER BY COUNT(*) DESC) AS rn
    FROM Device
    GROUP BY Device_id, Locations
) t
WHERE rn = 1;
SELECT 
    Device_id,
    COUNT(*) AS TotalSignals
INTO #TempTotalSignals
FROM Device
GROUP BY Device_id;
SELECT 
    d.Device_id,
    l.LocationCount,
    t.MostFrequentLocation,
    s.TotalSignals
FROM #TempLocCount l
JOIN #TempTopLoc t ON l.Device_id = t.Device_id
JOIN #TempTotalSignals s ON l.Device_id = s.Device_id;
7) SELECT 
    e.EmpID,
    e.EmpName,
    e.Salary
FROM Employee e
JOIN (
    SELECT DeptID, AVG(Salary) AS AvgSal
    FROM Employee
    GROUP BY DeptID
) d ON e.DeptID = d.DeptID
WHERE e.Salary > d.AvgSal;
