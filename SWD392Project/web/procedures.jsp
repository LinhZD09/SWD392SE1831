<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Procedures"%>
<%@page import="model.Category"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách Thủ tục</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
        <style>
            body { font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 20px; }
            table { width: 95%; margin: auto; border-collapse: collapse; background: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
            th, td { padding: 14px; text-align: center; border-bottom: 1px solid #ddd; }
            th { background: #1976d2; color: white; }
            .edit-mode { background-color: #f0f8ff; }
            .edit-btn, .save-btn { cursor: pointer; padding: 5px 10px; border: none; border-radius: 4px; color: white; }
            .edit-btn { background-color: #4caf50; }
            .save-btn { background-color: #ff9800; display: none; }
            .popup-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 999; }
            .popup { display: none; position: fixed; left: 50%; top: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.3); text-align: center; z-index: 1000; border-radius: 5px; }
            .popup button { margin: 10px; padding: 5px 15px; cursor: pointer; }
        </style>
    </head>
    <body>
        <h2 style="text-align:center;">Danh sách Thủ tục</h2>
        <table id="procedureTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tiêu đề</th>
                    <th>Mô tả</th>
                    <th>Danh mục</th>
                    <th>Trạng thái</th>
                    <th>Yêu cầu thanh toán</th>
                    <th>Hình thức nộp</th>
                    <th>Phí</th>
                    <th>Thời gian xử lý</th>
                    <th>Ngày tạo</th>
                    <th>Ngày cập nhật</th>
                    <th>Cơ quan phê duyệt</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Procedures> proceduresList = (List<Procedures>) request.getAttribute("proceduresList"); 
                    List<Category> categories = (List<Category>) request.getAttribute("categories"); 
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String currentDate = sdf.format(new Date());
                %>
                <% if (proceduresList != null && !proceduresList.isEmpty()) { for (Procedures p : proceduresList) { %>
                <tr id="row-<%= p.getProcedureId() %>">
                    <td><%= p.getProcedureId() %></td>
                    <td class="editable" data-field="title" contenteditable="false"><%= p.getTitle() %></td>
                    <td class="editable" data-field="description" contenteditable="false"><%= p.getDescription() %></td>
                    <td>
                        <select class="editable" data-field="categoryId" disabled>
                            <% for (Category c : categories) { %>
                            <option value="<%= c.getCategoryId() %>" <%= (c.getCategoryId() == p.getCategoryId()) ? "selected" : "" %>><%= c.getName() %></option>
                            <% } %>
                        </select>
                    </td>
                    <td>
                        <select class="editable" data-field="status" disabled>
                            <option value="Đang xử lý" <%= "Đang xử lý".equals(p.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="Từ chối" <%= "Từ chối".equals(p.getStatus()) ? "selected" : "" %>>Reject</option>
                            <option value="Hoàn thành" <%= "Hoàn thành".equals(p.getStatus()) ? "selected" : "" %>>Approve</option>
                        </select>
                    </td>
                    <td>
                        <select class="editable" data-field="paymentRequired" disabled>
                            <option value="Có" <%= "Có".equals(p.getPaymentRequired()) ? "selected" : "" %>>Có</option>
                            <option value="Không" <%= "Không".equals(p.getPaymentRequired()) ? "selected" : "" %>>Không</option>
                        </select>
                    </td>
                    <td>
                        <select class="editable" data-field="submissionMethod" disabled>
                            <option value="Trực tiếp" <%= "Trực tiếp".equals(p.getSubmissionMethod()) ? "selected" : "" %>>Trực tiếp</option>
                            <option value="Online" <%= "Online".equals(p.getSubmissionMethod()) ? "selected" : "" %>>Online</option>
                        </select>
                    </td>
                    <td class="editable" data-field="fee" contenteditable="false"><%= p.getFee() %></td>
                    <td class="editable" data-field="processingTime" contenteditable="false"><%= p.getProcessingTime() %></td>
                    <td class="editable" data-field="createdDate" contenteditable="false"><%= p.getCreatedDate() %></td>
                    <td class="editable" data-field="updateDate" contenteditable="false"><%= p.getUpdateDate() %></td>
                    <td class="editable" data-field="approvalAuthority" contenteditable="false"><%= p.getApprovalAuthority() %></td>
                    <td>
                        <button class="edit-btn" data-id="<%= p.getProcedureId() %>">Sửa</button>
                        <button class="save-btn" data-id="<%= p.getProcedureId() %>" style="display:none;">Lưu</button>
                    </td>
                </tr>
                <% } } else { %>
                <tr>
                    <td colspan="13">Không có thủ tục nào được tìm thấy.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Popup -->
        <div class="overlay" id="overlay"></div>
        <div class="popup" id="confirmPopup">
            <p>Bạn có chắc chắn muốn lưu thay đổi?</p>
            <button id="confirmYes">Có</button>
            <button id="confirmNo">Không</button>
        </div>

        <script>
            $(document).ready(function () {
                var currentRow;
                
                $(".edit-btn").click(function () {
                    var id = $(this).data("id");
                    currentRow = $("#row-" + id);
                    currentRow.find(".editable").attr("contenteditable", "true").prop("disabled", false);
                    currentRow.addClass("edit-mode");
                    $(this).hide();
                    currentRow.find(".save-btn").show();
                });

                $(".save-btn").click(function () {
                    currentRow = $(this).closest("tr");
                    $("#overlay").show();
                    $("#confirmPopup").show();
                });

                $("#confirmYes").click(function () {
                    var id = currentRow.find(".save-btn").data("id");
                    currentRow.find(".editable[data-field='updateDate']").text("<%= currentDate %>");
                    currentRow.find(".editable").attr("contenteditable", "false").prop("disabled", true);
                    currentRow.removeClass("edit-mode");
                    currentRow.find(".save-btn").hide();
                    currentRow.find(".edit-btn").show();
                    $("#overlay").hide();
                    $("#confirmPopup").hide();
                });

                $("#confirmNo").click(function () {
                    $("#overlay").hide();
                    $("#confirmPopup").hide();
                });
            });
        </script>
    </body>
</html>