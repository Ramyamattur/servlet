<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Patient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f4f8; font-family: 'Segoe UI', sans-serif; }
        .form-card { max-width: 480px; margin: 100px auto; background: white; border-radius: 16px; padding: 35px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
        h3 { color: #dc3545; font-weight: 700; margin-bottom: 25px; }
    </style>
    <script>
        function confirmDelete() {
            var id = document.getElementById('patientID').value.trim();
            if (!id || isNaN(id)) { alert('Enter a valid Patient ID.'); return false; }
            return confirm('Are you sure you want to delete Patient ID: ' + id + '?');
        }
    </script>
</head>
<body>
<div class="form-card">
    <a href="index.jsp" class="btn btn-outline-secondary btn-sm mb-3">← Back</a>
    <h3>🗑️ Delete Patient</h3>

    <% if(request.getAttribute("message") != null) { %>
        <div class="alert alert-<%= request.getAttribute("msgType") %>"><%= request.getAttribute("message") %></div>
    <% } %>

    <form action="DeletePatientServlet" method="post" onsubmit="return confirmDelete()">
        <div class="mb-3">
            <label class="form-label fw-semibold">Patient ID</label>
            <input type="number" id="patientID" name="patientID" class="form-control" placeholder="Enter Patient ID" required>
        </div>
        <button type="submit" class="btn btn-danger w-100">Delete Patient</button>
    </form>
</div>
</body>
</html>