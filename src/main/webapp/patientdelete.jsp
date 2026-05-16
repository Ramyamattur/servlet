<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Patient" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Delete Patient</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    background:#F1ECCE;
    font-family:'Segoe UI',sans-serif;
    animation:fadeBody 1s ease;
}

@keyframes fadeBody{

    from{
        opacity:0;
    }

    to{
        opacity:1;
    }
}

.navbar{

    background:#331832;
    color:#fff;
    padding:15px 30px;
    font-size:22px;
    font-weight:bold;
}

.navbar a{

    color:#9FC2CC;
    text-decoration:none;
    margin-right:15px;
    font-size:15px;
}

.page-wrap{

    width:95%;
    max-width:1000px;
    margin:40px auto;
}

.card{

    background:#fff;
    border-radius:14px;
    padding:30px;
    box-shadow:0 4px 18px rgba(0,0,0,0.15);
    margin-bottom:30px;

    animation:slideUp 0.8s ease;
}

@keyframes slideUp{

    from{
        transform:translateY(40px);
        opacity:0;
    }

    to{
        transform:translateY(0);
        opacity:1;
    }
}

.card h2{

    color:#331832;
    margin-bottom:20px;
    border-bottom:2px solid #F1ECCE;
    padding-bottom:10px;
}

.form-group{

    margin-bottom:20px;
}

.form-group label{

    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#331832;
}

.form-group input{

    width:100%;
    padding:12px;
    border:2px solid #9FC2CC;
    border-radius:8px;
    font-size:15px;
}

.form-group input:focus{

    outline:none;
    border-color:#694D75;
}

.btn-delete{

    width:100%;
    padding:13px;
    border:none;
    border-radius:8px;
    background:#dc3545;
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.btn-delete:hover{

    background:#a71d2a;
    transform:scale(1.02);
}

.alert{

    padding:12px;
    margin-bottom:20px;
    border-radius:8px;
    font-weight:600;
}

.alert-success{

    background:#9FC2CC;
    color:#331832;
}

.alert-error{

    background:#f8d7da;
    color:#721c24;
}

table{

    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

table th{

    background:#694D75;
    color:white;
    padding:12px;
}

table td{

    padding:12px;
    text-align:center;
    border:1px solid #ddd;
}

table tr:nth-child(even){

    background:#f8f8f8;
}

table tr:hover{

    background:#e8f1f4;
    transition:0.3s;
}

.back-link{

    display:inline-block;
    margin-bottom:15px;
    color:#1B5299;
    text-decoration:none;
    font-weight:600;
}

.back-link:hover{

    color:#331832;
}

</style>

<script>

function confirmDelete(){

    var patientID =
    document.getElementById("patientID").value;

    if(patientID == ""){

        alert("Please enter Patient ID");
        return false;
    }

    var result = confirm(
        "Are you sure you want to delete Patient ID : "
        + patientID + " ?"
    );

    if(result == true){

        return true;
    }
    else{

        return false;
    }
}

</script>

</head>

<body>

<div class="navbar">

<a href="index.jsp">&#8592; Home</a>

Hospital Management System

</div>

<div class="page-wrap">

<a href="index.jsp"
class="back-link">

&#8592; Back to Home

</a>

<div class="card">

<h2>Delete Patient</h2>

<%
String msg =
(String)request.getAttribute("message");

String typ =
(String)request.getAttribute("msgType");

if(msg != null){
%>

<div class="alert alert-<%= typ %>">

<%= msg %>

</div>

<%
}
%>

<form action="DeletePatientServlet"
method="post"
onsubmit="return confirmDelete()">

<div class="form-group">

<label>Patient ID</label>

<input type="number"
id="patientID"
name="patientID"
placeholder="Enter Patient ID"
required>

</div>

<button type="submit"
class="btn-delete">

Delete Patient

</button>

</form>

</div>

<div class="card">

<h2>Patient List</h2>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Age</th>
<th>Gender</th>
<th>Ailment</th>
<th>Doctor</th>

</tr>

<%

List<Patient> patients =
(List<Patient>)request.getAttribute("patients");

if(patients != null){

for(Patient p : patients){

%>

<tr>

<td><%= p.getPatientID() %></td>
<td><%= p.getPatientName() %></td>
<td><%= p.getAge() %></td>
<td><%= p.getGender() %></td>
<td><%= p.getAilment() %></td>
<td><%= p.getAssignedDoctor() %></td>

</tr>

<%
}
}
%>

</table>

</div>

</div>

</body>

</html>