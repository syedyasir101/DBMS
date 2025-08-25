-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
/*root@localhost	RVU-PC-017	8.4.6	2025-08-25 12:01:17*/

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
CREATE DATABASE CollegeManagement;
USE CollegeManagement;


-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    HOD VARCHAR(50),
    ContactEmail VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Location VARCHAR(50)
);
DESC Departments;


CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT,
    DepartmentID INT,
    Duration INT,
    Fee DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
DESC Course


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DateOfBirth DATE,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
DESC Students;

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,
    Qualification VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
DESC Faculty;


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester INT,
    Year INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
DESC Enrollments;



-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*DepartmentID	int	NO	PRI		
DepartmentName	varchar(50)	YES			
HOD	varchar(50)	YES			
ContactEmail	varchar(100)	YES			
PhoneNumber	varchar(15)	YES			
Location	varchar(50)	YES			*/

/*CourseID	int	NO	PRI		
CourseName	varchar(50)	YES			
Credits	int	YES			
DepartmentID	int	YES	MUL		
Duration	int	YES			
Fee	decimal(10,2)	YES			*/

/*StudentID	int	NO	PRI		
FirstName	varchar(50)	YES			
LastName	varchar(50)	YES			
Email	varchar(100)	YES			
DateOfBirth	date	YES			
CourseID	int	YES	MUL		*/

/*FacultyID	int	NO	PRI		
FacultyName	varchar(50)	YES			
DepartmentID	int	YES	MUL		
Qualification	varchar(50)	YES			
Email	varchar(100)	YES			
PhoneNumber	varchar(15)	YES			*/

/*FacultyID	int	NO	PRI		
FacultyName	varchar(50)	YES			
DepartmentID	int	YES	MUL		
Qualification	varchar(50)	YES			
Email	varchar(100)	YES			
PhoneNumber	varchar(15)	YES			*/


--  describe the structure of each table and copy paste the Output 
DESCRIBE Departments;
DESCRIBE Course;
DESCRIBE Students;
DESCRIBE Faculty;
DESCRIBE Enrollments;

-- output:
/*EnrollmentID	int	NO	PRI		
StudentID	int	YES	MUL		
CourseID	int	YES	MUL		
Semester	int	YES			
Year	int	YES			
Grade	char(2)	YES			*/


-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
ALTER TABLE Departments ADD EstablishedYear INT, ADD Website VARCHAR(100);
ALTER TABLE Course ADD CourseType VARCHAR(50), ADD Language VARCHAR(30);
ALTER TABLE Students ADD Address VARCHAR(100), ADD Gender CHAR(1);
ALTER TABLE Faculty ADD JoiningDate DATE, ADD OfficeLocation VARCHAR(50);
ALTER TABLE Enrollments ADD AttendancePercentage DECIMAL(5,2), ADD Remarks TEXT;

-- 02: Modify the existing column from each table
ALTER TABLE Departments MODIFY Location VARCHAR(80);
ALTER TABLE Course MODIFY CourseName VARCHAR(100);
ALTER TABLE Students MODIFY FirstName VARCHAR(80);
ALTER TABLE Faculty MODIFY FacultyName VARCHAR(80);
ALTER TABLE Enrollments MODIFY Grade VARCHAR(5);

-- 03 change the datatypes
ALTER TABLE Departments MODIFY ContactEmail TEXT;
ALTER TABLE Course MODIFY Credits DECIMAL(4,2);
ALTER TABLE Students MODIFY DateOfBirth DATETIME;
ALTER TABLE Faculty MODIFY Email TEXT;
ALTER TABLE Enrollments MODIFY Semester VARCHAR(10);

-- 04: Rename a column
ALTER TABLE Faculty CHANGE Qualification Degree VARCHAR(50);

-- 05: Drop a column
ALTER TABLE Departments DROP COLUMN PhoneNumber;
ALTER TABLE Course DROP COLUMN Duration;
ALTER TABLE Students DROP COLUMN Email;
ALTER TABLE Faculty DROP COLUMN PhoneNumber;
ALTER TABLE Enrollments DROP COLUMN Remarks;

-- 06: Rename the table
RENAME TABLE Faculty TO Teachers;

-- 07: describe the structure of the new table
DESC Teachers;

-- output:
/*FacultyID	int	NO	PRI		
FacultyName	varchar(80)	YES			
DepartmentID	int	YES	MUL		
Degree	varchar(50)	YES			
Email	text	YES			
JoiningDate	date	YES			
OfficeLocation	varchar(50)	YES			*/

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
-- COmpleted 

--2 Add a column Gender (CHAR(1)) to the Students table.
-- Completed

--3 Add a column JoiningDate (DATE) to the Faculty table.
-- Completed

--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
-- Completed

--5 Modify the column Location in the Departments table to VARCHAR(80).
-- Completed

--6 Rename the column Qualification in the Faculty table to Degree.
-- Completed 

--7 Rename the table Faculty to Teachers.
--Completed

--8 Drop the column PhoneNumber from the Departments table.


--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

-- 8
ALTER TABLE Departments DROP COLUMN PhoneNumber;

-- 9
ALTER TABLE Departments DROP COLUMN PhoneNumber;

-- 10
ALTER TABLE Course DROP COLUMN Duration;
DESC Course;

-- output:
/*CourseID	int	NO	PRI		
CourseName	varchar(100)	YES			
Credits	decimal(4,2)	YES			
DepartmentID	int	YES	MUL		
Fee	decimal(10,2)	YES			
CourseType	varchar(50)	YES			
Language	varchar(30)	YES		*/	





SHOW TABLES; -- Before dropping the table
-- OUTPUT:
/*course
departments
enrollments
students
teachers*/



-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
DROP TABLE Course;
DROP TABLE Enrollments;

SHOW TABLES; -- After dropping the table Enrollement and Course
-- OUTPUT:
/*course
departments
students
teachers*/

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01