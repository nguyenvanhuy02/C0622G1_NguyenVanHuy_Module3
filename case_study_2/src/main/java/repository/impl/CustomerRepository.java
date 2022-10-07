package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String INSERT_CUSTOMER = "insert into customer(customer_type_id,name,date_of_birth,gender,id_card,phone_number,email,address) values (?,?,?,?,?,?,?,?);";
    private final String UPDATE_CUSTOMER = "update customer set customer_type_id =?, name = ? , date_of_birth = ? , gender =? ,id_card=?,phone_number=?,email=?,address=? where id = ?;";
    private final String FIND_BY_ID = "select * from customer where id = ?;";
    private final String DELETE_BY_ID = "delete from customer where id = ? ;";
    private final String FIND_BY_NAME = "select * from customer where name like ?;";
    @Override
    public List<Customer> finAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM customer;");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
            int id = resultSet.getInt("id");
            int customer_type_id = resultSet.getInt("customer_type_id");
            String name = resultSet.getString("name");
            String date_of_birth = resultSet.getString("date_of_birth");
            boolean gender = resultSet.getBoolean("gender");
            String id_card = resultSet.getString("id_card");
            String phone_number = resultSet.getString("phone_number");
            String email = resultSet.getString("email");
            String address = resultSet.getString("address");
            Customer customer = new Customer(id, customer_type_id,name, date_of_birth,gender, id_card,phone_number,email,address);
            customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_ID);
            ps.setInt(1,id);
            System.out.println(ps);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()){
                int id_customer_type = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                String date_of_birth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String id_card = resultSet.getString("id_card");
                String phone_number = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                customer = new Customer(id,id_customer_type,name,date_of_birth,gender,id_card,phone_number,email,address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_CUSTOMER);
            ps.setInt(1,customer.getIdCustomerType());
            ps.setString(2,customer.getName());
            ps.setString(3,customer.getDateOfBirth());
            ps.setBoolean(4,customer.isGender());
            ps.setString(5,customer.getIdCard());
            ps.setString(6,customer.getPhoneNumber());
            ps.setString(7,customer.getEmail());
            ps.setString(8,customer.getAddress());
            int num = ps.executeUpdate();
            return (num==1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean uppdate(Customer customer) {
        boolean rowUpdate = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_CUSTOMER);
            ps.setInt(1,customer.getIdCustomerType());
            ps.setString(2,customer.getName());
            ps.setString(3,customer.getDateOfBirth());
            ps.setBoolean(4,customer.isGender());
            ps.setString(5,customer.getIdCard());
            ps.setString(6,customer.getPhoneNumber());
            ps.setString(7,customer.getEmail());
            ps.setString(8,customer.getAddress());
            ps.setInt(9,customer.getId());
             rowUpdate = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
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
    public List<Customer> search(String searchName) {
        Connection connection = BaseRepository.getConnectDB();
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_NAME);
            ps.setString(1,searchName);
            ResultSet resultSet =ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int id_customer_type = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                String date_of_birth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String id_card = resultSet.getString("id_card");
                String phone_number = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(id,id_customer_type,name,date_of_birth,gender,id_card,phone_number,email,address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

}
