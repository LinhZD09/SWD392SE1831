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
public class AdministratorProcedure {
    private int adminProcedureId;
    private int procedureCount;
    private LocalDateTime lastUpdated;

    public AdministratorProcedure() {}

    public AdministratorProcedure(int adminProcedureId, int procedureCount, LocalDateTime lastUpdated) {
        this.adminProcedureId = adminProcedureId;
        this.procedureCount = procedureCount;
        this.lastUpdated = lastUpdated;
    }

    public int getAdminProcedureId() {
        return adminProcedureId;
    }

    public void setAdminProcedureId(int adminProcedureId) {
        this.adminProcedureId = adminProcedureId;
    }

    public int getProcedureCount() {
        return procedureCount;
    }

    public void setProcedureCount(int procedureCount) {
        this.procedureCount = procedureCount;
    }

    public LocalDateTime getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(LocalDateTime lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}

