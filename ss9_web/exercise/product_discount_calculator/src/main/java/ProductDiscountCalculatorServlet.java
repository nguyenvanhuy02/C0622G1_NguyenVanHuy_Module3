import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", urlPatterns = "/display")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String productDescription = request.getParameter("product_description");
        double listPrice = Double.parseDouble(request.getParameter("list_price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount_percent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        if (listPrice < 0 ){
            request.setAttribute("erro","Số tiền không hợp lệ ");
            request.getRequestDispatcher("erro.jsp").forward(request,response);
        }
        else if (discountPercent < 0 || discountPercent > 100){
            request.setAttribute("erro","Số phần trăm không hợp lệ ");
            request.getRequestDispatcher("erro.jsp").forward(request,response);
        }
        else {
            request.setAttribute("productDescription",productDescription);
            request.setAttribute("listPrice",listPrice);
            request.setAttribute("discountPercent",discountPercent);
            request.setAttribute("discountAmount",discountAmount);
            request.setAttribute("discountPrice",discountPrice);
            request.getRequestDispatcher("result.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
