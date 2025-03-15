/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author MSI
 */
public class ProceduresHistory {
    private int procedureHistoryId;
    private int customerId;
    private int accountId;
    private String action;
    private String description;
    private String detail;
    private LocalDateTime dateAccept;
    private String status;

    public ProceduresHistory() {}

    public ProceduresHistory(int procedureHistoryId, int customerId, int accountId, String action, String description, String detail, LocalDateTime dateAccept, String status) {
        this.procedureHistoryId = procedureHistoryId;
        this.customerId = customerId;
        this.accountId = accountId;
        this.action = action;
        this.description = description;
        this.detail = detail;
        this.dateAccept = dateAccept;
        this.status = status;
    }

    public int getProcedureHistoryId() {
        return procedureHistoryId;
    }

    public void setProcedureHistoryId(int procedureHistoryId) {
        this.procedureHistoryId = procedureHistoryId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public LocalDateTime getDateAccept() {
        return dateAccept;
    }

    public void setDateAccept(LocalDateTime dateAccept) {
        this.dateAccept = dateAccept;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
