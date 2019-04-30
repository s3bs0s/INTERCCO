package com.INTERCCO.modelo.Beans;

public class Categorias {

    private Integer idCategorias;
    private String nombre;
    private String existencia;
    private int idSede;
    private String NombreSede;

    public Categorias() {
    }

    public Categorias(Integer idCategorias) {
        this.idCategorias = idCategorias;
    }

    public Categorias(Integer idCategorias, String nombre, String existencia) {
        this.idCategorias = idCategorias;
        this.nombre = nombre;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdCategorias() {
        return idCategorias;
    }

    public void setIdCategorias(Integer idCategorias) {
        this.idCategorias = idCategorias;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    /* Metodos Adicionales para la Vista */
    
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
        hash += (idCategorias != null ? idCategorias.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Categorias)) {
            return false;
        }
        Categorias other = (Categorias) object;
        if ((this.idCategorias == null && other.idCategorias != null) || (this.idCategorias != null && !this.idCategorias.equals(other.idCategorias))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Categorias[ idCategorias=" + idCategorias + " ]";
    }
    
}
