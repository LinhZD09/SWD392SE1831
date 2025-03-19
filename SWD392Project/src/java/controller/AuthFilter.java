package controller;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;

@WebFilter("/*")
public class AuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {}

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) 
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String uri = request.getRequestURI();

        // ✅ Bỏ qua các trang không cần kiểm tra đăng nhập
        if (uri.endsWith("homepage.jsp") || 
            uri.endsWith("login.jsp") || 
            uri.endsWith("register.jsp") || 
            uri.endsWith("LoginServlet") || 
            uri.endsWith("RegisterServlet") || 
            uri.endsWith("LogoutServlet") || 
            uri.startsWith(request.getContextPath() + "/assets/")) { // Bỏ qua file tĩnh như CSS, JS, IMG
            chain.doFilter(req, res);
            return;
        }

        // ✅ Kiểm tra session nếu truy cập trang yêu cầu đăng nhập
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("homepage.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");

        // ✅ Kiểm tra quyền truy cập trang theo vai trò
        if (uri.contains("admin") && !role.equals("Admin")) {
            response.sendRedirect("accessDenied.jsp");
            return;
        }
        if (uri.contains("customer") && !role.equals("Customer")) {
            response.sendRedirect("accessDenied.jsp");
            return;
        }
        if (uri.contains("procedure") && !role.equals("Procedure")) {
            response.sendRedirect("accessDenied.jsp");
            return;
        }
        if (uri.contains("information") && !role.equals("Information")) {
            response.sendRedirect("accessDenied.jsp");
            return;
        }

        chain.doFilter(req, res);
    }

    public void destroy() {}
}