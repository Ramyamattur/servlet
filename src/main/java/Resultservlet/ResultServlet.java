package Resultservlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

    // POST METHOD
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roll = request.getParameter("rollno");
        String name = request.getParameter("name");

        try {
            int s1 = Integer.parseInt(request.getParameter("sub1"));
            int s2 = Integer.parseInt(request.getParameter("sub2"));
            int s3 = Integer.parseInt(request.getParameter("sub3"));
            int s4 = Integer.parseInt(request.getParameter("sub4"));
            int s5 = Integer.parseInt(request.getParameter("sub5"));

            // Validation
            if (s1<0 || s1>100 || s2<0 || s2>100 ||
                s3<0 || s3>100 || s4<0 || s4>100 ||
                s5<0 || s5>100) {

                request.setAttribute("error", "Marks must be between 0 and 100");
                request.getRequestDispatcher("/result.jsp").forward(request, response);
                return;
            }

            int total = s1+s2+s3+s4+s5;
            double avg = total / 5.0;

            String result = (s1>40 && s2>40 && s3>40 && s4>40 && s5>40) ? "PASS" : "FAIL";

            request.setAttribute("roll", roll);
            request.setAttribute("name", name);
            request.setAttribute("s1", s1);
            request.setAttribute("s2", s2);
            request.setAttribute("s3", s3);
            request.setAttribute("s4", s4);
            request.setAttribute("s5", s5);
            request.setAttribute("avg", avg);
            request.setAttribute("result", result);

            request.getRequestDispatcher("/result.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Invalid input! Enter numeric values.");
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        }
    }

    // FIX FOR 405 ERROR
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.jsp");
    }
}