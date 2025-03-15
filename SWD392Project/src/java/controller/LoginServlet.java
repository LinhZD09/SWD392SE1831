package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Dal.ConnectDB;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra đầu vào
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=empty_fields");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Kết nối database
            ConnectDB connectDB = new ConnectDB();
            conn = connectDB.getConnection();

            // Truy vấn để lấy thông tin user
            String sql = "SELECT u.userId, u.fullName, u.role " +
                         "FROM Account a " +
                         "JOIN Users u ON a.userId = u.userId " +
                         "WHERE a.username = ? AND a.password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); // Lưu ý: Nên mã hóa mật khẩu trong thực tế
            rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("userId"));
                session.setAttribute("role", rs.getString("role"));
                session.setAttribute("fullName", rs.getString("fullName")); // Lưu tên đầy đủ vào session

                // Điều hướng dựa vào vai trò
                String role = rs.getString("role");
                switch (role) {
                    case "Admin":
                        response.sendRedirect("adminDashboard.jsp");
                        break;
                    case "Customer":
                        response.sendRedirect("customerDashboard.jsp");
                        break;
                    case "Producer":
                        response.sendRedirect("producerDashboard.jsp");
                        break;
                    case "Information":
                        response.sendRedirect("informationDashboard.jsp");
                        break;
                    default:
                        response.sendRedirect("login.jsp?error=invalid_role");
                }
            } else {
                response.sendRedirect("login.jsp?error=invalid_credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server_error&message=" + e.getMessage());
        } finally {
            // Đóng tài nguyên
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
