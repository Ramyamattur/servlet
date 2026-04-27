package com.hospital.servlet;

import com.hospital.dao.HospitalDAO;
import com.hospital.model.Patient;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("patientID"));
            String name = request.getParameter("patientName");
            int age = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            Date date = Date.valueOf(request.getParameter("admissionDate"));
            String ailment = request.getParameter("ailment");
            String doctor = request.getParameter("assignedDoctor");

            Patient p = new Patient(id, name, age, gender, date, ailment, doctor);
            HospitalDAO dao = new HospitalDAO();
            boolean success = dao.addPatient(p);

            request.setAttribute("message", success ? "Patient added successfully!" : "Error: Could not add patient.");
            request.setAttribute("msgType", success ? "success" : "danger");
        } catch (Exception e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
            request.setAttribute("msgType", "danger");
        }
        request.getRequestDispatcher("patientadd.jsp").forward(request, response);
    }
}