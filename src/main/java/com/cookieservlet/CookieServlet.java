//8a. Build a servlet program to create a cookie to get your name through text box and press submit button(
//through HTML) to display the message by greeting Welcome back your name ! , you have visited this page
//n times ( n = number of your visit ) along with the list of cookies and demonstrate the expiry of cookie also.
package com.cookieservlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");

        int visitCount = 1;
        boolean found = false;

        // Get existing cookies
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {

                // Check if user cookie exists
                if (c.getName().equals("username")) {
                    name = c.getValue();
                    found = true;
                }

                // Check visit count cookie
                if (c.getName().equals("visitCount")) {
                    visitCount = Integer.parseInt(c.getValue());
                    visitCount++;
                }
            }
        }

        // Create/Update cookies
        Cookie userCookie = new Cookie("username", name);
        Cookie countCookie = new Cookie("visitCount", String.valueOf(visitCount));

        // Set expiry (60 seconds)
        userCookie.setMaxAge(60);
        countCookie.setMaxAge(60);

        response.addCookie(userCookie);
        response.addCookie(countCookie);

        // Display output
        out.println("<html><body>");
        out.println("<h2>Welcome back " + name + "!</h2>");
        out.println("<h3>You have visited this page " + visitCount + " times.</h3>");

        // Show cookie list
        out.println("<h3>List of Cookies:</h3>");

        if (cookies != null) {
            for (Cookie c : cookies) {
                out.println("Name: " + c.getName() + 
                            " | Value: " + c.getValue() + "<br>");
            }
        } else {
            out.println("No cookies found<br>");
        }

        // Expiry message
        out.println("<br><b>Note:</b> Cookies will expire in 60 seconds.");

        // Refresh link
        out.println("<br><br><a href='index.html'>Go Back</a>");

        out.println("</body></html>");
    }
}