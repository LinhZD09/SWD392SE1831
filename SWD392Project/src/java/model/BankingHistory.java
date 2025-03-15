/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author MSI
 */
public class BankingHistory {
    private int bankingHistoryId;
    private int customerId;
    private int accountId;
    private String action;
    private String description;
    private String orderId;
    private String detail;
    private BigDecimal amount;

    public BankingHistory() {}

    public BankingHistory(int bankingHistoryId, int customerId, int accountId, String action, String description, String orderId, String detail, BigDecimal amount) {
        this.bankingHistoryId = bankingHistoryId;
        this.customerId = customerId;
        this.accountId = accountId;
        this.action = action;
        this.description = description;
        this.orderId = orderId;
        this.detail = detail;
        this.amount = amount;
    }

    public int getBankingHistoryId() {
        return bankingHistoryId;
    }

    public void setBankingHistoryId(int bankingHistoryId) {
        this.bankingHistoryId = bankingHistoryId;
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

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
}
