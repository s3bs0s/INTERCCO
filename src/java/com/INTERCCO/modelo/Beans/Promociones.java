package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Promociones {

    private Integer idPromociones;
    private Date fchRegistro;
    private Date horaRegistro;
    private float porcentajePromo;
    private Date fchCaducidad;
    private String existencia;
    private Integer idProducto;
    private int idSede;
    private String NombreSede;
    private String NombreProducto;

    public Promociones() {
    }

    public Promociones(Integer idPromociones) {
        this.idPromociones = idPromociones;
    }

    public Promociones(Integer idPromociones, Date fchRegistro, Date horaRegistro, float porcentajePromo, Date fchCaducidad, String existencia) {
        this.idPromociones = idPromociones;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
        this.porcentajePromo = porcentajePromo;
        this.fchCaducidad = fchCaducidad;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdPromociones() {
        return idPromociones;
    }

    public void setIdPromociones(Integer idPromociones) {
        this.idPromociones = idPromociones;
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

    public float getPorcentajePromo() {
        return porcentajePromo;
    }

    public void setPorcentajePromo(float porcentajePromo) {
        this.porcentajePromo = porcentajePromo;
    }

    public Date getFchCaducidad() {
        return fchCaducidad;
    }

    public void setFchCaducidad(Date fchCaducidad) {
        this.fchCaducidad = fchCaducidad;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    /* Metodos Adicionales para la Vista */
    
    public String getNombreProducto() {
        return NombreProducto;
    }

    public void setNombreProducto(String NombreProducto) {
        this.NombreProducto = NombreProducto;
    }
    
    public String getNombreSede() {
        return NombreSede;
    }

    public void setNombreSede(String NombreSede) {
        this.NombreSede = NombreSede;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPromociones != null ? idPromociones.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Promociones)) {
            return false;
        }
        Promociones other = (Promociones) object;
        if ((this.idPromociones == null && other.idPromociones != null) || (this.idPromociones != null && !this.idPromociones.equals(other.idPromociones))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Promociones[ idPromociones=" + idPromociones + " ]";
    }
    
}
