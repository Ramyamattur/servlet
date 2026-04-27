package com.hospital.servlet;

import com.hospital.dao.HospitalDAO;
import com.hospital.model.Patient;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayPatientsServlet")
public class DisplayPatientsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HospitalDAO dao = new HospitalDAO();
        List<Patient> patients = dao.getAllPatients();
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("patientdisplay.jsp").forward(request, response);
    }
}