create database  quan_ly_sinh_vien;
use  quan_ly_sinh_vien;
create table lop (
id_lop int,
ten_lop varchar(45)
);
create table sinh_vien(
id_sinh_vien int,
ten_sinh_vien varchar(45),
tuoi_hoc_sinh int,
dia_chi varchar(45)
);
insert into lop values(1,"lop"); 
insert into sinh_vien values(2,"huy",19,"da nag"); 
select * from lop;
select * from sinh_vien;