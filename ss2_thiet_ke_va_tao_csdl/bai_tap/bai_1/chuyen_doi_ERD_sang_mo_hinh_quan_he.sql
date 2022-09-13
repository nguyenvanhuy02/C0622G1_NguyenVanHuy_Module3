drop database if exists chuyen_doi_ERD_sang_mo_hinh_quan_he;
create database chuyen_doi_ERD_sang_mo_hinh_quan_he;
use chuyen_doi_ERD_sang_mo_hinh_quan_he;
create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);
create table vat_tu(
ma_vtu int primary key auto_increment,
ten_vtu varchar(45)
);
create table chi_tiet_chieu_suat(
dg_xuat double,
sl_xuat int,
so_px int,
ma_vtu int,
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vtu) references vat_tu(ma_vtu)
);
create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date
);
create table chi_tiet_phieu_nhap(
dg_nhap double,
sl_nhap int,
ma_vtu int,
foreign key(ma_vtu) references vat_tu(ma_vtu),
so_pn int,
foreign key(so_pn) references phieu_nhap(so_pn)
);

create table nha_cc(
ma_ncc int primary key auto_increment,
ten_ncc varchar(45),
dia_chi varchar(45),
sdt int
);
create table don_dh(
so_dh int primary key auto_increment,
ngay_dh date,
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);
create table chi_tiet_don_hang(
ma_vtu int,
foreign key(ma_vtu) references vat_tu(ma_vtu),
so_dh int,
foreign key(so_dh) references don_dh(so_dh)
);
