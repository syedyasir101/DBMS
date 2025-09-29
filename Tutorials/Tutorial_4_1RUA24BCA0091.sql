SELECT 
    USER(),
    @@hostname AS Host_Name,
    VERSION() AS MySQL_Version,
    NOW() AS Current_Date_Time;
    
create database LibraryManagementSystem;
use LibraryManagementSystem;

create table Boooks (
Book_ID varchar(20) PRIMARY KEY,
Title varchar(20),
Author varchar(20),
Price decimal(8,2),
Publisheddate date
);

create table customers (
Customer_ID varchar(20) PRIMARY KEY,
Name varchar(20),
Email varchar(20),
Joindate date
);

create table Orders (
Order_ID varchar(20) PRIMARY KEY,
Customer_ID varchar(20),
Book_ID varchar(20),
Orderdate date,
Quantity decimal(8, 2),
FOREIGN KEY(Customer_ID) REFERENCES customers(Customer_ID),
FOREIGN KEY(Book_ID) REFERENCES Boooks(Book_ID)
);

INSERT INTO Boooks(Book_ID,Title,Author,Price,Publisheddate)
VALUES 
('B1', 'THE ART OF LAZINESS','Kuvempu', 340, '2020-09-21'),
('B2','THE DEEP WORK','Tagore' , 450, '2021-06-12'),
('B3','THE MAGIC MORNING', 'Reddy', 500, '2023-08-12'),
('B4','DO IT TODAY', 'Shivu', 400, '2021-09-10'),
('B5','THE DARKDESIRE', 'ShivuB', 490, '2024-01-01');

INSERT INTO customers(Customer_ID, Name, Email, Joindate)
VALUES 
('C1','Harsha Puranik', 'harsha79@gmail.com', '2020-08-21'),
('C2','Nithin Ravi', 'nithin@gmail.com', '2021-01-12'),
('C3', 'Charan M', 'charanM@gmail.com', '2023-12-12'),
('C4', 'Shivu', 'Shivu@gmail.com', '2021-10-10'),
('C5', 'Harshit', 'Harshit@gmail.com', '2022-02-11');

INSERT INTO Orders(Order_ID, Customer_ID,Book_ID, Orderdate, Quantity)
VALUES
('O1', 'C1', 'B1', '2020-09-25', 2),
('O2', 'C2', 'B3', '2021-07-15', 1),
('O3', 'C3', 'B2', '2023-12-20', 3),
('O4', 'C4', 'B5', '2022-03-11', 1),
('O5', 'C5', 'B4', '2021-11-01', 4);

UPDATE customers
SET 
	Name = UPPER(NAME),
    Email = UPPER(Email);
    
select * from customers;

-- Output:  'C1','HARSHA PURANIK','HARSHA79@GMAIL.COM','2020-08-21'
'C2','NITHIN RAVI','NITHIN@GMAIL.COM','2021-01-12'
'C3','CHARAN M','CHARANM@GMAIL.COM','2023-12-12'
'C4','SHIVU','SHIVU@GMAIL.COM','2021-10-10'
'C5','HARSHIT','HARSHIT@GMAIL.COM','2022-02-11'

UPDATE customers
SET 
	Name = LOWER(name),
    Email = lower(email);
    
select * from customers;

-- Output: 'C1','harsha puranik','harsha79@gmail.com','2020-08-21'
'C2','nithin ravi','nithin@gmail.com','2021-01-12'
'C3','charan m','charanm@gmail.com','2023-12-12'
'C4','shivu','shivu@gmail.com','2021-10-10'
'C5','harshit','harshit@gmail.com','2022-02-11'

--  2.Extract the first 3 letters of each book title.

SELECT Book_ID , Title , SUBSTRING(Title,1,3) AS FIRST3
FROM Boooks;

-- Output: 'B1','THE ART OF LAZINESS','THE'
'B2','THE DEEP WORK','THE'
'B3','THE MAGIC MORNING','THE'
'B4','DO IT TODAY','DO '
'B5','THE DARKDESIRE','THE'

