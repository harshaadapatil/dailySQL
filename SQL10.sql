use college;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    product VARCHAR(50),
    order_date DATE,
    amount INT
);


INSERT INTO customers (id,name,age,city) VALUES
(1, 'Rohit', 25, 'Mumbai'),
(2, 'Priya', 30, 'Pune'),
(3, 'Karan', 28, 'Delhi'),
(4, 'Anjali', 22, 'Bangalore'),
(5, 'Vikas', 35, 'Hyderabad'),
(6, 'Meena', 27, 'Chennai');

INSERT INTO orders (order_id ,cust_id ,product ,order_date ,amount ) VALUES
(201, 1, 'Laptop', '2024-01-10', 60000),
(202, 2, 'Mobile', '2024-02-15', 25000),
(203, 1, 'Mouse', '2024-03-01', 1000),
(204, 4, 'Keyboard', '2024-03-10', 2000),
(205, 7, 'Monitor', '2024-04-05', 12000);

-- INNER JOIN
-- Get customer name and product they ordered
SELECT customers.name, orders.product
FROM customers 
INNER JOIN  orders 
ON customers.id = orders.cust_id;

-- Get name, product, and order date
SELECT customers.name, orders.product, orders.order_date
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id;

-- Get unique customers who placed orders
SELECT DISTINCT customers.name
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id;

-- Get customer name and order amount
SELECT customers.name, orders.amount
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id;

-- Get name, city, and product
SELECT customers.name, customers.city, orders.product
FROM customers 
INNER JOIN orders
ON customers.id = orders.cust_id;

-- Count total orders per customer
SELECT customers.name, COUNT(orders.order_id) AS total_orders
FROM customers 
INNER JOIN orders
ON customers.id = orders.cust_id
group by customers.name;

-- Total amount spent by each customer
SELECT customers.name, sum(orders.amount) AS total_amount
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
group by customers.name;

-- Average order amount per customer
SELECT customers.name , avg(orders.amount) AS total_amount
FROM customers
INNER JOIN orders 
ON customers.id = orders.cust_id
group by customers.name;

-- Maximum order amount per customer
SELECT customers.name , max(orders.amount) AS max_amount
FROM customers 
INNER JOIN orders
ON customers.id = orders.cust_id
group by customers.name;

-- Customers with more than 1 order
SELECT customers.name, count(orders.order_id) AS total_order
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
group by customers.name
having count(orders.order_id) > 1;

-- Customers who ordered Laptop
SELECT customers.name
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
WHERE orders.product = 'Laptop';

-- Orders after 2024-02-01
SELECT customers.name
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
WHERE orders.order_date > 2024-02-01;

-- Customers with age > 25 who placed orders
SELECT customers.name
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
WHERE customers.age > 25
group by customers.name;



