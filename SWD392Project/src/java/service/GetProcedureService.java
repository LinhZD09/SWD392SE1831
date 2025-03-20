package service;

import Dal.ConnectDB;
import java.security.Timestamp;
import model.Procedures;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class GetProcedureService {

    public List<Procedures> getAllProcedures() throws SQLException, ClassNotFoundException {
        List<Procedures> proceduresList = new ArrayList<>();

        String sql = "SELECT [procedureId], [title], [description], [categoryId], [createdDate], [updateDate], [status], "
                + "[processingTime], [fee], [paymentRequired], [submissionMethod], [approvalAuthority] "
                + "FROM [SWD392Project].[dbo].[Procedures]";

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Procedures procedure = new Procedures(
                        rs.getInt("procedureId"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("categoryId"),
                        rs.getDate("createdDate"),
                        rs.getDate("updateDate"),
                        rs.getString("status"),
                        rs.getInt("processingTime"),
                        rs.getDouble("fee"),
                        rs.getString("paymentRequired"),
                        rs.getString("submissionMethod"),
                        rs.getString("approvalAuthority")
                );
                proceduresList.add(procedure);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proceduresList;
    }

    public boolean updateProcedure(Procedures procedure) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Procedures SET title = ?, description = ?, categoryId = ?, updateDate = ?, "
                + "status = ?, processingTime = ?, fee = ?, paymentRequired = ?, submissionMethod = ?, approvalAuthority = ? "
                + "WHERE procedureId = ?";

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, procedure.getTitle());
            stmt.setString(2, procedure.getDescription());
            stmt.setInt(3, procedure.getCategoryId());
            stmt.setDate(4, new java.sql.Date(procedure.getUpdateDate().getTime())); // Chuyển đổi đúng kiểu dữ liệu
            stmt.setString(5, procedure.getStatus());
            stmt.setInt(6, procedure.getProcessingTime());
            stmt.setDouble(7, procedure.getFee());
            stmt.setString(8, procedure.getPaymentRequired());
            stmt.setString(9, procedure.getSubmissionMethod());
            stmt.setString(10, procedure.getApprovalAuthority());
            stmt.setInt(11, procedure.getProcedureId());

            return stmt.executeUpdate() > 0;
        }
    }

    public List<Category> getAllCategories() throws SQLException, ClassNotFoundException {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT categoryId, name FROM Category";

        try (Connection conn = ConnectDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("categoryId"),
                        rs.getString("name")
                ));
            }
        }
        return categories;
    }
}