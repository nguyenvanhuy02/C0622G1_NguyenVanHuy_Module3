package service;

import model.Employee;

import java.util.List;
import java.util.Map;

public interface IEmployeeSevice {
    List<Employee> finAll();
    Employee findById(int id);
    Map<String,String> add(Employee employee);
    boolean uppdate(Employee employee);
    boolean delete(int id);
//    List<Employee> search(String searchName);
    List<Employee> search(String searchName , String searchDivision);
}
