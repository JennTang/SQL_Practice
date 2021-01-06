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


