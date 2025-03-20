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

    public String validateProcedure(Procedures procedure) {
        List<String> errors = new ArrayList<>();

        // Kiểm tra tiêu đề
        if (procedure.getTitle() == null || procedure.getTitle().trim().isEmpty()) {
            errors.add("⚠️ Tiêu đề không được để trống!");
        } else if (procedure.getTitle().trim().length() < 3) {
            errors.add("⚠️ Tiêu đề phải có ít nhất 3 ký tự!");
        }

        // Kiểm tra mô tả
        if (procedure.getDescription() == null || procedure.getDescription().trim().isEmpty()) {
            errors.add("⚠️ Mô tả không được để trống!");
        } else if (procedure.getDescription().trim().length() < 5) {
            errors.add("⚠️ Mô tả phải có ít nhất 5 ký tự!");
        }

        // Kiểm tra thời gian xử lý
        if (procedure.getProcessingTime() <= 0) {
            errors.add("⚠️ Thời gian xử lý phải là số nguyên dương!");
        }

        // Kiểm tra lệ phí
        if (procedure.getFee() < 0) {
            errors.add("⚠️ Lệ phí không được âm!");
        }

        // Kiểm tra cơ quan phê duyệt
        if (procedure.getApprovalAuthority() == null || procedure.getApprovalAuthority().trim().isEmpty()) {
            errors.add("⚠️ Cơ quan phê duyệt không được để trống!");
        }

        // Kiểm tra các trường dropdown
        if (procedure.getStatus() == null || !isValidStatus(procedure.getStatus())) {
            errors.add("⚠️ Trạng thái không hợp lệ!");
        }
        if (procedure.getPaymentRequired() == null || !isValidPaymentRequired(procedure.getPaymentRequired())) {
            errors.add("⚠️ Yêu cầu thanh toán không hợp lệ!");
        }
        if (procedure.getSubmissionMethod() == null || !isValidSubmissionMethod(procedure.getSubmissionMethod())) {
            errors.add("⚠️ Hình thức nộp không hợp lệ!");
        }

        if (!errors.isEmpty()) {
            return String.join("<br>", errors);
        }
        return null;
    }

    private boolean isValidStatus(String status) {
        return "Đang xử lý".equals(status) || "Từ chối".equals(status) || "Hoàn thành".equals(status);
    }

    private boolean isValidPaymentRequired(String paymentRequired) {
        return "Có".equals(paymentRequired) || "Không".equals(paymentRequired);
    }

    private boolean isValidSubmissionMethod(String submissionMethod) {
        return "Trực tiếp".equals(submissionMethod) || "Online".equals(submissionMethod);
    }


}