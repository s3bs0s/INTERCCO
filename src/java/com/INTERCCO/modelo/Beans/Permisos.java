package com.INTERCCO.modelo.Beans;

public class Permisos {

    private Integer idPermisos;
    private String rol;
    private String ciudadesInsert;
    private String ciudadesSelect;
    private String ciudadesUpdate;
    private String ciudadesDelet;
    private String sedesInsert;
    private String sedesSelect;
    private String sedesUpdate;
    private String sedesDelet;
    private String carruselesInsert;
    private String carruselesSelect;
    private String carruselesUpdate;
    private String carruselesDelet;
    private String categoriasInsert;
    private String categoriasSelect;
    private String categoriasUpdate;
    private String categoriasDelet;
    private String usuariosInsert;
    private String usuariosSelect;
    private String usuariosUpdate;
    private String usuariosDelet;
    private String infoUsuariosInsert;
    private String infoUsuariosSelect;
    private String infoUsuariosUpdate;
    private String infoUsuariosDelet;
    private String facturasInsert;
    private String facturasSelect;
    private String facturasUpdate;
    private String facturasDelet;
    private String pedidosInsert;
    private String pedidosSelect;
    private String pedidosUpdate;
    private String pedidosDelet;
    private String comandasInsert;
    private String comandasSelect;
    private String comandasUpdate;
    private String comandasDelet;
    private String productosInsert;
    private String productosSelect;
    private String productosUpdate;
    private String productosDelet;
    private String detallesPedidosInsert;
    private String detallesPedidosSelect;
    private String detallesPedidosUpdate;
    private String detallesPedidosDelet;
    private String horariosSedesInsert;
    private String horariosSedesSelect;
    private String horariosSedesUpdate;
    private String horariosSedesDelet;
    private String proveedoresInsert;
    private String proveedoresSelect;
    private String proveedoresUpdate;
    private String proveedoresDelet;
    private String insumosInsert;
    private String insumosSelect;
    private String insumosUpdate;
    private String insumosDelet;
    private String ivaInsert;
    private String ivaSelect;
    private String ivaUpdate;
    private String ivaDelet;
    private String logsInsert;
    private String logsSelect;
    private String logsUpdate;
    private String logsDelet;
    private String pqrsfInsert;
    private String pqrsfSelect;
    private String pqrsfUpdate;
    private String pqrsfDelet;
    private String promocionesInsert;
    private String promocionesSelect;
    private String promocionesUpdate;
    private String promocionesDelet;
    private String soportesInsert;
    private String soportesSelect;
    private String soportesUpdate;
    private String soportesDelet;

    public Permisos() {
    }

    public Permisos(Integer idPermisos) {
        this.idPermisos = idPermisos;
    }

