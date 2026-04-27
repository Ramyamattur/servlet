package com.hospital.servlet;

import com.hospital.dao.HospitalDAO;
import com.hospital.model.Patient;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("patientID");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                HospitalDAO dao = new HospitalDAO();
                Patient p = dao.getPatientById(id);
                if (p != null) {
                    request.setAttribute("patient", p);
                } else {
                    request.setAttribute("message", "Patient ID not found.");
                    request.setAttribute("msgType", "danger");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Patient ID.");
                request.setAttribute("msgType", "danger");
            }
        }
        request.getRequestDispatcher("patientupdate.jsp").forward(request, response);
    }

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
            boolean success = dao.updatePatient(p);

            request.setAttribute("message", success ? "Patient updated successfully!" : "Error updating patient.");
            request.setAttribute("msgType", success ? "success" : "danger");
        } catch (Exception e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
            request.setAttribute("msgType", "danger");
        }
        request.getRequestDispatcher("patientupdate.jsp").forward(request, response);
    }
}