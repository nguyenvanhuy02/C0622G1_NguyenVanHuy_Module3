use quan_ly_khu_nghi_duong_furama;


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


-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang set ma_loai_khach = 1 where ma_khach_hang in (
	select ma_khach_hang
	from (
		select kh.ma_khach_hang, sum(ifnull(dv.chi_phi_thue, 0)) + sum(ifnull(dvdk.gia, 0) * ifnull(hdct.so_luong, 0)) as tong_tien
		from khach_hang kh
		join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
		join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
		join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
		join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
		join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
		where year(hd.ngay_lam_hop_dong) = 2021 and lk.ten_loai_khach = 'Platinium'
		group by kh.ma_khach_hang
		having tong_tien >1000000
	) as temp
);

select kh.ma_khach_hang, kh.ho_va_ten, lk.ma_loai_khach
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ma_loai_khach = 1
group by kh.ma_khach_hang;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

set FOREIGN_KEY_CHECKS=0;
delete khach_hang 
from khach_hang
join hop_dong 
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where hop_dong.ngay_lam_hop_dong in
(select hop_dong.ngay_lam_hop_dong 
from hop_dong
where year(hop_dong.ngay_lam_hop_dong)<2021);

select khach_hang.* from khach_hang;


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    SUM(hdct.so_luong) AS tong_so
FROM
    hop_dong hd
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE
    YEAR(hd.ngay_lam_hop_dong) = '2020'
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING tong_so > 10;

SET sql_safe_updates = 0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            hop_dong hd
                JOIN
            hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
                AND YEAR(ngay_lam_hop_dong) = '2020'
        GROUP BY ma_dich_vu_di_kem
        HAVING SUM(so_luong) > 10);
SET sql_safe_updates =1;



update dich_vu_di_kem dvdk set dvdk.gia=dvdk.gia*2
where dvdk.ma_dich_vu_di_kem in(
select *
from(
select dvdk.ma_dich_vu_di_kem
 from hop_dong hd
 join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 where hdct.so_luong >10 and year(ngay_lam_hop_dong)=2020 )temp);

-- Task 20
-- Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nhan_vien.ma_nhan_vien as id, 
	   nhan_vien.ho_va_ten, 
       nhan_vien.email,
       nhan_vien.so_dien_thoai,
       nhan_vien.ngay_sinh,
       nhan_vien.dia_chi,
	   "nhan_vien" as "doi_tuong"
from nhan_vien
union all 
select khach_hang.ma_khach_hang, 
	   khach_hang.ho_va_ten, 
       khach_hang.email,
       khach_hang.so_dien_thoai,
       khach_hang.ngay_sinh,
       khach_hang.dia_chi,
	   "khach_hang" as "doi_tuong"
from khach_hang