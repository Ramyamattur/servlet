<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.hospital.model.Patient" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Patients</title>

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
    font-weight:400;
}

.page-wrap{
    max-width:1050px;
    margin:36px auto;
    padding:0 16px;
}

.card{
    background:#fff;
    border-radius:12px;
    padding:32px;
    box-shadow:0 2px 16px rgba(51,24,50,0.10);
    border-top:5px solid #1B5299;
}

.card h2{
    color:#331832;
    font-size:1.3rem;
    margin-bottom:24px;
    border-bottom:2px solid #F1ECCE;
    padding-bottom:10px;
}

table{
    width:100%;
    border-collapse:collapse;
    font-size:0.9rem;
}

thead tr{
    background:#331832;
    color:#F1ECCE;
}

thead th{
    padding:12px 14px;
    text-align:left;
    font-weight:600;
}

tbody tr{
    border-bottom:1px solid #F1ECCE;
}

tbody tr:hover{
    background:#F1ECCE;
}

tbody td{
    padding:11px 14px;
    color:#331832;
}

tbody tr:nth-child(even){
    background:#f7f3e3;
}

tbody tr:nth-child(even):hover{
    background:#F1ECCE;
}

.badge{
    display:inline-block;
    padding:3px 10px;
    border-radius:12px;
    font-size:0.78rem;
    font-weight:700;
}

.badge-male{
    background:#9FC2CC;
    color:#1B5299;
}

.badge-female{
    background:#e8d5f0;
    color:#694D75;
}

.badge-other{
    background:#F1ECCE;
    color:#331832;
}

.count{
    color:#694D75;
    font-size:0.85rem;
    margin-top:14px;
}

.alert{
    padding:11px 16px;
    border-radius:7px;
    font-weight:600;
}

.alert-info{
    background:#9FC2CC;
    color:#331832;
    border-left:4px solid #1B5299;
}

.back-link{
    display:inline-block;
    margin-bottom:16px;
    color:#1B5299;
    font-weight:600;
    text-decoration:none;
    font-size:0.9rem;
}

.back-link:hover{
    color:#331832;
}

</style>

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

<h2>All Patient Records</h2>

<%

List<Patient> patients =
(List<Patient>) request.getAttribute("patients");

if(patients == null || patients.isEmpty()){

%>

<div class="alert alert-info">

No patient records found.

</div>

<%

}else{

%>

<div style="overflow-x:auto;">

<table>

<thead>

<tr>

<th>ID</th>
<th>Name</th>
<th>Age</th>
<th>Gender</th>
<th>Admission Date</th>
<th>Ailment</th>
<th>Doctor</th>

</tr>

</thead>

<tbody>

<%

for(Patient p : patients){

    if(p != null){

%>

<tr>

<td>

<strong>

<%= p.getPatientID() %>

</strong>

</td>

<td>

<%= p.getPatientName() %>

</td>

<td>

<%= p.getAge() %>

</td>

<td>

<span class="badge badge-<%= p.getGender().toLowerCase() %>">

<%= p.getGender() %>

</span>

</td>

<td>

<%= p.getAdmissionDate() %>

</td>

<td>

<%= p.getAilment() %>

</td>

<td>

<%= p.getAssignedDoctor() %>

</td>

</tr>

<%

    }
}

%>

</tbody>

</table>

</div>

<p class="count">

Total Records:
<strong><%= patients.size() %></strong>

</p>

<%

}

%>

</div>

</div>

</body>
</html>