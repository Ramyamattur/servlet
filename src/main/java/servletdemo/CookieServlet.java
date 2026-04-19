//6a. Build a servlet program to find the factorial of a number using HTML with step by step procedure.

package servletdemo;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userName = request.getParameter("userName");

        Cookie[] cookies = request.getCookies();

        String existingUser = null;
        int visitCount = 0;

        // 🔍 Read cookies
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user")) {
                    existingUser = URLDecoder.decode(c.getValue(), "UTF-8");
                }
                if (c.getName().equals("count")) {
                    visitCount = Integer.parseInt(c.getValue());
                }
            }
        }

        // 🧠 New user
        if (userName != null && !userName.trim().isEmpty()) {

            String encodedName = URLEncoder.encode(userName, "UTF-8");

            Cookie userCookie = new Cookie("user", encodedName);
            userCookie.setMaxAge(30);
            response.addCookie(userCookie);

            existingUser = userName;
            visitCount = 1;

        } else if (existingUser != null) {
            visitCount++;
        }

        // 🍪 Store visit count
        Cookie countCookie = new Cookie("count", String.valueOf(visitCount));
        countCookie.setMaxAge(30);
        response.addCookie(countCookie);

        // 🎨 HTML OUTPUT
        out.println("<html>");
        out.println("<head><title>Cookie Demo</title></head>");
        out.println("<body style='text-align:center;font-family:Arial;'>");

        if (existingUser != null) {
            out.println("<h2>Welcome back, " + existingUser + "!</h2>");
            out.println("<h3>You have visited this page " + visitCount + " times!</h3>");
        } else {
            out.println("<h2>Welcome Guest! Please enter your name.</h2>");
        }

        // 🧾 Show cookies
        out.println("<h3>All Cookies:</h3>");
        if (cookies != null) {
            for (Cookie c : cookies) {
                String name = c.getName();
                String value = URLDecoder.decode(c.getValue(), "UTF-8");
                out.println("<p>" + name + " = " + value + "</p>");
            }
        }

        // 📝 Form
        out.println("<form action='CookieServlet' method='get'>");
        out.println("Enter Name: <input type='text' name='userName' required/>");
        out.println("<br><br><input type='submit' value='Submit'/>");
        out.println("</form>");

        // 🚪 Logout
        out.println("<form action='CookieServlet' method='post'>");
        out.println("<br><input type='submit' value='Logout (Delete Cookies)'/>");
        out.println("</form>");

        out.println("<p><b>Note:</b> Cookies expire in 30 seconds.</p>");

        out.println("</body>");
        out.println("</html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie user = new Cookie("user", "");
        user.setMaxAge(0);

        Cookie count = new Cookie("count", "");
        count.setMaxAge(0);

        response.addCookie(user);
        response.addCookie(count);

        response.sendRedirect("CookieServlet");
    }
}