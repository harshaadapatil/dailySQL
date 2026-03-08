use college;

CREATE TABLE class(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20) 
);

insert into class
(rollno, name , marks, grade, city)
values
(101,"anil", 78, "C", "pune"),
(102,"bhumika", 93, "B", "mumbai"),
(103,"khushi", 87, "A", "mumbai"),
(104,"dhruv", 45, "F", "pune"),
(105,"samu", 90, "B", "delhi"),
(106,"vani", 78, "C", "delhi");

SELECT*FROM class;
SELECT rollno, name,marks FROM class;
SELECT rollno, name, grade FROM class where city='mumbai';
SELECT city FROM class where marks>78;
SELECT name FROM class where grade='A' 'B';
update class set marks=60 where rollno=101;
update class set city='jalgaon' where rollno=101 AND 102;
delete from class where rollno=101 AND 102;
select*from class where marks BETWEEN 78 AND 90;
update class set marks=100 , grade='A' where rollno=105;

INSERT INTO class 
(rollno, name , marks, grade, city)
 values
 (107, 'dolly', 50, 'D', 'jalgaon' ),
 (108, 'tanmay', 40, 'D', 'pune' ),
 (109, 'raju', 70, 'B', 'pune' );
 select*from class;
 
 delete from class where grade='D' OR marks<60;
					

