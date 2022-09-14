drop database if exists quan_ly_du_lieu_sinh_vien;
create database quan_ly_du_lieu_sinh_vien;
use quan_ly_du_lieu_sinh_vien;
create table class (
class_id int primary key auto_increment,
class_name varchar(60),
start_data datetime,
`status` bit 
);
create table student(
student_id int primary key auto_increment,
student_name varchar(30),
address varchar(50),
phone varchar(20),
`status` bit,
class_id int,
foreign key(class_id) references class(class_id)
);
create table subject(
sub_id int primary key auto_increment,
sub_name varchar(30),
credit tinyint default 1 check(credit>=1),
`status` bit default 1 
);
create table mark(
mard_id int primary key auto_increment,
sub_id int,
student_id int,
mark float default 0 check(mark between 0 and 100),
examtimes tinyint default 1,
unique(sub_id,student_id),
foreign key(sub_id) references subject(sub_id),
foreign key(student_id)references student(student_id)
);
-- Thêm vào bảng class
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
-- Thêm vào bảng student
insert into student (student_name, address, phone, `status`, class_Id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (student_name, address, phone, `status`, class_Id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
-- Thêm vào bảng subject
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
-- Thêm vào bảng mark
INSERT INTO Mark (Sub_Id, Student_Id, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);       