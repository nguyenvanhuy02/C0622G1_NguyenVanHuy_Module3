package repository.impl;

import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
//    private static List<Student> studentList = new ArrayList<>();
//    private static List<ClassCG> classCGList = new ArrayList<>();
//    static {
//        classCGList.add(new ClassCG(1,"C11"));
//        classCGList.add(new ClassCG(2,"C12"));
//        studentList.add(new Student(1,"Trần Văn Chánh",true,"12/12/2022",7,"chanhtv",1,"chanhtv"));
//        studentList.add(new Student(2,"Nguyễn Văn A",false,"12/12/2022",1,"chanhtv",1,"chanhtv"));
//        studentList.add(new Student(3,"Nguyễn Minh Tiến",true,"12/12/2022",4,"chanhtv",1,"chanhtv"));
//        studentList.add(new Student(4,"chanh4",true,"12/12/2022",8,"chanhtv",2,"chanhtv"));
//        studentList.add(new Student(5,"chanh5",true,"12/12/2022",6,"chanhtv",2,"chanhtv"));
//        studentList.add(new Student(6,"chanh6",true,"12/12/2022",5,"chanhtv",3,"chanhtv"));
//    }


    private final String SELECT_ALL = "select * from student; ";
    private final String INSERT_STUDENT = "insert into student(name,birthday,gender,email,point,class_id,account) values (?,?,?,?,?,?,?);";
    private static final String DELETE_USERS_SQL = "delete from student where id = ?;";
    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement pr = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                String birthday = resultSet.getString("birthday");
                int point = resultSet.getInt("point");
                String account = resultSet.getString("account");
                int class_id = resultSet.getInt("class_id");
                String email = resultSet.getString("email");
                Student student = new Student(id, name ,gender,birthday,point,account,class_id,email);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public boolean add(Student student) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_STUDENT);
            ps.setString(1,student.getName());
            ps.setDate(2,Date.valueOf(student.getBirthday()));
            ps.setBoolean(3,student.isGender());
            ps.setString(4,student.getAccount());
            ps.setFloat(5,student.getPoint());
            ps.setInt(6,student.getClassId());
            ps.setString(7, student.getEmail());
            int num = ps.executeUpdate();
            return (num==1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_USERS_SQL);
            ps.setInt(1,id);
            rowDelete = ps.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }
}
