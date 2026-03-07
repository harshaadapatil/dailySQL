CREATE database xyz;

CREATE table user(
id int, name varchar(50), age int);

INSERT INTO user values
(101, 'raj', 25),
(102, 'khushi', 22),
(103, 'tanmay', 17);
 
 SELECT*FROM user;
 
 INSERT INTO user values(104, 'chetan', 19);
 
 UPDATE user SET age=18 WHERE id=101;
 SELECT*FROM user where id=101;
 SELECT name FROM user where age=19;
 SELECT name, age FROM user;
 
                           
						