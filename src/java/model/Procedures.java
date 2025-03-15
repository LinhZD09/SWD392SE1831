/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author MSI
 */

public class Procedures {
    private int procedureId;
    private String title;
    private String description;
    private int categoryId;
    private LocalDateTime createdDate;
    private Date updateDate;
    private String status;
    private int processingTime;
    private double fee;
    private String paymentRequired;
    private String submissionMethod;
    private String approvalAuthority;
    private Category category;

    public Procedures() {
    }

    public Procedures(int procedureId, String title, String description, int categoryId, LocalDateTime createdDate, Date updateDate, String status, int processingTime, double fee, String paymentRequired, String submissionMethod, String approvalAuthority, Category category) {
        this.procedureId = procedureId;
        this.title = title;
        this.description = description;
        this.categoryId = categoryId;
        this.createdDate = createdDate;
        this.updateDate = updateDate;
        this.status = status;
        this.processingTime = processingTime;
        this.fee = fee;
        this.paymentRequired = paymentRequired;
        this.submissionMethod = submissionMethod;
        this.approvalAuthority = approvalAuthority;
        this.category = category;
    }

    public int getProcedureId() {
        return procedureId;
    }

    public void setProcedureId(int procedureId) {
        this.procedureId = procedureId;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getProcessingTime() {
        return processingTime;
    }

    public void setProcessingTime(int processingTime) {
        this.processingTime = processingTime;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }

    public String getPaymentRequired() {
        return paymentRequired;
    }

    public void setPaymentRequired(String paymentRequired) {
        this.paymentRequired = paymentRequired;
    }

    public String getSubmissionMethod() {
        return submissionMethod;
    }

    public void setSubmissionMethod(String submissionMethod) {
        this.submissionMethod = submissionMethod;
    }

    public String getApprovalAuthority() {
        return approvalAuthority;
    }

    public void setApprovalAuthority(String approvalAuthority) {
        this.approvalAuthority = approvalAuthority;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Procedures{" + "procedureId=" + procedureId + ", title=" + title + ", description=" + description + ", categoryId=" + categoryId + ", createdDate=" + createdDate + ", updateDate=" + updateDate + ", status=" + status + ", processingTime=" + processingTime + ", fee=" + fee + ", paymentRequired=" + paymentRequired + ", submissionMethod=" + submissionMethod + ", approvalAuthority=" + approvalAuthority + ", category=" + category + '}';
    } 
}