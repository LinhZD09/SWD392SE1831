/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI
 */
public class Customer {
    private int userId;
    private String membershipLevel;
    private Users user;

    public Customer() {
    }

    public Customer(int userId, String membershipLevel, Users user) {
        this.userId = userId;
        this.membershipLevel = membershipLevel;
        this.user = user;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMembershipLevel() {
        return membershipLevel;
    }

    public void setMembershipLevel(String membershipLevel) {
        this.membershipLevel = membershipLevel;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Customer{" + "userId=" + userId + ", membershipLevel=" + membershipLevel + ", user=" + user + '}';
    }
    
}
