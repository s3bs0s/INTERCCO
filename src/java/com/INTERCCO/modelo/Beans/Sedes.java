package com.INTERCCO.modelo.Beans;

public class Sedes {

    private Integer idSedes;
    private String nombre;
    private String rango;
    private String direccion;
    private Integer numMesas;
    private String srcMapa;
    private int idCiudad;
    private String NombreCiudad;
    private String TienePrincipal;
    private String DiasHorario;
    private String HorasHorario;
    private String HorariosSede;

    public Sedes() {
    }

    public Sedes(Integer idSedes) {
        this.idSedes = idSedes;
    }

    public Sedes(Integer idSedes, String nombre, String rango, String direccion, Integer numMesas, String srcMapa) {
        this.idSedes = idSedes;
        this.nombre = nombre;
        this.rango = rango;
        this.direccion = direccion;
        this.numMesas = numMesas;
        this.srcMapa = srcMapa;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdSedes() {
        return idSedes;
    }

    public void setIdSedes(Integer idSedes) {
        this.idSedes = idSedes;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRango() {
        return rango;
    }

    public void setRango(String rango) {
        this.rango = rango;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getNumMesas() {
        return numMesas;
    }

    public void setNumMesas(Integer numMesas) {
        this.numMesas = numMesas;
    }

    public String getSrcMapa() {
        return srcMapa;
    }

    public void setSrcMapa(String srcMapa) {
        this.srcMapa = srcMapa;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    /* Metodos Adicionales para la Vista */
    
    public String getDiasHorario() {
        return DiasHorario;
    }

    public void setDiasHorario(String DiasHorario) {
        this.DiasHorario = DiasHorario;
    }
    
    public String getHorasHorario() {
        return HorasHorario;
    }

    public void setHorasHorario(String HorasHorario) {
        this.HorasHorario = HorasHorario;
    }
    
    public String getHorariosSede() {
        return HorariosSede;
    }

    public void setHorariosSede(String HorariosSede) {
        this.HorariosSede = HorariosSede;
    
    }
    
    public String getNombreCiudad() {
        return NombreCiudad;
    }

    public void setNombreCiudad(String NombreCiudad) {
        this.NombreCiudad = NombreCiudad;
    }
    
    public String getTienePrincipal() {
        return TienePrincipal;
    }

    public void setTienePrincipal(String TienePrincipal) {
        this.TienePrincipal = TienePrincipal;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSedes != null ? idSedes.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sedes)) {
            return false;
        }
        Sedes other = (Sedes) object;
        if ((this.idSedes == null && other.idSedes != null) || (this.idSedes != null && !this.idSedes.equals(other.idSedes))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Sedes[ idSedes=" + idSedes + " ]";
    }
    
}
