package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> finAll();
    Customer findById(int id);
    boolean add(Customer customer);
    boolean uppdate(Customer customer);
    boolean delete(int id);
    List<Customer> search(String name);

}
