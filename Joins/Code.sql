-- 1. Salesmen and customers in the same city
SELECT s.ENAME AS SalesmanName, c.CUST_NAME AS CustomerName, c.CITY
FROM salesman s
JOIN customer c ON s.CITY = c.CITY;

-- 2. Salesman not associated with any customer
SELECT s.ENAME AS SalesmanName
FROM salesman s
LEFT JOIN customer c ON s.SALESMAN_ID = c.SALES_ID
WHERE c.SALES_ID IS NULL;

-- 3. Orders between $700 and $2000 with customer info
SELECT o.ORDER_NO, o.PURCHASE_AMOUNT, c.CUST_NAME AS CustomerName, c.CITY
FROM orders o
JOIN customer c ON o.CUST_ID = c.CUST_ID
WHERE o.PURCHASE_AMOUNT BETWEEN 700 AND 2000;

-- 4. Salesman working for each customer
SELECT c.CUST_NAME AS CustomerName, s.ENAME AS SalesmanName
FROM customer c
LEFT JOIN salesman s ON c.SALES_ID = s.SALESMAN_ID;

-- 5. Customers with salesmen having >12% commission
SELECT c.CUST_NAME AS CustomerName
FROM customer c
JOIN salesman s ON c.SALES_ID = s.SALESMAN_ID
WHERE s.COMMISSION > 0.12;

-- 6. Customers with different city and >12% commission salesmen
SELECT c.CUST_NAME AS CustomerName
FROM customer c
JOIN salesman s ON c.SALES_ID = s.SALESMAN_ID
WHERE c.CITY <> s.CITY AND s.COMMISSION > 0.12;

-- 7. Order details with customer, salesman, and commission
SELECT o.ORDER_NO, o.ORDER_DATE, o.PURCHASE_AMOUNT, c.CUST_NAME AS CustomerName, s.ENAME AS SalesmanName, s.COMMISSION
FROM orders o
JOIN customer c ON o.CUST_ID = c.CUST_ID
JOIN salesman s ON c.SALES_ID = s.SALESMAN_ID;

-- 8. Join with unique columns from salesman, customer, and orders
SELECT s.SALESMAN_ID, s.ENAME, s.CITY, c.CUST_ID, c.CUST_NAME, c.CITY, o.ORDER_NO, o.ORDER_DATE, o.PURCHASE_AMOUNT
FROM salesman s
LEFT JOIN customer c ON s.SALESMAN_ID = c.SALES_ID
LEFT JOIN orders o ON c.CUST_ID = o.CUST_ID;

-- 9. Customers with grade < 250 working with or without a salesman
SELECT c.CUST_NAME AS CustomerName
FROM customer c
LEFT JOIN salesman s ON c.SALES_ID = s.SALESMAN_ID
WHERE c.GRADE < 250 OR s.SALESMAN_ID IS NULL;

-- 10. Salesmen working for one or more customers or not joined any
SELECT s.ENAME AS SalesmanName
FROM salesman s
LEFT JOIN customer c ON s.SALESMAN_ID = c.SALES_ID
GROUP BY s.SALESMAN_ID
HAVING COUNT(c.CUST_ID) > 0 OR COUNT(c.SALES_ID) IS NULL;

-- 11. Salesmen with customers and orders or none
SELECT s.ENAME AS SalesmanName
FROM salesman s
LEFT JOIN customer c ON s.SALESMAN_ID = c.SALES_ID
LEFT JOIN orders o ON c.CUST_ID = o.CUST_ID
GROUP BY s.SALESMAN_ID
HAVING COUNT(c.CUST_ID) > 0 OR COUNT(o.ORDER_NO) = 0;

-- 12. Cartesian product between salesman and customer
SELECT s.ENAME AS SalesmanName, c.CUST_NAME AS CustomerName
FROM salesman s
CROSS JOIN customer c;
