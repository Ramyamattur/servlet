<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hospital Management System</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { background:#F1ECCE; font-family:'Segoe UI',sans-serif; min-height:100vh; }
    .navbar {
      background:#331832;
      padding:16px 32px;
      color:#F1ECCE;
      font-size:1.3rem;
      font-weight:700;
      letter-spacing:1px;
    }
    .hero {
      background:linear-gradient(135deg,#331832,#694D75);
      color:#F1ECCE;
      text-align:center;
      padding:50px 20px 40px;
    }
    .hero h1 { font-size:2rem; margin-bottom:8px; }
    .hero p  { font-size:1rem; color:#9FC2CC; }
    .container { max-width:1000px; margin:40px auto; padding:0 20px; }
    .grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(180px,1fr)); gap:20px; }
    .card {
      background:#fff;
      border-radius:12px;
      padding:28px 20px;
      text-align:center;
      box-shadow:0 2px 12px rgba(51,24,50,0.10);
      border-top:4px solid #694D75;
      cursor:pointer;
      text-decoration:none;
      color:#331832;
      display:block;
    }
    .card:hover {
      background:#694D75;
      color:#F1ECCE;
      box-shadow:0 6px 20px rgba(51,24,50,0.18);
    }
    .card:hover .card-icon { color:#9FC2CC; }
    .card:hover .card-btn  { background:#331832; color:#F1ECCE; }
    .card-icon { font-size:2rem; margin-bottom:10px; color:#694D75; }
    .card h3   { font-size:1rem; font-weight:700; margin-bottom:8px; }
    .card p    { font-size:0.8rem; margin-bottom:14px; color:#694D75; }
    .card:hover p { color:#9FC2CC; }
    .card-btn {
      background:#694D75;
      color:#F1ECCE;
      border:none;
      border-radius:6px;
      padding:7px 22px;
      font-size:0.85rem;
      font-weight:600;
      cursor:pointer;
    }
    footer { text-align:center; padding:24px; color:#694D75; font-size:0.85rem; margin-top:40px; }
  </style>
</head>
<body>
<div class="navbar">Hospital Management System</div>
<div class="hero">
  <h1>Welcome to Hospital Management System</h1>
  <p>Manage patients, doctors and appointments efficiently.</p>
</div>
<div class="container">
  <div class="grid">
    <a href="AddPatientServlet" class="card">
      <div class="card-icon">&#43;</div>
      <h3>Add Patient</h3>
      <p>Register new patient</p>
      <span class="card-btn">Open</span>
    </a>
    <a href="patientupdate.jsp" class="card">
      <div class="card-icon">&#9998;</div>
      <h3>Update Patient</h3>
      <p>Edit existing records</p>
      <span class="card-btn">Open</span>
    </a>
    <a href="patientdelete.jsp" class="card">
      <div class="card-icon">&#128465;</div>
      <h3>Delete Patient</h3>
      <p>Remove patient records</p>
      <span class="card-btn">Open</span>
    </a>
    <a href="DisplayPatientsServlet" class="card">
      <div class="card-icon">&#128203;</div>
      <h3>View Patients</h3>
      <p>Browse all records</p>
      <span class="card-btn">Open</span>
    </a>
    <a href="report_form.jsp" class="card">
      <div class="card-icon">&#128202;</div>
      <h3>Reports</h3>
      <p>Filter and generate reports</p>
      <span class="card-btn">Open</span>
    </a>
  </div>
</div>
<footer>Hospital Management System &copy; 2026</footer>
</body>
</html>
