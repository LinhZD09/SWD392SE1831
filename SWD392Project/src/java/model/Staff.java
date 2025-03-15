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

public class Staff {
    private int userId;
    private String position;
    private String status;
    private String department;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private Users user;

    public Staff(int userId, String position, String status, String department, LocalDateTime startDate, LocalDateTime endDate, Users user) {
        this.userId = userId;
        this.position = position;
        this.status = status;
        this.department = department;
        this.startDate = startDate;
        this.endDate = endDate;
        this.user = user;
    }

    public Staff() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Staff{" + "userId=" + userId + ", position=" + position + ", status=" + status + ", department=" + department + ", startDate=" + startDate + ", endDate=" + endDate + ", user=" + user + '}';
    }
    
}