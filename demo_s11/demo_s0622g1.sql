create database demo_c0622g1;
use demo_c0622g1;

create table student(
id int primary key auto_increment,
name varchar(50),
birthday date,
gender tinyint(1),
email varchar(50),
point float,
class_id int,
account varchar(50)
);

insert into student(name,birthday,gender,email,point,class_id,account)
values("Huy","2003-02-11",1,"mao@gmail.com",8,1,"maomao"),
		("Kỳ Anh","2009/02/09",1,"Anh@gmail.com",10,1,"anhmao"),
		("Ánh","1997/08/20",1,"kimanh@gmail.com",5,0,"AnhANh");
        
select * from student;        