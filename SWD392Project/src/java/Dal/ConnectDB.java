/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

/**
 *
 * @author MSI
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    // Thông tin kết nối
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=SWD392Project;encrypt=false";
    private static final String USER = "sa"; // Thay bằng username của bạn
    private static final String PASSWORD = "123"; // Thay bằng mật khẩu của bạn
    private static Connection connection = null;

    // Phương thức lấy kết nối
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        if (connection == null || connection.isClosed()) {
            try {
                // Load driver SQL Server
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("✅ Kết nối CSDL thành công!");
            } catch (ClassNotFoundException e) {
                System.err.println("❌ Lỗi: Không tìm thấy driver SQL Server!");
                throw e;
            } catch (SQLException e) {
                System.err.println("❌ Lỗi kết nối CSDL!");
                throw e;
            }
        }
        return connection;
    }

    // Đóng kết nối
    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("🔌 Kết nối CSDL đã đóng!");
            }
        } catch (SQLException e) {
            System.err.println("⚠️ Lỗi khi đóng kết nối CSDL!");
            e.printStackTrace();
        }
    }

    // Test kết nối
    public static void main(String[] args) {
        try {
            Connection conn = ConnectDB.getConnection();
            if (conn != null) {
                System.out.println("🔥 Kiểm tra kết nối: Thành công!");
                ConnectDB.closeConnection();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

