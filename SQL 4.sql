use sys;

create table user1 (
id int auto_increment primary key,
name varchar(100) not null,
email varchar(100) unique not null,
gender enum('male' , 'female', 'other'),
date_of_birth date,
created_at timestamp default current_timestamp
);

INSERT INTO user1 (name,email,gender,date_of_birth) VALUES
('Raj','raj@gmail.com','male','2000-05-10'),
('Khushi','khushi@gmail.com','female','2002-03-12'),
('Tanmay','tanmay@gmail.com','male','2001-07-21'),
('Chetan','chetan@gmail.com','male','2003-01-05'),
('Priya','priya@gmail.com','female','2001-11-25'),
('Aman','aman@gmail.com','male','2000-08-19'),
('Neha','neha@gmail.com','female','2002-09-15');

SELECT*FROM user1;
SELECT email , name FROM user1;
SELECT * FROM user1 WHERE gender='female';
SELECT name, date_of_birth FROM user1 WHERE gender='male';
SELECT * FROM user1 WHERE name='Raj';
SELECT * FROM user1 WHERE gender='female';
SELECT * FROM user1 WHERE date_of_birth > '2001-01-01';
SELECT * FROM user1 WHERE name LIKE 'A%';
SELECT * FROM user1 WHERE name LIKE 'R%';

SELECT * FROM user1 ORDER BY name;
SELECT * FROM user1 ORDER BY name DESC;
SELECT name,date_of_birth FROM user1 ORDER BY date_of_birth;
SELECT * FROM user1 ORDER BY created_at DESC;

SELECT gender, COUNT(*) 
FROM user1
GROUP BY gender;

SELECT gender, COUNT(id)
FROM user1
GROUP BY gender;

SELECT gender, COUNT(*)
FROM user1
GROUP BY gender
HAVING COUNT(*) > 3;

SELECT gender, COUNT(*)
FROM user1
GROUP BY gender
HAVING COUNT(*) <4;

SELECT COUNT(*) FROM user1;
SELECT COUNT(id) FROM user1;
SELECT MIN(date_of_birth) FROM user1;
SELECT MAX(date_of_birth) FROM user1;

UPDATE user1 SET name='Rahul' WHERE id=1;

UPDATE user1 SET gender='other' WHERE id=3;

UPDATE user1 SET name='Aman Sharma'
WHERE email='aman@gmail.com';

RENAME table user1 to user_col;
RENAME table user_col to user1;
ALTER table user1 ADD column in_active BOOLEAN DEFAULT TRUE;
ALTER TABLE user1 DROP COLUMN in_active;

ALTER TABLE user1 MODIFY COLUMN name VARCHAR(150); #modify a column type
ALTER TABLE user1 MODIFY  COLUMN email VARCHAR(100) FIRST; #to move column (e.g eamil) to the first position
ALTER TABLE user1 MODIFY COLUMN gender enum('male', 'female', 'other') AFTER name;  
#to move column after another column e.g  move gender after name 





