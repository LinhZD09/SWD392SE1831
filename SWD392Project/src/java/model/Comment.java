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
public class Comment {
    private int commentId;
    private int customerId;
    private LocalDateTime createdDate;
    private String title;
    private String description;
    private int filedId;
    private int answeredBy;

    public Comment() {}

    public Comment(int commentId, int customerId, LocalDateTime createdDate, String title, String description, int filedId, int answeredBy) {
        this.commentId = commentId;
        this.customerId = customerId;
        this.createdDate = createdDate;
        this.title = title;
        this.description = description;
        this.filedId = filedId;
        this.answeredBy = answeredBy;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
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

    public int getFiledId() {
        return filedId;
    }

    public void setFiledId(int filedId) {
        this.filedId = filedId;
    }

    public int getAnsweredBy() {
        return answeredBy;
    }

    public void setAnsweredBy(int answeredBy) {
        this.answeredBy = answeredBy;
    }
}
