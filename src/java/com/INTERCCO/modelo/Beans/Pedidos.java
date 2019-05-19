package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Pedidos {

    private Integer idPedidos;
    private Date fchRegistro;
    private Date horaRegistro;
    private String tipoPedido;
    private Integer numMesa;
    private String direccionEnt;
    private String observaciones;
    private Integer subTotal;
    private String estado;
    private String existencia;
    private String idCliente;
    private Integer idFactura;
    private Integer idMeseroODomiciliario;
    private String NomMeseroODomiciliario;
    private Integer idSede;
    private String NomSede;

    public Pedidos() {
    }

    public Pedidos(Integer idPedidos) {
        this.idPedidos = idPedidos;
    }

    public Pedidos(Integer idPedidos, Date fchRegistro, Date horaRegistro, String tipoPedido, Integer numMesa, String direccionEnt, String observaciones, int subTotal, String estado, String existencia) {
        this.idPedidos = idPedidos;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
        this.tipoPedido = tipoPedido;
        this.numMesa = numMesa;
        this.direccionEnt = direccionEnt;
        this.observaciones = observaciones;
        this.subTotal = subTotal;
        this.estado = estado;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdPedidos() {
        return idPedidos;
    }

    public void setIdPedidos(Integer idPedidos) {
        this.idPedidos = idPedidos;
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

    public String getTipoPedido() {
        return tipoPedido;
    }

    public void setTipoPedido(String tipoPedido) {
        this.tipoPedido = tipoPedido;
    }

    public Integer getNumMesa() {
        return numMesa;
    }

    public void setNumMesa(Integer numMesa) {
        this.numMesa = numMesa;
    }

    public String getDireccionEnt() {
        return direccionEnt;
    }

    public void setDireccionEnt(String direccionEnt) {
        this.direccionEnt = direccionEnt;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Integer getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Integer subTotal) {
        this.subTotal = subTotal;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public Integer getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(Integer idFactura) {
        this.idFactura = idFactura;
    }

    public int getIdMeseroODomiciliario() {
        return idMeseroODomiciliario;
    }

    public void setIdMeseroODomiciliario(int idMeseroODomiciliario) {
        this.idMeseroODomiciliario = idMeseroODomiciliario;
    }

    public Integer getIdSede() {
        return idSede;
    }

    public void setIdSede(Integer idSede) {
        this.idSede = idSede;
    }
    
    /* Metodos Adicionales para la Vista */
    
    public String getNomMeseroODomiciliario() {
        return NomMeseroODomiciliario;
    }

    public void setNomMeseroODomiciliario(String NomMeseroODomiciliario) {
        this.NomMeseroODomiciliario = NomMeseroODomiciliario;
    }
    
    public String getNomSede() {
        return NomSede;
    }

    public void setNomSede(String NomSede) {
        this.NomSede = NomSede;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPedidos != null ? idPedidos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pedidos)) {
            return false;
        }
        Pedidos other = (Pedidos) object;
        if ((this.idPedidos == null && other.idPedidos != null) || (this.idPedidos != null && !this.idPedidos.equals(other.idPedidos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Pedidos[ idPedidos=" + idPedidos + " ]";
    }
    
}
