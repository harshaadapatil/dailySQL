use college;

CREATE TABLE employee (
name varchar(20),
department_name varchar(20),
salary int
);

INSERT INTO employee VALUES 
 ('A', 'IT', 20000),
 ('B', 'IT', 30000), 
 ('C','IT', 25000),
 ('D', 'HR', 20000),
 ('E', 'HR', 30000),
 ('F', 'FINANCE', 20000);
 
 select*from employee;
 select DISTINCT salary from employee;
 select*from employee where salary between 20000 AND 30000;
 select*from employee where department_name in ('IT', 'FINANCE');
 select*from employee where department_name not in ('IT');
 
 select*from employee limit 3;
 select*from employee where salary>25000
 limit 1;
 
 select*from employee order by salary;
 select*from employee order by salary desc;
 select*from employee order by name desc;
 
 select min(salary) from employee; 
 select max(salary) from employee;
 select count(department_name) from employee;
 select sum(salary) from employee;
 
 select department_name, count(name)
 from employee
 group by department_name;
 
 select name, department_name, count(salary)
 from employee
 group by name, department_name;
 
 select department_name, avg(salary)
 from employee
 group by department_name
 order by department_name desc;
 
 select count(name), department_name
 from employee
 group by department_name 
 having max(salary)>20000;
 
 update employee set salary=24000 where name='A';
 update employee set salary= salary+2000;
 
 alter table employee
 add column age_emp int default 30;
 
 alter table employee 
 rename to emp;
 select*from emp;