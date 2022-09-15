use quan_ly_khu_nghi_duong_furama;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond”
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select kh.ho_va_ten , lk.ten_loai_khach ,kh.dia_chi,dvdk.ma_dich_vu_di_kem ,dvdk.ten_dich_vu_di_kem
from khach_hang kh
join loai_khach lk
on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd
on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where (kh.dia_chi like "%Vinh" or kh.dia_chi like "%Quang Ngãi") and lk.ten_loai_khach = "Diamond" ;


-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_va_ten, kh.ho_va_ten, kh.so_dien_thoai, dv.ten_dich_vu,sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong hd
 left join khach_hang kh
on hd.ma_khach_hang = kh.ma_khach_hang
  left join nhan_vien nv
on hd.ma_nhan_vien = nv.ma_nhan_vien
  left join dich_vu dv
on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where (month(hd.ngay_lam_hop_dong) between 10 and 12 ) and year(hd.ngay_lam_hop_dong) = 2020
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.* ,sum(hdct.so_luong) as so_luong
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
left join hop_dong hd
on hdct.ma_hop_dong = hd.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
having so_luong >= (
select max(hdct.so_luong)
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
left join hop_dong hd
on hdct.ma_hop_dong = hd.ma_hop_dong
);






