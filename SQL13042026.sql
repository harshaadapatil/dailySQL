use college;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT,
    joining_date DATE,
    performance_rating INT
);

INSERT INTO employees ( emp_id, name, department, city, salary, joining_date, performance_rating)VALUES
(1, 'Amit', 'IT', 'Mumbai', 50000, '2021-01-10', 4),
(2, 'Neha', 'IT', 'Pune', 60000, '2020-03-15', 5),
(3, 'Rahul', 'HR', 'Delhi', 40000, '2019-07-20', 3),
(4, 'Sneha', 'HR', 'Mumbai', 45000, '2022-02-11', 4),
(5, 'Kiran', 'IT', 'Bangalore', 70000, '2018-11-05', 5),
(6, 'Pooja', 'HR', 'Pune', 42000, '2021-06-18', 3),
(7, 'Rohit', 'Finance', 'Delhi', 65000, '2019-09-09', 4),
(8, 'Priya', 'Finance', 'Mumbai', 72000, '2020-12-25', 5),
(9, 'Ankit', 'IT', 'Pune', 55000, '2021-04-30', 4),
(10, 'Meena', 'HR', 'Bangalore', 38000, '2017-08-14', 2) ,
(11, 'Suresh', 'IT', 'Delhi', 50000, '2020-01-19', 3),
(12, 'Kavita', 'Finance', 'Pune', 60000, '2018-05-22', 4),
(13, 'Arjun', 'IT', 'Mumbai', 75000, '2019-10-10', 5),
(14, 'Nikita', 'HR', 'Delhi', 60000, '2022-01-01', 4),
(15, 'Vikas', 'Finance', 'Bangalore', 71000, '2021-03-03', 5),
(16, 'Rina', 'IT', 'Pune', 58000, '2020-07-07', 4),
(17, 'Deepak', 'HR', 'Mumbai', 42000, '2019-12-12', 3),
(18, 'Sunita', 'Finance', 'Delhi', 69000, '2022-06-06', 4),
(19, 'Manoj', 'IT', 'Bangalore', 70000, '2018-04-04', 5),
(20, 'Alka', 'HR', 'Pune', 42000, '2021-09-09', 3) ;

select*from employees ;

-- WINDOW FUNCTIONS 
-- Assign row numbers to employees ordered by name
SELECT name , city , department , salary,
ROW_NUMBER() OVER(ORDER BY name) AS ID 
FROM employees ;

-- Assign row numbers starting from 101 (custom offset)
SELECT name , city , department , salary,
100 + ROW_NUMBER() OVER(ORDER BY name) AS ID
FROM employees;

-- Assign row numbers within each city (partition by city)
SELECT name , city , department , salary,
ROW_NUMBER() OVER( PARTITION BY city ORDER BY name) AS ID
FROM employees;

-- Assign row numbers within each city and department
SELECT name , city , department , salary,
ROW_NUMBER() OVER( PARTITION BY city , department ORDER BY name ) AS ID
FROM employees ;

-- Rank employees within each city based on salary (highest first)
-- Note: RANK() skips numbers if there are duplicate salaries
SELECT emp_id , name ,city, department , salary,
RANK() OVER( PARTITION BY city ORDER BY salary DESC ) RANKS 
FROM employees ;

-- Rank employees within each city and department based on salary
SELECT emp_id , name ,city, department , salary,
RANK() OVER( PARTITION BY city , department ORDER BY salary DESC ) RANKS 
FROM employees ;

-- Dense rank employees within each city (no gaps in ranking)
SELECT emp_id , name ,city, department , salary,
DENSE_RANK() OVER( PARTITION BY city  ORDER BY salary DESC ) RANKS 
FROM employees ; 

-- Get previous row's performance rating based on joining date
SELECT emp_id , city , salary , joining_date , performance_rating ,
LAG(performance_rating ,1) OVER(ORDER BY joining_date) AS LAG_NO
FROM employees ;

-- Get performance rating from 3 rows before (based on joining date)
SELECT emp_id , city , salary , joining_date , performance_rating,
LAG( performance_rating , 3) OVER (ORDER BY joining_date ) AS LAG_NO
FROM employees ;

-- Get performance rating from 2 rows before within each city
SELECT emp_id , city , salary , joining_date , performance_rating,
LAG( performance_rating , 2) OVER ( PARTITION BY city ORDER BY joining_date ) AS LAG_NO
FROM employees ;

-- Get performance rating from 2 rows ahead within each city
SELECT emp_id , city , salary , joining_date , performance_rating,
LEAD ( performance_rating ,2) OVER ( PARTITION BY city ORDER BY joining_date ) AS LEAD_NO
FROM employees ;

-- Get the first salary based on joining date (earliest employee)
-- Same value will be repeated for all rows
SELECT emp_id , city , salary , joining_date , performance_rating,
 FIRST_VALUE(salary) OVER (ORDER BY joining_date ) AS FIRSTNUM
FROM employees ;

-- Get first performance rating within each city
SELECT emp_id , city , salary , joining_date , performance_rating,
 FIRST_VALUE(performance_rating) OVER ( PARTITION BY city ORDER BY joining_date ) AS FIRSTNUM
FROM employees ;


SELECT emp_id , city , salary , joining_date , performance_rating,
 LAST_VALUE(salary) OVER ( PARTITION BY city ORDER BY performance_rating ) AS lastvalue
FROM employees ;

-- LAST_VALUE workaround (ignores ordering using constant)
SELECT emp_id , city , salary , joining_date , performance_rating,
 LAST_VALUE(salary) OVER ( PARTITION BY city ORDER BY (select 0) ) AS lastvalue
FROM employees ;




