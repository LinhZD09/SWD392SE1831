<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - SWD392 Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .nav {
            background-color: #34495e;
            padding: 10px;
            text-align: center;
        }
        .nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-weight: bold;
        }
        .nav a:hover {
            color: #3498db;
        }
        .nav .user-info {
            color: white;
            margin: 0 15px;
            font-weight: bold;
            display: inline-block;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            display: flex;
            justify-content: space-between;
        }
        .users, .procedures {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 45%;
        }
        .users h2, .procedures h2 {
            color: #2c3e50;
        }
        .user-item, .procedure-item {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }
        .user-item:last-child, .procedure-item:last-child {
            border-bottom: none;
        }
        .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Hệ Thống Quản Lý Thủ Tục Hành Chính</h1>
        <p>Chào mừng bạn đến với Dashboard Admin</p>
    </div>

    <div class="nav">
        <a href="adminDashboard.jsp">Trang Chủ</a>
        <a href="manageUsers">Quản Lý Người Dùng</a>
        <a href="manageProcedures">Quản Lý Thủ Tục</a>
               <% if (session.getAttribute("fullName") == null) { %>
            <a href="login.jsp">Đăng Nhập</a>
        <% } else { %>
            <span class="user-info"> <%= session.getAttribute("fullName") %> </span>
            <a href="logout">Đăng Xuất</a>
        <% } %>
    </div>

    <div class="container">
        <div class="users">
            <h2>Danh Sách Người Dùng</h2>
            <c:forEach var="user" items="${userList}">
                <div class="user-item">
                    <h3>${user.fullName}</h3>
                    <p>Vai trò: ${user.role} | Trạng thái: ${user.status}</p>
                    <a href="editUser?id=${user.userId}">Chỉnh Sửa</a>
                </div>
            </c:forEach>
        </div>

        <div class="procedures">
            <h2>Danh Sách Thủ Tục</h2>
            <c:forEach var="procedure" items="${procedureList}">
                <div class="procedure-item">
                    <h3>${procedure.title}</h3>
                    <p>${procedure.description}</p>
                    <a href="editProcedure?id=${procedure.procedureId}">Chỉnh Sửa</a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="footer">
        <p>© 2025 SWD392 Project. All rights reserved.</p>
    </div>
</body>
</html>