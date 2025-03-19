package service;

import Dal.ConnectDB;
import model.ProcedureSubmission;
import model.ProceduresHistory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProcedureSubmissionService {

    public ProcedureSubmission getEarliestSubmission() throws SQLException, ClassNotFoundException {
        String sql = "SELECT TOP 1 * FROM ProcedureSubmission WHERE status = 'Pending' ORDER BY submissionDate ASC";

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return new ProcedureSubmission(
                        rs.getInt("submissionId"),
                        rs.getInt("customerId"),
                        rs.getInt("templateId"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getTimestamp("submissionDate"),
                        rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStatus(String status,int submissionId) {
 
        String sql = "UPDATE [dbo].[ProcedureSubmission]\n"
                + "   SET \n"
                + "      [status] = ?\n"
                + "      \n"
                + " WHERE submissionId = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, submissionId);
            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0; // Trả về true nếu có dòng được cập nhật

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
