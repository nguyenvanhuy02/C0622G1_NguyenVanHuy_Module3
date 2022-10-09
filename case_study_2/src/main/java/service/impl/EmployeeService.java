package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeSevice;
import validation.Validation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, String> add(Employee employee) {
        Map<String , String> errorMap = new HashMap<>();
        if ("".equals(employee.getEmail())){
            errorMap.put("email","Email không để trống");
        }else if (!Validation.checkEmail(employee.getEmail())){
            errorMap.put("email","Email không đúng định dạng");
        }
        if ("".equals(employee.getName())){
            errorMap.put("name","Tên không để trống!!");
        }
        else if (!Validation.checkName(employee.getName())){
            errorMap.put("name","Tên không đúng định dạng!!");
        }
        if ("".equals(employee.getIdCard())){
            errorMap.put("idCard","Id card không để trống!!");
        }
        else if(!Validation.checkIdCard(employee.getIdCard())){
            errorMap.put("idCard","Id card không đúng định dạng");
        }
        if ("".equals(employee.getPhoneNumber())){
            errorMap.put("phoneNumber","Số điện thoại không được để trống!!");
        }
        else if (!Validation.checkPhone(employee.getPhoneNumber())){
            errorMap.put("phoneNumber","Số điện thoại không đúng định dạng");
        }

        if (errorMap.size()==0){
            boolean check= employeeRepository.add(employee);
        }
        return errorMap;
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
    public List<Employee> search(String searchName, String searchDivision) {
        return employeeRepository.search(searchName,searchDivision);
    }

//    @Override
//    public List<Employee> search(String searchName) {
//        return employeeRepository.search("%" + searchName + "%");
//    }
}
