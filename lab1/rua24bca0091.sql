-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database BCA24LAB0091;
use BCA24LAB0091;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
create table student(
studentid int primary key,
Firstname varchar(20), 
Lastname varchar(20),
email varchar(20),
dob date);

DESC student; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'studentid', 'int', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(20)', 'YES', '', NULL, ''
'lastname', 'varchar(20)', 'YES', '', NULL, ''
'email', 'varchar(20)', 'YES', '', NULL, ''
'dob', 'date', 'YES', '', NULL, ''*/


-- Alter the table and 2 new columns
ALTER TABLE student ADD (gender varchar(2),age int);
DESC student;

-- Modify a column data type
ALTER TABLE student MODIFY Lastname varchar(15);
DESC student;

-- Rename the column
ALTER TABLE student RENAME COLUMN dob TO DateOfBirth;

DESC student;


-- Drop a column
ALTER TABLE student DROP COLUMN age;
DESC student;

-- Rename the table
RENAME TABLE student to Students;
DESC Students;



-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table Courses(
CourseID int Primary Key,
CourseName varchar(20),
Credits int);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

/* OUTPUT :
'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''*/


-- Alter the table and 2 new columns
ALTER TABLE courses ADD (arts varchar(2),science varchar(2));
DESC courses;

-- Modify a column data type    
ALTER TABLE courses MODIFY credits varchar(20);
DESC courses;

-- Rename a column 
ALTER TABLE Courses RENAME COLUMN CourseName TO Course;
DESC Courses;
show tables;

-- Drop a column
ALTER TABLE courses DROP COLUMN science;
DESC courses;

-- Rename the table
RENAME TABLE Courses TO CourseDetails;
DESC CourseDetails;

/*'CourseID', 'int', 'NO', 'PRI', NULL, ''
'Course', 'varchar(20)', 'YES', '', NULL, ''
'arts', 'varchar(2)', 'YES', '', NULL, ''
'science', 'varchar(2)', 'YES', '', NULL, ''*/


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES CourseDetails(CourseID)
);

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/*'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''*/



-- Alter the table and 2 new columns
ALTER TABLE Enrollments ADD (
    Semester VARCHAR(10),
    Grade CHAR(2)
);
DESC Enrollments;
-- Modify a column data type
ALTER TABLE Enrollments MODIFY Grade VARCHAR(5);
DESC Enrollments;
-- Rename a column
ALTER TABLE Enrollments RENAME COLUMN EnrollmentDate TO DateOfEnrollment;
DESC Enrollments;

-- Drop a column
ALTER TABLE Enrollments DROP COLUMN Semester;
DESC Enrollments;

-- Rename the table
RENAME TABLE Enrollments TO StudentCourseMap;
DESC StudentCourseMap; 

/*'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'DateOfEnrollment', 'date', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, ''*/



-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
ALTER TABLE Students ADD PhoneNumber VARCHAR(15);
DESC Students;

DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
/*'studentid', 'int', 'NO', 'PRI', NULL, ''
'Firstname', 'varchar(20)', 'YES', '', NULL, ''
'Lastname', 'varchar(15)', 'YES', '', NULL, ''
'email', 'varchar(20)', 'YES', '', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'gender', 'varchar(2)', 'YES', '', NULL, ''
'PhoneNumber', 'varchar(15)', 'YES', '', NULL, ''*/


-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
-- Task 5: Modify the Courses Table
ALTER TABLE CourseDetails ADD Credits2 DECIMAL(5,2);
DESC CourseDetails;

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table
SHOW TABLES;

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
DROP TABLE StudentCourseMap;
DROP TABLE CourseDetails;

SHOW TABLES; -- After dropping the table Enrollement and Course
SHOW TABLES;
