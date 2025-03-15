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

public class News {
    private int newsId;
    private String title;
    private String description;
    private LocalDateTime createDate;

    public News() {}

    public News(int newsId, String title, String description, LocalDateTime createDate) {
        this.newsId = newsId;
        this.title = title;
        this.description = description;
        this.createDate = createDate;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
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

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "News{newsId=" + newsId + ", title='" + title + "', description='" + description + "', createDate=" + createDate + "}";
    }
}