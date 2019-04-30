package com.INTERCCO.modelo.Beans;

public class Carruseles {

    private Integer idCarruseles;
    private String tipo;
    private String dirigidoA;
    private String nombreImg;
    private String existencia;
    private int idSede;
    private int IdCiudad;
    private String NombreSede;

    public Carruseles() {
    }

    public Carruseles(Integer idCarruseles) {
        this.idCarruseles = idCarruseles;
    }

    public Carruseles(Integer idCarruseles, String tipo, String dirigidoA, String existencia) {
        this.idCarruseles = idCarruseles;
        this.tipo = tipo;
        this.dirigidoA = dirigidoA;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdCarruseles() {
        return idCarruseles;
    }

    public void setIdCarruseles(Integer idCarruseles) {
        this.idCarruseles = idCarruseles;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDirigidoA() {
        return dirigidoA;
    }

    public void setDirigidoA(String dirigidoA) {
        this.dirigidoA = dirigidoA;
    }
        
    public String getNombreImg() {
        return nombreImg;
    }

    public void setNombreImg(String nombreImg) {
        this.nombreImg = nombreImg;
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
    
    public int getIdCiudad() {
        return IdCiudad;
    }

    public void setIdCiudad(int IdCiudad) {
        this.IdCiudad = IdCiudad;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCarruseles != null ? idCarruseles.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Carruseles)) {
            return false;
        }
        Carruseles other = (Carruseles) object;
        if ((this.idCarruseles == null && other.idCarruseles != null) || (this.idCarruseles != null && !this.idCarruseles.equals(other.idCarruseles))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Carruseles[ idCarruseles=" + idCarruseles + " ]";
    }
    
}
