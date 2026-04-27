<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f4f8; font-family: 'Segoe UI', sans-serif; }
        .form-card { max-width: 580px; margin: 40px auto; background: white; border-radius: 16px; padding: 35px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
        h3 { color: #0dcaf0; font-weight: 700; }
        .section { display: none; }
    </style>
    <script>
        function showSection() {
            var val = document.getElementById('reportType').value;
            document.getElementById('dateSection').style.display = (val === 'dateRange') ? 'block' : 'none';
            document.getElementById('ailmentSection').style.display = (val === 'ailment') ? 'block' : 'none';
            document.getElementById('doctorSection').style.display = (val === 'doctor') ? 'block' : 'none';
        }
        function validateReport() {
            var type = document.getElementById('reportType').value;
            if (!type) { alert('Select a report type.'); return false; }
            if (type === 'dateRange') {
                var f = document.getElementById('fromDate').value;
                var t = document.getElementById('toDate').value;
                if (!f || !t) { alert('Select both dates.'); return false; }
                if (f > t) { alert('From Date cannot be after To Date.'); return false; }
            }
            if (type === 'ailment' && !document.getElementById('ailment').value.trim()) {
                alert('Enter ailment name.'); return false;
            }
            if (type === 'doctor' && !document.getElementById('doctor').value.trim()) {
                alert('Enter doctor name.'); return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="form-card">
    <a href="index.jsp" class="btn btn-outline-secondary btn-sm mb-3">← Back</a>
    <h3>📊 Generate Report</h3>
    <hr>
    <form action="ReportServlet" method="post" onsubmit="return validateReport()">
        <div class="mb-3">
            <label class="form-label fw-semibold">Report Type</label>
            <select id="reportType" name="reportType" class="form-select" onchange="showSection()" required>
                <option value="">-- Select Report --</option>
                <option value="dateRange">Patients by Date Range</option>
                <option value="ailment">Patients by Ailment</option>
                <option value="doctor">Patients by Doctor</option>
            </select>
        </div>

        <div id="dateSection" class="section">
            <div class="mb-3">
                <label class="form-label fw-semibold">From Date</label>
                <input type="date" id="fromDate" name="fromDate" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label fw-semibold">To Date</label>
                <input type="date" id="toDate" name="toDate" class="form-control">
            </div>
        </div>

        <div id="ailmentSection" class="section mb-3">
            <label class="form-label fw-semibold">Ailment</label>
            <input type="text" id="ailment" name="ailment" class="form-control" placeholder="e.g. Diabetes">
        </div>

        <div id="doctorSection" class="section mb-3">
            <label class="form-label fw-semibold">Doctor Name</label>
            <input type="text" id="doctor" name="doctor" class="form-control" placeholder="e.g. Dr. Sharma">
        </div>

        <button type="submit" class="btn btn-info text-white w-100">Generate Report</button>
    </form>
</div>
</body>
</html>