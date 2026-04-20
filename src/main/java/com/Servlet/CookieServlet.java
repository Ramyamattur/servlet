package com.Servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userName = request.getParameter("userName");

        Cookie[] cookies = request.getCookies();
        String existingUser = null;
        int count = 0;

        // Read existing cookies
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user")) {
                    existingUser = c.getValue();
                }
                if (c.getName().equals("count")) {
                    count = Integer.parseInt(c.getValue());
                }
            }
        }

        // If user enters name first time
        if (userName != null && !userName.isEmpty()) {
            existingUser = userName;

            Cookie userCookie = new Cookie("user", userName);
            userCookie.setMaxAge(60); // expires in 60 seconds
            response.addCookie(userCookie);

            count = 0;
        }

        out.println("<html><body>");

        if (existingUser != null) {

            count++;

            // Update visit count cookie
            Cookie countCookie = new Cookie("count", String.valueOf(count));
            countCookie.setMaxAge(60);
            response.addCookie(countCookie);

            // Greeting message
            out.println("<h2 style='color:blue;'>Welcome back, " + existingUser + "!</h2>");
            out.println("<h2 style='color:magenta;'>You have visited this page " + count + " times!</h2>");

            // Display cookie list
            out.println("<h3>List of Cookies:</h3>");
            if (cookies != null) {
                for (Cookie c : cookies) {
                    out.println("Name: " + c.getName() + 
                                " | Value: " + c.getValue() + "<br>");
                }
            }

            // Expiry info
            out.println("<p style='color:red;'>Note: Cookies will expire in 60 seconds.</p>");

            // Logout option
            out.println("<br><a href='CookieServlet?logout=true'>Logout</a>");

        } else {
            response.sendRedirect("index.html");
        }

        out.println("</body></html>");
    }

    // Logout → delete cookies
    protected void doLogout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Cookie user = new Cookie("user", "");
        user.setMaxAge(0);

        Cookie count = new Cookie("count", "");
        count.setMaxAge(0);

        response.addCookie(user);
        response.addCookie(count);

        response.sendRedirect("index.html");
    }

    // Handle logout or normal request
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if ("true".equals(request.getParameter("logout"))) {
            doLogout(request, response);
        } else {
            doGet(request, response);
        }
    }
}