package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy session hiện tại (nếu có)
        HttpSession session = request.getSession(false);

        // Kiểm tra nếu session tồn tại thì xóa toàn bộ thông tin trong session
        if (session != null) {
            session.invalidate(); // Hủy session
        }

        // Chuyển hướng về trang đăng nhập
        response.sendRedirect("homepage.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Gọi lại doGet để xử lý
    }
}