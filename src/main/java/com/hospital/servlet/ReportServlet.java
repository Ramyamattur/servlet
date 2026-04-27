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
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        HospitalDAO dao = new HospitalDAO();
        List<Patient> patients = null;
        String reportTitle = "";

        try {
            if ("dateRange".equals(reportType)) {
                Date from = Date.valueOf(request.getParameter("fromDate"));
                Date to = Date.valueOf(request.getParameter("toDate"));
                patients = dao.getPatientsByDateRange(from, to);
                reportTitle = "Patients Admitted from " + from + " to " + to;
            } else if ("ailment".equals(reportType)) {
                String ailment = request.getParameter("ailment");
                patients = dao.getPatientsByAilment(ailment);
                reportTitle = "Patients with Ailment: " + ailment;
            } else if ("doctor".equals(reportType)) {
                String doctor = request.getParameter("doctor");
                patients = dao.getPatientsByDoctor(doctor);
                reportTitle = "Patients under Dr. " + doctor;
            }
        } catch (Exception e) {
            request.setAttribute("message", "Invalid input: " + e.getMessage());
        }

        request.setAttribute("patients", patients);
        request.setAttribute("reportTitle", reportTitle);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}