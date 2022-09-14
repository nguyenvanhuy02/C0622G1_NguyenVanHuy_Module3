use quan_ly_du_lieu_sinh_vien;
-- hiển thị danh sách tất cả các học viên
select * from student;
-- hiển thị danh sách học viên đang theo học cần phải sử dụng câu lệnh select ... from kèm theo where để xét điều kiện truy vấn 
select * from student where status = true;
-- Sử dụng điều kiện where Credit < 10 và from Subject để lấy ra danh sách các môn học có thời gian học nhỏ hơn 10
select * from subject where credit < 10;
-- Sử dụng câu lệnh Join và where để hiển thị danh sách học viên lớp A1