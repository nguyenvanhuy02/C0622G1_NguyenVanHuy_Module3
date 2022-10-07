package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> finAll();
    Customer findById(int id);
    boolean add(Customer customer);
    boolean uppdate(Customer customer);
    boolean delete(int id);
    List<Customer> search(String name);
}
