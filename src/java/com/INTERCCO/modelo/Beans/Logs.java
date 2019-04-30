package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Logs {

    private Integer idLogs;
    private Date fchRegistro;
    private Date horaRegistro;
    private String rolUsuario;
    private String tabla;
    private String accion;
    private String idSede;
    private String idUsuario;

    public Logs() {
    }

    public Logs(Integer idLogs) {
        this.idLogs = idLogs;
    }

    public Logs(Integer idLogs, Date fchRegistro, Date horaRegistro, String rolUsuario, String tabla, String accion) {
        this.idLogs = idLogs;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
        this.rolUsuario = rolUsuario;
        this.tabla = tabla;
        this.accion = accion;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdLogs() {
        return idLogs;
    }

    public void setIdLogs(Integer idLogs) {
        this.idLogs = idLogs;
    }

    public Date getFchRegistro() {
        return fchRegistro;
    }

    public void setFchRegistro(Date fchRegistro) {
        this.fchRegistro = fchRegistro;
    }

    public Date getHoraRegistro() {
        return horaRegistro;
    }

    public void setHoraRegistro(Date horaRegistro) {
        this.horaRegistro = horaRegistro;
    }

    public String getRolUsuario() {
        return rolUsuario;
    }

    public void setRolUsuario(String rolUsuario) {
        this.rolUsuario = rolUsuario;
    }

    public String getTabla() {
        return tabla;
    }

    public void setTabla(String tabla) {
        this.tabla = tabla;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getIdSede() {
        return idSede;
    }

    public void setIdSede(String idSede) {
        this.idSede = idSede;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idLogs != null ? idLogs.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Logs)) {
            return false;
        }
        Logs other = (Logs) object;
        if ((this.idLogs == null && other.idLogs != null) || (this.idLogs != null && !this.idLogs.equals(other.idLogs))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Logs[ idLogs=" + idLogs + " ]";
    }
    
}