-- 3.Display each customer’s email domain (after @).
SELECT Customer_ID,
       Name,
       Email,
       SUBSTRING_INDEX(Email, '@', -1) AS DOMAIN
FROM customers;

-- Before @
SELECT Customer_ID,
		Name,
        Email,
        SUBSTRING_INDEX(Email, '@' , 1) AS DOMAIN
FROM customers;

-- 4.Find the length of each book title.

SELECT Book_ID,Title, LENGTH(Title) AS LengthTitle
FROM Boooks;

-- 5.Replace the word "Book"  with "Text"  in titles (if present).
SELECT Book_ID,Title, REPLACE(Title, 'BOOK' , 'Text') AS UPDATE_TITLE
FROM Boooks;

-- 6.Concatenate Author name and Book title as a single string.
SELECT Book_ID,Title,Author, CONCAT(Title, '', Author) AS SINGLE_STRING
FROM Boooks;

-- 7.Show book titles where the author’s name contains ‘a’.
SELECT Book_ID,Title, Author FROM Boooks WHERE Author Like "%a%"; 

-- 8.Display the year in which each book was published.
SELECT Book_ID,Title,Author, YEAR(Publisheddate) AS Published_Year
FROM Boooks;

-- 9.Find the month name in which each customer joined.
SELECT Customer_ID, Name, Email, Joindate, MONTHNAME(Joindate) AS Join_Month
FROM customers;

-- 10.List customers who joined in 2021.
SELECT Customer_ID, Name, Email, Joindate FROM customers WHERE YEAR(Joindate) = 2021;

-- 11.Find the day name on which each order was placed.
SELECT Order_ID, Customer_ID, Book_ID, Orderdate, DAYNAME(Orderdate) AS Order_day
FROM Orders;

-- 12.Display the age of each book (in years since published).
SELECT Book_ID, Title,Author, Publisheddate ,TIMESTAMPDIFF(YEAR, Publisheddate, CURDATE()) AS Book_Age_Years
FROM Boooks;

-- 13. Find the number of days between today and each customer’s join date.
SELECT Customer_ID, Name, Email, Joindate, TIMESTAMPDIFF(DAY, Joindate, CURDATE()) AS Num_Days
FROM customers;

-- 14. Show all orders placed in the month of December (any year).
SELECT Order_ID, Customer_ID, Book_ID, Orderdate, Quantity FROM Orders WHERE Month(OrderDate) = 12;

-- 15. Find the total number of books available in the store.
SELECT COUNT(*)  AS Total_Books
FROM Boooks;

-- 16. Find the average price of books.
SELECT AVG(Price) AS AVG_PRICE
FROM Boooks;

-- 17. Find the maximum and minimum book price.
SELECT MAX(Price) AS MAX_Price, MIN(Price) AS MIN_PRICE
FROM Boooks;

-- 18.Count how many customers joined after 2020.
SELECT COUNT(*) FROM customers WHERE YEAR(Joindate) > 2020;

-- 19.Find the total number of books ordered (all orders combined).
SELECT SUM(Quantity) AS TotalBooksOrdered
FROM Orders;

-- 20. Show the total quantity of books ordered per customer.
SELECT Customer_ID,SUM(Quantity) AS TotalBooksOrdered
FROM Orders
GROUP BY  Customer_ID;

-- 21. Find the average order quantity per book.
SELECT Book_ID, AVG(Quantity) AS AvgQuantityBook
FROM Orders
GROUP BY Book_ID;

-- 22.Find the book with the highest total quantity ordered.
SELECT Book_ID, SUM(Quantity) AS TotalOrdered
FROM Orders
GROUP BY Book_ID
ORDER BY TotalOrdered DESC
LIMIT 1;



-- 23. Show the total revenue generated per book (Price × Quantity).
SELECT Boooks.Book_ID, SUM(Orders.Quantity * Boooks.Price) AS TotalRevenue
FROM Orders, Boooks
WHERE Orders.Book_ID = Boooks.Book_ID
GROUP BY Boooks.Book_ID;

-- 24.Find the total number of orders placed each year.
SELECT YEAR(Orderdate) AS Order_Year, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(Orderdate);



