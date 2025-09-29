-- -------------------------------------------------------------------------
-- STUDENT NAME: Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: A
-- -------------------------------------------------------------------------

-- System Info
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- -------------------------------------------------------------------------
-- STEP 1: Create Tables
-- -------------------------------------------------------------------------

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert 5 Customers
INSERT INTO Customers VALUES
(1, 'Ravi Kumar', 'Bangalore'),
(2, 'Anita Sharma', 'Mumbai'),
(3, 'John Doe', 'Bangalore'),
(4, 'Priya Singh', 'Delhi'),
(5, 'Arun Mehta', 'Chennai');

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert 5 Orders
INSERT INTO Orders VALUES
(101, 1, 'Laptop', '2025-09-01'),
(102, 3, 'Mobile Phone', '2025-09-05'),
(103, 2, 'Headphones', '2025-09-10'),
(104, 1, 'Keyboard', '2025-09-12'),
(105, 4, 'Monitor', '2025-09-15');

-- -------------------------------------------------------------------------
-- 1. INNER JOIN Queries
-- -------------------------------------------------------------------------

-- Find all orders placed by customers from the city "Bangalore"
SELECT c.customer_name, o.product_name, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';

-- List all customers with the products they ordered
SELECT c.customer_name, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- Show customer names and their order dates
SELECT c.customer_name, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- Display order IDs with the corresponding customer names
SELECT o.order_id, c.customer_name
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- Find the number of orders placed by each customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Show city names along with the products ordered by customers
SELECT c.city, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- -------------------------------------------------------------------------
-- 2. LEFT OUTER JOIN Queries
-- -------------------------------------------------------------------------

-- Find all customers and their orders, even if a customer has no orders
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- List all customers and the products they ordered
SELECT c.customer_id, c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- Show customer IDs, names, and their order IDs
SELECT c.customer_id, c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- Find the total number of orders (if any) placed by each customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Retrieve customers who have not placed any orders
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Display customer names with their order dates
SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- -------------------------------------------------------------------------
-- 3. RIGHT OUTER JOIN Queries
-- -------------------------------------------------------------------------

-- Find all orders and their corresponding customers
SELECT o.order_id, c.customer_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- Show all orders with the customer names
SELECT o.order_id, o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- Display product names with the customers who ordered them
SELECT o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- List order IDs with customer cities
SELECT o.order_id, c.city
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- Find the number of orders per customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Retrieve customers who do not have any matching orders
SELECT c.customer_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- -------------------------------------------------------------------------
-- 4. FULL OUTER JOIN Queries
-- -------------------------------------------------------------------------
-- NOTE: MySQL does not support FULL OUTER JOIN directly.
-- We simulate it using UNION of LEFT JOIN and RIGHT JOIN.

-- Find all customers and their orders
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- Show customer IDs with order IDs
SELECT c.customer_id, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- Display customer names with order dates
SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_date
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- Find unmatched records (customers without orders and orders without customers)
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
UNION
SELECT c.customer_name, o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- Show customer cities with products
SELECT c.city, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.city, o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- -------------------------------------------------------------------------
-- 5. NATURAL JOIN Queries
-- -------------------------------------------------------------------------
-- (Works because both tables have "customer_id")

-- Find all orders placed by customers
SELECT * FROM Customers NATURAL JOIN Orders;

-- List all customers with the products they ordered
SELECT customer_name, product_name
FROM Customers NATURAL JOIN Orders;

-- Show customer names with their order dates
SELECT customer_name, order_date
FROM Customers NATURAL JOIN Orders;

-- Find all customer cities and the products ordered
SELECT city, product_name
FROM Customers NATURAL JOIN Orders;

-- -------------------------------------------------------------------------
-- END OF EXPERIMENT
-- -------------------------------------------------------------------------
