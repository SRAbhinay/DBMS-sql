-- 1. Add necessary constraints to the tables
-- (Primary key, NOT NULL, check (salary>50,000), foreign key)

-- Department Table
CREATE TABLE department (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

-- Employee Table
CREATE TABLE employee (
    emp_no INT PRIMARY KEY,
    emp_name VARCHAR(255) NOT NULL,
    DOB DATE,
    doj DATE,
    mobile_no VARCHAR(15),
    dept_no CHAR(4) REFERENCES department(dept_no),
    salary NUMERIC(9,2) CHECK (salary > 50000),
    designation VARCHAR(255)
);

-- 2. Modify the employee table by adding the designation attribute
ALTER TABLE employee
ADD COLUMN designation VARCHAR(255);

-- 3. Delete the address attribute from the employee table
ALTER TABLE employee
DROP COLUMN address;

-- 4. Add 5 rows in the employee and department tables

-- Department Table Data
INSERT INTO department (dept_no, dept_name, location)
VALUES
    ('d01', 'HR', 'New York'),
    ('d02', 'Finance', 'London'),
    ('d03', 'IT', 'San Francisco'),
    ('d04', 'Sales', 'Los Angeles'),
    ('d05', 'Marketing', 'Chicago');

-- Employee Table Data
INSERT INTO employee (emp_no, emp_name, DOB, doj, mobile_no, dept_no, salary, designation)
VALUES
    (1, 'John', '1980-01-15', '2010-05-20', '555-555-5555', 'd02', 60000, 'Manager'),
    (2, 'Jane', '1985-07-22', '2012-09-10', '555-555-5556', 'd01', 55000, 'Analyst'),
    (3, 'Bob', '1990-03-10', '2015-03-15', '555-555-5557', 'd03', 70000, 'Developer'),
    (4, 'Alice', '1988-12-05', '2018-07-01', '555-555-5558', 'd04', 62000, 'Salesperson'),
    (5, 'Eve', '1992-09-30', '2020-12-05', '555-555-5559', 'd05', 58000, 'Marketing Specialist');

-- 5. Display all the records from employee and department tables
SELECT * FROM department;
SELECT * FROM employee;

-- 6. Display the emp_no and emp_name of all the employees from department no 'd02'
SELECT emp_no, emp_name FROM employee WHERE dept_no = 'd02';

-- 7. Display the mobile number of 'John'
SELECT mobile_no FROM employee WHERE emp_name = 'John';

-- 8. Delete the employee record whose mobile_no = '555-555-5555'
DELETE FROM employee WHERE mobile_no = '555-555-5555';

-- 9. Update the salary with a 10% hike
UPDATE employee SET salary = salary * 1.10;

-- 10. Display the emp_no and name of all employees whose salary is between 60000 and 70000
SELECT emp_no, emp_name FROM employee WHERE salary BETWEEN 60000 AND 70000;

-- 11. Display emp_no, emp_name, designation, dept_no, and salary in descending order of salary
SELECT emp_no, emp_name, designation, dept_no, salary FROM employee ORDER BY salary DESC;

-- 12. Display emp_no, emp_name, designation, dept_no, and salary in ascending order of salary
SELECT emp_no, emp_name, designation, dept_no, salary FROM employee ORDER BY salary ASC;
