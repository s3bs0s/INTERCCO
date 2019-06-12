package com.INTERCCO.modelo.Beans;

public class DetallesProductos {

    private Integer idDetallesProductos;
    private Integer idProducto;
    private Integer idInsumoNecesario;
    private Integer cantidadInsumo;
    private String existencia;

    public DetallesProductos() {
    }

    public DetallesProductos(Integer idDetallesProductos) {
        this.idDetallesProductos = idDetallesProductos;
    }

    public DetallesProductos(Integer idDetallesProductos, Integer idProducto, Integer idInsumoNecesario, Integer cantidadInsumo, String existencia) {
        this.idDetallesProductos = idDetallesProductos;
        this.idProducto = idProducto;
        this.idInsumoNecesario = idInsumoNecesario;
        this.cantidadInsumo = cantidadInsumo;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdDetallesProductos() {
        return idDetallesProductos;
    }

    public void setIdDetallesProductos(Integer idDetallesProductos) {
        this.idDetallesProductos = idDetallesProductos;
    }
    
    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }
    
    public Integer getIdInsumoNecesario() {
        return idInsumoNecesario;
    }

    public void setIdInsumoNecesario(Integer idInsumoNecesario) {
        this.idInsumoNecesario = idInsumoNecesario;
    }
    
    public Integer getCantidadInsumo() {
        return cantidadInsumo;
    }

    public void setCantidadInsumo(Integer cantidadInsumo) {
        this.cantidadInsumo = cantidadInsumo;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }
    
    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetallesProductos != null ? idDetallesProductos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetallesProductos)) {
            return false;
        }
        DetallesProductos other = (DetallesProductos) object;
        if ((this.idDetallesProductos == null && other.idDetallesProductos != null) || (this.idDetallesProductos != null && !this.idDetallesProductos.equals(other.idDetallesProductos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.DetallesProductos[ idDetallesProductos=" + idDetallesProductos + " ]";
    }
    
}