    public Permisos(Integer idPermisos, String rol) {
        this.idPermisos = idPermisos;
        this.rol = rol;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdPermisos() {
        return idPermisos;
    }

    public void setIdPermisos(Integer idPermisos) {
        this.idPermisos = idPermisos;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getCiudadesInsert() {
        return ciudadesInsert;
    }

    public void setCiudadesInsert(String ciudadesInsert) {
        this.ciudadesInsert = ciudadesInsert;
    }

    public String getCiudadesSelect() {
        return ciudadesSelect;
    }

    public void setCiudadesSelect(String ciudadesSelect) {
        this.ciudadesSelect = ciudadesSelect;
    }

    public String getCiudadesUpdate() {
        return ciudadesUpdate;
    }

    public void setCiudadesUpdate(String ciudadesUpdate) {
        this.ciudadesUpdate = ciudadesUpdate;
    }

    public String getCiudadesDelet() {
        return ciudadesDelet;
    }

    public void setCiudadesDelet(String ciudadesDelet) {
        this.ciudadesDelet = ciudadesDelet;
    }

    public String getSedesInsert() {
        return sedesInsert;
    }

    public void setSedesInsert(String sedesInsert) {
        this.sedesInsert = sedesInsert;
    }

    public String getSedesSelect() {
        return sedesSelect;
    }

    public void setSedesSelect(String sedesSelect) {
        this.sedesSelect = sedesSelect;
    }

    public String getSedesUpdate() {
        return sedesUpdate;
    }

    public void setSedesUpdate(String sedesUpdate) {
        this.sedesUpdate = sedesUpdate;
    }

    public String getSedesDelet() {
        return sedesDelet;
    }

    public void setSedesDelet(String sedesDelet) {
        this.sedesDelet = sedesDelet;
    }

    public String getCarruselesInsert() {
        return carruselesInsert;
    }

    public void setCarruselesInsert(String carruselesInsert) {
        this.carruselesInsert = carruselesInsert;
    }

    public String getCarruselesSelect() {
        return carruselesSelect;
    }

    public void setCarruselesSelect(String carruselesSelect) {
        this.carruselesSelect = carruselesSelect;
    }

    public String getCarruselesUpdate() {
        return carruselesUpdate;
    }

    public void setCarruselesUpdate(String carruselesUpdate) {
        this.carruselesUpdate = carruselesUpdate;
    }

    public String getCarruselesDelet() {
        return carruselesDelet;
    }

    public void setCarruselesDelet(String carruselesDelet) {
        this.carruselesDelet = carruselesDelet;
    }

    public String getCategoriasInsert() {
        return categoriasInsert;
    }

    public void setCategoriasInsert(String categoriasInsert) {
        this.categoriasInsert = categoriasInsert;
    }

    public String getCategoriasSelect() {
        return categoriasSelect;
    }

    public void setCategoriasSelect(String categoriasSelect) {
        this.categoriasSelect = categoriasSelect;
    }

    public String getCategoriasUpdate() {
        return categoriasUpdate;
    }

    public void setCategoriasUpdate(String categoriasUpdate) {
        this.categoriasUpdate = categoriasUpdate;
    }

    public String getCategoriasDelet() {
        return categoriasDelet;
    }

    public void setCategoriasDelet(String categoriasDelet) {
        this.categoriasDelet = categoriasDelet;
    }

    public String getUsuariosInsert() {
        return usuariosInsert;
    }

    public void setUsuariosInsert(String usuariosInsert) {
        this.usuariosInsert = usuariosInsert;
    }

    public String getUsuariosSelect() {
        return usuariosSelect;
    }

    public void setUsuariosSelect(String usuariosSelect) {
        this.usuariosSelect = usuariosSelect;
    }

    public String getUsuariosUpdate() {
        return usuariosUpdate;
    }

    public void setUsuariosUpdate(String usuariosUpdate) {
        this.usuariosUpdate = usuariosUpdate;
    }

    public String getUsuariosDelet() {
        return usuariosDelet;
    }

    public void setUsuariosDelet(String usuariosDelet) {
        this.usuariosDelet = usuariosDelet;
    }

    public String getInfoUsuariosInsert() {
        return infoUsuariosInsert;
    }

    public void setInfoUsuariosInsert(String infoUsuariosInsert) {
        this.infoUsuariosInsert = infoUsuariosInsert;
    }

    public String getInfoUsuariosSelect() {
        return infoUsuariosSelect;
    }

    public void setInfoUsuariosSelect(String infoUsuariosSelect) {
        this.infoUsuariosSelect = infoUsuariosSelect;
    }

    public String getInfoUsuariosUpdate() {
        return infoUsuariosUpdate;
    }

    public void setInfoUsuariosUpdate(String infoUsuariosUpdate) {
        this.infoUsuariosUpdate = infoUsuariosUpdate;
    }

    public String getInfoUsuariosDelet() {
        return infoUsuariosDelet;
    }

    public void setInfoUsuariosDelet(String infoUsuariosDelet) {
        this.infoUsuariosDelet = infoUsuariosDelet;
    }

    public String getFacturasInsert() {
        return facturasInsert;
    }

    public void setFacturasInsert(String facturasInsert) {
        this.facturasInsert = facturasInsert;
    }

    public String getFacturasSelect() {
        return facturasSelect;
    }

    public void setFacturasSelect(String facturasSelect) {
        this.facturasSelect = facturasSelect;
    }

    public String getFacturasUpdate() {
        return facturasUpdate;
    }

    public void setFacturasUpdate(String facturasUpdate) {
        this.facturasUpdate = facturasUpdate;
    }

    public String getFacturasDelet() {
        return facturasDelet;
    }

    public void setFacturasDelet(String facturasDelet) {
        this.facturasDelet = facturasDelet;
    }

    public String getPedidosInsert() {
        return pedidosInsert;
    }

    public void setPedidosInsert(String pedidosInsert) {
        this.pedidosInsert = pedidosInsert;
    }

    public String getPedidosSelect() {
        return pedidosSelect;
    }

    public void setPedidosSelect(String pedidosSelect) {
        this.pedidosSelect = pedidosSelect;
    }

    public String getPedidosUpdate() {
        return pedidosUpdate;
    }

    public void setPedidosUpdate(String pedidosUpdate) {
        this.pedidosUpdate = pedidosUpdate;
    }

    public String getPedidosDelet() {
        return pedidosDelet;
    }

    public void setPedidosDelet(String pedidosDelet) {
        this.pedidosDelet = pedidosDelet;
    }

    public String getComandasInsert() {
        return comandasInsert;
    }

    public void setComandasInsert(String comandasInsert) {
        this.comandasInsert = comandasInsert;
    }

    public String getComandasSelect() {
        return comandasSelect;
    }

    public void setComandasSelect(String comandasSelect) {
        this.comandasSelect = comandasSelect;
    }

    public String getComandasUpdate() {
        return comandasUpdate;
    }

    public void setComandasUpdate(String comandasUpdate) {
        this.comandasUpdate = comandasUpdate;
    }

    public String getComandasDelet() {
        return comandasDelet;
    }

    public void setComandasDelet(String comandasDelet) {
        this.comandasDelet = comandasDelet;
    }

    public String getProductosInsert() {
        return productosInsert;
    }

    public void setProductosInsert(String productosInsert) {
        this.productosInsert = productosInsert;
    }

    public String getProductosSelect() {
        return productosSelect;
    }

    public void setProductosSelect(String productosSelect) {
        this.productosSelect = productosSelect;
    }

    public String getProductosUpdate() {
        return productosUpdate;
    }

    public void setProductosUpdate(String productosUpdate) {
        this.productosUpdate = productosUpdate;
    }

    public String getProductosDelet() {
        return productosDelet;
    }

    public void setProductosDelet(String productosDelet) {
        this.productosDelet = productosDelet;
    }

    public String getDetallesPedidosInsert() {
        return detallesPedidosInsert;
    }

    public void setDetallesPedidosInsert(String detallesPedidosInsert) {
        this.detallesPedidosInsert = detallesPedidosInsert;
    }

    public String getDetallesPedidosSelect() {
        return detallesPedidosSelect;
    }

    public void setDetallesPedidosSelect(String detallesPedidosSelect) {
        this.detallesPedidosSelect = detallesPedidosSelect;
    }

    public String getDetallesPedidosUpdate() {
        return detallesPedidosUpdate;
    }

    public void setDetallesPedidosUpdate(String detallesPedidosUpdate) {
        this.detallesPedidosUpdate = detallesPedidosUpdate;
    }

    public String getDetallesPedidosDelet() {
        return detallesPedidosDelet;
    }

    public void setDetallesPedidosDelet(String detallesPedidosDelet) {
        this.detallesPedidosDelet = detallesPedidosDelet;
    }

    public String getHorariosSedesInsert() {
        return horariosSedesInsert;
    }

    public void setHorariosSedesInsert(String horariosSedesInsert) {
        this.horariosSedesInsert = horariosSedesInsert;
    }

    public String getHorariosSedesSelect() {
        return horariosSedesSelect;
    }

    public void setHorariosSedesSelect(String horariosSedesSelect) {
        this.horariosSedesSelect = horariosSedesSelect;
    }

    public String getHorariosSedesUpdate() {
        return horariosSedesUpdate;
    }

    public void setHorariosSedesUpdate(String horariosSedesUpdate) {
        this.horariosSedesUpdate = horariosSedesUpdate;
    }

    public String getHorariosSedesDelet() {
        return horariosSedesDelet;
    }

    public void setHorariosSedesDelet(String horariosSedesDelet) {
        this.horariosSedesDelet = horariosSedesDelet;
    }

    public String getProveedoresInsert() {
        return proveedoresInsert;
    }

    public void setProveedoresInsert(String proveedoresInsert) {
        this.proveedoresInsert = proveedoresInsert;
    }

    public String getProveedoresSelect() {
        return proveedoresSelect;
    }

    public void setProveedoresSelect(String proveedoresSelect) {
        this.proveedoresSelect = proveedoresSelect;
    }

    public String getProveedoresUpdate() {
        return proveedoresUpdate;
    }

    public void setProveedoresUpdate(String proveedoresUpdate) {
        this.proveedoresUpdate = proveedoresUpdate;
    }

    public String getProveedoresDelet() {
        return proveedoresDelet;
    }

    public void setProveedoresDelet(String proveedoresDelet) {
        this.proveedoresDelet = proveedoresDelet;
    }

    public String getInsumosInsert() {
        return insumosInsert;
    }

    public void setInsumosInsert(String insumosInsert) {
        this.insumosInsert = insumosInsert;
    }

    public String getInsumosSelect() {
        return insumosSelect;
    }

    public void setInsumosSelect(String insumosSelect) {
        this.insumosSelect = insumosSelect;
    }

    public String getInsumosUpdate() {
        return insumosUpdate;
    }

    public void setInsumosUpdate(String insumosUpdate) {
        this.insumosUpdate = insumosUpdate;
    }

    public String getInsumosDelet() {
        return insumosDelet;
    }

    public void setInsumosDelet(String insumosDelet) {
        this.insumosDelet = insumosDelet;
    }

    public String getIvaInsert() {
        return ivaInsert;
    }

    public void setIvaInsert(String ivaInsert) {
        this.ivaInsert = ivaInsert;
    }

    public String getIvaSelect() {
        return ivaSelect;
    }

    public void setIvaSelect(String ivaSelect) {
        this.ivaSelect = ivaSelect;
    }

    public String getIvaUpdate() {
        return ivaUpdate;
    }

    public void setIvaUpdate(String ivaUpdate) {
        this.ivaUpdate = ivaUpdate;
    }

    public String getIvaDelet() {
        return ivaDelet;
    }

    public void setIvaDelet(String ivaDelet) {
        this.ivaDelet = ivaDelet;
    }

    public String getLogsInsert() {
        return logsInsert;
    }

    public void setLogsInsert(String logsInsert) {
        this.logsInsert = logsInsert;
    }

    public String getLogsSelect() {
        return logsSelect;
    }

    public void setLogsSelect(String logsSelect) {
        this.logsSelect = logsSelect;
    }

    public String getLogsUpdate() {
        return logsUpdate;
    }

    public void setLogsUpdate(String logsUpdate) {
        this.logsUpdate = logsUpdate;
    }

    public String getLogsDelet() {
        return logsDelet;
    }

    public void setLogsDelet(String logsDelet) {
        this.logsDelet = logsDelet;
    }

    public String getPqrsfInsert() {
        return pqrsfInsert;
    }

    public void setPqrsfInsert(String pqrsfInsert) {
        this.pqrsfInsert = pqrsfInsert;
    }

    public String getPqrsfSelect() {
        return pqrsfSelect;
    }

    public void setPqrsfSelect(String pqrsfSelect) {
        this.pqrsfSelect = pqrsfSelect;
    }

    public String getPqrsfUpdate() {
        return pqrsfUpdate;
    }

    public void setPqrsfUpdate(String pqrsfUpdate) {
        this.pqrsfUpdate = pqrsfUpdate;
    }

    public String getPqrsfDelet() {
        return pqrsfDelet;
    }

    public void setPqrsfDelet(String pqrsfDelet) {
        this.pqrsfDelet = pqrsfDelet;
    }

    public String getPromocionesInsert() {
        return promocionesInsert;
    }

    public void setPromocionesInsert(String promocionesInsert) {
        this.promocionesInsert = promocionesInsert;
    }

    public String getPromocionesSelect() {
        return promocionesSelect;
    }

    public void setPromocionesSelect(String promocionesSelect) {
        this.promocionesSelect = promocionesSelect;
    }

    public String getPromocionesUpdate() {
        return promocionesUpdate;
    }

    public void setPromocionesUpdate(String promocionesUpdate) {
        this.promocionesUpdate = promocionesUpdate;
    }

    public String getPromocionesDelet() {
        return promocionesDelet;
    }

    public void setPromocionesDelet(String promocionesDelet) {
        this.promocionesDelet = promocionesDelet;
    }

    public String getSoportesInsert() {
        return soportesInsert;
    }

    public void setSoportesInsert(String soportesInsert) {
        this.soportesInsert = soportesInsert;
    }

    public String getSoportesSelect() {
        return soportesSelect;
    }

    public void setSoportesSelect(String soportesSelect) {
        this.soportesSelect = soportesSelect;
    }

    public String getSoportesUpdate() {
        return soportesUpdate;
    }

    public void setSoportesUpdate(String soportesUpdate) {
        this.soportesUpdate = soportesUpdate;
    }

    public String getSoportesDelet() {
        return soportesDelet;
    }

    public void setSoportesDelet(String soportesDelet) {
        this.soportesDelet = soportesDelet;
    }

    /* Metodos Adicionales para la Vista */
    
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPermisos != null ? idPermisos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Permisos)) {
            return false;
        }
        Permisos other = (Permisos) object;
        if ((this.idPermisos == null && other.idPermisos != null) || (this.idPermisos != null && !this.idPermisos.equals(other.idPermisos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Permisos[ idPermisos=" + idPermisos + " ]";
    }
    
}
