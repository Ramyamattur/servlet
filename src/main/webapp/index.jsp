<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f4f8; font-family: 'Segoe UI', sans-serif; }
        .navbar { background: #0d6efd; }
        .hero { background: linear-gradient(135deg, #0d6efd, #0dcaf0); color: white; padding: 60px 20px; text-align: center; border-radius: 0 0 20px 20px; }
        .card { border: none; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .card .icon { font-size: 2.5rem; margin-bottom: 10px; }
        .card-title { font-weight: 700; }
        .btn-main { border-radius: 8px; padding: 8px 20px; }
    </style>
</head>
<body>
<nav class="navbar navbar-dark px-4">
    <span class="navbar-brand fw-bold fs-4">🏥 Hospital Management System</span>
</nav>

<div class="hero">
    <h1 class="fw-bold">Welcome to HMS</h1>
    <p class="lead">Manage patients, doctors, and appointments efficiently.</p>
</div>

<div class="container mt-5">
    <div class="row g-4 justify-content-center">
        <div class="col-md-4">
            <div class="card text-center p-4">
                <div class="icon">➕</div>
                <h5 class="card-title">Add Patient</h5>
                <p class="text-muted">Register a new patient</p>
                <a href="patientadd.jsp" class="btn btn-primary btn-main">Go</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center p-4">
                <div class="icon">✏️</div>
                <h5 class="card-title">Update Patient</h5>
                <p class="text-muted">Edit existing records</p>
                <a href="patientupdate.jsp" class="btn btn-warning btn-main">Go</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center p-4">
                <div class="icon">🗑️</div>
                <h5 class="card-title">Delete Patient</h5>
                <p class="text-muted">Remove patient records</p>
                <a href="patientdelete.jsp" class="btn btn-danger btn-main">Go</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center p-4">
                <div class="icon">📋</div>
                <h5 class="card-title">View All Patients</h5>
                <p class="text-muted">Browse all records</p>
                <a href="DisplayPatientsServlet" class="btn btn-success btn-main">Go</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center p-4">
                <div class="icon">📊</div>
                <h5 class="card-title">Reports</h5>
                <p class="text-muted">Filter & generate reports</p>
                <a href="report_form.jsp" class="btn btn-info btn-main text-white">Go</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>