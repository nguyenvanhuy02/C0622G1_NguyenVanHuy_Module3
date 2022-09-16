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

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong ,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem ,count(hdct.so_luong) as so_luong
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
left join hop_dong hd
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu dv
on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv
on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having so_luong = (
select min(hdct.so_luong)
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
left join hop_dong hd
on hdct.ma_hop_dong = hd.ma_hop_dong
)
order by hd.ma_hop_dong;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_va_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
right join hop_dong hd
on nv.ma_nhan_vien = hd.ma_nhan_vien
join trinh_do td
on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp
on nv.ma_bo_phan = bp.ma_bo_phan
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having count(nv.ma_nhan_vien)<= 3
order by nv.ma_nhan_vien;


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete nhan_vien from nhan_vien 
left join hop_dong 
on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
 where exists (
select * , hop_dong.ma_hop_dong
where hop_dong.ma_hop_dong is null
order by nhan_vien.ma_nhan_vien
) ; 
select nhan_vien.* from nhan_vien;