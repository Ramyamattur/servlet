<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Reports</title>

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
    max-width:560px;
    margin:36px auto;
    padding:0 16px;
}

.card{
    background:#fff;
    border-radius:12px;
    padding:32px;
    box-shadow:0 2px 16px rgba(51,24,50,0.10);
    border-top:5px solid #9FC2CC;
}

.card h2{
    color:#331832;
    font-size:1.3rem;
    margin-bottom:24px;
    border-bottom:2px solid #F1ECCE;
    padding-bottom:10px;
}

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    font-weight:600;
    color:#331832;
    margin-bottom:6px;
    font-size:0.9rem;
}

.form-group input,
.form-group select{

    width:100%;
    padding:10px 12px;
    border:1.5px solid #9FC2CC;
    border-radius:7px;
    font-size:0.95rem;
    color:#331832;
    background:#fff;
}

.form-group input:focus,
.form-group select:focus{
    outline:none;
    border-color:#694D75;
}

.section{
    display:none;
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

<script>

function showSection(){

    var v =
    document.getElementById(
    "reportType").value;

    document.getElementById(
    "dateSection").style.display =
    (v=="dateRange") ? "block" : "none";

    document.getElementById(
    "ailmentSection").style.display =
    (v=="ailment") ? "block" : "none";

    document.getElementById(
    "doctorSection").style.display =
    (v=="doctor") ? "block" : "none";
}

</script>

</head>

<body>

<div class="navbar">

<a href="index.jsp">
&#8592; Home
</a>

Hospital Management System

</div>

<div class="page-wrap">

<a href="index.jsp"
class="back-link">

&#8592; Back to Home

</a>

<div class="card">

<h2>Generate Report</h2>

<form action="ReportServlet"
      method="post">

<div class="form-group">

<label>Report Type</label>

<select id="reportType"
        name="reportType"
        onchange="showSection()"
        required>

<option value="">
-- Select Report --
</option>

<option value="dateRange">
Patients by Date Range
</option>

<option value="ailment">
Patients by Ailment
</option>

<option value="doctor">
Patients by Doctor
</option>

</select>

</div>

<!-- DATE SECTION -->

<div id="dateSection"
     class="section">

<div class="form-group">

<label>From Date</label>

<input type="date"
       id="fromDate"
       name="fromDate">

</div>

<div class="form-group">

<label>To Date</label>

<input type="date"
       id="toDate"
       name="toDate">

</div>

</div>

<!-- AILMENT LIST -->

<div id="ailmentSection"
     class="section form-group">

<label>Ailment</label>

<select id="ailment"
        name="ailment">

<option value="">
Select Ailment
</option>

<option value="Fever">
Fever
</option>

<option value="Cold">
Cold
</option>

<option value="Diabetes">
Diabetes
</option>

<option value="Asthma">
Asthma
</option>

<option value="Heart Problem">
Heart Problem
</option>

<option value="Cancer">
Cancer
</option>

</select>

</div>

<!-- DOCTOR LIST -->

<div id="doctorSection"
     class="section form-group">

<label>Doctor Name</label>

<select id="doctor"
        name="doctor">

<option value="">
Select Doctor
</option>

<option value="Dr. Raj">
Dr. Raj
</option>

<option value="Dr. Priya">
Dr. Priya
</option>

<option value="Dr. Kumar">
Dr. Kumar
</option>

<option value="Dr. Anitha">
Dr. Anitha
</option>

</select>

</div>

<button type="submit"
        class="btn-submit">

Generate Report

</button>

</form>

</div>

</div>

</body>

</html>