-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
'root@localhost', 'RVU-PC-017', '8.4.6', '2025-09-08 11:29:20'
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create database employeemanagement;
use employeemanagement;

CREATE TABLE Employee (
	EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary VARCHAR(15),
    BirthDate DATE,
    HireDate DATE
    );
    desc Employee
    
-- 2. Insert 10 records to employee;
INSERT INTO Employee values
(1, 'Amit', 'Sharma', 55000, '1990-05-12', '2015-06-01'),
(2, 'Priya', 'Verma', 62000, '1988-11-23', '2016-03-15'),
(3, 'Rahul', 'Mehta', 47000, '1992-07-19', '2017-08-10'),
(4, 'Sneha', 'Verma', 51000, '1991-02-28', '2018-01-20'),
(5, 'Karan', 'Patel', 58000, '1989-09-05', '2014-11-30'),
(6, 'Neha', 'Singh', 60000, '1993-03-14', '2019-04-25'),
(7, 'Ravi', 'Kumar', 49000, '1990-12-01', '2020-07-18'),
(8, 'Divya', 'Joshi', 53000, '1994-06-22', '2021-05-05'),
(9, 'Ankit', 'Gupta', 61000, '1987-10-10', '2013-09-12'),
(10, 'Meena', 'Nair', 56000, '1995-01-17', '2022-02-14');


-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL VARCHAR(12),
    EmpID INT,
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
    );
    desc Orders
    
-- 4. Insert 10 records to Orders
INSERT INTO Orders values
(1, '2025-06-01', 1200.50, 1),
(2, '2025-06-05', 1500.00, 2),
(3, '2025-06-10', 980.75, 3),
(4, '2025-06-15', 1100.00, 4),
(5, '2025-06-20', 1350.25, 5),
(6, '2025-06-25', 1600.00, 6),
(7, '2025-06-30', 1250.60, 7),
(8, '2025-07-05', 1400.40, 8),
(9, '2025-07-10', 1700.00, 9),
(10, '2025-07-15', 1550.80, 10);



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
SELECT * FROM Employee;
SELECT * FROM Orders;

-- Output: 
/*
1	2025-06-01	1200.50	1
2	2025-06-05	1500.00	2
3	2025-06-10	980.75	3
4	2025-06-15	1100.00	4
5	2025-06-20	1350.25	5
6	2025-06-25	1600.00	6
7	2025-06-30	1250.60	7
8	2025-07-05	1400.40	8
9	2025-07-10	1700.00	9
10	2025-07-15	1550.80	10*/
			
			



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT FirstName, ROUND(Salary) AS RoundedSalary FROM Employee;

-- Output: 
/*
Amit	55001
Priya	62000
Rahul	47000
Sneha	51000
Karan	58001
Neha	60000
Ravi	49001
Divya	53000
Ankit	61001
Meena	56000*/

/* b. Absolute Values: Show absolute values of salaries */
SELECT FirstName, ABS(Salary) AS AbsoluteSalary FROM Employee;



-- Output: 
/*
Amit	55000.75
Priya	62000.5
Rahul	47000
Sneha	51000.25
Karan	58000.9
Neha	60000
Ravi	49000.6
Divya	53000.4
Ankit	61000.8
Meena	56000.3*/

/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT  CEIL(TotalAmount) AS CeilingAmount FROM Orders;


-- Output: 
/*
1	1201
2	1500
3	981
4	1100
5	1351
6	1600
7	1251
8	1401
9	1700
10	1551*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS TotalEmployees FROM Employee;


-- Output: 
/*10

/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(Salary) AS TotalSalaryExpense FROM Employee;

-- Output: 
/*552004.5


/* c. Average Order Amount: Find average order value */
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

-- Output: 
/*1363.330000


/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employee;

-- Output: 
/*62000.50	47000.00

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT UPPER(FirstName) AS UpperName, LOWER(LastName) AS LowerName FROM Employee;

-- Output: 
/*AMIT	sharma
PRIYA	verma
RAHUL	mehta
SNEHA	rao
KARAN	patel
NEHA	singh
RAVI	kumar
DIVYA	joshi
ANKIT	gupta
MEENA	nair*/

/* b. Concatenate Names: Create full names */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Employee;

-- Output: 
/*Amit Sharma
Priya Verma
Rahul Mehta
Sneha Rao
Karan Patel
Neha Singh
Ravi Kumar
Divya Joshi
Ankit Gupta
Meena Nair*/

/* c. Extract Substring: Get first 3 characters of first names */
SELECT SUBSTRING(FirstName, 1, 3) AS FirstThreeChars FROM Employee;


-- Output: 
/*Ami
Pri
Rah
Sne
Kar
Neh
Rav
Div
Ank
Mee*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert Date to String: Convert Date to text type */
SELECT cast(OrderDate AS CHAR) AS ConvertedData From Orders



-- Output: 
/*
2025-06-01
2025-06-05
2025-06-10
2025-06-15
2025-06-20
2025-06-25
2025-06-30
2025-07-05
2025-07-10
2025-07-15*/


-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW() AS CurrentTimestamp;



-- Output: 
/*2025-09-08 12:09:09

/* b. Extract Year: Get year from order dates */
SELECT OrderID, YEAR(OrderDate) AS OrderYear FROM Orders;


-- Output: 
/*
1	2025
2	2025
3	2025
4	2025
5	2025
6	2025
7	2025
8	2025
9	2025
10	2025*/

/* c. Add Months: Add 3 months to order dates */
SELECT OrderID, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS NewOrderDate FROM Orders;

-- Output: 
/*
1	2025-09-01
2	2025-09-05
3	2025-09-10
4	2025-09-15
5	2025-09-20
6	2025-09-25
7	2025-09-30
8	2025-10-05
9	2025-10-10
10	2025-10-15
*/

/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, DATEDIFF(NOW(), OrderDate) AS DaysSinceOrder FROM Orders;

-- Output: 
/*
1	99
2	95
3	90
4	85
5	80
6	75
7	70
8	65
9	60
10	55
*/

-- END of the Task -- 