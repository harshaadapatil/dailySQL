use college;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    age INT,
    signup_date DATE
);

INSERT INTO customers ( customer_id , name, email ,city ,age ,signup_date )  VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'Mumbai', 25, '2023-01-10'),
(2, 'Neha Verma', 'neha@gmail.com', 'Pune', 30, '2023-02-15'),
(3, 'Raj Patel', 'raj@gmail.com', 'Delhi', 22, '2023-03-20'),
(4, 'Simran Kaur', 'simran@gmail.com', 'Chandigarh', 27, '2023-04-05'),
(5, 'Karan Mehta', 'karan@gmail.com', 'Mumbai', 35, '2023-05-12'),
(6, 'Priya Singh', 'priya@gmail.com', 'Pune', 28, '2023-06-18'),
(7, 'Arjun Reddy', 'arjun@gmail.com', 'Hyderabad', 26, '2023-07-22'),
(8, 'Sneha Joshi', 'sneha@gmail.com', 'Mumbai', 24, '2023-08-30');

select*from customers;

select customer_id, name, email from customers;
select* from customers where age > 25;
select *from customers where customer_id= 1 ;
SELECT * FROM customers WHERE customer_id BETWEEN 2 AND 6;
SELECT*FROM customers WHERE signup_date > 2023-02-15;

SELECT*FROM customers WHERE name LIKE 'A%';

UPDATE customers SET name = 'payal rajput', age = 32 WHERE customer_id = 2;
UPDATE customers SET email = 'payal@gmail.com' WHERE customer_id = 2;
select*from customers;
select DISTINCT city from customers;
SELECT*FROM customers where city='Mumbai';
SELECT*FROM customers WHERE city NOT IN ('delhi' ,'Mumbai');
SELECT*FROM customers WHERE age BETWEEN 25 AND 35;
SELECT*FROM customers where age<25;
SELECT*FROM customers WHERE city IN ('pune', 'Mumbai');

SELECT COUNT(*) FROM customers;
SELECT DISTINCT COUNT(city) FROM customers;
SELECT MAX(age) FROM customers;

SELECT*FROM customers 
ORDER BY CITY ASC;

SELECT*FROM customers
ORDER BY age ASC;

SELECT*FROM customers
ORDER BY age DESC;

SELECT*FROM customers
ORDER BY age DESC
LIMIT 3;

SELECT*FROM customers 
ORDER BY age ASC
LIMIT 2;

-- skip first 3 customers and show next 4 
SELECT*FROM customers
ORDER BY age 
LIMIT 4 OFFSET 3 ;

-- Converts all names to uppercase
SELECT UPPER(name) FROM CUSTOMERS;

-- Converts all names to lowercase
SELECT LOWER(name) FROM customers;

-- Shows name and number of characters in each name
SELECT name , LENGTH (name) FROM customers;

-- Combines name and city into one column
SELECT CONCAT (name, ' - ', city) FROM customers;

-- Shows names ending with 'a'
SELECT * FROM customers
WHERE name LIKE '%a';

-- Shows names containing 'ra' anywhere
SELECT * FROM customers
WHERE name LIKE '%ra%';

-- Counts number of customers in each city
SELECT city, COUNT(*) 
FROM customers
GROUP BY city;

-- Calculates average age for each city
SELECT city, AVG(age)
FROM customers
GROUP BY city;

-- Finds maximum age in each city
SELECT city, MAX(age)
FROM customers
GROUP BY city;

-- Shows cities having more than 2 customers
SELECT city, COUNT(*)
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;

-- Shows cities where average age is greater than 28
SELECT city, AVG(age)
FROM customers
GROUP BY city
HAVING AVG(age) > 28;

-- Finds second highest unique age
SELECT DISTINCT age
FROM customers
ORDER BY age DESC
LIMIT 1 OFFSET 1;

-- Shows customers whose age is above average age
SELECT * FROM customers
WHERE age > (SELECT AVG(age) FROM customers);

-- Finds minimum age in each city
SELECT city, MIN(age)
FROM customers
GROUP BY city;

-- Shows cities having more than 1 customer
SELECT city, COUNT(*)
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

-- Shows customers whose name length is more than 5 characters
SELECT * FROM customers
WHERE LENGTH(name) > 5;
