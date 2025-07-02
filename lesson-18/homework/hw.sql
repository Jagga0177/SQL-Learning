1) SELECT 
    s.ProductID,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.Quantity * p.Price) AS TotalRevenue
INTO #MonthlySales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE FORMAT(SaleDate, 'yyyy-MM') = FORMAT(GETDATE(), 'yyyy-MM')  -- Use '2025-04' for fixed test
GROUP BY s.ProductID;
2) CREATE OR ALTER VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(s.Quantity) AS TotalQuantitySold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;
3) CREATE OR ALTER FUNCTION fn_GetTotalRevenueForProduct (@ProductID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Revenue DECIMAL(18,2);

    SELECT @Revenue = SUM(s.Quantity * p.Price)
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    WHERE s.ProductID = @ProductID;

    RETURN ISNULL(@Revenue, 0);
END;
4) CREATE OR ALTER FUNCTION fn_GetSalesByCategory(@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantity,
        SUM(s.Quantity * p.Price) AS TotalRevenue
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName
);
5) CREATE OR ALTER FUNCTION dbo.fn_IsPrime (@Number INT)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @i INT = 2;
    IF @Number < 2 RETURN 'No';
    
    WHILE @i <= SQRT(@Number)
    BEGIN
        IF @Number % @i = 0 RETURN 'No';
        SET @i = @i + 1;
    END
    RETURN 'Yes';
END;
6) CREATE OR ALTER FUNCTION fn_GetNumbersBetween (@Start INT, @End INT)
RETURNS @Nums TABLE (Number INT)
AS
BEGIN
    DECLARE @i INT = @Start;

    WHILE @i <= @End
    BEGIN
        INSERT INTO @Nums VALUES (@i);
        SET @i = @i + 1;
    END

    RETURN;
END;
