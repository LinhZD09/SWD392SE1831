<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ProcedureSubmission" %>
<%@ page import="com.google.gson.JsonParser, com.google.gson.JsonObject, com.google.gson.JsonArray, com.google.gson.JsonElement" %>
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
                <h2><%= submission.getTitle() %></h2>
                <p><strong>Mô tả:</strong> <%= submission.getDescription() %></p>
                <p><strong>Ngày nộp:</strong> <%= submission.getSubmissionDate() %></p>
                <p><strong>Trạng thái:</strong> 
                    <span class="<%= "Pending".equals(submission.getStatus()) ? "pending" : ("Approved".equals(submission.getStatus()) ? "approved" : "rejected") %>">
                        <%= submission.getStatus() %>
                    </span>
                </p>

                <h3>Chi tiết hồ sơ:</h3>
                <div class="submission-details">
                    <% 
                    if (submission.getTemplateData() != null) {
                        try {
                            JsonParser parser = new JsonParser();
                            JsonElement jsonElement = parser.parse(submission.getTemplateData());
                            if (jsonElement.isJsonObject()) {
                                JsonObject jsonData = jsonElement.getAsJsonObject();
                                JsonArray fields = jsonData.getAsJsonArray("fields");

                                for (JsonElement fieldElement : fields) {
                                    JsonObject field = fieldElement.getAsJsonObject();
                                    String label = field.get("label").getAsString();
                                    String content = field.has("content") && !field.get("content").isJsonNull() ? field.get("content").getAsString() : "(Không có dữ liệu)";
                    %>
                    <p>
                        <strong><%= label %>:</strong>
                        <span><%= content %></span>
                    </p>
                    <% 
                                }
                            } else {
                    %>
                    <p class="error">(Dữ liệu template không hợp lệ: <%= submission.getTemplateData() %>)</p>
                    <% 
                            }
                        } catch (Exception e) {
                    %>
                    <p class="error">(Lỗi khi đọc dữ liệu template: <%= e.getMessage() %>)</p>
                    <% 
                        }
                    } else { 
                    %>
                    <p class="error">(Không có dữ liệu template)</p>
                    <% } %>
                </div>

                <div class="button-group">
                    <button class="approve" onclick="openPopup()">Duyệt</button>
                    <button class="reject" onclick="rejectSubmission(<%= submission.getSubmissionId() %>)">Từ chối</button>
                </div>
            </div>

            <div id="popup" class="popup">
                <div class="popup-content">
                    <h3>Xác nhận duyệt hồ sơ</h3>
                    <p>Bạn có chắc chắn muốn duyệt submission này?</p>
                    <button onclick="closePopup()">Hủy</button>
                    <button class="confirm" onclick="approveSubmission(<%= submission.getSubmissionId() %>)">Xác nhận</button>
                </div>
            </div>
            <% } } %>
        </div>

        <script>
            function openPopup() {
                document.getElementById("popup").style.display = "block";
            }
            function closePopup() {
                document.getElementById("popup").style.display = "none";
            }
            function approveSubmission(submissionId) {
                fetch("/approve-submission", {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
                    body: `submissionId=${submissionId}`
                }).then(() => {
                    alert("Hồ sơ đã được duyệt!");
                    location.reload();
                });
            }
            function rejectSubmission(submissionId) {
                fetch("/reject-submission", {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
                    body: `submissionId=${submissionId}`
                }).then(() => {
                    alert("Hồ sơ đã bị từ chối!");
                    location.reload();
                });
            }
        </script>
    </body>
</html>