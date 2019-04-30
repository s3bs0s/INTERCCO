package com.INTERCCO.modelo.Beans;

import java.util.Date;

public class Insumos {

    private Integer idInsumos;
    private String referencia;
    private String nombre;
    private Date fchIngreso;
    private Date fchCaducidad;
    private String unidadMedida;
    private int cantidad;
    private int precioUnitario;
    private String existencia;
    private Integer idProveedor;
    private String NombreProveedor;
    private String idSede;
    private String tipoIf;
    private String numIt;
    private String nombrePc;
    private String cargoPc;
    private String tipoI;
    private String numI;
    private String email;
    private String faxPc;
    private String extensionFaxPc;
    private String telefonoPc;
    private String movilPc;

    public Insumos() {
    }

    public Insumos(Integer idInsumos) {
        this.idInsumos = idInsumos;
    }

    public Insumos(Integer idInsumos, String referencia, String nombre, Date fchIngreso, Date fchCaducidad, String unidadMedida, int cantidad, int precioUnitario, String existencia) {
        this.idInsumos = idInsumos;
        this.referencia = referencia;
        this.nombre = nombre;
        this.fchIngreso = fchIngreso;
        this.fchCaducidad = fchCaducidad;
        this.unidadMedida = unidadMedida;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdInsumos() {
        return idInsumos;
    }

    public void setIdInsumos(Integer idInsumos) {
        this.idInsumos = idInsumos;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFchIngreso() {
        return fchIngreso;
    }

    public void setFchIngreso(Date fchIngreso) {
        this.fchIngreso = fchIngreso;
    }

    public Date getFchCaducidad() {
        return fchCaducidad;
    }

    public void setFchCaducidad(Date fchCaducidad) {
        this.fchCaducidad = fchCaducidad;
    }

    public String getUnidadMedida() {
        return unidadMedida;
    }

    public void setUnidadMedida(String unidadMedida) {
        this.unidadMedida = unidadMedida;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(int precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public Integer getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(Integer idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getIdSede() {
        return idSede;
    }

    public void setIdSede(String idSede) {
        this.idSede = idSede;
    }

    /* Metodos Adicionales para la Vista */
    
    public String getNombreProveedor() {
        return NombreProveedor;
    }

    public void setNombreProveedor(String NombreProveedor) {
        this.NombreProveedor = NombreProveedor;
    }
    
    public String getTipoIf() {
        return tipoIf;
    }

    public void setTipoIf(String tipoIf) {
        this.tipoIf = tipoIf;
    }

    public String getNumIt() {
        return numIt;
    }

    public void setNumIt(String numIt) {
        this.numIt = numIt;
    }
    
    public String getNombrePc() {
        return nombrePc;
    }

    public void setNombrePc(String nombrePc) {
        this.nombrePc = nombrePc;
    }

    public String getCargoPc() {
        return cargoPc;
    }

    public void setCargoPc(String cargoPc) {
        this.cargoPc = cargoPc;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFaxPc() {
        return faxPc;
    }

    public void setFaxPc(String faxPc) {
        this.faxPc = faxPc;
    }

    public String getExtensionFaxPc() {
        return extensionFaxPc;
    }

    public void setExtensionFaxPc(String extensionFaxPc) {
        this.extensionFaxPc = extensionFaxPc;
    }

    public String getTelefonoPc() {
        return telefonoPc;
    }

    public void setTelefonoPc(String telefonoPc) {
        this.telefonoPc = telefonoPc;
    }

    public String getMovilPc() {
        return movilPc;
    }

    public void setMovilPc(String movilPc) {
        this.movilPc = movilPc;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idInsumos != null ? idInsumos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Insumos)) {
            return false;
        }
        Insumos other = (Insumos) object;
        if ((this.idInsumos == null && other.idInsumos != null) || (this.idInsumos != null && !this.idInsumos.equals(other.idInsumos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Insumos[ idInsumos=" + idInsumos + " ]";
    }
    
}
