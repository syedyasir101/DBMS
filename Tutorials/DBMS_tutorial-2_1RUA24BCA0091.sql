-- STUDENT NAME: Syed Yasir
-- USN: 1RUA24BCA0091
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

/*root@localhost	syed yasir	9.4.0	2025-09-03 23:18:20*/

-- -----------------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE STUDENTMARKS;
use STUDENTMARKS;

CREATE TABLE StudentMarks (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    M1 INT,
    M2 INT,
    M3 INT,
    Total INT,
    Average DECIMAL(5,2),
    Result VARCHAR(10)
);

desc StudentMarks;

/*'StudentID', 'int', 'NO', 'PRI', NULL, ''
'Name', 'varchar(100)', 'YES', '', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
'M1', 'int', 'YES', '', NULL, ''
'M2', 'int', 'YES', '', NULL, ''
'M3', 'int', 'YES', '', NULL, ''
'Total', 'int', 'YES', '', NULL, ''
'Average', 'decimal(5,2)', 'YES', '', NULL, ''
'Result', 'varchar(10)', 'YES', '', NULL, ''*/

INSERT INTO StudentMarks VALUES (1, 'Aarav', 15, 78, 85, 90, NULL, NULL, NULL);
INSERT INTO StudentMarks VALUES (2, 'Diya', 16, 65, 70, 60, NULL, NULL, NULL);
INSERT INTO StudentMarks VALUES (3, 'Kabir', 15, 45, 50, 40, NULL, NULL, NULL);
INSERT INTO StudentMarks VALUES (4, 'Meera', 16, 90, 95, 88, NULL, NULL, NULL);
INSERT INTO StudentMarks VALUES (5, 'Rohan', 15, 55, 60, 58, NULL, NULL, NULL);

UPDATE StudentMarks
SET
    Total = M1 + M2 + M3,
    Average = (M1 + M2 + M3) / 3.0;
    
    ALTER TABLE StudentMarks 
MODIFY Average DECIMAL(5,2);



UPDATE StudentMarks
SET Result = CASE
    WHEN M1 >= 40 AND M2 >= 40 AND M3 >= 40 THEN 'Pass'
    ELSE 'Fail'
END;

SELECT * FROM StudentMarks;

/*'1', 'Aarav', '15', '78', '85', '90', '253', '84.33', 'Pass'
'2', 'Diya', '16', '65', '70', '60', '195', '65.00', 'Pass'
'3', 'Kabir', '15', '45', '50', '40', '135', '45.00', 'Pass'
'4', 'Meera', '16', '90', '95', '88', '273', '91.00', 'Pass'
'5', 'Rohan', '15', '55', '60', '58', '173', '57.67', 'Pass'*/

