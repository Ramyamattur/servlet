<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Patient" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Report Result</title>

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
    border-top:5px solid #694D75;
}

.card h2{
    color:#331832;
    margin-bottom:8px;
}

.report-title{
    color:#694D75;
    margin-bottom:20px;
    border-bottom:2px solid #F1ECCE;
    padding-bottom:10px;
}

table{
    width:100%;
    border-collapse:collapse;
}

thead{
    background:#331832;
    color:#F1ECCE;
}

thead th{
    padding:12px;
    text-align:left;
}

tbody td{
    padding:12px;
    border-bottom:1px solid #ddd;
}

tbody tr:nth-child(even){
    background:#f7f3e3;
}

tbody tr:hover{
    background:#F1ECCE;
}

.btn-back{

    display:inline-block;
    margin-bottom:16px;
    padding:8px 18px;
    background:#694D75;
    color:#F1ECCE;
    border-radius:7px;
    text-decoration:none;
    font-weight:600;
}

.btn-back:hover{
    background:#331832;
}

.alert{
    padding:12px;
    background:#fff3cd;
    color:#856404;
    border-left:4px solid #ffc107;
    border-radius:6px;
}

.count{
    margin-top:16px;
    color:#694D75;
    font-weight:600;
}

</style>

</head>

<body>

<div class="navbar">

<a href="index.jsp">&#8592; Home</a>

Hospital Management System

</div>

<div class="page-wrap">

<a href="report_form.jsp"
class="btn-back">

&#8592; New Report

</a>

<div class="card">

<h2>Report Result</h2>

<p class="report-title">

<%= request.getAttribute("reportTitle") %>

</p>

<%

List<Patient> patients =
(List<Patient>)request.getAttribute("patients");

if(patients != null && !patients.isEmpty()){

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

<%= p.getGender() %>

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

Total Records :
<strong>

<%= patients.size() %>

</strong>

</p>

<%

}else{

%>

<div class="alert">

No Records Found

</div>

<%
}
%>

</div>

</div>

</body>

</html>