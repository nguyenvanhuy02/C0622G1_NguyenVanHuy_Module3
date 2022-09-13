drop database if exists xay_dung_co_so_du_lieu_quan_ly_ban_hang;
create database xay_dung_co_so_du_lieu_quan_ly_ban_hang;
use xay_dung_co_so_du_lieu_quan_ly_ban_hang;
create table khach_hang(
ma_khach int primary key auto_increment,
ten varchar(45),
tuoi int
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

