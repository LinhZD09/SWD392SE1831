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
public class Users {
    private int userId;
    private String fullName;
    private String address;
    private Date dob;
    private String gender;
    private String role;
    private LocalDateTime createdAt;
    private Date updatedAt;

    public Users() {}

    public Users(int userId, String fullName, String address, Date dob, String gender, String role, LocalDateTime createdAt, Date updatedAt) {
        this.userId = userId;
        this.fullName = fullName;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Users{userId=" + userId + ", fullName='" + fullName + "', address='" + address + "', dob=" + dob + ", gender='" + gender + "', role='" + role + "', createdAt=" + createdAt + ", updatedAt=" + updatedAt + "}";
    }
}