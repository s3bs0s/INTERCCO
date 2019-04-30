package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Pqrsf {

    private Integer idPqrsf;
    private Date fchRegistro;
    private Date horaRegistro;
    private String tipoSolicitud;
    private String dirigidoA;
    private String consulta;
    private String respuesta;
    private String estado;
    private String idCliente;
    private String NombreCliente;
    private String idInterlocutor;
    private String NombreInterlocutor;
    private String idSedeCliente;
    private String idSedeDirigido;

    public Pqrsf() {
    }

    public Pqrsf(Integer idPqrsf) {
        this.idPqrsf = idPqrsf;
    }

    public Pqrsf(Integer idPqrsf, Date fchRegistro, Date horaRegistro, String tipoSolicitud, String dirigidoA, String consulta, String respuesta, String estado) {
        this.idPqrsf = idPqrsf;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
        this.tipoSolicitud = tipoSolicitud;
        this.dirigidoA = dirigidoA;
        this.consulta = consulta;
        this.respuesta = respuesta;
        this.estado = estado;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdPqrsf() {
        return idPqrsf;
    }

    public void setIdPqrsf(Integer idPqrsf) {
        this.idPqrsf = idPqrsf;
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

    public String getTipoSolicitud() {
        return tipoSolicitud;
    }

    public void setTipoSolicitud(String tipoSolicitud) {
        this.tipoSolicitud = tipoSolicitud;
    }

    public String getDirigidoA() {
        return dirigidoA;
    }

    public void setDirigidoA(String dirigidoA) {
        this.dirigidoA = dirigidoA;
    }

    public String getConsulta() {
        return consulta;
    }

    public void setConsulta(String consulta) {
        this.consulta = consulta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public String getIdInterlocutor() {
        return idInterlocutor;
    }

    public void setIdInterlocutor(String idInterlocutor) {
        this.idInterlocutor = idInterlocutor;
    }

    public String getIdSedeCliente() {
        return idSedeCliente;
    }

    public void setIdSedeCliente(String idSedeCliente) {
        this.idSedeCliente = idSedeCliente;
    }

    public String getIdSedeDirigido() {
        return idSedeDirigido;
    }

    public void setIdSedeDirigido(String idSedeDirigido) {
        this.idSedeDirigido = idSedeDirigido;
    }

    /* Metodos Adicionales para la Vista */
    
    public String getNombreCliente() {
        return NombreCliente;
    }

    public void setNombreCliente(String NombreCliente) {
        this.NombreCliente = NombreCliente;
    }
    
    public String getNombreInterlocutor() {
        return NombreInterlocutor;
    }

    public void setNombreInterlocutor(String NombreInterlocutor) {
        this.NombreInterlocutor = NombreInterlocutor;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPqrsf != null ? idPqrsf.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pqrsf)) {
            return false;
        }
        Pqrsf other = (Pqrsf) object;
        if ((this.idPqrsf == null && other.idPqrsf != null) || (this.idPqrsf != null && !this.idPqrsf.equals(other.idPqrsf))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Pqrsf[ idPqrsf=" + idPqrsf + " ]";
    }
    
}
