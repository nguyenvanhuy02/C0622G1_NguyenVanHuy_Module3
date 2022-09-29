package servlet;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StudentServlet", urlPatterns = "/student")
public class StudentServlet extends HttpServlet {
    private static List<Student> studentList = new ArrayList<>();
    private static List<ClassCG> classCGList = new ArrayList<>();
    static {
        classCGList.add(new ClassCG(1,"C11"));
        classCGList.add(new ClassCG(2,"C12"));
        studentList.add(new Student(1,"Trần Văn Chánh ",true,"12/12/2022",7,"Chanhtv",1,"Chanhtv"));
        studentList.add(new Student(2,"Nguyễn Văn A ",false,"12/12/2022",1,"Chanhtv",1,"Chanhtv"));
        studentList.add(new Student(3,"Nguyễn Minh Tiến ",true,"12/12/2022",4,"Chanhtv",2,"Chanhtv"));
        studentList.add(new Student(4,"Trần Chánh ",false,"12/12/2022",8,"Chanhtv",2,"Chanhtv"));
        studentList.add(new Student(5,"Trần Văn  ",true,"12/12/2022",6,"Chanhtv",1,"Chanhtv"));
        studentList.add(new Student(6,"Trần Chánh1 ",true,"12/12/2022",5,"Chanhtv",3,"Chanhtv"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("classList",classCGList);
        request.setAttribute("studentList",studentList);
        request.getRequestDispatcher("/student/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
