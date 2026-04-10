use college;

CREATE TABLE members (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    year INT
);

CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    semester INT
);

INSERT INTO members VALUES
(1, 'Amit', 'Computer', 2),
(2, 'Neha', 'IT', 3),
(3, 'Rahul', 'Mechanical', 1),
(4, 'Sneha', 'Civil', 4),
(5, 'Karan', 'Computer', 2),
(6, 'Pooja', 'IT', 1),
(7, 'Arjun', 'Mechanical', 3),
(8, 'Riya', 'Civil', 2),
(9, 'Vikas', 'Computer', 4),
(10, 'Anjali', 'IT', 2);

INSERT INTO enrollments VALUES
(101, 1, 'DBMS', 3),
(102, 2, 'Operating Systems', 5),
(103, 3, 'Thermodynamics', 1),
(104, 1, 'Data Structures', 2),
(105, 5, 'Algorithms', 3),
(106, 11, 'Machine Learning', 6), -- no matching student
(107, 7, 'Fluid Mechanics', 5),
(108, 8, 'Structural Design', 4),
(109, 12, 'AI', 6), -- no matching student
(110, 2, 'Computer Networks', 4),
(111, 9, 'Cloud Computing', 7);

select*from members;
select*from enrollments;

--  RIGHT JOIN
-- Get all members (RIGHT table) and matching enrollments
-- If a member has no enrollment → enroll_id will be NULL
select e.enroll_id , m.name
from enrollments e 
right join members m 
on e.student_id = m.student_id ;

-- Get all enrollments (RIGHT table) and matching member names
-- If enrollment has no matching member → name will be NULL
select m.name , e.course_name 
from members m 
right join enrollments e 
on m.student_id = e.student_id ;

-- Find enrollments where NO matching member exists
-- (invalid student_id in enrollments)
select m.student_id , e.course_name
from members m 
right join enrollments e 
on m.student_id = e.student_id 
where m.student_id is null;

-- Count how many enrollments each student has
-- NULL name means invalid enrollment (no student found)
select m.name , count(e.enroll_id) as total_enroll
from members m 
right join enrollments e 
on m.student_id = e.student_id 
group by m.name;

-- Show course and department
-- Department will be NULL if student does not exist
select e.course_name , m.department
from members m 
right join enrollments e 
on m.student_id = e.student_id ;

-- Show enrollments where semester > 4
-- Includes invalid students also (RIGHT JOIN behavior)
select m.name  ,e.semester 
from members m 
right join enrollments e 
on m.student_id = e.student_id 
where e.semester > 4;

-- FULL OUTER JOIN
-- (LEFT + RIGHT + UNION)

-- LEFT JOIN → all members
-- RIGHT JOIN → all enrollments
-- UNION → combine both (remove duplicates)
select m.name , e.enroll_id 
from members m 
left join enrollments e 
on m.student_id = e.student_id 
UNION
select m.name , e.enroll_id 
from members m 
right join enrollments e 
on m.student_id = e.student_id ;

-- Find members who are NOT enrolled in any course
-- (no matching record in enrollments)
select m.*
from members m 
left join enrollments e 
on m.student_id = e. student_id
where e.enroll_id is null ;

-- Find invalid enrollments (no matching member)
-- (data inconsistency detection)
select e.*
from enrollments e 
left join members m
on m.student_id = e. student_id
where m.student_id is null ;

-- Count total rows after FULL OUTER JOIN
-- (unique combinations of student + enrollment)
select count(*) as total_rows
from (
    select m.student_id, e.enroll_id
    from members m
    left join  enrollments e
    ON m.student_id = e.student_id
	UNION
	select m.student_id, e.enroll_id
    from members m
    right join enrollments e
    ON m.student_id = e.student_id
) AS full_data;

-- Show all student names and course names
-- Includes:
-- 1. Students without courses
-- 2. Courses without valid students
select m.name, e.course_name
from members m 
left join enrollments e
ON m.student_id = e.student_id
UNION
select m.name, e.course_name
from members m 
right join enrollments e
ON m.student_id = e.student_id;
