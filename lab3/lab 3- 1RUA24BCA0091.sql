-- STUDENT NAME: Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*'root@localhost', 'RVU-PC-017', '8.4.6', '2025-09-01 11:42:44'*/

CREATE DATABASE Library;
USE Library;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    published_year INT,
    available_copies INT,
    total_copies INT
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    membership_type VARCHAR(50),
    join_date DATE
);

-- Paste the Output below for the given command ( DESC TableName;) 
DESC Books;
DESC Members;

/*BOOKS TABLE;
'book_id', 'int', 'NO', 'PRI', NULL, ''
'title', 'varchar(190)', 'YES', '', NULL, ''
'author', 'varchar(99)', 'YES', '', NULL, ''
'published_year', 'int', 'YES', '', NULL, ''
'available_copies', 'int', 'YES', '', NULL, ''
'total_copies', 'int', 'YES', '', NULL, ''

MEMBERS TABLE;
'member_id', 'int', 'NO', 'PRI', NULL, ''
'name', 'varchar(99)', 'YES', '', NULL, ''
'membership_type', 'varchar(70)', 'YES', '', NULL, ''
'join_date', 'date', 'YES', '', NULL, ''*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
INSERT INTO Books (book_id,title, author, published_year, available_copies, total_copies)
VALUES(12,'The 48 Laws of Power', 'Robert Greene',1998,20000,120000),
(13,'The Courage to Be Disliked','Ichiro Kishimi, Fumitake Koga',2013,20000,100000),
(14,'The Mountain Is You','Brianna Wiest',2020,2000,90000),
(15,'The Psychology of Money','Morgan Housel',2020,2000,140000),
(16,'Ikigai','Héctor García, Francesc Miralles',2017,2000,120000);




-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
 SELECT * FROM Books;


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
 INSERT INTO members (member_id,name,membership_type,join_date)
 Values(78,'David Lee','platinum','2024-04-15'),
 (79,'Rahul','gold','2024-04-10'),
 (80,'kumar','gold','2024-04-19');

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

select * from members;
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.