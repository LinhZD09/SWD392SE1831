/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Procedures;
import service.GetProcedureService;

/**
 *
 * @author MSI
 */
public class UpdateProcedureServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProcedureServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProcedureServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final GetProcedureService procedureService = new GetProcedureService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JsonObject jsonResponse = new JsonObject();

        try {
            // Lấy dữ liệu từ request và kiểm tra trước khi parse
            String procedureIdStr = request.getParameter("procedureId");
            String categoryIdStr = request.getParameter("categoryId");
            String processingTimeStr = request.getParameter("processingTime");
            String feeStr = request.getParameter("fee");

            // Kiểm tra các tham số số
            if (procedureIdStr == null || procedureIdStr.trim().isEmpty()) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "⚠️ ID thủ tục không được để trống!");
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }
            if (categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "⚠️ ID danh mục không được để trống!");
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }
            if (processingTimeStr == null || processingTimeStr.trim().isEmpty()) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "⚠️ Thời gian xử lý không được để trống!");
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }
            if (feeStr == null || feeStr.trim().isEmpty()) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "⚠️ Lệ phí không được để trống!");
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }

            // Parse dữ liệu
            int procedureId = Integer.parseInt(procedureIdStr);
            int categoryId = Integer.parseInt(categoryIdStr);
            int processingTime = Integer.parseInt(processingTimeStr);
            double fee = Double.parseDouble(feeStr);

            String title = request.getParameter("title").trim();
            String description = request.getParameter("description").trim();
            String status = request.getParameter("status");
            String paymentRequired = request.getParameter("paymentRequired");
            String submissionMethod = request.getParameter("submissionMethod");
            String approvalAuthority = request.getParameter("approvalAuthority");

            // Tạo đối tượng Procedures
            Procedures procedure = new Procedures(procedureId, title, description, categoryId, null, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority);

            // Validate dữ liệu
            String validationError = procedureService.validateProcedure(procedure);
            if (validationError != null) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", validationError);
            } else {
                boolean updated = procedureService.updateProcedure(procedure);
                if (updated) {
                    jsonResponse.addProperty("status", "success");
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Cập nhật không thành công!");
                }
            }
        
        } catch (SQLException | ClassNotFoundException e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "⚠️ Lỗi hệ thống! Vui lòng thử lại sau.");
            e.printStackTrace();
        }

        out.print(jsonResponse.toString());
        out.flush();
    }       
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}