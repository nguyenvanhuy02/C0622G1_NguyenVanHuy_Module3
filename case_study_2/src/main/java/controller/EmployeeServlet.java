package controller;

import model.Customer;
import model.Employee;
import service.IEmployeeSevice;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeSevice employeeService = new EmployeeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                addEmployee(request,response);
                break;
            case "edit":
                editEmployee(request,response);
                break;
//            case "delete":
//                deleteCustomer(request,response);
//                break;
//            case "search":
//                searchCustomer(request,response);
//                break;
            default:
                showListEmployee(request,response);
                break;
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findById(id);
        RequestDispatcher dispatcher;
        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("employee", employee);
            dispatcher = request.getRequestDispatcher("view/employee/listEmployee.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/employee/addEmployee.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listEmployee", employeeService.finAll());
        try {
            request.getRequestDispatcher("view/employee/listEmployee.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                saveEmployee(request,response);
                break;
            case "edit":
                update(request,response);
                break;
//            case "delete":
//                deleteCustomer(request,response);
//                break;
//            case "search":
//                searchCustomer(request,response);
//                break;
            default:
                showListEmployee(request,response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee employee = new Employee(id,name,birthday,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId,username);
        employeeService.uppdate(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void saveEmployee(HttpServletRequest request, HttpServletResponse response) {
            String name = request.getParameter("name");
            String birthday = request.getParameter("dateOfBirth");
            String idCard = request.getParameter("idCard");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            int positionId = Integer.parseInt(request.getParameter("positionId"));
            int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
            int divisionId = Integer.parseInt(request.getParameter("divisionId"));
            String username = request.getParameter("username");
            Employee employee = new Employee(name,birthday,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId,username);
            boolean check = employeeService.add(employee);
            String mess = "Thêm mới thành công !";
            if (!check){
                mess = " thêm mới không thành công !";
            }
            request.setAttribute("mess",mess);
            showListEmployee(request,response);
    }
}