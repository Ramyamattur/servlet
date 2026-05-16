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

public class ReportServlet extends HttpServlet {

    // ================= GET METHOD =================
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HospitalDAO dao = new HospitalDAO();

        // Load ailment list
        request.setAttribute(
                "ailments",
                dao.getAllAilments()
        );

        // Load doctor list
        request.setAttribute(
                "doctors",
                dao.getAllDoctors()
        );

        request.getRequestDispatcher("reports.jsp")
                .forward(request, response);
    }

    // ================= POST METHOD =================
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String type =
                request.getParameter("reportType");

        HospitalDAO dao = new HospitalDAO();

        List<Patient> patients = null;

        String title = "";

        try {

            if ("dateRange".equals(type)) {

                Date from =
                        Date.valueOf(
                                request.getParameter("fromDate"));

                Date to =
                        Date.valueOf(
                                request.getParameter("toDate"));

                patients =
                        dao.getPatientsByDateRange(from, to);

                title =
                        "Patients Admitted from "
                        + from + " to " + to;
            }

            else if ("ailment".equals(type)) {

                String ail =
                        request.getParameter("ailment");

                patients =
                        dao.getPatientsByAilment(ail);

                title =
                        "Patients with Ailment : "
                        + ail;
            }

            else if ("doctor".equals(type)) {

                String doc =
                        request.getParameter("doctor");

                patients =
                        dao.getPatientsByDoctor(doc);

                title =
                        "Patients under Doctor : "
                        + doc;
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "message",
                    "Invalid Input"
            );

            request.setAttribute(
                    "msgType",
                    "error"
            );
        }

        // Reload dropdown lists
        request.setAttribute(
                "ailments",
                dao.getAllAilments()
        );

        request.setAttribute(
                "doctors",
                dao.getAllDoctors()
        );

        request.setAttribute(
                "patients",
                patients
        );

        request.setAttribute(
                "reportTitle",
                title
        );

        request.getRequestDispatcher("report_result.jsp")
                .forward(request, response);
    }
}