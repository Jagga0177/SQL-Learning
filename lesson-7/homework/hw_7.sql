select*from Products;
select*from Employees;
select*from Customers;
select*from Sales;

1) select min(Price) as Min_Price from Products;
2) select max(Salary) as Max_Salary from Employees;
3) select count(*) from Customers;
4) select count(distinct Category) from Products;
5) select sum(SaleAmount) from Sales
   where ProductID = 7;  
6) select avg(age) as Average_age from Employees;
7) select DepartmentName, count(EmployeeID) as Number_of_Employees from Employees
   group by DepartmentName; 
8) select Category, min(Price) as Min_Price, max(Price) as Max_Price from Products
   group by Category;
9) select CustomerID, sum(saleamount) AS Total_sales from Sales
   group by CustomerID;
10) select DepartmentName as Department, count(DepartmentName) as Number_of_Employees from Employees
    group by DepartmentName
	having count(DepartmentName)>5;
11) select ProductID, sum(SaleAmount) as Total_Sales_Amount, avg(SaleAmount) as Average_Sales_Amount from Sales
    group by ProductID;
12) select DepartmentName, count(DepartmentName) as Number_of_Employees from Employees
    group by DepartmentName
	having DepartmentName = 'HR';
13) select departmentname as Department, min(salary) as Min_Salary, max(salary) as Max_Salary from Employees
    group by departmentname;
14) select DepartmentName as Department, avg(salary) as Avg_Salary from Employees 
    group by DepartmentName;
15) select departmentname, avg(salary) as Avg_Salary, Count(*) as Count_Employees from Employees
    group by departmentname;
16) select Category, avg(price) as Avg_Price from Products
    group by Category
	having avg(price) > 400;
17) select SaleDate, sum(Saleamount) AS Sale_Amount from Sales
    group by Saledate;
18) select CustomerID, count(CustomerID) AS Orders from SALES
    GROUP BY CustomerID;
19) SELECT DEPARTMENTNAME AS DEPARTMENT, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES
    GROUP BY DEPARTMENTNAME
	HAVING AVG(SALARY) > 60000;
20) select Category, avg(Price) as Avg_Price from Products
    group by Category
	having avg(Price)>150;
21) select CustomerID, sum(SaleAmount) as Total_Sale_Amount from Sales
    group by CustomerID
	having sum(SaleAmount)> 1500;
22) select DepartmentName as Department, sum(salary) as Total_Salary, avg(salary) as Avg_Salary from Employees
    group by DepartmentName
	having avg(salary)>65000;
	select*from Employees;
23) select custid, sum(freight) as [Total amount] from sales.orders
    group by custid, freight
	having freight>50; 
24) select*from orders;
    select Month(OrderDate) as Month, Quantity as Products_Sold, sum(totalamount) as [Total Sales], count(distinct ProductID) as [Unique Products Sold] from orders
	group by Quantity, Month(OrderDate)
	having quantity>=2 
	order by Month;
25) select year(orderdate) as Year, min(quantity) as Min_Quantity, max(quantity) as Max_Quantity from orders
    group by year(orderdate)
	order by year;
