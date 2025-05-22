select*from Products
1) select Category, count(ProductName) as [Total Number of Products] from Products 
   group by Category;
2) select Category, avg(Price) as [Average Price of Products] from Products
   where Category = 'Electronics'
   group by Category;
3) select*from Customers
   where City like 'L%'; 
4) select*from Products
   where ProductName like '%er';
5) select*from Customers
   where Country like '%A';     
6) select*from Products
   select ProductName, max(Price) as [The Highest Price] from Products
   group by ProductName;
7) select*from Products
   select*, iif(StockQuantity<30, 'Low Stock', 'Sufficient') as Category from Products;
8) select*from Customers
   select Country, count(CustomerID) AS [Total Number of Customers] from Customers
   group by Country;
9) select*from Orders
   select Min(Quantity) as [Minimum Quantity Ordered], max(quantity) as [Maximum Quantity Ordered] from Orders;
10) select*from Orders
    select*from Invoices
    ?

11) select*from Products
    select*from Products_Discounted
	select ProductName from Products
	union all
	select ProductName from Products_Discounted;
12) select ProductName from Products
	union 
	select ProductName from Products_Discounted;
13) select*from Orders
    select year(OrderDate) as Year, avg(TotalAmount) as [Average Order Amount] from Orders
	Group by year(Orderdate);
14) select*from Products
    
	select ProductName,  
	case
	when Price<100 then 'Low' 
    when Price between 100 and 500 then 'Mid'
	when Price > 500 then 'High'
	end as PriceGroup
	from Products;
15) Select*from City_Population
    
	select*from
	(
	select Population, year from City_Population
	) as Source_Table
	pivot
	(
	sum(Population)
	for Year in ([2012], [2013])
	) as Population_Each_Year;
16) select*from Sales
    select productid, sum(Saleamount) as total_sale_amount from sales
	group by productid;
17) select Productname from Products
    where Productname like '%oo%'; 
18) select*from City_population
    
	select*from
	(
	select district_name, population from City_population
	) as Source_Table
	pivot
	(
	sum(population)
	for district_name in ([Chilonzor], [Yakkasaroy], [Bektemir])
	) as Population_Each_City;
19) select*from Invoices
    select TOP 3 CustomerID, TotalAmount as TotalSpent from Invoices
	order by TotalSpent desc
20) ?
21) ?
22) ?
