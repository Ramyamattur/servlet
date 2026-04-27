<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Patient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f4f8; font-family: 'Segoe UI', sans-serif; }
        .form-card { max-width: 620px; margin: 40px auto; background: white; border-radius: 16px; padding: 35px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
        h3 { color: #ffc107; font-weight: 700; margin-bottom: 20px; }
    </style>
    <script>
        function validateUpdate() {
            var name = document.getElementById('patientName').value.trim();
            var age = document.getElementById('age').value;
            if (!name || name.length < 2) { alert('Enter a valid name.'); return false; }
            if (!age || age < 0 || age > 150) { alert('Enter a valid age.'); return false; }
            return true;
        }
    </script>
</head>
<body>
<div class="form-card">
    <a href="index.jsp" class="btn btn-outline-secondary btn-sm mb-3">← Back</a>
    <h3>✏️ Update Patient</h3>

    <% if(request.getAttribute("message") != null) { %>
        <div class="alert alert-<%= request.getAttribute("msgType") %>"><%= request.getAttribute("message") %></div>
    <% } %>

    <!-- Step 1: Search by ID -->
    <form action="UpdatePatientServlet" method="get" class="mb-4">
        <div class="input-group">
            <input type="number" name="patientID" class="form-control" placeholder="Enter Patient ID to search" required>
            <button class="btn btn-warning" type="submit">Search</button>
        </div>
    </form>

    <% Patient p = (Patient) request.getAttribute("patient"); %>
    <% if (p != null) { %>
    <!-- Step 2: Update Form -->
    <form action="UpdatePatientServlet" method="post" onsubmit="return validateUpdate()">
        <input type="hidden" name="patientID" value="<%= p.getPatientID() %>">
        <div class="mb-3">
            <label class="form-label fw-semibold">Patient ID</label>
            <input type="text" class="form-control" value="<%= p.getPatientID() %>" disabled>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Patient Name</label>
            <input type="text" id="patientName" name="patientName" class="form-control" value="<%= p.getPatientName() %>" required>
        </div>
        <div class="row">
            <div class="col mb-3">
                <label class="form-label fw-semibold">Age</label>
                <input type="number" id="age" name="age" class="form-control" value="<%= p.getAge() %>" required>
            </div>
            <div class="col mb-3">
                <label class="form-label fw-semibold">Gender</label>
                <select name="gender" class="form-select">
                    <option <%= "Male".equals(p.getGender()) ? "selected" : "" %>>Male</option>
                    <option <%= "Female".equals(p.getGender()) ? "selected" : "" %>>Female</option>
                    <option <%= "Other".equals(p.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Admission Date</label>
            <input type="date" name="admissionDate" class="form-control" value="<%= p.getAdmissionDate() %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Ailment</label>
            <input type="text" name="ailment" class="form-control" value="<%= p.getAilment() %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Assigned Doctor</label>
            <input type="text" name="assignedDoctor" class="form-control" value="<%= p.getAssignedDoctor() %>" required>
        </div>
        <button class="btn btn-warning w-100">Update Patient</button>
    </form>
    <% } %>
</div>
</body>
</html>