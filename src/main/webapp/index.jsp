<%@ page language="java" %>
<html>
<head>
<title>User Form</title>

<script>
function validateForm() {

    let username = document.f.username.value;
    let email = document.f.email.value;
    let designation = document.f.designation.value;

    if (username === "" || email === "" || designation === "") {
        alert("All fields are required");
        return false;
    }

    // Email validation
    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!email.match(emailPattern)) {
        alert("Enter valid email");
        return false;
    }

    return true;
}
</script>

</head>
<body>

<h2>User Data Form</h2>

<form name="f"
      action="<%= request.getContextPath() %>/UserDataServlet"
      method="post"
      onsubmit="return validateForm()">

Username: <input type="text" name="username"><br><br>
Email: <input type="text" name="email"><br><br>
Designation: <input type="text" name="designation"><br><br>

<input type="submit" value="Submit">

</form>

</body>
</html>