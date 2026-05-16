package com.hospital.dao;

import com.hospital.model.Patient;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class HospitalDAO {

    private static final String URL =
            "jdbc:mysql://localhost:3306/hospital_db";

    private static final String USER = "root";

    private static final String PASS = "shashi@@2730";

    // Database Connection
    private Connection getConnection()
            throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(URL, USER, PASS);
    }

    // Get Next Patient ID
    public int getNextAutoIncrement() {

        String sql =
                "SELECT IFNULL(MAX(PatientID),0)+1 AS nextID FROM Patients";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("nextID");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 1;
    }

    // Add Patient
    public boolean addPatient(Patient p) {

        String sql =
                "INSERT INTO Patients " +
                "(PatientName, Age, Gender, AdmissionDate, Ailment, AssignedDoctor) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getPatientName());
            ps.setInt(2, p.getAge());
            ps.setString(3, p.getGender());
            ps.setDate(4, p.getAdmissionDate());
            ps.setString(5, p.getAilment());
            ps.setString(6, p.getAssignedDoctor());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Update Patient
    public boolean updatePatient(Patient p) {

        String sql =
                "UPDATE Patients SET " +
                "PatientName=?, " +
                "Age=?, " +
                "Gender=?, " +
                "AdmissionDate=?, " +
                "Ailment=?, " +
                "AssignedDoctor=? " +
                "WHERE PatientID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getPatientName());
            ps.setInt(2, p.getAge());
            ps.setString(3, p.getGender());
            ps.setDate(4, p.getAdmissionDate());
            ps.setString(5, p.getAilment());
            ps.setString(6, p.getAssignedDoctor());
            ps.setInt(7, p.getPatientID());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Delete Patient
    public boolean deletePatient(int id) {

        String sql =
                "DELETE FROM Patients WHERE PatientID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get All Patients
    public List<Patient> getAllPatients() {

        List<Patient> list = new ArrayList<>();

        String sql = "SELECT * FROM Patients";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Patient p = new Patient();

                p.setPatientID(
                        rs.getInt("PatientID"));

                p.setPatientName(
                        rs.getString("PatientName"));

                p.setAge(
                        rs.getInt("Age"));

                p.setGender(
                        rs.getString("Gender"));

                p.setAdmissionDate(
                        rs.getDate("AdmissionDate"));

                p.setAilment(
                        rs.getString("Ailment"));

                p.setAssignedDoctor(
                        rs.getString("AssignedDoctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Patient By ID
    public Patient getPatientById(int id) {

        String sql =
                "SELECT * FROM Patients WHERE PatientID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Patient p = new Patient();

                p.setPatientID(rs.getInt("PatientID"));
                p.setPatientName(rs.getString("PatientName"));
                p.setAge(rs.getInt("Age"));
                p.setGender(rs.getString("Gender"));
                p.setAdmissionDate(rs.getDate("AdmissionDate"));
                p.setAilment(rs.getString("Ailment"));
                p.setAssignedDoctor(rs.getString("AssignedDoctor"));

                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Search Patients By Date Range
    public List<Patient> getPatientsByDateRange(Date from, Date to) {

        List<Patient> list = new ArrayList<>();

        String sql =
                "SELECT * FROM Patients " +
                "WHERE AdmissionDate BETWEEN ? AND ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, from);
            ps.setDate(2, to);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Patient p = new Patient();

                p.setPatientID(rs.getInt("PatientID"));
                p.setPatientName(rs.getString("PatientName"));
                p.setAge(rs.getInt("Age"));
                p.setGender(rs.getString("Gender"));
                p.setAdmissionDate(rs.getDate("AdmissionDate"));
                p.setAilment(rs.getString("Ailment"));
                p.setAssignedDoctor(rs.getString("AssignedDoctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Search Patients By Ailment
    public List<Patient> getPatientsByAilment(String ailment) {

        List<Patient> list = new ArrayList<>();

        String sql =
                "SELECT * FROM Patients WHERE Ailment LIKE ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + ailment + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Patient p = new Patient();

                p.setPatientID(rs.getInt("PatientID"));
                p.setPatientName(rs.getString("PatientName"));
                p.setAge(rs.getInt("Age"));
                p.setGender(rs.getString("Gender"));
                p.setAdmissionDate(rs.getDate("AdmissionDate"));
                p.setAilment(rs.getString("Ailment"));
                p.setAssignedDoctor(rs.getString("AssignedDoctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Search Patients By Doctor
    public List<Patient> getPatientsByDoctor(String doctor) {

        List<Patient> list = new ArrayList<>();

        String sql =
                "SELECT * FROM Patients WHERE AssignedDoctor LIKE ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + doctor + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Patient p = new Patient();

                p.setPatientID(rs.getInt("PatientID"));
                p.setPatientName(rs.getString("PatientName"));
                p.setAge(rs.getInt("Age"));
                p.setGender(rs.getString("Gender"));
                p.setAdmissionDate(rs.getDate("AdmissionDate"));
                p.setAilment(rs.getString("Ailment"));
                p.setAssignedDoctor(rs.getString("AssignedDoctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get All Ailments
    public List<String> getAllAilments() {

        List<String> list = new ArrayList<>();

        String sql =
                "SELECT DISTINCT Ailment FROM Patients";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                list.add(
                        rs.getString("Ailment"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get All Doctors
    public List<String> getAllDoctors() {

        List<String> list = new ArrayList<>();

        String sql =
                "SELECT DISTINCT AssignedDoctor FROM Patients";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                list.add(
                        rs.getString("AssignedDoctor"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}