drop database if exists bai_tap;
create database bai_tap;
use bai_tap;

create table  products (
id int primary key auto_increment,
product_code varchar(45),
product_name varchar(45),
product_price double,
product_amount int,
product_description text,
product_status bit
);

insert into products(id,product_code,product_name,product_price,product_amount,product_description,product_status)
			values(1,"sp1","kẹo",3000,12,"ăn nhiều sâu răng",0),
            (2,"sp2","bánh",5000,2,"Bánh ăn béo đấy",1),
            (3,"sp3","xúc xích",5000,10,"Ăn nhiều hại đấy",0),
            (4,"sp4","giày",100000,10,"Giày xấu lắm đừng mua",1),
            (5,"sp5","kính",50000,11,"Kính đen không thấy đường",1),
            (6,"sp6","mũ",30000,15,"Mũ mũ ",0),
            (7,"sp7","áo",70000,15,"Áo rách chưa may",1),
            (8,"sp8","quần",80000,12,"Quần rách",1);
 -- 1,YÊU CẦU INDEX   
 
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_products on products(product_code);


-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_products on products(product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_description like "%mua" ;
select * from products where product_code like "sp7" or product_code like "sp6" ;


-- xoá index 
drop index i_products on products;


-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code = "sp3";


-- So sánh câu truy vấn trước và sau khi tạo index ----> dùng index nhanh hơn

-- 2, YÊU CẦU VIEW

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_product 
AS
select product_code,product_name,product_price,product_status
from products;


-- Hiện view 
select * from v_product;   

     
-- Tiến hành sửa đổi view
create or replace view v_product 
as
select product_code,product_name,product_price,product_status,product_description
from products ;

-- Tiến hành xoá view
drop view v_product;

-- 3, YÊU CẦU store procedure

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure thong_tin_san_pham()
begin
select * from products ;
end //
DELIMITER ;
-- Hiện thông tin sản phẩm
call thong_tin_san_pham();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure them_san_pham()
begin
insert into products(id,product_code,product_name,product_price,product_amount,product_description,product_status)
			values(9,"sp1","kẹo",3000,12,"ăn nhiều sâu răng",0);
end //
DELIMITER ;

call them_san_pham();

select * from products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure sua_san_pham(in id_products int)
begin
update products set product_price = 6000 where id = id_products;
end //
DELIMITER ;

 
call sua_san_pham(1);
select * from products;

-- Tạo store procedure xoá sản phẩm theo id

DELIMITER //
create procedure xoa_san_pham(in id_products int)
begin
delete from products where id = id_products;
end //
DELIMITER ;

call xoa_san_pham(9);
select * from products;