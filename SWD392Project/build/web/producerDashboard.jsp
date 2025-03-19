<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Producer Dashboard - SWD392 Project</title>
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
        .procedures, .templates {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 45%;
        }
        .procedures h2, .templates h2 {
            color: #2c3e50;
        }
        .procedure-item, .template-item {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }
        .procedure-item:last-child, .template-item:last-child {
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
        <p>Chào mừng bạn đến với Dashboard Producer</p>
    </div>

    <div class="nav">
        <a href="producerDashboard.jsp">Trang Chủ</a>
        <a href="get-earliest-submission">Xử lý thủ tục</a>
        <a href="manageTemplates">Quản Lý Mẫu</a>
                <% if (session.getAttribute("fullName") == null) { %>
            <a href="login.jsp">Đăng Nhập</a>
        <% } else { %>
            <span class="user-info"> <%= session.getAttribute("fullName") %></span>
            <a href="logout">Đăng Xuất</a>
        <% } %>    </div>

    <div class="container">
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

        <div class="templates">
            <h2>Danh Sách Mẫu Thủ Tục</h2>
            <c:forEach var="template" items="${templateList}">
                <div class="template-item">
                    <h3>${template.title}</h3>
                    <p>${template.description}</p>
                    <a href="editTemplate?id=${template.templateId}">Chỉnh Sửa</a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="footer">
        <p>© 2025 SWD392 Project. All rights reserved.</p>
    </div>
</body>
</html>