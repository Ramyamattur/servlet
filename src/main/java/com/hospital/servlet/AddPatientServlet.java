package com.hospital.servlet;
import com.hospital.dao.HospitalDAO;
import com.hospital.model.Patient;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
public class AddPatientServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
HospitalDAO dao = new HospitalDAO();
request.setAttribute("nextID", dao.getNextAutoIncrement());
request.getRequestDispatcher("patientadd.jsp").forward(request, response);
}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
HospitalDAO dao = new HospitalDAO();
try {
String name = request.getParameter("patientName");
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");
Date date = Date.valueOf(request.getParameter("admissionDate"));
String ail = request.getParameter("ailment");
String doc = request.getParameter("assignedDoctor");
Patient p = new Patient(0, name, age, gender, date, ail, doc);
boolean ok = dao.addPatient(p);
request.setAttribute("message", ok ? "Patient added successfully!" : "Error: Could not add patient.");
request.setAttribute("msgType", ok ? "success" : "error");
} catch (Exception e) {
request.setAttribute("message", "Invalid input: " + e.getMessage());
request.setAttribute("msgType", "error");
}
request.setAttribute("nextID", dao.getNextAutoIncrement());
request.getRequestDispatcher("patientadd.jsp").forward(request, response);
}
}