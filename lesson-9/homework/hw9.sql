1) SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;
2) SELECT d.DepartmentName, e.EmployeeName
FROM Departments d
CROSS JOIN Employees e;
3) SELECT s.SupplierName, p.ProductName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;
4) SELECT c.CustomerName, o.OrderID
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;
5) SELECT s.StudentName, c.CourseName
FROM Students s
CROSS JOIN Courses c;
6) SELECT p.ProductName, o.OrderID
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;
7) SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;
8) SELECT s.StudentName, e.CourseID
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID;
9) SELECT o.OrderID, p.PaymentID
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID;
10) SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100;
11) SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID != d.DepartmentID;
12) SELECT o.OrderID, p.ProductName, o.Quantity, p.StockQuantity
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity;
13) SELECT c.CustomerName, s.ProductID
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE s.Amount >= 500;
14) SELECT s.StudentName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
15) SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';
16) SELECT o.OrderID, p.Amount AS PaidAmount, o.TotalAmount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;
17) SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;
18) SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');
19) SELECT s.SaleID, c.CustomerName
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';
20) SELECT o.OrderID, c.CustomerName, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100;
21) SELECT e1.EmployeeName AS Emp1, e2.EmployeeName AS Emp2
FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID != e2.EmployeeID
WHERE e1.DepartmentID != e2.DepartmentID;
22) SELECT p.PaymentID, p.Amount AS PaidAmount, o.Quantity, pr.Price, (o.Quantity * pr.Price) AS ExpectedAmount
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount != o.Quantity * pr.Price;
23) SELECT s.StudentName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IS NULL;
24) SELECT m.EmployeeName AS Manager, e.EmployeeName AS Subordinate
FROM Employees m
JOIN Employees e ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;
25) SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
