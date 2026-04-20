<%@ page language="java" %>
<html>
<head>
<title>Result Page</title>
</head>
<body>

<h2>Student Result</h2>

<%
    String error = (String) request.getAttribute("error");

    if (error != null) {
%>
    <h3 style="color:red;"><%= error %></h3>
<%
    } else {
%>

<p>Roll No: <%= request.getAttribute("roll") %></p>
<p>Name: <%= request.getAttribute("name") %></p>

<p>Sub1: <%= request.getAttribute("s1") %></p>
<p>Sub2: <%= request.getAttribute("s2") %></p>
<p>Sub3: <%= request.getAttribute("s3") %></p>
<p>Sub4: <%= request.getAttribute("s4") %></p>
<p>Sub5: <%= request.getAttribute("s5") %></p>

<h3>Average: <%= request.getAttribute("avg") %></h3>
<h3>Result: <%= request.getAttribute("result") %></h3>

<%
    }
%>

<br>
<a href="index.jsp">Go Back</a>

</body>
</html>