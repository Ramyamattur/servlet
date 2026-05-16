package com.hospital.servlet;
import com.hospital.dao.HospitalDAO;
import com.hospital.model.Patient;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
public class UpdatePatientServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("patientID");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                Patient p = new HospitalDAO().getPatientById(Integer.parseInt(idStr));
                if (p != null) {
                    request.setAttribute("patient", p);
                } else {
                    request.setAttribute("message", "Patient ID not found.");
                    request.setAttribute("msgType", "error");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Patient ID.");
                request.setAttribute("msgType", "error");
            }
        }
        request.getRequestDispatcher("patientupdate.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int    id     = Integer.parseInt(request.getParameter("patientID"));
            String name   = request.getParameter("patientName");
            int    age    = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            Date   date   = Date.valueOf(request.getParameter("admissionDate"));
            String ail    = request.getParameter("ailment");
            String doc    = request.getParameter("assignedDoctor");
            boolean ok = new HospitalDAO().updatePatient(
                    new Patient(id, name, age, gender, date, ail, doc));
            request.setAttribute("message", ok ? "Patient updated successfully!" : "Error updating patient.");
            request.setAttribute("msgType", ok ? "success" : "error");
        } catch (Exception e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
            request.setAttribute("msgType", "error");
        }
        request.getRequestDispatcher("patientupdate.jsp").forward(request, response);
    }
}