//6c. Build a servlet program to check the given number is prime number or not using HTML with step by step procedure.
package servletdemo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/PrimeServlet")
public class Primeservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String numStr = request.getParameter("num");

        out.println("<html><head><title>Prime Check</title></head><body>");

        // ✅ If no input, show form
        if (numStr == null || numStr.trim().equals("")) {

            out.println("<h2>Prime Number Checker</h2>");
            out.println("<form action='PrimeServlet' method='get'>");
            out.println("Enter number: <input type='number' name='num' required>");
            out.println("<br><br><input type='submit' value='Check'>");
            out.println("</form>");

        } else {
            // ✅ Process input
            int num = Integer.parseInt(numStr);
            boolean isPrime = true;

            out.println("<h2>Step by Step Process:</h2>");

            if (num <= 1) {
                isPrime = false;
                out.println(num + " is not a prime number (must be > 1)<br>");
            } else {
                for (int i = 2; i <= num / 2; i++) {
                    out.println("Checking: " + num + " ÷ " + i + "<br>");

                    if (num % i == 0) {
                        isPrime = false;
                        out.println("Divisible by " + i + " → Not Prime<br>");
                        break;
                    }
                }
            }

            // ✅ Final Result
            if (isPrime && num > 1) {
                out.println("<h3 style='color:green;'>" + num + " is PRIME</h3>");
            } else if (num > 1) {
                out.println("<h3 style='color:red;'>" + num + " is NOT PRIME</h3>");
            }

            // Back button
            out.println("<br><a href='PrimeServlet'>Check another number</a>");
        }

        out.println("</body></html>");
    }
}