package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UserDataServlet")
public class UserDataServlet extends HttpServlet {

    // HANDLE POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");

        String error = null;

        // Server-side validation
        if (username == null || username.trim().isEmpty()) {
            error = "Username is required";
        } else if (email == null || !email.contains("@")) {
            error = "Invalid Email";
        } else if (designation == null || designation.trim().isEmpty()) {
            error = "Designation is required";
        }

        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/result.jsp").forward(request, response);
            return;
        }

        // Set attributes
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("designation", designation);

        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    // FIX FOR 405
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.jsp");
    }
}