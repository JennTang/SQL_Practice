/***********************************************************/
/*                                                         */
/* The following SQL Problems are from the book            */
/*     SQL Practice Problems by Sylvia Moestl Vasilik      */
/* The .sql file will contain Intermediate Problems        */
/*                                                         */
/***********************************************************/

/* Question 20: Calculate the total number of products in each category and sort results by the total number of products in descending order. Categories Table */

select 
	c.CategoryName,
	count(p.ProductName) as TotalProducts
from Categories c 
left join Products p 
on c.CategoryID = p.CategoryID 
group by c.CategoryName
order by TotalProducts desc;

/* Question 21: In the customers table show the total number of customers per Country and City */

select 
	Country,
	City,
	count(CustomerID) as TotalNumberCustomers 
from Customers 
group by Country, City
order by TotalNumberCustomers desc;

/* Question 22: Figure out what products in our inventory should be reordered by using the table products and the fields UnitsInStock and ReorderLevel where UnitsInStock is less than or equal to the ReorderLevel. Igonore the fields UnitsOnOrder and Discontinued */

select 
	ProductID,
	ProductName,
	UnitsInStock,
	ReorderLevel
from Products
where UnitsInStock <= ReorderLevel
order by ProductID

/* Question 23: Still using Products table use the fields UnitsInStock, ReorderLevel, UnitsOnOrder, Discontinued. Products that need reordering will have the following: UnitsInStock + UnitsOnOrder <= ReOrderLevel and the Discontinued flag is false (0) */

select
	ProductID,
	ProductName,
	UnitsInStock,
	UnitsOnOrder,
	ReorderLevel,
	Discontinued
from products
where (UnitsInStock + UnitsOnOrder) <= ReOrderLevel
and Discontinued = 0

/*Question 24: Create a list of customers sorted by region alphabetically. But when there is a customer on the list with no region but that customer at the end of the list. And within the same region companies should be sorted by CustomerID */

select  
	CustomerID,
	CompanyName,
	Region,
	(case when Region is null then 0 else 1 end) as Region2
from Customers
order by Region2 desc, Region asc, CompanyName asc

/* Question 25: Return the three ship countires with the higest average freight overall in descending order by average freight */

select top 3
	ShipCountry,
	avg(Freight) as AvgFreight
from Orders
group by ShipCountry
order by AvgFreight desc

/* Question 26: SImilar to question 2015 using the same data, but instead only take the orders from 2015 */

select top 3
	ShipCountry,
	avg(Freight) as AvgFreight
from Orders
where year(cast(OrderDate as date)) = '2015'
group by ShipCountry
Order by AvgFreight desc

/* Question 27: What is the OrderID of the Order that in the incorrect answer above is missing - Use given 'incorrect' query */

select 
	orderID
from Orders
where OrderDate between '20151231' and '20160101'

/* Question 28: Get the three ship countires with the higest average freight charges. Instead of filtering on a specific year we want to use the last 12 months of order data, using as the end date the last OrderDate in ORders */

Select 
	max(OrderDate) as MaxDate,
	dateadd(yy, -1, max(orderDate)) as MinDate
from orders 

select top 3
	ShipCountry,
	avg(Freight) as AvgFreight
from Orders
where OrderDate >= (select dateadd(yy, -1, (select max(orderDate) from Orders)))
group by ShipCountry 
order by AvgFreight desc

/*Question 29: Show Employee and Order Detail information for all orders. Sort by OrderID and ProductID */

select * from Employees;
Select * from OrderDetails;
select * from Products;
select * from ORders;

select 
	e.EmployeeID,
	e.LastName,
	d.OrderID,
	p.ProductName,
	d.Quantity
from Employees e

join Orders o 
on e.EmployeeID = o.EmployeeID

join OrderDetails d 
on o.OrderID = d.OrderID

join Products p
on d.ProductID = p.ProductID;

/*Question 30: Show customers who never actually placed an order */

select * from Customers
select * from Orders;

select 
	c.CustomerID as CustomerID,
	o.CustomerID as Order_CustomerID
from Customers c

left join Orders o
on c.CustomerID = o.CustomerID
where O.CustomerID is null

/* Question 31: Show only the customers who have never placed an order with Margaret Peacock, EmployeeID 4 */
