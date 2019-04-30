package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Facturas {

    private Integer idFacturas;
    private Date fchRegistro;
    private Date horaRegistro;
    private String tipoI;
    private String numI;
    private int importe;
    private int total;
    private String existencia;
    private String idCajero;
    private String idSede;

    public Facturas() {
    }

    public Facturas(Integer idFacturas) {
        this.idFacturas = idFacturas;
    }

    public Facturas(Integer idFacturas, Date fchRegistro, Date horaRegistro, String tipoI, String numI, int importe, int total, String existencia) {
        this.idFacturas = idFacturas;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
        this.tipoI = tipoI;
        this.numI = numI;
        this.importe = importe;
        this.total = total;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdFacturas() {
        return idFacturas;
    }

    public void setIdFacturas(Integer idFacturas) {
        this.idFacturas = idFacturas;
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

    public String getTipoI() {
        return tipoI;
    }

    public void setTipoI(String tipoI) {
        this.tipoI = tipoI;
    }

    public String getNumI() {
        return numI;
    }

    public void setNumI(String numI) {
        this.numI = numI;
    }

    public int getImporte() {
        return importe;
    }

    public void setImporte(int importe) {
        this.importe = importe;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public String getIdCajero() {
        return idCajero;
    }

    public void setIdCajero(String idCajero) {
        this.idCajero = idCajero;
    }

    public String getIdSede() {
        return idSede;
    }

    public void setIdSede(String idSede) {
        this.idSede = idSede;
    }

    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFacturas != null ? idFacturas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Facturas)) {
            return false;
        }
        Facturas other = (Facturas) object;
        if ((this.idFacturas == null && other.idFacturas != null) || (this.idFacturas != null && !this.idFacturas.equals(other.idFacturas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Facturas[ idFacturas=" + idFacturas + " ]";
    }
    
}
