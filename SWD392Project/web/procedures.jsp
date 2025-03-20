<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Procedures"%>
<%@page import="model.Category"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách Thủ tục</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
                crossorigin="anonymous"></script>
        <style>
            body { font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 20px; }
            table { width: 95%; margin: auto; border-collapse: collapse; background: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
            th, td { padding: 14px; text-align: center; border-bottom: 1px solid #ddd; }
            th { background: #1976d2; color: white; }
            .edit-mode { background-color: #f0f8ff; }
            .edit-btn, .save-btn { cursor: pointer; padding: 5px 10px; border: none; border-radius: 4px; color: white; }
            .edit-btn { background-color: #4caf50; }
            .save-btn { background-color: #ff9800; display: none; }
            .message { text-align: center; font-size: 16px; margin-top: 10px; }
            .success { color: green; }
            .error { color: red; }
            .popup { display: none; position: fixed; left: 50%; top: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.3); text-align: center; z-index: 1000; }
            .popup button { margin: 10px; padding: 5px 15px; cursor: pointer; }
        </style>
    </head>
    <body>
        <h2 style="text-align:center;">Danh sách Thủ tục</h2>

        <table id="procedureTable">
            <thead>
                <tr>
                    <th>Tiêu đề</th>
                    <th>Mô tả</th>
                    <th>Danh mục</th>
                    <th>Ngày tạo</th>
                    <th>Ngày cập nhật</th>
                    <th>Trạng thái</th>
                    <th>Thời gian xử lý</th>
                    <th>Lệ phí</th>
                    <th>Yêu cầu thanh toán</th>
                    <th>Hình thức nộp</th>
                    <th>Cơ quan phê duyệt</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Procedures> proceduresList = (List<Procedures>) request.getAttribute("proceduresList");
                    List<Category> categories = (List<Category>) request.getAttribute("categories");

                    if (proceduresList != null && !proceduresList.isEmpty()) {
                        for (Procedures p : proceduresList) {
                %>
                <tr id="row-<%= p.getProcedureId() %>">
                    <td class="editable" data-field="title"><%= p.getTitle() %></td>
                    <td class="editable" data-field="description"><%= p.getDescription() %></td>
                    <td>
                        <select class="editable" data-field="categoryId">
                            <% for (Category c : categories) { %>
                            <option value="<%= c.getCategoryId() %>" <%= (c.getCategoryId() == p.getCategoryId()) ? "selected" : "" %>><%= c.getName() %></option>
                            <% } %>
                        </select>
                    </td>
                    <td><%= p.getCreatedDate() %></td>
                    <td id="updateDate-<%= p.getProcedureId() %>"><%= p.getUpdateDate() %></td>
                    <td class="editable" data-field="status"><%= p.getStatus() %></td>
                    <td class="editable" data-field="processingTime"><%= p.getProcessingTime() %></td>
                    <td class="editable" data-field="fee" data-value="<%= p.getFee() %>"><%= p.getFee() %> VND</td>
                    <td class="editable" data-field="paymentRequired"><%= p.getPaymentRequired() %></td>
                    <td class="editable" data-field="submissionMethod"><%= p.getSubmissionMethod() %></td>
                    <td class="editable" data-field="approvalAuthority"><%= p.getApprovalAuthority() %></td>
                    <td>
                        <button class="edit-btn" data-id="<%= p.getProcedureId() %>">Sửa</button>
                        <button class="save-btn" data-id="<%= p.getProcedureId() %>">Lưu</button>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="12" class="no-data">Không có thủ tục nào được tìm thấy.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <p class="message" id="message"></p>

        <div id="popup" class="popup">
            <p id="popup-message">Bạn có chắc chắn muốn lưu thay đổi?</p>
            <button id="confirm-save">Xác nhận</button>
            <button id="cancel-save">Hủy</button>
        </div>

        <script>
            $(document).ready(function () {
                if (typeof jQuery === "undefined") {
                    console.error("jQuery không tải được!");
                    return;
                }

                $(".edit-btn").click(function () {
                    var id = $(this).data("id");
                    var row = $("#row-" + id);

                    if (!row.length) {
                        console.error("Không tìm thấy hàng với ID: row-" + id);
                        return;
                    }

                    row.addClass("edit-mode");

                    row.find(".editable").each(function () {
                        var field = $(this).data("field");
                        var currentValue = $(this).text().trim();

                        if (field === "status") {
                            $(this).html(`
                                <select>
                                    <option value="Đang xử lý" ${currentValue == "Đang xử lý" ? "selected" : ""}>Pending</option>
                                    <option value="Từ chối" ${currentValue == "Từ chối" ? "selected" : ""}>Reject</option>
                                    <option value="Hoàn thành" ${currentValue == "Hoàn thành" ? "selected" : ""}>Approve</option>
                                </select>
                            `);
                        } else if (field === "paymentRequired") {
                            $(this).html(`
                                <select>
                                    <option value="Có" ${currentValue == "Có" ? "selected" : ""}>Có</option>
                                    <option value="Không" ${currentValue == "Không" ? "selected" : ""}>Không</option>
                                </select>
                            `);
                        } else if (field === "submissionMethod") {
                            $(this).html(`
                                <select>
                                    <option value="Trực tiếp" ${currentValue == "Trực tiếp" ? "selected" : ""}>Trực tiếp</option>
                                    <option value="Online" ${currentValue == "Online" ? "selected" : ""}>Online</option>
                                </select>
                            `);
                        } else if (field !== "categoryId") {
                            // Dùng data-value cho fee để tránh lấy "VND"
                            var value = field === "fee" ? $(this).attr("data-value") : currentValue;
                            $(this).html(`<input type="text" value="${value}">`);
                        }
                    });

                    $(this).hide();
                    row.find(".save-btn").show();
                });

                let currentRowId;
                $(".save-btn").click(function () {
                    currentRowId = $(this).data("id");
                    var isValid = validateForm(currentRowId);

                    if (isValid) {
                        $("#popup").fadeIn();
                    }
                });

                $("#confirm-save").click(function () {
                    var row = $("#row-" + currentRowId);
                    var updatedData = {};

                    row.find(".editable").each(function () {
                        var field = $(this).data("field");
                        var input = $(this).find("input, select");
                        var value = input.length ? input.val().trim() : $(this).text().trim();
                        updatedData[field] = value;
                    });
                    updatedData["procedureId"] = currentRowId;

                    $.ajax({
                        url: "updateProcedure",
                        type: "POST",
                        data: updatedData,
                        dataType: "json",
                        success: function (response) {
                            $("#popup").fadeOut();
                            if (response.status === "success") {
                                $("#message").text("Cập nhật thành công! 🎉").removeClass("error").addClass("success").fadeIn().fadeOut(3000);
                                setTimeout(function () {
                                    location.reload();
                                }, 1000);
                            } else {
                                $("#message").html(response.message).removeClass("success").addClass("error").fadeIn().fadeOut(5000);
                            }
                        },
                        error: function () {
                            $("#popup").fadeOut();
                            $("#message").text("❌ Lỗi khi gửi yêu cầu!").addClass("error").fadeIn().fadeOut(5000);
                        }
                    });
                });

                $("#cancel-save").click(function () {
                    $("#popup").fadeOut();
                });

                function validateForm(id) {
                    var result = { isValid: true, messages: [] };
                    var row = $("#row-" + id);

                    var title = row.find(".editable[data-field='title'] input").val() || row.find(".editable[data-field='title']").text().trim();
                    var description = row.find(".editable[data-field='description'] input").val() || row.find(".editable[data-field='description']").text().trim();
                    var processingTime = parseInt(row.find(".editable[data-field='processingTime'] input").val() || row.find(".editable[data-field='processingTime']").text(), 10);
                    var feeStr = row.find(".editable[data-field='fee'] input").val() || row.find(".editable[data-field='fee']").attr("data-value");
                    var approvalAuthority = row.find(".editable[data-field='approvalAuthority'] input").val() || row.find(".editable[data-field='approvalAuthority']").text().trim();

                    // Validate fee
                    var fee = parseFloat(feeStr);
                    if (isNaN(fee)) {
                        result.isValid = false;
                        result.messages.push("⚠️ Lệ phí phải là một số hợp lệ!");
                    } else if (fee < 0) {
                        result.isValid = false;
                        result.messages.push("⚠️ Lệ phí không được âm!");
                    }

                    if (!title || title.length < 3) {
                        result.isValid = false;
                        result.messages.push("⚠️ Tiêu đề phải có ít nhất 3 ký tự!");
                    }
                    if (!description || description.length < 5) {
                        result.isValid = false;
                        result.messages.push("⚠️ Mô tả phải có ít nhất 5 ký tự!");
                    }
                    if (isNaN(processingTime) || processingTime <= 0) {
                        result.isValid = false;
                        result.messages.push("⚠️ Thời gian xử lý phải là số nguyên dương!");
                    }
                    if (!approvalAuthority) {
                        result.isValid = false;
                        result.messages.push("⚠️ Cơ quan phê duyệt không được để trống!");
                    }

                    if (!result.isValid) {
                        $("#message").html(result.messages.join("<br>")).addClass("error").fadeIn().fadeOut(5000);
                    }
                    return result.isValid;
                }
            });
        </script>
    </body>
</html>