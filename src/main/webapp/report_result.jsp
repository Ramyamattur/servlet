<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.hospital.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f4f8; font-family: 'Segoe UI', sans-serif; }
        .page-card { margin: 30px auto; max-width: 1000px; background: white; border-radius: 16px; padding: 30px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
        h3 { color: #0dcaf0; font-weight: 700; }
        thead { background-color: #198754; color: white; }
    </style>
</head>
<body>
<div class="page-card">
    <a href="report_form.jsp" class="btn btn-outline-secondary btn-sm mb-3">← New Report</a>
    <a href="index.jsp" class="btn btn-outline-primary btn-sm mb-3 ms-2">🏠 Home</a>
    <h3>📊 Report: <%= request.getAttribute("reportTitle") %></h3>
    <hr>
    <%
        List<Patient> patients = (List<Patient>) request.getAttribute("patients");
        if (patients == null || patients.isEmpty()) {
    %>
        <div class="alert alert-warning">No records found for the selected criteria.</div>
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
    <p class="text-muted">Total: <%= patients.size() %> record(s)</p>
    <% } %>
</div>
</body>
</html>