package repository.impl;

import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String INSERT_EMPLOYEE = "insert into employee(name , date_of_birth, id_card, salary,phone_number , email,address , position_id,education_degree_id , division_id,username) " +
            "values(?,?,?,?,?,?,?,?,?,?,?)";
    private final String FIND_BY_ID = "select * from employee where id = ?;";
    private final String UPDATE_EMPLOYEE = "update employee set name= ?,date_of_birth =?, id_card=?, salary=?, phone_number=?, email=?,address =?,position_id =?,education_degree_id =?, division_id=?, username=? where id = ?; ";
    private final String DELETE_BY_ID = "delete from employee where id = ? ;";
    private final String FIND_BY_NAME = "select * from employee where name like ?;";
    @Override
    public List<Employee> finAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM employee;");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId =  resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                Employee employee = new Employee(id,name,birthday,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId,username);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_ID);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId =  resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                employee = new Employee(name,birthday,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId,username);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean add(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_EMPLOYEE);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getDateOfBirth());
            ps.setString(3,employee.getIdCard());
            ps.setDouble(4,employee.getSalary());
            ps.setString(5,employee.getPhoneNumber());
            ps.setString(6,employee.getEmail());
            ps.setString(7,employee.getAddress());
            ps.setInt(8,employee.getPositionId());
            ps.setInt(9,employee.getEducationDegreeId());
            ps.setInt(10,employee.getDivisionId());
            ps.setString(11, employee.getUsername());
            int num =ps.executeUpdate();
            return (num==1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean uppdate(Employee employee) {
        boolean rowUpdat = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_EMPLOYEE);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getDateOfBirth());
            ps.setString(3,employee.getIdCard());
            ps.setDouble(4,employee.getSalary());
            ps.setString(5,employee.getPhoneNumber());
            ps.setString(6,employee.getEmail());
            ps.setString(7,employee.getAddress());
            ps.setInt(8,employee.getPositionId());
            ps.setInt(9,employee.getEducationDegreeId());
            ps.setInt(10,employee.getDivisionId());
            ps.setString(11, employee.getUsername());
            ps.setInt(12,employee.getId());
            rowUpdat = ps.executeUpdate() > 0 ;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdat;
    }

    @Override
    public boolean delete(int id) {
        Boolean rowDelete = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_BY_ID);
            ps.setInt(1,id);
            rowDelete = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public List<Employee> search(String searchName) {
        Connection connection = BaseRepository.getConnectDB();
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_NAME);
            ps.setString(1,searchName);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId =  resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String username = resultSet.getString("username");
                Employee employee = new Employee(id,name,birthday,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId,username);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
}
