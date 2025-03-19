//package controller;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import Dal.ConnectDB; // Import class ConnectDB
//
//@WebServlet("/signup")
//public class SignupServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // Lấy dữ liệu từ form đăng ký
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String fullName = request.getParameter("fullName");
//        String address = request.getParameter("address");
//        String gender = request.getParameter("gender");
//
//        // Debug xem có nhận được dữ liệu không
//        System.out.println("Signup Attempt - Username: " + username);
//
//        Connection conn = null;
//        PreparedStatement stmt = null;
//
//        try {
//            // Kết nối database
//            conn = ConnectDB.getConnection();
//            if (conn == null) {
//                throw new Exception("Không thể kết nối đến cơ sở dữ liệu!");
//            }
//
//            // Câu lệnh SQL thêm tài khoản vào bảng `Account`
//            String sql = "INSERT INTO Account (username, password, fullName, address, gender) VALUES (?, ?, ?, ?, ?)";
//            stmt = conn.prepareStatement(sql);
//            stmt.setString(1, username);
//            stmt.setString(2, password); // Không mã hóa mật khẩu như yêu cầu
//            stmt.setString(3, fullName);
//            stmt.setString(4, address);
//            stmt.setString(5, gender);
//
//            int rowsInserted = stmt.executeUpdate();
//            if (rowsInserted > 0) {
//                System.out.println("Tài khoản được tạo thành công!");
//                response.sendRedirect("login.jsp?message=Signup successful! Please login.");
//            } else {
//                response.sendRedirect("signup.jsp?error=Signup failed! Please try again.");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("signup.jsp?error=Database error: " + e.getMessage());
//        } finally {
//            try {
//                if (stmt != null) stmt.close();
//                if (conn != null) conn.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//    }
//}
