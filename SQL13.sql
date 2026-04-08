use college;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(100),
    budget INT
);

INSERT INTO employees  (emp_id ,name ,department ,salary ) VALUES
(1, 'Amit',   'IT',       50000),
(2, 'Neha',   'HR',       40000),
(3, 'Raj',    'IT',       60000),
(4, 'Sneha',  'Finance',  45000),
(5, 'Karan',  'IT',       55000),
(6, 'Pooja',  'HR',       42000),
(7, 'Vikas',  'Sales',    38000),
(8, 'Riya',   'IT',       52000),
(9, 'Arjun',  'Finance',  47000),
(10,'Meena',  'Sales',    39000);

INSERT INTO projects  (project_id ,emp_id ,project_name ,budget ) VALUES
(101, 1, 'Website Development', 100000),
(102, 2, 'HR System',           50000),
(103, 3, 'Mobile App',          120000),
(104, 5, 'Data Pipeline',       90000),
(105, 7, 'Sales Dashboard',     60000),
(106, 8, 'AI Chatbot',          150000),
(107, 1, 'Bug Fixing',          30000),
(108, 3, 'API Integration',     70000);

select*from employees;
select*from projects;

-- Show all employees with their project names
-- If an employee has no project, project_name will be NULL
select e.name , p.project_name
from employees e
left join projects p 
on e.emp_id = p.emp_id;

-- Show employee names along with project budget
-- Budget will be NULL if no project is assigned
select e.name , p.budget 
from employees e 
left join projects p 
on e.emp_id = p.emp_id;

-- Show complete data from both employees and projects tables
-- Non-matching project fields will appear as NULL
select *
from employees e 
left join projects p 
on e.emp_id = p.emp_id ;

-- Display employee name, department, and project name
select e.name , e.department, p.project_name
from employees e 
left join projects p 
on e.emp_id = p.emp_id ;

-- Find employees who are not assigned to any project
-- NULL in project table indicates no match
select e.name 
from employees e 
left join projects p 
on e.emp_id = p.emp_id
where p.emp_id IS NULL;

-- Count number of projects assigned to each employee
-- Employees with no projects will have count = 0
select e.name ,count(p.project_id) as total_project
from employees e
left join projects p  
on e.emp_id = p.emp_id 
group by e.name ;

-- Calculate total budget of all projects for each employee
-- If no project exists, result may be NULL
select e.name , sum(p.budget) as total_budget
from employees e 
left join projects p 
on e.emp_id = p.emp_id
group by e.name;

-- Show employees working on projects with budget greater than 80000
select e.name ,p.budget
from employees e 
left join projects p 
on e.emp_id = p.emp_id 
where p.budget > 80000;

-- Count projects per employee 
select e.name , count(p.project_id) as total_project
from employees e 
left join projects p 
on e.emp_id = p.emp_id
group by e.name;

-- Find employees who are working on more than one project
select e.name , count(p.project_id) as total_pro 
from employees e 
left join projects p 
on e.emp_id = p.emp_id 
group by e.name 
having count(p.project_id) >1;

-- Find the highest project budget for each employee
select e.name , max(p.budget) as high_budget
from employees e 
left join projects p 
on e.emp_id = p.emp_id 
group by e.name;

-- Show only employees from IT department with their projects
select e.name , p.project_name 
from employees e 
left join projects p 
on e.emp_id = p.emp_id 
where e.department = 'IT';

-- Replace NULL project names with 'no project' using COALESCE
select e.name , COALESCE(p.project_name , 'no project') as project
from employees e 
left join projects p 
on e.emp_id = p.emp_id ;

-- Calculate total salary of employees who are not assigned any project
select e.name , SUM(e.salary) as total_salary
from employees e 
left join projects p 
on e.emp_id = p.emp_id 
where p.emp_id IS NULL 
group by e.name ;

