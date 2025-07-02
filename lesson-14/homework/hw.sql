1) SELECT 
  LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
  LTRIM(RIGHT(Name, LEN(Name) - CHARINDEX(',', Name))) AS Surname
FROM TestMultipleColumns;
2) SELECT * 
FROM TestPercent 
WHERE [String] LIKE '%[%]%';
3) SELECT 
  value AS SplitPart
FROM Splitter
CROSS APPLY STRING_SPLIT(FullText, '.');
4) SELECT 
  TRANSLATE('1234ABC123456XYZ1234567890ADS', '0123456789', 'XXXXXXXXXX') AS Masked;
5) SELECT * 
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;
6) SELECT 
  LEN(MyString) - LEN(REPLACE(MyString, ' ', '')) AS SpaceCount
FROM CountSpaces;
7) SELECT e.Name AS Employee
FROM Employee e
JOIN Employee m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;
8) SELECT 
  EmployeeID, FirstName, LastName, HireDate,
  DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 10 AND 14;
Medium Tasks
1) SELECT 
  Vals,
  LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'a') - 1) AS Digits,
  SUBSTRING(Vals, PATINDEX('%[^0-9]%', Vals + 'a'), LEN(Vals)) AS Letters
FROM YourTable;
2) SELECT w1.Id
FROM weather w1
JOIN weather w2 ON DATEDIFF(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;
3) SELECT 
  PlayerID, 
  MIN(EventDate) AS FirstLogin
FROM Activity
GROUP BY PlayerID;
4) SELECT value AS ThirdFruit
FROM (
  SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
  FROM STRING_SPLIT('apple,banana,orange,grape', ',')
) t
WHERE rn = 3;
5) WITH chars AS (
  SELECT 
    SUBSTRING('sdgfhsdgfhs@121313131', number, 1) AS Char
  FROM master.dbo.spt_values
  WHERE number BETWEEN 1 AND LEN('sdgfhsdgfhs@121313131') AND type = 'P'
)
SELECT Char FROM chars;
6) SELECT 
  p1.id,
  CASE WHEN p1.code = 0 THEN p2.code ELSE p1.code END AS code
FROM p1
JOIN p2 ON p1.id = p2.id;
7) SELECT 
  EmployeeID, HIRE_DATE,
  DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YearsOfService,
  CASE 
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 6 AND 10 THEN 'Mid-Level'
    WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 11 AND 20 THEN 'Senior'
    ELSE 'Veteran'
  END AS EmploymentStage
FROM Employees;
8) SELECT 
  Vals,
  LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'x') - 1) AS LeadingInteger
FROM GetIntegers;
