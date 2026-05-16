<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Patient</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:#F1ECCE;
    font-family:'Segoe UI',sans-serif;
}

.navbar{
    background:#331832;
    padding:14px 28px;
    color:#F1ECCE;
    font-weight:700;
    font-size:1.1rem;
}

.navbar a{
    color:#9FC2CC;
    text-decoration:none;
    margin-right:12px;
    font-size:0.9rem;
}

.page-wrap{
    max-width:620px;
    margin:36px auto;
    padding:0 16px;
}

.card{
    background:#fff;
    border-radius:12px;
    padding:32px;
    box-shadow:0 2px 16px rgba(51,24,50,0.10);
    border-top:5px solid #694D75;
}

.card h2{
    color:#331832;
    margin-bottom:20px;
    border-bottom:2px solid #F1ECCE;
    padding-bottom:10px;
}

.form-group{
    margin-bottom:16px;
}

.form-group label{
    display:block;
    margin-bottom:6px;
    font-weight:600;
    color:#331832;
}

.form-group input,
.form-group select{

    width:100%;
    padding:10px 12px;
    border:1.5px solid #9FC2CC;
    border-radius:7px;
    font-size:0.95rem;
}

.form-group input:focus,
.form-group select:focus{
    outline:none;
    border-color:#694D75;
}

.row{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:14px;
}

input[readonly]{
    background:#F1ECCE;
    color:#694D75;
    font-weight:700;
}

.btn-submit{

    width:100%;
    padding:11px;
    background:#1B5299;
    color:#F1ECCE;
    border:none;
    border-radius:7px;
    font-size:1rem;
    font-weight:700;
    cursor:pointer;
}

.btn-submit:hover{
    background:#331832;
}

.alert{
    padding:11px 16px;
    border-radius:7px;
    margin-bottom:18px;
    font-weight:600;
}

.alert-success{
    background:#9FC2CC;
    color:#331832;
    border-left:4px solid #1B5299;
}

.alert-error{
    background:#f8d7da;
    color:#721c24;
    border-left:4px solid #dc3545;
}

.back-link{
    display:inline-block;
    margin-bottom:16px;
    color:#1B5299;
    text-decoration:none;
    font-weight:600;
}

.back-link:hover{
    color:#331832;
}

</style>

<script>

function validateAdd(){

    var nm  = document.getElementById("patientName").value.trim();
    var age = document.getElementById("age").value;

    if(!nm || nm.length < 2){
        alert("Enter valid Patient Name");
        return false;
    }

    if(!age || isNaN(age) || age < 0 || age > 150){
        alert("Enter valid Age");
        return false;
    }

    return true;
}

</script>

</head>

<body>

<div class="navbar">
    <a href="index.jsp">&#8592; Home</a>
    Hospital Management System
</div>

<div class="page-wrap">

<a href="index.jsp" class="back-link">
&#8592; Back to Home
</a>

<div class="card">

<h2>Add Patient</h2>

<%
String msg = (String) request.getAttribute("message");
String typ = (String) request.getAttribute("msgType");

if(msg != null){
%>

<div class="alert alert-<%= typ %>">
    <%= msg %>
</div>

<%
}
%>

<form action="AddPatientServlet"
      method="post"
      onsubmit="return validateAdd()">

<div class="form-group">

<label>Patient ID</label>

<input type="text"
       value="<%= request.getAttribute("nextID") %>"
       readonly>

</div>

<div class="form-group">

<label>Patient Name</label>

<input type="text"
       id="patientName"
       name="patientName"
       required>

</div>

<div class="row">

<div class="form-group">

<label>Age</label>

<input type="number"
       id="age"
       name="age"
       required>

</div>

<div class="form-group">

<label>Gender</label>

<select name="gender">

<option value="Male">Male</option>
<option value="Female">Female</option>
<option value="Other">Other</option>

</select>

</div>

</div>

<div class="form-group">

<label>Admission Date</label>

<input type="date"
       name="admissionDate"
       required>

</div>

<div class="form-group">

<label>Ailment</label>

<select name="ailment">

<option value="Fever">Fever</option>
<option value="Cold">Cold</option>
<option value="Diabetes">Diabetes</option>
<option value="Asthma">Asthma</option>
<option value="Heart Problem">Heart Problem</option>
<option value="Cancer">Cancer</option>

</select>

</div>

<div class="form-group">

<label>Assigned Doctor</label>

<select name="assignedDoctor">

<option value="Dr. Raj">Dr. Raj</option>
<option value="Dr. Priya">Dr. Priya</option>
<option value="Dr. Kumar">Dr. Kumar</option>
<option value="Dr. Anitha">Dr. Anitha</option>

</select>

</div>

<button type="submit" class="btn-submit">
    Add Patient
</button>

</form>

</div>

</div>

</body>
</html>