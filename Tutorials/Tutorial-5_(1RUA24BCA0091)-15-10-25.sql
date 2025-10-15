-- TUTORIAL-5
-- NAME: Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: A



CREATE DATABASE TechNova;
USE TechNova;

-- Department Table:
CREATE TABLE Department (
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(50),
	location VARCHAR(100)
);

-- Employee Table:
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    age INT,
    salary DECIMAL(10, 2),
    designation VARCHAR(50),
    address VARCHAR(100),
    doj DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insering values to department table:
INSERT INTO Department (dept_id, dept_name, location) VALUES
(101, 'Technology', 'Bengaluru'),
(102, 'Human Resources', 'Mumbai'),
(103, 'Sales', 'Delhi'),
(104, 'Marketing', 'Bengaluru');

-- Inserting values to Employee table:
INSERT INTO Employee (emp_id, emp_name, age, salary, designation, address, doj, dept_id) VALUES
(1, 'Rohan Sharma', 30, 80000.00, 'Developer', '123 Tech Park, Bengaluru', '2021-06-15', 101),
(2, 'Ananya Rao', 28, 65000.00, 'HR Executive', '456 HR Towers, Mumbai', '2022-08-20', 102),
(3, 'Vikram Singh', 35, 75000.00, 'Sales Manager', '789 Market St, Delhi', '2019-03-10', 103),
(4, 'Priya Das', 32, 85000.00, 'Developer', '321 Code Avenue, Bengaluru', '2020-11-05', 101),
(5, 'Suresh Kumar', 29, 45000.00, 'Marketing Specialist', '654 Brand Road, Bengaluru', '2023-01-30', 104);

-- Update:
UPDATE Employee
SET salary = salary + 5000
WHERE designation = 'Developer';


-- Select with aggergate functions:
SELECT
	d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG (e.salary) AS average_salary,
    MAX(e.salary) AS lowest_salary
FROM
	Employee e
JOIN
	Department d ON e.dept_id = d.dept_id
GROUP BY
	d.dept_name;
    

-- Select with String function:
Select
	UPPER(emp_name) AS employee_name_uppercase,
    UPPER(designation) AS designation_uppercase,
    CONCAT (emp_name, ' works as ', designation) AS job_description
FROM
	Employee;
 
 

-- Select with date functions:
SELECT
	emp_name,
    doj,
    EXTRACT(YEAR FROM doj) AS joining_year,
    TIMESTAMPDIFF(YEAR, doj, CURDATE()) AS years_worked
from
	Employee;
    


-- Select with operations:
SELECT
    emp_name,
    salary
FROM
    Employee
WHERE
    salary BETWEEN 40000 AND 80000
    AND dept_id != (SELECT dept_id FROM Department WHERE dept_name = 'Sales');
    


-- Inner join query:
SELECT
    e.emp_name,
    e.designation,
    d.dept_name,
    d.location
FROM
    Employee e
INNER JOIN
    Department d ON e.dept_id = d.dept_id;
    


-- Left outer join query:
SELECT
    e.emp_name,
    d.dept_name
FROM
    Employee e
LEFT OUTER JOIN
    Department d ON e.dept_id = d.dept_id;
    


-- Right outer join query:
SELECT
    e.emp_name,
    d.dept_name
FROM
    Employee e
RIGHT OUTER JOIN
    Department d ON e.dept_id = d.dept_id;
    


-- Stored procedure-insert:
DELIMITER //
CREATE PROCEDURE InsertEmployee(
    IN p_emp_id INT,
    IN p_emp_name VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10, 2),
    IN p_designation VARCHAR(50),
    IN p_address VARCHAR(100),
    IN p_doj DATE,
    IN p_dept_id INT
)
BEGIN
    INSERT INTO Employee (emp_id, emp_name, age, salary, designation, address, doj, dept_id)
    VALUES (p_emp_id, p_emp_name, p_age, p_salary, p_designation, p_address, p_doj, p_dept_id);
END //
DELIMITER ;

CALL InsertEmployee(6, 'Amit Patel', 25, 52000.00, 'QA Engineer', '987 Test Lane, Pune', '2023-05-12', 101);



-- Stored procedure-update:
DELIMITER //
CREATE PROCEDURE UpdateSalary(
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10, 2)
)
BEGIN
    UPDATE Employee
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;


CALL UpdateSalary(5, 48000.00);



-- Stored procedure-delete:
DELIMITER //
CREATE PROCEDURE DeleteEmployee(
    IN p_emp_id INT
)
BEGIN
    DELETE FROM Employee
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;

CALL DeleteEmployee(6);



-- comprehensive query:
SELECT
    e.emp_name AS "Employee Name",
    d.dept_name AS "Department Name",
    TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) AS "Years Worked",
    e.salary AS "Salary after increment"
FROM
    Employee e
JOIN
    Department d ON e.dept_id = d.dept_id
WHERE
    TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) > 2;


