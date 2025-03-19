<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ProcedureSubmission" %>
<%@ page import="com.google.gson.JsonParser, com.google.gson.JsonObject, com.google.gson.JsonArray, com.google.gson.JsonElement" %>
<%
    if (request.getAttribute("submission") == null && request.getAttribute("error") == null) {
        response.sendRedirect("get-earliest-submission");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Review Submission</title>
        <link rel="stylesheet" type="text/css" href="Webapp/Css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Thông tin hồ sơ</h1>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <p class="error"><%= error %></p>
            <% } else { 
                ProcedureSubmission submission = (ProcedureSubmission) request.getAttribute("submission");
                if (submission != null && submission.getStatus() != null) { %>
            <div class="submission-card">
                <h2 id="submission-title"><%= submission.getTitle() %></h2>
                <p><strong>Ngày nộp:</strong> <span id="submission-date"><%= submission.getSubmissionDate() %></span></p>
                <p><strong>Trạng thái:</strong> 
                    <span id="submission-status" class="<%= submission.getStatus().toLowerCase() %>">
                        <%= submission.getStatus() %>
                    </span>
                </p>

                <h3>Chi tiết hồ sơ:</h3>
                <div class="submission-details">
                    <% if (submission.getDescription() != null) {
                        try {
                            JsonParser parser = new JsonParser();
                            JsonElement jsonElement = parser.parse(submission.getDescription());
                            if (jsonElement.isJsonObject()) {
                                JsonObject jsonData = jsonElement.getAsJsonObject();
                                JsonArray fields = jsonData.getAsJsonArray("fields");

                                for (JsonElement fieldElement : fields) {
                                    JsonObject field = fieldElement.getAsJsonObject();
                                    String label = field.get("label").getAsString();
                                    String content = field.has("content") && !field.get("content").isJsonNull() ? field.get("content").getAsString() : "(Không có dữ liệu)";
                    %>
                    <p><strong><%= label %>:</strong> <span><%= content %></span></p>
                    <% 
                                }
                            } else { %>
                                <p class="error">(Dữ liệu template không hợp lệ: <%= submission.getDescription() %>)</p>
                    <% } 
                        } catch (Exception e) { %>
                            <p class="error">(Lỗi khi đọc dữ liệu template: <%= e.getMessage() %>)</p>
                    <% } 
                    } else { %>
                        <p class="error">(Không có dữ liệu template)</p>
                    <% } %>
                </div>

                <div class="button-group">
                    <button class="approve" onclick="openPopup('approve', <%= submission.getSubmissionId() %>)">Duyệt</button>
                    <button class="reject" onclick="openPopup('reject', <%= submission.getSubmissionId() %>)">Từ chối</button>
                </div>
            </div>
            <% } else { %>
                <h2>Không còn hồ sơ nào để duyệt.</h2>
            <% } } %>
        </div>

        <!-- Popup xác nhận -->
<div id="popup" class="popup" style="display: none;">
    <div class="popup-content">
        <h3 id="popup-title">Xác nhận</h3>
        <p id="popup-message"></p>
        <button onclick="closePopup()">Hủy</button>
        <button class="confirm" onclick="confirmAction()">Xác nhận</button>
    </div>
</div>

<!-- Thông báo -->
<div id="notification" style="display: none;">
    <p id="notification-message"></p>
</div>

<style>
    #notification {
        position: fixed;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        background: #4CAF50;
        color: white;
        padding: 15px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        z-index: 1000;
    }
</style>

<script>
    let actionType = "";
    let submissionId = 0;

    function openPopup(action, id) {
        actionType = action;
        submissionId = id;

        if (action === "approve") {
            document.getElementById("popup-title").innerText = "Xác nhận duyệt hồ sơ";
            document.getElementById("popup-message").innerText = "Bạn có chắc chắn muốn duyệt hồ sơ này?";
        } else {
            document.getElementById("popup-title").innerText = "Xác nhận từ chối hồ sơ";
            document.getElementById("popup-message").innerText = "Bạn có chắc chắn muốn từ chối hồ sơ này?";
        }

        document.getElementById("popup").style.display = "block";
    }

    function closePopup() {
        document.getElementById("popup").style.display = "none";
    }

    function confirmAction() {
        // Hiện thông báo trước khi gửi form
        const notification = document.getElementById("notification");
        const message = actionType === "approve" ? "Hồ sơ đã được duyệt thành công!" : "Hồ sơ đã bị từ chối!";
        
        document.getElementById("notification-message").innerText = message;
        notification.style.display = "block";

        // Ẩn popup
        closePopup();

        // Chờ 2 giây rồi gửi form
        setTimeout(() => {
            const form = document.createElement("form");
            form.method = "post";
            form.action = actionType === "approve" ? "approve-submission" : "reject-submission";

            const input = document.createElement("input");
            input.type = "hidden";
            input.name = "submissionId";
            input.value = submissionId;
            form.appendChild(input);

            document.body.appendChild(form);
            form.submit();
        }, 1000);
    }
</script>

    </body>
</html>
