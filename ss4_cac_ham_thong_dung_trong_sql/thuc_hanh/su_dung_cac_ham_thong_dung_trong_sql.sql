use quan_ly_du_lieu_sinh_vien;
-- Hiển thị số lượng sinh viên ở từng nơi
SELECT Address, COUNT(Student_Id) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

-- Tính điểm trung bình các môn học của mỗi học viên
SELECT S.Student_Id,S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15

SELECT S.Student_Id,S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name
HAVING AVG(Mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.

SELECT S.Student_Id, S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.Student_Id);