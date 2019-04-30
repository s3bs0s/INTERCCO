package com.INTERCCO.modelo.Beans;

public class Iva {

    private Float porcetaje;
    private String actualizacion;

    public Iva() {
    }

    public Iva(Float porcetaje) {
        this.porcetaje = porcetaje;
    }

    public Iva(Float porcetaje, String actualizacion) {
        this.porcetaje = porcetaje;
        this.actualizacion = actualizacion;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Float getPorcetaje() {
        return porcetaje;
    }

    public void setPorcetaje(Float porcetaje) {
        this.porcetaje = porcetaje;
    }

    public String getActualizacion() {
        return actualizacion;
    }

    public void setActualizacion(String actualizacion) {
        this.actualizacion = actualizacion;
    }

    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (porcetaje != null ? porcetaje.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Iva)) {
            return false;
        }
        Iva other = (Iva) object;
        if ((this.porcetaje == null && other.porcetaje != null) || (this.porcetaje != null && !this.porcetaje.equals(other.porcetaje))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Iva[ porcetaje=" + porcetaje + " ]";
    }
    
}
