package com.hospital.servlet;

import com.hospital.dao.HospitalDAO;
import com.hospital.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class DeletePatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HospitalDAO dao = new HospitalDAO();

        try {

            int id = Integer.parseInt(
                    request.getParameter("patientID"));

            boolean ok = dao.deletePatient(id);

            request.setAttribute(
                    "message",
                    ok ? "Patient deleted successfully!"
                       : "Patient ID not found."
            );

            request.setAttribute(
                    "msgType",
                    ok ? "success" : "error"
            );

        } catch (Exception e) {

            request.setAttribute(
                    "message",
                    "Invalid Patient ID."
            );

            request.setAttribute(
                    "msgType",
                    "error"
            );
        }

        // Get updated patient list
        List<Patient> patients = dao.getAllPatients();

        // Send list to JSP
        request.setAttribute("patients", patients);

        request.getRequestDispatcher("patientdelete.jsp")
               .forward(request, response);
    }
}