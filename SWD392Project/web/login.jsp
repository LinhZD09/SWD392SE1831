<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập - SWD392 Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 300px;
        }
        .login-container h2 {
            text-align: center;
            color: #2c3e50;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 3px;
            box-sizing: border-box;
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #34495e;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
        .login-container a {
            color: #2c3e50;
            text-decoration: none;
        }
        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <%-- Hiển thị thông báo lỗi nếu có --%>
        <% if (request.getParameter("error") != null) { %>
            <div class="error">
                <% 
                    String error = request.getParameter("error");
                    String message = request.getParameter("message");
                    if ("invalid_credentials".equals(error)) {
                        out.print("Tên đăng nhập hoặc mật khẩu không đúng!");
                    } else if ("server_error".equals(error)) {
                        out.print("Lỗi hệ thống, vui lòng thử lại sau! Chi tiết: " + (message != null ? message : "Không xác định"));
                    } else if ("empty_fields".equals(error)) {
                        out.print("Vui lòng nhập đầy đủ thông tin!");
                    } else if ("invalid_role".equals(error)) {
                        out.print("Vai trò không hợp lệ!");
                    } else {
                        out.print("Lỗi: " + error);
                    }
                %>
            </div>
        <% } %>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <input type="submit" value="Đăng Nhập">
        </form>
        <p style="text-align: center; margin-top: 10px;">
            Chưa có tài khoản? <a href="signup.jsp">Đăng Ký</a>
        </p>
        <p style="text-align: center; margin-top: 10px;">
            Trang chủ <a href="homepage.jsp">Homepage</a>
        </p>
    </div>
</body>
</html>