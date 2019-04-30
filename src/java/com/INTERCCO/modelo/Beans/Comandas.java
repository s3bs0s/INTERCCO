package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Comandas {

    private Integer idComandas;
    private Date fchRegistro;
    private Date horaRegistro;
    private String idPedido;

    public Comandas() {
    }

    public Comandas(Integer idComandas) {
        this.idComandas = idComandas;
    }

    public Comandas(Integer idComandas, Date fchRegistro, Date horaRegistro) {
        this.idComandas = idComandas;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdComandas() {
        return idComandas;
    }

    public void setIdComandas(Integer idComandas) {
        this.idComandas = idComandas;
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

    public String getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(String idPedido) {
        this.idPedido = idPedido;
    }

    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idComandas != null ? idComandas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comandas)) {
            return false;
        }
        Comandas other = (Comandas) object;
        if ((this.idComandas == null && other.idComandas != null) || (this.idComandas != null && !this.idComandas.equals(other.idComandas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Comandas[ idComandas=" + idComandas + " ]";
    }
    
}
