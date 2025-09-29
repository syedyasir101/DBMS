-- DBMS TUTORIAL-3

-- STUDENT NAME: Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: A






create database SchoolDB;
use SchoolDB;


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Class VARCHAR(20),
    Marks INT,
    City VARCHAR(50)
);

INSERT INTO Student (StudentID, FirstName, LastName, DOB, Class, Marks, City) VALUES
(1, 'Rahul', 'J', '2006-01-15', '10A', 85, 'Bangalore'),
(2, 'Rohan', 'Sharma', '2006-02-20', '10B', 92, 'Hyderabad'),
(3, 'Ravi', 'Gowda', '2006-01-05', '9A', 76, 'Delhi'),
(4, 'Suhail', 'Khan', '2006-07-12', '10A', 64, 'Mumbai'),
(5, 'Aman', 'Syed', '2006-12-22', '9B', 58, 'Chennai');


CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Subject VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, HireDate, Salary) VALUES
(101, 'Sharanth', 'Shetty', 'DBMS', '2015-08-23', 80000),
(102, 'Manish', 'Kumar', 'CN', '2016-06-15', 75000),
(103, 'Manish', 'Rajan', 'Numerical Methods', '2017-09-10', 72000),
(104, 'Sasikala', 'J', 'Java', '2018-11-20', 85000);

------------------------------------------------------------

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

INSERT INTO Course (CourseID, CourseName, Credits) VALUES
(201, 'DBMS', 4),
(202, 'CN', 3),
(203, 'Numerical Methods', 2),
(204, 'Java', 5);



CREATE TABLE Enrollment (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Enrollment (EnrollID, StudentID, CourseID, Grade) VALUES
(301, 1, 201, 'A'),
(302, 1, 202, 'B'),
(303, 2, 201, 'A'),
(304, 3, 203, 'C'),
(305, 4, 204, 'B'),
(306, 5, 202, 'D');

SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Enrollment;

-- SQL queries:
-- 1. Display the details of all students
SELECT * FROM Student;

-- 2. Show the last 3 characters of course names
SELECT CourseName, RIGHT(CourseName, 3) AS Last3Chars
FROM Course;

-- 3. Concatenate FirstName and LastName of teachers as fullname
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Teacher;

-- 4. Find the length of each student’s name
SELECT FirstName, LastName, LENGTH(FirstName) + LENGTH(LastName) AS NameLength
FROM Student;

-- 5. Replace the word "Numerical Methods" with "Mathematics" in the Course table
SELECT REPLACE(Subject, 'Numerical Methods', 'Mathematics') AS UpdatedSubject
FROM Teacher;

-- 6. Find the absolute difference between maximum and minimum marks
SELECT ABS(MAX(Marks) - MIN(Marks)) AS MarksDifference
FROM Student;

-- 7. Round off teachers’ salaries to the nearest thousand
SELECT FirstName, LastName, ROUND(Salary, -3) AS RoundedSalary
FROM Teacher;

-- 8. Show the square root of each course credit
SELECT CourseName, SQRT(Credits) AS CreditSquareRoot
FROM Course;

-- 9. Display students’ marks along with ceiling and floor values
SELECT FirstName, Marks,
       CEIL(Marks) AS CeilingMarks,
       FLOOR(Marks) AS FloorMarks
FROM Student;

-- 10. Find the modulus of total marks divided by 5
SELECT SUM(Marks) % 5 AS MarksModulus
FROM Student;

-- 11. Display the current date and time
SELECT NOW() AS CurrentDateTime;

-- 12. Show the year and month of hire for all teachers
SELECT FirstName, LastName,
       YEAR(HireDate) AS HireYear,
       MONTH(HireDate) AS HireMonth
FROM Teacher;

-- 13. List students who were born in January
SELECT * FROM Student
WHERE MONTH(DOB) = 1;

-- 14. Find the difference in days between today and a teacher’s HireDate
SELECT FirstName, LastName,
       DATEDIFF(CURDATE(), HireDate) AS DaysWorked
FROM Teacher;

-- 15. Find the total number of students in the school
SELECT COUNT(*) AS TotalStudents
FROM Student;

-- 16. Calculate the average salary of teachers
SELECT AVG(Salary) AS AverageSalary
FROM Teacher;

-- 17. Find the highest and lowest marks in the Student table
SELECT MAX(Marks) AS HighestMarks,
       MIN(Marks) AS LowestMarks
FROM Student;





