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

/*Question 26: 