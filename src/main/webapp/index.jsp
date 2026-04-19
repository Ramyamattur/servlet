<%@ page language="java" %>
<html>
<head>
    <title>User Form</title>

    <script>
        function validateForm() {
            let username = document.forms["f"]["username"].value.trim();
            let email = document.forms["f"]["email"].value.trim();
            let designation = document.forms["f"]["designation"].value;

            let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

            if (username === "" || email === "" || designation === "") {
                alert("All fields are required!");
                return false;
            }

            if (username.length < 3) {
                alert("Username must be at least 3 characters!");
                return false;
            }

            if (!email.match(emailPattern)) {
                alert("Invalid email format!");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

<h2>User Registration Form</h2>

<form name="f" action="UserDataServlet" method="post" onsubmit="return validateForm()">
    
    Username: <input type="text" name="username"><br><br>
    Email: <input type="text" name="email"><br><br>

    Designation:
    <select name="designation">
        <option value="">Select</option>
        <option value="Manager">Manager</option>
        <option value="Developer">Developer</option>
        <option value="Tester">Tester</option>
    </select>
    <br><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>