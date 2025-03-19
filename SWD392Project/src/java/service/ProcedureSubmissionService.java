/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import Dal.ConnectDB;
import model.ProcedureSubmission;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author MSI
 */
public class ProcedureSubmissionService {

    public ProcedureSubmission getEarliestSubmission() {
        String sql = "SELECT TOP 1 ps.*, pt.data AS templateData "
                + "FROM ProcedureSubmission ps "
                + "JOIN AdministratorProcedure ap ON ap.adminProcedureId = ps.adminProcedureId "
                + "JOIN ProcedureTemplate pt ON pt.adminId = ap.adminProcedureId "
                + "WHERE ps.status = 'Pending' ORDER BY ps.submissionDate ASC";

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return new ProcedureSubmission(
                        rs.getInt("submissionId"),
                        rs.getInt("customerId"),
                        rs.getInt("templateId"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getDate("submissionDate"),
                        rs.getString("status"),
                        rs.getString("templateData")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStatus(int submissionId, String status) {
        String sql = "UPDATE ProcedureSubmission SET status = ? WHERE submissionId = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, submissionId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
