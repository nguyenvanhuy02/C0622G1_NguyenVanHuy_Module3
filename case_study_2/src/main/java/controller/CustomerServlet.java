package controller;

import model.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                addCustomer(request,response);
                break;
            case "edit":
                editCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            case "search":
                searchCustomer(request,response);
                break;
            default:
                showListCustomer(request,response);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        List<Customer> list = customerService.search(name == null ? "" : name);
        request.setAttribute("customerList",list);
        try {
            request.getRequestDispatcher("/view/listCustomer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.delete(id);

        List<Customer> list = customerService.finAll();
        request.setAttribute("customerList",list);
        try {
            request.getRequestDispatcher("/view/listCustomer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("/view/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.getRequestDispatcher("view/add.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList",customerService.finAll());
        try {
            request.getRequestDispatcher("view/listCustomer.jsp").forward(request,response);
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
                save(request,response);
                break;
            case "edit":
                update(request,response);
                break;
            default:
                showListCustomer(request,response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int id_customer = Integer.parseInt(request.getParameter("customer_type_id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("date_of_birth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String id_card = request.getParameter("id_card");
        String phone_number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,id_customer,name,birthday,gender,id_card,phone_number,email,address);
        customerService.uppdate(customer);
        response.sendRedirect("/customer");
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id_customer_type = Integer.parseInt(request.getParameter("idCustomerType"));
        String name = request.getParameter("name");
        String birthay = request.getParameter("dateOfBirth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String id_card = request.getParameter("idCard");
        String phone_number = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id_customer_type,name,birthay,gender,id_card,phone_number,email,address);
        Boolean check = customerService.add(customer);
        String mess = "Thêm mới thành công !";
        if (!check){
            mess = " thêm mới không thành công !";
        }
        request.setAttribute("mess",mess);
        showListCustomer(request,response);
    }
}
