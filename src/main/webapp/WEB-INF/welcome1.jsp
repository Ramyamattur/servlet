<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
</head>
<body>

<%
String name = request.getParameter("uname");
String t = request.getParameter("time");

// Convert time to integer
int time = Integer.parseInt(t);

// Display messages
out.print("Welcome! " + name);
out.print("<br>Session has started ... " + name);

// Store in session
session.setAttribute("user", name);
out.print("<br>Your name has been stored in session object");

// Set user-defined expiry time
session.setMaxInactiveInterval(time);
out.print("<br>Session expiry time is set to " + time + " seconds");

// Instruction
out.print("<br>Kindly press the following link to check it within the set session time or wait here to see the session expiry<br>");
%>

<br>
<a href="second.jsp">Display the value</a>

</body>
</html>