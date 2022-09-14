-- create database thao_tac_voi_csdl_quan_ly_ban_hang;
use xay_dung_co_so_du_lieu_quan_ly_ban_hang;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select so_hoa_don,ngay_mua,tong_gia 
from hoa_don;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    kh.ten,
    sp.ten_san_pham
FROM
    khach_hang kh
        JOIN
    hoa_don hd ON kh.ma_khach = hd.ma_khach
        JOIN
    chi_tiet_dat_hang dh ON hd.so_hoa_don = dh.so_hoa_don
        JOIN
    san_pham sp ON dh.ma_san_pham = sp.ma_san_pham;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
    SELECT 
   kh.ten,sp.ten_san_pham
FROM
    khach_hang kh
       left JOIN
    hoa_don hd ON kh.ma_khach = hd.ma_khach
       left JOIN
    chi_tiet_dat_hang dh ON hd.so_hoa_don = dh.so_hoa_don
        left JOIN
    san_pham sp ON dh.ma_san_pham = sp.ma_san_pham
    where sp.ten_san_pham is null;
    
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select sp.ten_san_pham, hd.so_hoa_don,hd.ngay_mua,sum(sp.gia * dh.od_qty) as tong_tien 
from hoa_don hd
join chi_tiet_dat_hang dh
on hd.so_hoa_don = dh.so_hoa_don
join san_pham sp
on dh.ma_san_pham = sp.ma_san_pham
group by sp.ma_san_pham;

    