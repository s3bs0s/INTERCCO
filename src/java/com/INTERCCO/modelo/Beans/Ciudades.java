package com.INTERCCO.modelo.Beans;

public class Ciudades {

    private Integer idCiudades;
    private String codigoPostal;
    private String nombre;

    public Ciudades() {
    }

    public Ciudades(Integer idCiudades) {
        this.idCiudades = idCiudades;
    }

    public Ciudades(Integer idCiudades, String codigoPostal, String nombre) {
        this.idCiudades = idCiudades;
        this.codigoPostal = codigoPostal;
        this.nombre = nombre;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdCiudades() {
        return idCiudades;
    }

    public void setIdCiudades(Integer idCiudades) {
        this.idCiudades = idCiudades;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCiudades != null ? idCiudades.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ciudades)) {
            return false;
        }
        Ciudades other = (Ciudades) object;
        if ((this.idCiudades == null && other.idCiudades != null) || (this.idCiudades != null && !this.idCiudades.equals(other.idCiudades))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Ciudades[ idCiudades=" + idCiudades + " ]";
    }
    
}
