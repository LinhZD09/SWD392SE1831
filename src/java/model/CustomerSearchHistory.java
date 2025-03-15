/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI
 */
public class CustomerSearchHistory {
    private int searchHistoryId;
    private int customerId;
    private int accountId;
    private String action;
    private String description;

    public CustomerSearchHistory() {}

    public CustomerSearchHistory(int searchHistoryId, int customerId, int accountId, String action, String description) {
        this.searchHistoryId = searchHistoryId;
        this.customerId = customerId;
        this.accountId = accountId;
        this.action = action;
        this.description = description;
    }

    public int getSearchHistoryId() {
        return searchHistoryId;
    }

    public void setSearchHistoryId(int searchHistoryId) {
        this.searchHistoryId = searchHistoryId;
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
}

