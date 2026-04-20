package com.prime;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/PrimeServlet")
public class PrimeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String input = request.getParameter("number");

        out.println("<html><body>");

        try {
            // Convert input to integer
            int num = Integer.parseInt(input);

            // Check for invalid number
            if (num < 2) {
                response.setStatus(400); // Error code
                out.println("<h3 style='color:red;'>Invalid number! Enter number greater than 1.</h3>");
            } else {
                boolean isPrime = true;

                for (int i = 2; i <= Math.sqrt(num); i++) {
                    if (num % i == 0) {
                        isPrime = false;
                        break;
                    }
                }

                // Display result
                if (isPrime) {
                    out.println("<h2 style='color:green;'>" + num + " is a Prime Number</h2>");
                } else {
                    out.println("<h2 style='color:blue;'>" + num + " is NOT a Prime Number</h2>");
                }
            }

        } catch (NumberFormatException e) {
            // Invalid input (not a number)
            response.setStatus(400); // HTTP Error Code
            out.println("<h3 style='color:red;'>Error: Please enter a valid numeric value!</h3>");
        }

        out.println("<br><a href='index.html'>Try Again</a>");
        out.println("</body></html>");
    }
}