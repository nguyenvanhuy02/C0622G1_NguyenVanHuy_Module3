create database truy_van_du_lieu_voi_csdl_quan_ly_sinh_sien;
use quan_ly_du_lieu_sinh_vien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student_name like "h%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(start_data) = 12;   
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit >= 3 and credit <= 5; 
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set class_id = 2 where student_name like "Hung";
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.student_name, subject.sub_name,mark.mark 
from student 
inner join mark
on student.student_id = mark.student_id
inner join subject
on subject.sub_id = mark.sub_id
order by mark desc , student.student_name asc; 
