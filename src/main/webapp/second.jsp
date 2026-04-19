<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session Check</title>
</head>
<body>

<h1>Display the session value on this page</h1>

<%
String name = (String)session.getAttribute("user");

// Check session
if(name == null)
    out.print("Sorry the session has ended");
else
    out.print("Hello " + name);
%>

</body>
</html>