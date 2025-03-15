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
public class AdministratorInformation {
    private int userId;
    private int totalArticles;
    private LocalDateTime lastModify;

    public AdministratorInformation() {}

    public AdministratorInformation(int userId, int totalArticles, LocalDateTime lastModify) {
        this.userId = userId;
        this.totalArticles = totalArticles;
        this.lastModify = lastModify;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTotalArticles() {
        return totalArticles;
    }

    public void setTotalArticles(int totalArticles) {
        this.totalArticles = totalArticles;
    }

    public LocalDateTime getLastModify() {
        return lastModify;
    }

    public void setLastModify(LocalDateTime lastModify) {
        this.lastModify = lastModify;
    }
}

