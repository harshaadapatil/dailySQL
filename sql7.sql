USE sys;

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
-- INNER JOIN

--  all enrolled students with their course details
SELECT students.name, students.gender, courses.course_name, courses.subject, courses.teacher FROM students INNER JOIN courses ON students.course_id = courses.id;

-- Only student name, email and course name
SELECT students.name, students.email, courses.course_name FROM students INNER JOIN courses ON students.course_id = courses.id;

--  rename columns in result
SELECT students.name AS student_name, courses.course_name AS enrolled_in, courses.teacher AS taught_by FROM students INNER JOIN courses ON students.course_id = courses.id;

-- only female students with their course
SELECT students.name, students.gender, courses.course_name, courses.subject FROM students INNER JOIN courses ON students.course_id = courses.id WHERE students.gender = 'female';

-- only male students with their course
SELECT students.name, students.gender, courses.course_name, courses.teacher FROM students INNER JOIN courses ON students.course_id = courses.id WHERE students.gender = 'male';

--  students enrolled in computer subject
SELECT students.name, students.email, courses.course_name, courses.subject FROM students INNER JOIN courses ON students.course_id = courses.id WHERE courses.subject = 'computer';

--  courses with 4 or more credits
SELECT students.name, courses.course_name, courses.credits FROM students INNER JOIN courses ON students.course_id = courses.id WHERE courses.credits >= 4;

--  students born after 2002
SELECT students.name, students.date_of_birth, courses.course_name FROM students INNER JOIN courses ON students.course_id = courses.id WHERE students.date_of_birth > '2002-01-01';

--  students whose name starts with 'R'
SELECT students.name, students.email, courses.course_name FROM students INNER JOIN courses ON students.course_id = courses.id WHERE students.name LIKE 'R%';


--  CROSS JOIN

--  every student paired with every course
SELECT students.name, courses.course_name FROM students CROSS JOIN courses;

-- Total combinations produced
SELECT COUNT(*) AS total_combinations FROM students CROSS JOIN courses;

--  only female students crossed with all courses
SELECT students.name, students.gender, courses.course_name, courses.subject FROM students CROSS JOIN courses WHERE students.gender = 'female';

--  only male students crossed with all courses
SELECT students.name, students.gender, courses.course_name, courses.teacher FROM students CROSS JOIN courses WHERE students.gender = 'male';

--  all students crossed with computer subject only
SELECT students.name, students.email, courses.course_name, courses.subject FROM students CROSS JOIN courses WHERE courses.subject = 'computer';

--  all students crossed with high credit courses
SELECT students.name, courses.course_name, courses.credits FROM students CROSS JOIN courses WHERE courses.credits >= 4;

--  students born after 2002 crossed with all courses
SELECT students.name, students.date_of_birth, courses.course_name FROM students CROSS JOIN courses WHERE students.date_of_birth > '2002-01-01';

-- students starting with 'A' crossed with all courses
SELECT students.name, courses.course_name, courses.teacher FROM students CROSS JOIN courses WHERE students.name LIKE 'A%';

