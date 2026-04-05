CREATE TABLE course (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    subject     ENUM('math', 'science', 'history', 'english', 'computer'),
    credits     INT,
    teacher     VARCHAR(100)
);

CREATE TABLE student (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    gender        ENUM('male', 'female', 'other'),
    course_id     INT,
    date_of_birth DATE,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO course (course_name, subject, credits, teacher) VALUES
('Algebra Basics',      'math',     4, 'Mr. Sharma'),
('Biology 101',         'science',  3, 'Ms. Verma'),
('World History',       'history',  3, 'Mr. Khan'),
('English Literature',  'english',  2, 'Ms. Patel'),
('Python Programming',  'computer', 4, 'Mr. Mehta'),
('Advanced Chemistry',  'science',  4, 'Ms. Rao'),
('Quantum Physics',     'science',  5, 'Mr. Iyer');   

INSERT INTO student (name, email, gender, course_id, date_of_birth) VALUES
('Raj',    'raj@gmail.com',    'male',   1, '2002-05-10'),
('Khushi', 'khushi@gmail.com', 'female', 2, '2003-03-12'),
('Tanmay', 'tanmay@gmail.com', 'male',   5, '2001-07-21'),
('Chetan', 'chetan@gmail.com', 'male',   3, '2004-01-05'),
('Priya',  'priya@gmail.com',  'female', 1, '2002-11-25'),
('Aman',   'aman@gmail.com',   'male',   4, '2001-08-19'),
('Neha',   'neha@gmail.com',   'female', 5, '2003-09-15'),
('Riya',   'riya@gmail.com',   'female', NULL, '2002-06-30'); 

select c.course_name, s.name
from student s 
right join course c 
on s.course_id = c.id;

select*from course;
select*from student;

select s.name , c.course_name
from student s 
left join course c 
on s.course_id = c.id;

select s.name, c.teacher
from  student s 
left join course c 
on s.course_id = c.id;

select s.name , c.credits
from student s 
left join course c 
on s.course_id = c.id;

select s.name 
from student s 
left join course c 
on s.course_id =c.id
where c.id is null;

select c.course_name, count(s.id) as total_stu
from student s 
left join course c 
on s.course_id = c.id
group by c.course_name;

select s.name , c.course_name
from course c 
left join student s
on  c.id = s.course_id ;

SELECT s.name, c.course_name ,c.subject 
      FROM student  s
      LEFT JOIN course c
      ON  s.course_id =c.id
      AND c.subject='science';
      
select  c.subject , count(s.id) as total_stu
from student s
left join course c
on s.course_id = c.id 
group by c.subject ;


