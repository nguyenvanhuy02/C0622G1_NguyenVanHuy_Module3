package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg"));
        customers.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg"));
        customers.add(new Customer("Nguyễn Thái Hoà","1983-08-22","Nam Định","https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg"));
        customers.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg"));
        customers.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setAttribute("customers",customers);
            request.getRequestDispatcher("/customer/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
