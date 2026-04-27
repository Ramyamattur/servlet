<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Patient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f4f8; font-family: 'Segoe UI', sans-serif; }
        .form-card { max-width: 600px; margin: 40px auto; background: white; border-radius: 16px; padding: 35px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
        h3 { color: #0d6efd; font-weight: 700; margin-bottom: 25px; }
    </style>
    <script>
        function validateForm() {
            var id = document.getElementById('patientID').value.trim();
            var name = document.getElementById('patientName').value.trim();
            var age = document.getElementById('age').value;
            var date = document.getElementById('admissionDate').value;
            var ailment = document.getElementById('ailment').value.trim();
            var doctor = document.getElementById('assignedDoctor').value.trim();

            if (!id || isNaN(id) || parseInt(id) <= 0) { alert('Enter a valid Patient ID.'); return false; }
            if (!name || name.length < 2) { alert('Enter a valid Patient Name.'); return false; }
            if (!age || isNaN(age) || age < 0 || age > 150) { alert('Enter a valid Age (0-150).'); return false; }
            if (!date) { alert('Select an Admission Date.'); return false; }
            if (!ailment) { alert('Enter the Ailment.'); return false; }
            if (!doctor) { alert('Enter Assigned Doctor name.'); return false; }
            return true;
        }
    </script>
</head>
<body>
<div class="form-card">
    <a href="index.jsp" class="btn btn-outline-secondary btn-sm mb-3">← Back</a>
    <h3>➕ Add New Patient</h3>

    <% if(request.getAttribute("message") != null) { %>
        <div class="alert alert-<%= request.getAttribute("msgType") %>"><%= request.getAttribute("message") %></div>
    <% } %>

    <form action="AddPatientServlet" method="post" onsubmit="return validateForm()">
        <div class="mb-3">
            <label class="form-label fw-semibold">Patient ID</label>
            <input type="number" id="patientID" name="patientID" class="form-control" placeholder="e.g. 101" required>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Patient Name</label>
            <input type="text" id="patientName" name="patientName" class="form-control" placeholder="Full Name" required>
        </div>
        <div class="row">
            <div class="col mb-3">
                <label class="form-label fw-semibold">Age</label>
                <input type="number" id="age" name="age" class="form-control" placeholder="Age" required>
            </div>
            <div class="col mb-3">
                <label class="form-label fw-semibold">Gender</label>
                <select name="gender" class="form-select" required>
                    <option value="">Select</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Admission Date</label>
            <input type="date" id="admissionDate" name="admissionDate" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Ailment</label>
            <input type="text" id="ailment" name="ailment" class="form-control" placeholder="e.g. Fever, Diabetes" required>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Assigned Doctor</label>
            <input type="text" id="assignedDoctor" name="assignedDoctor" class="form-control" placeholder="Dr. Name" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Add Patient</button>
    </form>
</div>
</body>
</html>