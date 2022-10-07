package service;

import model.Employee;

import java.util.List;

public interface IEmployeeSevice {
    List<Employee> finAll();
    Employee findById(int id);
    boolean add(Employee employee);
    boolean uppdate(Employee employee);
    boolean delete(int id);
    List<Employee> search(String name);
}