package com.INTERCCO.modelo.Beans;

public class Usuarios {

    private Integer idUsuarios;
    private String email;
    private String password;
    private String rol;
    private String nombres;
    private String idSede;
    private String verificado;
    private String existencia;

    public Usuarios() {
    }

    public Usuarios(Integer idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public Usuarios(Integer idUsuarios, String email, String password, String rol, String nombres, String verificado, String existencia) {
        this.idUsuarios = idUsuarios;
        this.email = email;
        this.password = password;
        this.rol = rol;
        this.nombres = nombres;
        this.verificado = verificado;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(Integer idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
     public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getVerificado() {
        return verificado;
    }

    public void setVerificado(String verificado) {
        this.verificado = verificado;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
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
        hash += (idUsuarios != null ? idUsuarios.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuarios)) {
            return false;
        }
        Usuarios other = (Usuarios) object;
        if ((this.idUsuarios == null && other.idUsuarios != null) || (this.idUsuarios != null && !this.idUsuarios.equals(other.idUsuarios))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Usuarios[ idUsuarios=" + idUsuarios + " ]";
    }
    
}
