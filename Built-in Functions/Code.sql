-- 1. Calculate the square root of the salary of all employees.
SELECT EmpNo, Ename, Job, DOB, Salary, Gender, SQRT(Salary) AS SalarySquareRoot FROM Emp;

-- 2. Format the salary attribute.
SELECT EmpNo, Ename, Job, DOB, FORMAT(Salary, 2) AS FormattedSalary FROM Emp;

-- 3. Apply any other five numeric built-in functions to ‘salary’ attribute of the employee table.
SELECT 
    EmpNo,
    Ename,
    Job,
    DOB,
    Salary,
    Gender,
    ROUND(Salary) AS RoundedSalary,
    CEIL(Salary) AS CeilingSalary,
    FLOOR(Salary) AS FloorSalary,
    POWER(Salary, 2) AS SalarySquared,
    ABS(Salary) AS AbsoluteSalary
FROM Emp;

-- 4. Extract only the first 5 characters of the employee names.
SELECT EmpNo, LEFT(Ename, 5) AS First5Characters FROM Emp;

-- 5. Extract the second letter and third letter of the employee names.
SELECT EmpNo, MID(Ename, 2, 2) AS SecondAndThirdLetters FROM Emp;

-- 6. Apply any other five string built-in functions to the ‘name’ attribute of the employee table.
SELECT 
    EmpNo,
    Ename,
    Job,
    DOB,
    Salary,
    Gender,
    UPPER(Ename) AS UppercaseName,
    LOWER(Ename) AS LowercaseName,
    LENGTH(Ename) AS NameLength,
    CONCAT('Employee: ', Ename) AS ConcatenatedName,
    REPLACE(Ename, 'a', 'X') AS NameWithAReplaced
FROM Emp;

-- 7. Determine the max and min salary and rename the column as max_salary and min_salary.
SELECT MAX(Salary) AS max_salary, MIN(Salary) AS min_salary FROM Emp;

-- 8. Display the month name of the date “14-Apr-23” in full.
SELECT DATE_FORMAT('2023-04-14', '%M') AS FullMonthName;

-- 9. Display the DOB of all employees in the format “dd-mm-yy”.
SELECT EmpNo, DATE_FORMAT(DOB, '%d-%m-%y') AS FormattedDOB FROM Emp;

-- 10. Display the date two months after the DOB of employees.
SELECT EmpNo, DATE_ADD(DOB, INTERVAL 2 MONTH) AS TwoMonthsAfterDOB FROM Emp;

-- 11. Display the last date of the month in “05-Oct-22”.
SELECT LAST_DAY('2022-10-05') AS LastDateOfMonth;

-- 12. Display the rounded date in the year format, month format, day format.
SELECT 
    EmpNo,
    Ename,
    Job,
    DATE_FORMAT(DOB, '%Y') AS YearFormat,
    DATE_FORMAT(DOB, '%m') AS MonthFormat,
    DATE_FORMAT(DOB, '%d') AS DayFormat
FROM Emp;

-- 13. Display the date 60 days before the current date.
SELECT DATE_SUB(CURDATE(), INTERVAL 60 DAY) AS Date60DaysBeforeCurrent;

-- 14. Display the date 14 days after the current date.
SELECT DATE_ADD(CURDATE(), INTERVAL 14 DAY) AS Date14DaysAfterCurrent;

-- 15. Display the names and DOB of all employees who were born in August.
SELECT EmpNo, Ename, DOB FROM Emp WHERE MONTH(DOB) = 8;

-- 16. List out the employee names who will celebrate their birthdays during the current month.
SELECT EmpNo, Ename FROM Emp WHERE MONTH(DOB) = MONTH(CURDATE());

-- 17. List all female employees who were born in April.
SELECT EmpNo, Ename FROM Emp WHERE MONTH(DOB) = 4 AND Gender = 'Female';

-- 18. Fill all null values of the salary attribute with 10000.
UPDATE Emp SET Salary = 10000 WHERE Salary IS NULL;
