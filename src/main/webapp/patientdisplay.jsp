<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.hospital.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Patients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f4f8; font-family: 'Segoe UI', sans-serif; }
        .page-card { margin: 30px auto; max-width: 1000px; background: white; border-radius: 16px; padding: 30px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
        h3 { color: #198754; font-weight: 700; }
        thead { background-color: #0d6efd; color: white; }
    </style>
</head>
<body>
<div class="page-card">
    <a href="index.jsp" class="btn btn-outline-secondary btn-sm mb-3">← Back</a>
    <h3>📋 All Patient Records</h3>
    <hr>
    <%
        List<Patient> patients = (List<Patient>) request.getAttribute("patients");
        if (patients == null || patients.isEmpty()) {
    %>
        <div class="alert alert-info">No patient records found.</div>
    <% } else { %>
    <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle">
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Age</th><th>Gender</th>
                <th>Admission Date</th><th>Ailment</th><th>Doctor</th>
            </tr>
        </thead>
        <tbody>
        <% for (Patient p : patients) { %>
            <tr>
                <td><%= p.getPatientID() %></td>
                <td><%= p.getPatientName() %></td>
                <td><%= p.getAge() %></td>
                <td><%= p.getGender() %></td>
                <td><%= p.getAdmissionDate() %></td>
                <td><%= p.getAilment() %></td>
                <td><%= p.getAssignedDoctor() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    </div>
    <p class="text-muted">Total Records: <%= patients.size() %></p>
    <% } %>
</div>
</body>
</html>