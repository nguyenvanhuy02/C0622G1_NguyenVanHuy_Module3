drop database if exists xay_dung_co_so_du_lieu_quan_ly_ban_hang;
create database xay_dung_co_so_du_lieu_quan_ly_ban_hang;
use xay_dung_co_so_du_lieu_quan_ly_ban_hang;
create table khach_hang(
ma_khach int primary key auto_increment,
ten varchar(45),
tuoi tinyint
);
create table hoa_don(
so_hoa_don int primary key auto_increment,
ma_khach int,
foreign key(ma_khach) references khach_hang(ma_khach),
ngay_mua date,
tong_gia double
);
create table san_pham(	
 ma_san_pham int primary key auto_increment,
 ten_san_pham varchar(45),
 gia double
);
create table chi_tiet_dat_hang(
so_hoa_don int ,
ma_san_pham int,
primary key (so_hoa_don,ma_san_pham),
foreign key(so_hoa_don) references hoa_don(so_hoa_don),
foreign key(ma_san_pham) references san_pham(ma_san_pham),
od_qty int
);
-- cach2
-- create table dat_hang_chi_tiet(
-- ma_dat_hang_chi_tiet int primary key auto_increment,
-- so_hoa_don int ,
-- ma_san_pham int,
-- foreign key(so_hoa_don) references hoa_don(so_hoa_don),
-- foreign key(ma_san_pham) references san_pham(ma_san_pham),
-- od_qty int,
-- unique(so_hoa_don,ma_san_pham)
-- );
insert into khach_hang(ma_khach,ten,tuoi) 
values(1,"Minh Quan",10),
		(2,"Ngoc Oanh",20),
        (3,"Hong Ha",50);
insert into hoa_don(so_hoa_don,ma_khach,ngay_mua,tong_gia)
values(1,1,"2006-3-21",null),
		(2,2,"2006-3-23",null),
        (3,1,"2006-3-16",null);
insert into san_pham(ma_san_pham,ten_san_pham,gia)
values(1,"May Giat",3),
		(2,"Tu Lanh",5),
        (3,"Dieu Hoa",7),
        (4,"Quat",1),
        (5,"Bep Dien",2);
insert into chi_tiet_dat_hang(so_hoa_don,ma_san_pham,od_qty)
values(1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);   
