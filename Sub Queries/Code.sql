-- 1. Display the names of the employees working with Abi’s department
SELECT emp_name
FROM employee
WHERE dept_no = (SELECT dept_no FROM employee WHERE emp_name = 'Abi');

-- 2. Display names of employees whose salary is greater than the employee emp_no=1234
SELECT emp_name
FROM employee
WHERE salary > (SELECT salary FROM employee WHERE emp_no = 1234);

-- 3. Display all the employees drawing more than or equal to the average salary of department number 5
SELECT emp_name, salary
FROM employee
WHERE salary >= (SELECT AVG(salary) FROM employee WHERE dept_no = 5);

-- 4. Display the name of the highest paid employee
SELECT emp_name
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- 5. Find the Name and Salary of people who draw in the range from Ram’s salary to Rs. John’s salary
SELECT emp_name, salary
FROM employee
WHERE salary BETWEEN 
    (SELECT salary FROM employee WHERE emp_name = 'Ram') 
    AND 
    (SELECT salary FROM employee WHERE emp_name = 'John');

-- 6. Update the salary by 0.25 times for all employees who work in the least paid employee’s department
UPDATE employee
SET salary = salary * 1.25
WHERE dept_no = (SELECT dept_no FROM employee WHERE salary = (SELECT MIN(salary) FROM employee));

-- 7. Display the department number in which employee who has the lowest salary
SELECT dept_no
FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee);

-- 8. Display the employee details of all employees who earn more than that of ‘Reena’ and are in the same department as ‘John’
SELECT e.emp_name, e.salary, e.dept_no
FROM employee e
INNER JOIN employee j ON e.dept_no = j.dept_no
WHERE e.salary > (SELECT salary FROM employee WHERE emp_name = 'Reena')
AND j.emp_name = 'John';

-- 9. Display the name of the employees whose salary is less than the average salary of department number 3
SELECT emp_name
FROM employee
WHERE salary < (SELECT AVG(salary) FROM employee WHERE dept_no = 3);

-- 10. Count the number of employees in the department where “John” works
SELECT COUNT(*)
FROM employee
WHERE dept_no = (SELECT dept_no FROM employee WHERE emp_name = 'John');