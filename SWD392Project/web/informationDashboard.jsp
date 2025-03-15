<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Information Dashboard - SWD392 Project</title>
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
        .news, .content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 45%;
        }
        .news h2, .content h2 {
            color: #2c3e50;
        }
        .news-item, .content-item {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }
        .news-item:last-child, .content-item:last-child {
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
        <p>Chào mừng bạn đến với Dashboard Information</p>
    </div>

    <div class="nav">
        <a href="informationDashboard.jsp">Trang Chủ</a>
        <a href="manageNews">Quản Lý Tin Tức</a>
        <a href="manageContent">Quản Lý Nội Dung</a>
               <% if (session.getAttribute("fullName") == null) { %>
            <a href="login.jsp">Đăng Nhập</a>
        <% } else { %>
            <span class="user-info">Information <%= session.getAttribute("fullName") %> </span>
            <a href="logout">Đăng Xuất</a>
        <% } %>
    </div>

    <div class="container">
        <div class="news">
            <h2>Danh Sách Tin Tức</h2>
            <c:forEach var="news" items="${newsList}">
                <div class="news-item">
                    <h3>${news.title}</h3>
                    <p>${news.description}</p>
                    <a href="editNews?id=${news.newsId}">Chỉnh Sửa</a>
                </div>
            </c:forEach>
        </div>

        <div class="content">
            <h2>Danh Sách Nội Dung</h2>
            <c:forEach var="content" items="${contentList}">
                <div class="content-item">
                    <h3>${content.title}</h3>
                    <p>${content.description}</p>
                    <a href="editContent?id=${content.contentId}">Chỉnh Sửa</a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="footer">
        <p>© 2025 SWD392 Project. All rights reserved.</p>
    </div>
</body>
</html>