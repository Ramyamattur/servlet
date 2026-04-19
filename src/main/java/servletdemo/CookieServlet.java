//6b. Build a servlet program to create a cookie to get your name through text box and press submit button( through HTML) to display the message by greeting Welcome back your name ! , you have visited this page n times ( n = number of your visit ) and demonstrate the expiry of cookie also.

package servletdemo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userName = request.getParameter("userName");

        String existingUser = null;
        int count = 0;

        Cookie[] cookies = request.getCookies();

        // Read cookies
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user")) {
                    existingUser = cookie.getValue();
                }
                if (cookie.getName().equals("count")) {
                    count = Integer.parseInt(cookie.getValue());
                }
            }
        }

        // New user
        if (userName != null && !userName.isEmpty()) {
            existingUser = userName;
            count = 0;

            Cookie userCookie = new Cookie("user", userName);
            userCookie.setMaxAge(30); // 30 sec expiry

            Cookie countCookie = new Cookie("count", "0");
            countCookie.setMaxAge(30);

            response.addCookie(userCookie);
            response.addCookie(countCookie);
        }

        // Increment count
        if (existingUser != null) {
            count++;

            Cookie countCookie = new Cookie("count", String.valueOf(count));
            countCookie.setMaxAge(30);
            response.addCookie(countCookie);
        }

        // HTML output
        out.println("<html><head><title>Cookie Example</title></head><body>");

        if (existingUser != null) {
            out.println("<h2 style='color:blue;'>Welcome back, " + existingUser + "!</h2>");
            out.println("<h2 style='color:magenta;'>You have visited this page " + count + " times!</h2>");
        } else {
            out.println("<h2 style='color:red;'>Welcome Guest! Please enter your name</h2>");
            out.println("<form action='CookieServlet' method='get'>");
            out.println("Enter your name: <input type='text' name='userName'>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
        }

        // TABLE FOR COOKIES
        out.println("<h3>Cookies List:</h3>");
        out.println("<table border='1' cellpadding='10'>");
        out.println("<tr><th>Cookie Name</th><th>Cookie Value</th></tr>");

        if (cookies != null) {
            for (Cookie c : cookies) {
                out.println("<tr>");
                out.println("<td>" + c.getName() + "</td>");
                out.println("<td>" + c.getValue() + "</td>");
                out.println("</tr>");
            }
        } else {
            out.println("<tr><td colspan='2'>No Cookies Found</td></tr>");
        }

        out.println("</table>");

        // EXPIRY NOTE
        out.println("<p style='color:green;'><b>Note:</b> Cookies will expire in 30 seconds from creation.</p>");

        // Logout button
        out.println("<form action='CookieServlet' method='post'>");
        out.println("<input type='submit' value='Logout'>");
        out.println("</form>");

        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Delete cookies
        Cookie userCookie = new Cookie("user", "");
        userCookie.setMaxAge(0);

        Cookie countCookie = new Cookie("count", "");
        countCookie.setMaxAge(0);

        response.addCookie(userCookie);
        response.addCookie(countCookie);

        response.sendRedirect("CookieServlet");
    }
}