/***********************************************************/
/*                                                         */
/* The following SQL Problems are from the book            */
/*     SQL Practice Problems by Sylvia Moestl Vasilik      */
/* The .sql file will contain Introductory Problems        */
/*                                                         */
/***********************************************************/

/* Question 1: Return all fields from the Shipper Table */

select * from Shippers

/* Question 2: Return CategoryName and Description fields from Categories table */

select 
	CategoryName,
	Description
from categories 

/*Question 3: Select FirstName, LastName, and HireDate of all employees with the title of SalesRepresentative. Only Return those employee information */

select 
	FirstName,
	LastName,
	HireDate
from Employees
where title ='Sales Representative'

/*Question 4: Seeing the same columns as question 3, but this time only for employees that have the title of Sales Represntative and are also in the United States */

select
	FirstName,
	LastName,
	--Country,
	HireDate
from Employees
where title ='Sales Representative' and Country = 'USA'

/*Question 5: Show all orderes placed by specific employee. The EmployeeID for this Employee - Steven Buchanan is 5*/

select 
	*
from Orders 
where EmployeeID = 5

/*Question 6: Suppliers table show the SupplierID, ContactName, and ContactTitle for the Suppliers whose ContactTitle is NOT marketing Manager */

select
	SupplierID,
	ContactName,
	ContactTitle
from Suppliers 
where ContactTitle != 'Marketing Manager'

/*Question 7: In the products table select ProductID and ProductName for those products where the ProductName includes the string "queso"*/

select
	ProductID,
	ProductName
from Products
where ProductName like '%queso%'

/*Question 8: Using Orders table write a query that shows the OrderID, CustomerID and ShipCountry for all orders where teh ShipCountry is either France or Belguimm */

select 
	OrderID,
	CustomerID,
	ShipCountry
from Orders 
where ShipCountry = 'France' or ShipCountry = 'Belgium'

/*Question 9: Using Orders Table write a query to return all orders from any Latin American Country. (Brazil, Maxico, Argentina, Venezuela) */

select 
	OrderID,
	CustomerID,
	ShipCountry
from Orders 
where ShipCountry in ('Brazil','Mexico','Argentina','Venezuela')

/*Question 10: For all Employees in the Employee table show the FirstName, LastName, Title and BirthDate. Order the results by Birthdate so we have the oldest employees first */

select
	FirstName,
	LastName,
	Title,
	BirthDate
from Employees
order by BirthDate Asc 


/*Question 11: Using same output of question 10, but instead of showing BirthDate as a timestamp show BirtDate as a Date Field only */

select 
	FirstName,
	LastName,
	TItle,
	cast(BirthDate as date) as BirthDate
from Employees 
order by BirthDate Asc

/*Question 12: Show FirstName and LastName from the Employees table and create a new Column called FullName showing FirstName and LastName joinined together in one column with a space in-between */

select 
	FirstName,
	LastName,
	(FirstName + ' ' + LastName) as FullName
from Employees 

/*Question 13: In the OrdersDetails table we have the fields UnitePrice and Quantity. Create a new field called TotalPrice that multiplies the 2 fields together. Show OrderId, ProductID, UnitPrice and Quantity and order by OrderID and Product ID */

select
	OrderID,
	ProductID,
	UnitPrice,
	Quantity,
	(UnitPrice * Quantity) as TotalPrice
from OrderDetails
order by OrderID, ProductID

/*Question 14: How many Customers are in the Customers Table? Show only one value and dont rely on getting the record count from the result sheet. */

select
	count(CustomerID) as TotalCustomers
from Customers 

/*Question 15: Show the date of the first oder ever made in the Orders Table */
select 
	min(OrderDate) as FirstOrder
from Orders

/*Question 16: Show a list of countries where Northwind Company has customers. */

select distinct
	Country 
from Customers 

	/*alternative way*/
	select 
		Country
	from Customers 
	group by Country

/*Question 17: List of all the different values in the Customers table for ContactTitles. Include a count for each CountactTItle. */

select 
	ContactTitle,
	Count(ContactTitle) as Count_Contact_Titles
from Customers
group by ContactTitle
order by Count_Contact_Titles desc

/*Question 18: Show for each product the associated Supplier. Show ProductID, ProductName, and the CompanyName of the Supplier. Sort by ProductID. Join Suppliers table to Products table by SupplierID. */

select 
	p.ProductID,
	p.ProductName,
	s.CompanyName as Supplier
from Products p 
left join Suppliers s
on p.SupplierID = s.SupplierID
order by ProductID

/*Question 19: Show a list of Orders made. Including the Shipper that was used. Show OrderID, OrderDate (date only), and CompanyName of Shipper. Srt by OrderID. Show only the rows where OrderID is less than 10270*/

select 
	o.OrderID,
	cast(o.OrderDate as date) as OrderDate,
	s.CompanyName as Shipper 
from Orders o
left join Shippers s
on o.ShipVia = s.ShipperID
where OrderID < 10270
