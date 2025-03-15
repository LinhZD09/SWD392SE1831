/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI
 */

public class CustomerProcedureTemplate {
    private int customerId;
    private int templateId;

    public CustomerProcedureTemplate() {}

    public CustomerProcedureTemplate(int customerId, int templateId) {
        this.customerId = customerId;
        this.templateId = templateId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getTemplateId() {
        return templateId;
    }

    public void setTemplateId(int templateId) {
        this.templateId = templateId;
    }
}
