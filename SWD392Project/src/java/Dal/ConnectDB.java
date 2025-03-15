package Dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=SWD392Project";
    private static final String USER = "sa"; // Thay bằng username của bạn
    private static final String PASSWORD = "1234"; // Thay bằng mật khẩu của bạn

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load driver SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Kết nối thành công!");
        } catch (ClassNotFoundException e) {
            System.out.println("Lỗi: Không tìm thấy driver!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối CSDL!");
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        getConnection(); // Kiểm tra kết nối
    }
}