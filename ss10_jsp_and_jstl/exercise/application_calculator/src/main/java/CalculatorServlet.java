import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("first"));
        double secondOperand = Double.parseDouble(request.getParameter("second"));
        String select = request.getParameter("select");
        String error = "Mẫu số không thể bằng 0";
        if (select.equals("+")) {
            BigDecimal result = new BigDecimal(firstOperand + secondOperand);
            request.setAttribute("result", firstOperand + " + " + secondOperand + " = " + result);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (select.equals("-")) {
            BigDecimal result = new BigDecimal(firstOperand - secondOperand);
            request.setAttribute("result", firstOperand + " - " + secondOperand + " = " + result);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (select.equals("x")) {
            BigDecimal result = new BigDecimal(firstOperand * secondOperand);
            request.setAttribute("result", firstOperand + " x " + secondOperand + " = " + result);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (select.equals("/")) {
            if (secondOperand != 0) {
                BigDecimal result = new BigDecimal(firstOperand / secondOperand);
                request.setAttribute("result", firstOperand + " : " + secondOperand + " = " + result);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("result", error);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
