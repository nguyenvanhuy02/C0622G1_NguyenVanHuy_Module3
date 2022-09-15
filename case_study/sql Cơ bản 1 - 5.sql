use quan_ly_khu_nghi_duong_furama;
-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_va_ten LIKE 'H%'
        OR ho_va_ten LIKE 'T%'
        OR ho_va_ten LIKE 'K%'
        AND CHAR_LENGTH(ho_va_ten) <= 15;


-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT 
    *
FROM
    khach_hang
WHERE
    (YEAR(CURDATE()) - YEAR(ngay_sinh) >= 18
        AND YEAR(CURDATE()) - YEAR(ngay_sinh) <= 50)
        AND dia_chi LIKE '%Đà Nẵng'
        OR dia_chi LIKE '%Quảng Trị';


-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_va_ten,
    loai_khach.ten_loai_khach,
    COUNT(hop_dong.ma_khach_hang) AS so_lan_dat_phong
FROM
    hop_dong
        INNER JOIN
    khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        INNER JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE
    ten_loai_khach LIKE 'Diamond'
GROUP BY ma_khach_hang
ORDER BY so_lan_dat_phong;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_va_ten,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    dich_vu.ten_dich_vu,
    ifnull(dich_vu.chi_phi_thue,0) + ifnull(hop_dong_chi_tiet.so_luong,0) * ifnull(dich_vu_di_kem.gia,0) as tong_tien
FROM
    khach_hang
        left JOIN
    hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        left JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
        left JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        left JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        left JOIN
    dich_vu_di_kem 
    ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
    group by hop_dong.ma_hop_dong;



select ma_khach_hang, ho_va_ten from khach_hang 
order by ma_khach_hang
limit 3 offset 2;