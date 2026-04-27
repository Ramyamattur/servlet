package com.hospital.servlet;

import com.hospital.dao.HospitalDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("patientID");
        try {
            int id = Integer.parseInt(idStr);
            HospitalDAO dao = new HospitalDAO();
            boolean success = dao.deletePatient(id);
            request.setAttribute("message", success ? "Patient deleted successfully!" : "Patient ID not found.");
            request.setAttribute("msgType", success ? "success" : "danger");
        } catch (Exception e) {
            request.setAttribute("message", "Invalid Patient ID.");
            request.setAttribute("msgType", "danger");
        }
        request.getRequestDispatcher("patientdelete.jsp").forward(request, response);
    }
}