/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI
 */
public class CustomerProcedure {
    private int userId;
    private int procedureId;

    public CustomerProcedure() {}

    public CustomerProcedure(int userId, int procedureId) {
        this.userId = userId;
        this.procedureId = procedureId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProcedureId() {
        return procedureId;
    }

    public void setProcedureId(int procedureId) {
        this.procedureId = procedureId;
    }
}
