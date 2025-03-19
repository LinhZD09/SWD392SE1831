/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import java.util.Date;

/**
 *
 * @author MSI
 */
public class ProcedureSubmission {
    private int submissionId;
    private int customerId;
    private int templateId;
    private String title;
    private String description;
    private Date submissionDate;
    private String status;
    private int adminProcedureId;

    public ProcedureSubmission(int submissionId, int customerId, int templateId, String title, String description, Date submissionDate, String status) {
        this.submissionId = submissionId;
        this.customerId = customerId;
        this.templateId = templateId;
        this.title = title;
        this.description = description;
        this.submissionDate = submissionDate;
        this.status = status;
    }

    public int getSubmissionId() {
        return submissionId;
    }

    public void setSubmissionId(int submissionId) {
        this.submissionId = submissionId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getTemplateId() {
        return templateId;
    }

    public void setTemplateId(int templateId) {
        this.templateId = templateId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAdminProcedureId() {
        return adminProcedureId;
    }

    public void setAdminProcedureId(int adminProcedureId) {
        this.adminProcedureId = adminProcedureId;
    }
}
