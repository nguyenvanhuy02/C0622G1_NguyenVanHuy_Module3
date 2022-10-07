package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> finAll() {
        return iCustomerRepository.finAll();
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public boolean add(Customer customer) {
        return iCustomerRepository.add(customer);
    }

    @Override
    public boolean uppdate(Customer customer) {
        return iCustomerRepository.uppdate(customer);
    }

    @Override
    public boolean delete(int id) {
        return iCustomerRepository.delete(id);
    }

    @Override
    public List<Customer> search(String name) {
        return iCustomerRepository.search("%" + name + "%");
    }
}
