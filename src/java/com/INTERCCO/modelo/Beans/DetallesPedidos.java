package com.INTERCCO.modelo.Beans;

public class DetallesPedidos {

    private Integer idDetallesPedidos;
    private String idPedido;
    private String idProducto;

    public DetallesPedidos() {
    }

    public DetallesPedidos(Integer idDetallesPedidos) {
        this.idDetallesPedidos = idDetallesPedidos;
    }

    public Integer getIdDetallesPedidos() {
        return idDetallesPedidos;
    }

    public void setIdDetallesPedidos(Integer idDetallesPedidos) {
        this.idDetallesPedidos = idDetallesPedidos;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public String getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(String idPedido) {
        this.idPedido = idPedido;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetallesPedidos != null ? idDetallesPedidos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetallesPedidos)) {
            return false;
        }
        DetallesPedidos other = (DetallesPedidos) object;
        if ((this.idDetallesPedidos == null && other.idDetallesPedidos != null) || (this.idDetallesPedidos != null && !this.idDetallesPedidos.equals(other.idDetallesPedidos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.DetallesPedidos[ idDetallesPedidos=" + idDetallesPedidos + " ]";
    }
    
}
