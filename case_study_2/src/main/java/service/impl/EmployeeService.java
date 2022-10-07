package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeSevice;

import java.util.List;

public class EmployeeService implements IEmployeeSevice {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> finAll() {
        return employeeRepository.finAll();
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public boolean add(Employee employee) {
        return employeeRepository.add(employee);
    }

    @Override
    public boolean uppdate(Employee employee) {
        return employeeRepository.uppdate(employee);
    }

    @Override
    public boolean delete(int id) {
        return employeeRepository.delete(id);
    }

    @Override
    public List<Employee> search(String searchName) {
        return employeeRepository.search("%" + searchName + "%");
    }
}
