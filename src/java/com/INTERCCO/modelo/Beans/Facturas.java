package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Facturas {

    private Integer idFacturas;
    private Date fchRegistro;
    private Date horaRegistro;
    private int idCliente;
    private int importe;
    private int total;
    private String existencia;
    private int idCajero;
    private int idSede;
    private String NomCliente;
    private String NomCajero;
    private String NomSede;
    private int IdMesero;
    private int SubTotal;
    private String NomMesero;
    private String DetallesPedidos;
    private int Mesa;

    public Facturas() {
    }

    public Facturas(Integer idFacturas) {
        this.idFacturas = idFacturas;
    }

    public Facturas(Integer idFacturas, Date fchRegistro, Date horaRegistro, int importe, int total, String existencia) {
        this.idFacturas = idFacturas;
        this.fchRegistro = fchRegistro;
        this.horaRegistro = horaRegistro;
        this.importe = importe;
        this.total = total;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdFacturas() {
        return idFacturas;
    }

    public void setIdFacturas(Integer idFacturas) {
        this.idFacturas = idFacturas;
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

    public int getImporte() {
        return importe;
    }

    public void setImporte(int importe) {
        this.importe = importe;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdCajero() {
        return idCajero;
    }

    public void setIdCajero(int idCajero) {
        this.idCajero = idCajero;
    }

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    /* Metodos Adicionales para la Vista */
    
    
    public int getIdMesero() {
        return IdMesero;
    }

    public void setIdMesero(int IdMesero) {
        this.IdMesero = IdMesero;
    }
    
    public String getNomMesero() {
        return NomMesero;
    }

    public void setNomMesero(String NomMesero) {
        this.NomMesero = NomMesero;
    }
    
    public int getMesa() {
        return Mesa;
    }

    public void setMesa(int Mesa) {
        this.Mesa = Mesa;
    }

    public int getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(int SubTotal) {
        this.SubTotal = SubTotal;
    }
    
    public String getNomCliente() {
        return NomCliente;
    }

    public void setNomCliente(String NomCliente) {
        this.NomCliente = NomCliente;
    }

    public String getNomCajero() {
        return NomCajero;
    }

    public void setNomCajero(String NomCajero) {
        this.NomCajero = NomCajero;
    }

    public String getNomSede() {
        return NomSede;
    }

    public void setNomSede(String NomSede) {
        this.NomSede = NomSede;
    }

    public String getDetallesPedidos() {
        return DetallesPedidos;
    }

    public void setDetallesPedidos(String DetallesPedidos) {
        this.DetallesPedidos = DetallesPedidos;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFacturas != null ? idFacturas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Facturas)) {
            return false;
        }
        Facturas other = (Facturas) object;
        if ((this.idFacturas == null && other.idFacturas != null) || (this.idFacturas != null && !this.idFacturas.equals(other.idFacturas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Facturas[ idFacturas=" + idFacturas + " ]";
    }
    
}
