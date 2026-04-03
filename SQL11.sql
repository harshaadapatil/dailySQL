use college;

CREATE TABLE courses (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    subject     ENUM('math', 'science', 'history', 'english', 'computer'),
    credits     INT,
    teacher     VARCHAR(100)
);

CREATE TABLE students (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    gender        ENUM('male', 'female', 'other'),
    course_id     INT,
    date_of_birth DATE,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO courses (course_name, subject, credits, teacher) VALUES
('Algebra Basics',      'math',     4, 'Mr. Sharma'),
('Biology 101',         'science',  3, 'Ms. Verma'),
('World History',       'history',  3, 'Mr. Khan'),
('English Literature',  'english',  2, 'Ms. Patel'),
('Python Programming',  'computer', 4, 'Mr. Mehta'),
('Advanced Chemistry',  'science',  4, 'Ms. Rao'),
('Quantum Physics',     'science',  5, 'Mr. Iyer');   

INSERT INTO students (name, email, gender, course_id, date_of_birth) VALUES
('Raj',    'raj@gmail.com',    'male',   1, '2002-05-10'),
('Khushi', 'khushi@gmail.com', 'female', 2, '2003-03-12'),
('Tanmay', 'tanmay@gmail.com', 'male',   5, '2001-07-21'),
('Chetan', 'chetan@gmail.com', 'male',   3, '2004-01-05'),
('Priya',  'priya@gmail.com',  'female', 1, '2002-11-25'),
('Aman',   'aman@gmail.com',   'male',   4, '2001-08-19'),
('Neha',   'neha@gmail.com',   'female', 5, '2003-09-15'),
('Riya',   'riya@gmail.com',   'female', NULL, '2002-06-30'); 

select*from courses;
select*from students;

-- INNER JOIN
-- Get course name and student name (course → student mapping)
SELECT c.course_name , s.name
FROM courses c
INNER JOIN students s 
ON c.id = s.course_id; 

-- Same as above but starting from students table
SELECT s.name , c.course_name
FROM students s 
INNER JOIN courses c 
on s.course_id = c.id;

-- Get student name, subject, and teacher
select s.name, c.subject, c.teacher
from students s 
inner join courses c 
on s.course_id= c.id;

-- Students enrolled in science subjects
select s.name 
from students s 
inner join courses c
on s.course_id = c.id 
where c.subject = 'science';

-- Students enrolled in courses with credits > 3
select s.name 
from students s 
inner join courses c 
on s.course_id = c.id
where c.credits > 3;

-- Students taught by Mr. Sharma 
select s.name , c.course_name
from students s 
inner join courses c 
on s.course_id = c.id
where c.teacher = 'Mr. sharma';

-- Male students with their courses
select s.name, s.gender , c.course_name
from students s
inner join courses c 
on s.course_id = c.id
where s.gender = 'male';

-- Students enrolled in Python Programming
select s.name, c.course_name
from students s 
inner join courses c 
on s.course_id = c.id
where c.course_name = 'python programming';

-- Count number of students per course
select c.course_name as cn , count(s.id) as total_student
from students s 
inner join courses c 
on s.course_id = c.id
group by cn;

-- Total credits per student
select s.name , sum(c.credits) as total_credits
from students s 
inner join courses c 
on s.course_id = c.id
group by s.name;

-- Average credits per student per subject
select s.name as N , c.subject, avg(c.credits) as avg_credits
from students s 
inner  join courses c
on s.course_id = c.id
group by N, c.subject;

-- Students whose subject is NOT science
select s.name as N , c.subject as S
from students s 
inner join courses c 
on s.course_id = c.id 
where c.subject!='science'
group by N,S;
 
 -- Students enrolled in courses with 4 credits
 select s.name , c.teacher , c.course_name 
from students s 
inner join courses c 
on s.course_id = c.id
where c.credits = '4';
 
 -- Courses having more than 1 student
 select  c.course_name ,count(s.id) as total_stu
 from students s 
 inner join courses c 
 on s.course_id = c.id
 group by c.course_name 
 having count(s.id) > 1;
 
 -- List students ordered by subject name
 select s.name , c.subject 
 from students s 
 inner join courses c 
 on s.course_id = c.id 
 order by c.subject;


