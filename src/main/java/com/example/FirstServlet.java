//7a. Build a Session Management using JSP program set with one minute session expiry time  to get your name through text box and press submit  to  display  the message by greeting Hello your name!. Check the expiry of the session after one minute. 
package com.example;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class HelloWorldSecond
 */
@WebServlet("/HelloWorldSecond")
public class FirstServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstServlet() {
        super();
        // 
//TODO Auto-generated constructor stub
    }
/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse 
response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {
PrintWriter out = response.getWriter();
out.println("<html><body>");
out.println("<h2 style='color:blue;'>Hello World!!!</h2>");
out.println("<p style='color:magenta;'>The server time is: " + new java.util.Date() + 
"</p>");
out.println("</body></html>");
}
/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse 
response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {
// TODO Auto-generated method stub
doGet(request, response);
}
}