package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class InfoUsuarios {

    private Integer idInfoUsuarios;
    private Date fchRegistro;
    private Date horaRegistro;
    private String nombreImg;
    private String apellidos;
    private String tipoI;
    private String numI;
    private String telefono;
    private String movil;
    private String genero;
    private Date fchNaci;
    private String direccion;
    private String existencia;
    private Integer idUsuario;
    private String Email;
    private String Password;
    private String Rol;
    private String Nombres;
    private String Sede;
    private String Justificacion;
    private Date FchLimite;
    private Integer idModerador;
    private String EmailModerador;
    private String ExistenciaSancion;
    private String Verificado;

    public InfoUsuarios() {
    }

    public InfoUsuarios(Integer idInfoUsuarios) {
        this.idInfoUsuarios = idInfoUsuarios;
    }

    public InfoUsuarios(Integer idInfoUsuarios, Date fchRegistro, Date horaRegistro, String nombreImg, String apellidos, String tipoI, String numI, String telefono, String movil, String genero, Date fchNaci, String direccion, String existencia) {
        this.idInfoUsuarios = idInfoUsuarios;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
        this.nombreImg = nombreImg;
        this.apellidos = apellidos;
        this.tipoI = tipoI;
        this.numI = numI;
        this.telefono = telefono;
        this.movil = movil;
        this.genero = genero;
        this.fchNaci = fchNaci;
        this.direccion = direccion;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdInfoUsuarios() {
        return idInfoUsuarios;
    }

    public void setIdInfoUsuarios(Integer idInfoUsuarios) {
        this.idInfoUsuarios = idInfoUsuarios;
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

    public String getNombreImg() {
        return nombreImg;
    }

    public void setNombreImg(String nombreImg) {
        this.nombreImg = nombreImg;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMovil() {
        return movil;
    }

    public void setMovil(String movil) {
        this.movil = movil;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Date getFchNaci() {
        return fchNaci;
    }

    public void setFchNaci(Date fchNaci) {
        this.fchNaci = fchNaci;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    /* Metodos Adicionales para la Vista */
    
    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    
    public String getRol() {
        return Rol;
    }

    public void setRol(String Rol) {
        this.Rol = Rol;
    }
    
    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }
    
    public String getSede() {
        return Sede;
    }

    public void setSede(String Sede) {
        this.Sede = Sede;
    }
    
    public String getJustificacion() {
        return Justificacion;
    }

    public void setJustificacion(String Justificacion) {
        this.Justificacion = Justificacion;
    }

    public Date getFchLimite() {
        return FchLimite;
    }

    public void setFchLimite(Date FchLimite) {
        this.FchLimite = FchLimite;
    }

    public Integer getIdModerador() {
        return idModerador;
    }

    public void setIdModerador(Integer idModerador) {
        this.idModerador = idModerador;
    }

    public String getEmailModerador() {
        return EmailModerador;
    }

    public void setEmailModerador(String EmailModerador) {
        this.EmailModerador = EmailModerador;
    }

    public String getExistenciaSancion() {
        return ExistenciaSancion;
    }

    public void setExistenciaSancion(String ExistenciaSancion) {
        this.ExistenciaSancion = ExistenciaSancion;
    }

    public String getVerificado() {
        return Verificado;
    }

    public void setVerificado(String Verificado) {
        this.Verificado = Verificado;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idInfoUsuarios != null ? idInfoUsuarios.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InfoUsuarios)) {
            return false;
        }
        InfoUsuarios other = (InfoUsuarios) object;
        if ((this.idInfoUsuarios == null && other.idInfoUsuarios != null) || (this.idInfoUsuarios != null && !this.idInfoUsuarios.equals(other.idInfoUsuarios))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.InfoUsuarios[ idInfoUsuarios=" + idInfoUsuarios + " ]";
    }
    
}
