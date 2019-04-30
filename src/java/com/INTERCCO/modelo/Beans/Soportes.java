package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Soportes {

    private Integer idSoportes;
    private Date fchSolicitud;
    private Date fchResuelto;
    private String descripcion;
    private String ruta;
    private String estado;
    private String idSede;
    private Integer idUsuario;
    private String EmailUsuario;

    public Soportes() {
    }

    public Soportes(Integer idSoportes) {
        this.idSoportes = idSoportes;
    }

    public Soportes(Integer idSoportes, Date fchSolicitud, String descripcion, String ruta, String estado) {
        this.idSoportes = idSoportes;
        this.fchSolicitud = fchSolicitud;
        this.descripcion = descripcion;
        this.ruta = ruta;
        this.estado = estado;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdSoportes() {
        return idSoportes;
    }

    public void setIdSoportes(Integer idSoportes) {
        this.idSoportes = idSoportes;
    }

    public Date getFchSolicitud() {
        return fchSolicitud;
    }

    public void setFchSolicitud(Date fchSolicitud) {
        this.fchSolicitud = fchSolicitud;
    }

    public Date getFchResuelto() {
        return fchResuelto;
    }

    public void setFchResuelto(Date fchResuelto) {
        this.fchResuelto = fchResuelto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdSede() {
        return idSede;
    }

    public void setIdSede(String idSede) {
        this.idSede = idSede;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    /* Metodos Adicionales para la Vista */
    
    public String getEmailUsuario() {
        return EmailUsuario;
    }

    public void setEmailUsuario(String EmailUsuario) {
        this.EmailUsuario = EmailUsuario;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSoportes != null ? idSoportes.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Soportes)) {
            return false;
        }
        Soportes other = (Soportes) object;
        if ((this.idSoportes == null && other.idSoportes != null) || (this.idSoportes != null && !this.idSoportes.equals(other.idSoportes))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Soportes[ idSoportes=" + idSoportes + " ]";
    }
    
}
