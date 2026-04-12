use college;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    department VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    fees INT
);

INSERT INTO students VALUES
(1, 'Amit', 80, 'Computer'),
(2, 'Neha', 65, 'IT'),
(3, 'Rahul', 90, 'Computer'),
(4, 'Priya', 70, 'Mechanical'),
(5, 'Sneha', 85, 'IT');

INSERT INTO courses VALUES
(101, 1, 'SQL', 5000),
(102, 2, 'Python', 6000),
(103, 3, 'Java', 7000),
(104, 1, 'Data Science', 8000),
(105, 5, 'SQL', 5000);

-- SUBQUERY
-- find students who scored above avg marks 
select name , marks 
from students
where marks > (select avg(marks) from students );

-- Find students who scored the highest marks
SELECT name , marks 
from students
where marks = (select max(marks) from students );

-- Find students who belong to same department as 'Amit'
select name , department 
from students 
where department = 
( select department 
  from students
  where name = 'Amit');
  
  -- Find students who enrolled in 'SQL' course
  select name 
  from students 
  where student_id IN (
     select student_id 
     from courses 
     where course_name = 'SQL');
     
 --  Find students who did NOT enroll in any course
 select name 
 from students 
 where student_id NOT IN(
     select student_id 
     from courses );
     
 -- Find students who paid more than average course fee
 SELECT student_id , course_name , fees
 from courses 
 where fees > 
     ( select avg(fees) from courses );
     
 --  Find students who have taken more than one course
 select student_id 
 from courses 
 group by student_id
 having count(course_id) > 1;
 
-- Find names of students who have taken more than one course
select name 
from students 
where student_id IN 
    (select student_id 
    from courses
    group by student_id
    having count(course_id) > 1);
    
-- Find second highest marks using subquery
select max(marks)
from students 
where marks < 
    ( select max(marks) from students );    

-- Find students whose marks are below department average
select s.name , s.marks , s.department 
from students s 
where marks < 
      ( select avg(s.marks)
      from students s 
      where s.department = s.department );
