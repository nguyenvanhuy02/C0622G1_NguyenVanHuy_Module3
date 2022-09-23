use quan_ly_du_lieu_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject
where credit in (select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select mark.mark as max,subject.* from subject
join mark
on subject.sub_id = mark.sub_id
where mark in (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*,ifnull(avg(mark.mark),0) as "avg"
from student
left join mark 
on student.student_id= mark.student_id 
group by student.student_id
order by mark.mark desc;