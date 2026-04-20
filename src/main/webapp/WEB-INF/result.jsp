<%@ page language="java" %>
<html>
<head>
<title>Result Page</title>
</head>
<body>

<h2>Result</h2>

<%
    String error = (String) request.getAttribute("error");

    if (error != null) {
%>
    <h3 style="color:red;"><%= error %></h3>
<%
    } else {
%>

<p>Username: <%= request.getAttribute("username") %></p>
<p>Email: <%= request.getAttribute("email") %></p>
<p>Designation: <%= request.getAttribute("designation") %></p>

<%
    }
%>

<br>
<a href="index.jsp">Back to Form</a>

</body>
</html>