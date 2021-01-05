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

