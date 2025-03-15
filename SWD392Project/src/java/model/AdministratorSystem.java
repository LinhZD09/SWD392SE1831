/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI
 */
public class AdministratorSystem {
    private int userId;
    private int totalUsers;
    private int bannedUsers;

    public AdministratorSystem() {}

    public AdministratorSystem(int userId, int totalUsers, int bannedUsers) {
        this.userId = userId;
        this.totalUsers = totalUsers;
        this.bannedUsers = bannedUsers;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTotalUsers() {
        return totalUsers;
    }

    public void setTotalUsers(int totalUsers) {
        this.totalUsers = totalUsers;
    }

    public int getBannedUsers() {
        return bannedUsers;
    }

    public void setBannedUsers(int bannedUsers) {
        this.bannedUsers = bannedUsers;
    }
}

