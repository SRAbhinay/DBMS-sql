-- 1. Create student table
CREATE TABLE student (
    SName VARCHAR(255),
    RegNo INT,
    Dept VARCHAR(255),
    MobileNo VARCHAR(15),
    M1 INT,
    M2 INT,
    M3 INT
);

-- 2. Display the structure of the student table
DESCRIBE student;

-- 3. Rename the Mobile attribute as MobileNo
ALTER TABLE student
CHANGE COLUMN MobileNo Mobile VARCHAR(15);

-- 4. Modify the table by removing Place attribute
ALTER TABLE student
DROP COLUMN Place;

-- 5. Insert 5 rows into student table
INSERT INTO student (SName, RegNo, Dept, Mobile, M1, M2, M3)
VALUES ('John', 101, 'Computer Science', '123-456-7890', 85, 90, 78),
       ('Alice', 102, 'Electrical Engineering', '987-654-3210', 76, 88, 92),
       ('Bob', 103, 'Mechanical Engineering', '555-555-5555', 68, 72, 81),
       ('Mary', 104, 'Physics', '777-123-4567', 92, 95, 88),
       ('Ram', 105, 'Chemistry', '333-888-2222', 72, 64, 78);

-- 6. Display the student table with all attributes
SELECT * FROM student;

-- 7. Display only student names
SELECT SName FROM student;

-- 8. Modify the table by adding Tot, Avg, and Status
ALTER TABLE student
ADD COLUMN Tot INT,
ADD COLUMN Avg DECIMAL(5, 2),
ADD COLUMN Status VARCHAR(15);

-- 9. Update the table by calculating Tot, Avg, and Status
UPDATE student
SET Tot = M1 + M2 + M3,
    Avg = (M1 + M2 + M3) / 3,
    Status = CASE
                WHEN (M1 + M2 + M3) / 3 >= 50 THEN 'Eligible'
                ELSE 'Not Eligible'
             END;

-- 10. Display the Regno, Sname, Tot, Avg, and Grade of the students
SELECT RegNo, SName, Tot, Avg,
    CASE
        WHEN Avg >= 50 THEN 'Pass'
        ELSE 'Fail'
    END AS Grade
FROM student;

-- 11. Display the students' details where Tot > 200
SELECT * FROM student
WHERE Tot > 200;

-- 12. Display the eligible students' details
SELECT * FROM student
WHERE Status = 'Eligible';

-- 13. Delete a row from student table where SName='Ram'
DELETE FROM student
WHERE SName = 'Ram';

-- 14. Create faculty table
CREATE TABLE faculty (
    Faculty_ID INT,
    Name VARCHAR(255),
    Salary DECIMAL(10, 2)
);

-- 15. Insert Any 2 rows into faculty table
INSERT INTO faculty (Faculty_ID, Name, Salary)
VALUES (121, 'Dr. Smith', 75000.00),
       (122, 'Prof. Johnson', 85000.00);

-- 16. Display the faculty table with all attributes
SELECT * FROM faculty;

-- 17. Display faculty table where Faculty_ID=121
SELECT * FROM faculty
WHERE Faculty_ID = 121;

-- 18. Display all available tables in your user login
SHOW TABLES;

-- 19. Delete all the values from faculty table
DELETE FROM faculty;

-- 20. Drop faculty table
DROP TABLE faculty;
